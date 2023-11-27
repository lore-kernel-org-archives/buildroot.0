Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 860EEC4167B
	for <buildroot@archiver.kernel.org>; Mon, 27 Nov 2023 13:38:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 20D17405AA;
	Mon, 27 Nov 2023 13:38:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 20D17405AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xWdrgtk9WubT; Mon, 27 Nov 2023 13:38:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48A5740571;
	Mon, 27 Nov 2023 13:38:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48A5740571
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2640C1BF2BC
 for <buildroot@lists.busybox.net>; Mon, 27 Nov 2023 13:38:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EE33C40374
 for <buildroot@lists.busybox.net>; Mon, 27 Nov 2023 13:38:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE33C40374
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Zf7QMsObqZLz for <buildroot@lists.busybox.net>;
 Mon, 27 Nov 2023 13:38:22 +0000 (UTC)
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D58A140138
 for <buildroot@buildroot.org>; Mon, 27 Nov 2023 13:38:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D58A140138
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1cfc9c4acb6so7013215ad.0
 for <buildroot@buildroot.org>; Mon, 27 Nov 2023 05:38:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701092302; x=1701697102;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tMDfo5YEqgzIyIzjeppIHAnwGsqc2wOrSdUbFvH09Hg=;
 b=J3aeqhNxn5bu25lXhwKg1j7QOioUxZgxLUflHRdHfEW8KjUIGURpkBMnQUXaJrTzXg
 IF1pRL0WtDmQSfr/h9nv3TkxVyv/cyXFvTokALOzPTDR84pGYQdKZMFIOJc4bZQ8JDyf
 OTxmlPJPUdbtKMSgqFin2f1frOKBq1qCkAex1SSkoC6l11AOI4Txpdry0D7KI5JHJsDd
 7q8NlOfhPdqkOVD4ju208cl18QBS95E50WGilrydp6BSpUHiL31I3TOD2tkbfqBqBT/U
 dsJHBCsBm7ltGJj+zL6nLtXsp6UyanXnmi0O0JBeMzir5m6eoskqkzj0Bu2eRLMBcBwv
 lXdg==
X-Gm-Message-State: AOJu0YzmNED0IRn6H8gfgK3eM5w0PSU9dOGOQCAYuo2OVcEtzrL0DPuD
 CBIAQKKqfjv4uX3EJJzmkx0VBEX+x9LTkQ==
X-Google-Smtp-Source: AGHT+IG8v/wExqh4nwOjFdikhB0J/2/VkdwxRFWsT2MDvaOG34KxWMGhbr9sUGw3V2i/0rLTYtZ1fA==
X-Received: by 2002:a17:903:22c5:b0:1cc:2a23:cbb4 with SMTP id
 y5-20020a17090322c500b001cc2a23cbb4mr11502696plg.35.1701092301962; 
 Mon, 27 Nov 2023 05:38:21 -0800 (PST)
Received: from archie.me ([103.131.18.64]) by smtp.gmail.com with ESMTPSA id
 u10-20020a17090282ca00b001cf65d03cedsm7426446plz.32.2023.11.27.05.38.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Nov 2023 05:38:21 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
 id 187E8101A2BEC; Mon, 27 Nov 2023 20:38:18 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Buildroot Development <buildroot@buildroot.org>
Date: Mon, 27 Nov 2023 20:38:08 +0700
Message-ID: <20231127133806.848789-3-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1675; i=bagasdotme@gmail.com;
 h=from:subject; bh=h/DdA4b2W8TtgNfMNKccv1kq8Humt2h+8NhMtrhn3sE=;
 b=owGbwMvMwCUmqirOYPHY4znjabUkhtSU2fsuzljFsOf4ZsWWVJbFlofq7jP2dBrd7D3GfND3S
 EZWdq5gRykLgxgXg6yYIkv0Wtldxrx7L5nFJBTBzGFlAhnCwMUpABPp/cvIMLHIPXXzKsX5b8wi
 DguyXzzIcVBAK9a6Qlr/s8zypK3MXYwMc9efKd+ZKfv37W8GhsnK0xUEXl27EnbeXcp9e9miXae
 yGQE=
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp;
 fpr=5BAD1DBA330DBDD2365C60721525170038E348E7
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701092302; x=1701697102; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tMDfo5YEqgzIyIzjeppIHAnwGsqc2wOrSdUbFvH09Hg=;
 b=JuWOu0NvH/qVP+GVXY+QqNxi+E75FWbkEmJqcPSx87HIMY9GKkudq5FekrF12kSOpA
 7brGqCs6V0+na/bYuaJVeV4ODkhSHyPNR0OmlqbGMWFFK8gHo9O+aud6FThDkbZDW+3e
 L0K5bKwoWMgKEeB1beB5Djc0bHVoGL8HNNGsuypTyh6W4Z6owkZQlP/k4MlEVOZ9tMXc
 9nAuR5elsesQDHRQ0tO01W3CdvkBfaIhA2qdYHTx74NPiYWkWJ2YlK4tqRJlJjZzGL95
 jVF0RB7W2DMs4t+JivkbZ3L+yUX2nw28jdaPa95R7xzahy0XC1gWVimlT20lnZ+QNauG
 EqMg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=JuWOu0Nv
Subject: [Buildroot] [PATCH v2] package/git: bump to version 2.43.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump the package version to 2.43.0. For the full changelog, see the
release announcement at [1].

Link: https://lore.kernel.org/git/xmqqzfz8l5or.fsf@gitster.g/ [1]
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
Changes since v1 [1]:

  * Fix up patch subject prefix (add missing colon separator)

 [1]: https://lore.kernel.org/buildroot/20231127133043.847846-2-bagasdotme@gmail.com/

 package/git/git.hash | 2 +-
 package/git/git.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/git/git.hash b/package/git/git.hash
index f3f5915c8d..9cf044cc07 100644
--- a/package/git/git.hash
+++ b/package/git/git.hash
@@ -1,5 +1,5 @@
 # From: https://www.kernel.org/pub/software/scm/git/sha256sums.asc
-sha256  8e46fa96bf35a65625d85fde50391e39bc0620d1bb39afb70b96c4a237a1a4f7  git-2.42.1.tar.xz
+sha256  5446603e73d911781d259e565750dcd277a42836c8e392cac91cf137aa9b76ec  git-2.43.0.tar.xz
 # Locally calculated
 sha256  5b2198d1645f767585e8a88ac0499b04472164c0d2da22e75ecf97ef443ab32e  COPYING
 sha256  1922f45d2c49e390032c9c0ba6d7cac904087f7cec51af30c2b2ad022ce0e76a  LGPL-2.1
diff --git a/package/git/git.mk b/package/git/git.mk
index cb49986c43..1502968186 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GIT_VERSION = 2.42.1
+GIT_VERSION = 2.43.0
 GIT_SOURCE = git-$(GIT_VERSION).tar.xz
 GIT_SITE = $(BR2_KERNEL_MIRROR)/software/scm/git
 GIT_LICENSE = GPL-2.0, LGPL-2.1+

base-commit: 4d549c071dcc7ede701ee91cb39bc4a9a2be7baf
-- 
An old man doll... just what I always wanted! - Clara

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
