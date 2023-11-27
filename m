Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F0A8C4167B
	for <buildroot@archiver.kernel.org>; Mon, 27 Nov 2023 13:31:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 588D540549;
	Mon, 27 Nov 2023 13:31:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 588D540549
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xGiUa_MabfVz; Mon, 27 Nov 2023 13:31:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 78AA34034D;
	Mon, 27 Nov 2023 13:30:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 78AA34034D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5CF4A1BF2BC
 for <buildroot@lists.busybox.net>; Mon, 27 Nov 2023 13:30:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3692581274
 for <buildroot@lists.busybox.net>; Mon, 27 Nov 2023 13:30:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3692581274
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZrCAiUJz-9mO for <buildroot@lists.busybox.net>;
 Mon, 27 Nov 2023 13:30:56 +0000 (UTC)
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0BD7981272
 for <buildroot@buildroot.org>; Mon, 27 Nov 2023 13:30:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0BD7981272
Received: by mail-pg1-x52a.google.com with SMTP id
 41be03b00d2f7-5bddf66ed63so2825958a12.1
 for <buildroot@buildroot.org>; Mon, 27 Nov 2023 05:30:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701091855; x=1701696655;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Tfpt9vqhNrosHpHOl47Y5P9dZ6Rhphg+xk2veuPEjuI=;
 b=MAAPQhJSCEoB0jCTqDEkhMl6P8oH3GIZwk0BD+92lV8yfH59Fofw7J0n4C0znrTiWA
 m7m6kdZTztmXMh2h6qH+S24tnF8V7zdqXAV/4PGgA+3pkGz71za+jAqM+5gq4NrM8AwH
 t8iTYAlpREHFmAlvIGG612VevlueOl9y4+EJFi07+osXTyN3Tj4S/ZHNrj/B1byyTjvt
 1whfs2NH1M1yYG0MqG5teACCWpBucWtJIZJ1zYEMIcF54XXYTJNn2izo0HHeiWabkaeL
 zDCjHXPUXyxELUKyTIE75DNw0iAnYWZum2Bh8ufr9xCrjOkmCCNzTmy6gZdKuND1oHEC
 wqBw==
X-Gm-Message-State: AOJu0YzuyrS62CkWy62+Zrk+FSn3AIX8nZaroPb9gp9z7De490QHGXdG
 bIDDwplch0Vh0hIKN+SBpZm5AHDtBLHK5Q==
X-Google-Smtp-Source: AGHT+IF4WixWooJfuA0dnM3ZDmf0035/2P1Z+jFREqRmtx29LTMYGfxLK6We+ezt5H3cSzoUHS4o+Q==
X-Received: by 2002:a17:90b:164d:b0:285:9a7f:30e2 with SMTP id
 il13-20020a17090b164d00b002859a7f30e2mr12331973pjb.5.1701091854766; 
 Mon, 27 Nov 2023 05:30:54 -0800 (PST)
Received: from archie.me ([103.131.18.64]) by smtp.gmail.com with ESMTPSA id
 w2-20020a17090a4f4200b00280c9ba1176sm7095427pjl.48.2023.11.27.05.30.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Nov 2023 05:30:54 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
 id D0CD9101BCCB3; Mon, 27 Nov 2023 20:30:51 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Buildroot Development <buildroot@buildroot.org>
Date: Mon, 27 Nov 2023 20:30:44 +0700
Message-ID: <20231127133043.847846-2-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1496; i=bagasdotme@gmail.com;
 h=from:subject; bh=iQmSnhzp5VtTLETAumJlj7QethbyjHmF79CK/qz/kpI=;
 b=owGbwMvMwCUmqirOYPHY4znjabUkhtSUWcxBHu2bHP7mGRzZ6Fe0dFegwc0Xnk9X7Z+gkLK2T
 J5nHXd2RykLgxgXg6yYIkv0Wtldxrx7L5nFJBTBzGFlAhnCwMUpABOxNWVkWFvDIywbMmF/B88l
 LUGG+6ZV9y/tm+wQeUlmxe7PjJ7xCgz/c9Z1394hOy8m80axuMSUmP+Hig5ucPib9OK1w6LIe5c
 esgEA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp;
 fpr=5BAD1DBA330DBDD2365C60721525170038E348E7
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701091855; x=1701696655; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Tfpt9vqhNrosHpHOl47Y5P9dZ6Rhphg+xk2veuPEjuI=;
 b=M7m6h5RlLiHXOmhkDCt6ZllwzNnblzQMmVWsS7M/IjjNS+lPkyxDtRLRjYzCaLKvNK
 bQ16NOBPH6SrGN6/8tnrashtNn1A84/iahh8PBDBpwHlU/qtmqVUmpf3KuO3oVwUCftY
 GycRDUfrcoQ/dRGKfcF9jibT2dONx0NaJFAhvlwvQ/ENyM6w3yFrXqTNi9W5W24n1b8x
 jpYkdXO3vwaJ1pxWytA+buYgnr6N+8gsRmNbjiVun8RKsI1C2+4273XKx9CSUToAD4If
 I8PqIudNxrN3EUMAN7xV0s1Xfu4aXy8X1iYW9jCaUq7iBqfuxA5UB5tIGrRwhNslxxco
 XEbA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=M7m6h5Rl
Subject: [Buildroot] [PATCH] package/git bump to version 2.43.0
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
