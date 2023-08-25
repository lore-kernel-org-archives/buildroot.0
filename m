Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B426C3DA66
	for <buildroot@archiver.kernel.org>; Fri, 25 Aug 2023 12:43:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 97C4E80EB9;
	Fri, 25 Aug 2023 12:43:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 97C4E80EB9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cTQpQuA7iaD1; Fri, 25 Aug 2023 12:43:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E531080E3E;
	Fri, 25 Aug 2023 12:43:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E531080E3E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3B1311BF3E3
 for <buildroot@lists.busybox.net>; Fri, 25 Aug 2023 12:43:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2054481BA8
 for <buildroot@lists.busybox.net>; Fri, 25 Aug 2023 12:43:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2054481BA8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WUQQ_Gd6RXjo for <buildroot@lists.busybox.net>;
 Fri, 25 Aug 2023 12:43:30 +0000 (UTC)
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 539A483216
 for <buildroot@busybox.net>; Fri, 25 Aug 2023 12:43:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 539A483216
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1bf078d5f33so7722115ad.3
 for <buildroot@busybox.net>; Fri, 25 Aug 2023 05:43:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692967409; x=1693572209;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ce2ufPFdKC4MRy6hsWwlCPYBCztlOD8BgZu872HwmW8=;
 b=fHWly+hLbHDw17c7xadBC3fARCfMLJI/nznR6eD05geFb+x4WzBL7w+pV+5fG7K5Il
 xwyhmpNRddpoC1Idl9Ohta2UcdpJSF3j3uTpJ1tiEFALTxVta9yUZn4EONG6FWQqRvhX
 /v9JN8EtoSg0ge1m08X7ea4GCN+J1Hjn4uKUM9d69h/0Rgws1j/cHXlcBvut+EF7EBbg
 l4nHijuI89Lmay9YPEa8FXmPs7vmxbKiTph7t/3LQFD0qP+uSOkpXstFNROUOq3EzHsQ
 nGUGc4+39lHfa08ne3PaUukMAGtkNMiK2yVrf/jBuxmpAQF0leY2QlwxjSZSCUhrPY+Q
 EsnQ==
X-Gm-Message-State: AOJu0Ywk7TeWR0hxUofTzitlTS7Vxgv+RiQkQlIcZPGuF/VWEzEvjpGH
 XQkZHltm6F1u9YTnaCj53ksyScgh7mw=
X-Google-Smtp-Source: AGHT+IFadsp60rmCD1F5Z3U77hZ3lLynlKdq3X/KszbRXZGxJdW/WjBLo+w9PEgc5uz3B6sMtY7K/Q==
X-Received: by 2002:a17:902:dacf:b0:1c0:b8fd:9c6 with SMTP id
 q15-20020a170902dacf00b001c0b8fd09c6mr6153429plx.42.1692967409512; 
 Fri, 25 Aug 2023 05:43:29 -0700 (PDT)
Received: from debian.me ([103.124.138.83]) by smtp.gmail.com with ESMTPSA id
 d10-20020a170902654a00b001bb9aadfb04sm1611275pln.220.2023.08.25.05.43.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Aug 2023 05:43:29 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
 id F06B681A1A74; Fri, 25 Aug 2023 19:43:26 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Buildroot Development <buildroot@busybox.net>
Date: Fri, 25 Aug 2023 19:42:40 +0700
Message-ID: <20230825124238.294533-3-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1496; i=bagasdotme@gmail.com;
 h=from:subject; bh=T8yXEgwIgmV4uo2TSltoVK36+JOHrXjctJDWFzUJaMw=;
 b=owGbwMvMwCUmqirOYPHY4znjabUkhpQXC/eVvJo78+6RFPYMHYYLq9pN53SXLJ3men/lx0/TJ
 wdsUMsT6ShlYRDjYpAVU2SJXiu7y5h37yWzmIQimDmsTCBDGLg4BWAiuxoY/umeeZWq/uyv5i9D
 5g6X1OzjXt0l+Ub77uzOLnSbEMQ1bSrDP8uP7Vcvn/geIcBtF37ws41YwVu/Q/+/rld7xd+xQj9
 wPTMA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp;
 fpr=5BAD1DBA330DBDD2365C60721525170038E348E7
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692967409; x=1693572209;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ce2ufPFdKC4MRy6hsWwlCPYBCztlOD8BgZu872HwmW8=;
 b=g/392pONC/ccaldhowe6ilg+N2iYdtJlZw6pV8GqjMWNb4jP09BjNaeuucBqUymRZ7
 9DBJotVPaoXJ+KGFwtVMZ8ZXprkty/UjI6UZcIbzuq1MpSUw3iEPylHu2kOvUrW7WwNJ
 AXvaBUjOW4FRN+QY8Wm8maoM+rZcxdQzoh7RmtyxvbshgQoVPdEEabpQT2lGx00hR04p
 E6lYtAXP2TVbIc7mIhoAkPmGAPEE2XhKYzxF6e8UwBw2Fs3+T2vvx6ImIFkgrFbuJeFq
 YyQkz5s6sVSX3aRdkKDunrbITtkBopnG8hiINj/ULrmKDD9KvA8aj0g/+FmU7gNc5q8R
 L2oQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=g/392pON
Subject: [Buildroot] [PATCH] package/git: bump to version 2.42.0
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

Bump the package version to 2.42.0. For the full changelog, see the release
announcement at [1].

Link: https://lore.kernel.org/git/xmqqr0nwp8mv.fsf@gitster.g/ [1]
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 package/git/git.hash | 2 +-
 package/git/git.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/git/git.hash b/package/git/git.hash
index 91d723ecd1..d73778ad85 100644
--- a/package/git/git.hash
+++ b/package/git/git.hash
@@ -1,5 +1,5 @@
 # From: https://www.kernel.org/pub/software/scm/git/sha256sums.asc
-sha256  e748bafd424cfe80b212cbc6f1bbccc3a47d4862fb1eb7988877750478568040  git-2.41.0.tar.xz
+sha256  3278210e9fd2994b8484dd7e3ddd9ea8b940ef52170cdb606daa94d887c93b0d  git-2.42.0.tar.xz
 # Locally calculated
 sha256  5b2198d1645f767585e8a88ac0499b04472164c0d2da22e75ecf97ef443ab32e  COPYING
 sha256  1922f45d2c49e390032c9c0ba6d7cac904087f7cec51af30c2b2ad022ce0e76a  LGPL-2.1
diff --git a/package/git/git.mk b/package/git/git.mk
index 99646b10dc..853ec256a0 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GIT_VERSION = 2.41.0
+GIT_VERSION = 2.42.0
 GIT_SOURCE = git-$(GIT_VERSION).tar.xz
 GIT_SITE = $(BR2_KERNEL_MIRROR)/software/scm/git
 GIT_LICENSE = GPL-2.0, LGPL-2.1+

base-commit: 87bc648720bb4e79ac99beff8a807019ac930233
-- 
An old man doll... just what I always wanted! - Clara

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
