Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9565EC43334
	for <buildroot@archiver.kernel.org>; Wed, 22 Jun 2022 17:13:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D9D7417CF;
	Wed, 22 Jun 2022 17:13:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D9D7417CF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hUVgoNjMvGkI; Wed, 22 Jun 2022 17:13:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A0B59417B6;
	Wed, 22 Jun 2022 17:13:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A0B59417B6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8618E1BF3E9
 for <buildroot@lists.busybox.net>; Wed, 22 Jun 2022 17:13:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 601D260BFA
 for <buildroot@lists.busybox.net>; Wed, 22 Jun 2022 17:13:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 601D260BFA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IRch2Ug5I210 for <buildroot@lists.busybox.net>;
 Wed, 22 Jun 2022 17:13:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 42B1660B9B
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 42B1660B9B
 for <buildroot@buildroot.org>; Wed, 22 Jun 2022 17:13:51 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id e25so20476990wrc.13
 for <buildroot@buildroot.org>; Wed, 22 Jun 2022 10:13:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sC68x71fJ6yr9gOoS3RdYGdRPhDxaZnaikzyRYFTn1w=;
 b=UpnVj5cQi5oZ9HFyqD1THL6OXj4qbf00yAfYkKsrSb+EaF0kM4KxRJVozdtHqw7ROi
 +CH18KzqF8el6hQZLPbyKq/5q4Ivqq1qUFqvnsMcac+qcho8UfFqB2SyYCwngkG9fiZH
 GvOZtPIOa03f3xNs8OemfOBPQdOdUfjriImNt6pY3o7mx71VM3fSWCKM0hnuBiVgx0jg
 KUlt9W/fCj3hUgHFNtxvZcFaKAfs3coyoutNVeKE9tFFw1LYP1G8LrLW0tLyYzekzk6x
 +mOAzzabyPJHJCLUPf/XbrobZkV6ZNhAiEbLoWUAvmixVzf7dcP+6NQMi5IF+2nP5s2E
 9wMA==
X-Gm-Message-State: AJIora/mvlJBvNWkj1EYQG1gzM5DSth4lQ3j1a1SibIxto5SPf23Qz7A
 ICKkZYF0Dp0ttTI3C891dGe1CdvRp6c=
X-Google-Smtp-Source: AGRyM1uJHnW/Cdoml7EN4LbwwhbuIJo0dB/LDo4L3y3gwlFpILzakTNv4kJbvbPO0g6mGdbHP6PG1Q==
X-Received: by 2002:a05:6000:1e1c:b0:21b:8a12:acba with SMTP id
 bj28-20020a0560001e1c00b0021b8a12acbamr4604364wrb.710.1655918029223; 
 Wed, 22 Jun 2022 10:13:49 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 m5-20020a5d4a05000000b0021b903a018bsm767564wrq.92.2022.06.22.10.13.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jun 2022 10:13:48 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 22 Jun 2022 19:11:05 +0200
Message-Id: <20220622171105.104081-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sC68x71fJ6yr9gOoS3RdYGdRPhDxaZnaikzyRYFTn1w=;
 b=NXxLdF+JVHvsLKgXKyjD4Enr4zM6sY+7i4rGq/XmHHm55KafkBkfkfWOtnPGc25/zg
 h9MjeTMZNPuHFv9+GG0Wfni8av45JhFgpPXGurBlG6qFajiRvzW01ATQPqFuTyagG29p
 RQWZnXHfaeUg/IxirCwNZc3s4mc5a+zZRiSXlGLK70cN7f72ttbMNfQpPm1dqUZw7osw
 qIPpFpCvIbyx/h9acc2QIQpHM1sCzktx1i5DQT0+Yby516VnwRcCq8nS6V/dahXea4j7
 UBuFNrKqNiuxjG5HL75ubCpgfTwa6PrgSGi0hkIVEwOy0CRtaPo797EN7IJvkcf+oKn6
 kDNg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=NXxLdF+J
Subject: [Buildroot] [PATCH 1/1] package/libnl: bump to version 3.6.0
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Drop first patch (already in version)
- Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...orkaround-to-the-libc-compat.h-copy.patch} |  0
 ...rivate-field-in-libnl-pkg-config-fil.patch | 30 -------------------
 package/libnl/libnl.hash                      |  8 ++---
 package/libnl/libnl.mk                        |  2 +-
 4 files changed, 4 insertions(+), 36 deletions(-)
 rename package/libnl/{0002-Add-musl-workaround-to-the-libc-compat.h-copy.patch => 0001-Add-musl-workaround-to-the-libc-compat.h-copy.patch} (100%)
 delete mode 100644 package/libnl/0001-build-add-Libs.private-field-in-libnl-pkg-config-fil.patch

diff --git a/package/libnl/0002-Add-musl-workaround-to-the-libc-compat.h-copy.patch b/package/libnl/0001-Add-musl-workaround-to-the-libc-compat.h-copy.patch
similarity index 100%
rename from package/libnl/0002-Add-musl-workaround-to-the-libc-compat.h-copy.patch
rename to package/libnl/0001-Add-musl-workaround-to-the-libc-compat.h-copy.patch
diff --git a/package/libnl/0001-build-add-Libs.private-field-in-libnl-pkg-config-fil.patch b/package/libnl/0001-build-add-Libs.private-field-in-libnl-pkg-config-fil.patch
deleted file mode 100644
index 2419ae282c..0000000000
--- a/package/libnl/0001-build-add-Libs.private-field-in-libnl-pkg-config-fil.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From db0d59cd06f3ffd350379847c0885e1bfb85af0f Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Sat, 7 Mar 2015 11:34:42 +0100
-Subject: [PATCH] build: add Libs.private field in libnl pkg-config file
-
-In order to support static linking, the libnl pkg-config file should
-indicate in its Libs.private field the libraries that libnl-3.0.a
-requires. The LIBS variable contains the appropriate list of
-libraries: -lm in all cases, and -lpthread when pthread support is
-enabled. This allows to statically link applications against libnl
-properly.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- libnl-3.0.pc.in | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/libnl-3.0.pc.in b/libnl-3.0.pc.in
-index b87e3dc..ddbc999 100644
---- a/libnl-3.0.pc.in
-+++ b/libnl-3.0.pc.in
-@@ -7,4 +7,5 @@ Name: libnl
- Description: Convenience library for netlink sockets
- Version: @PACKAGE_VERSION@
- Libs: -L${libdir} -lnl-@MAJ_VERSION@
-+Libs.private: @LIBS@
- Cflags: -I${includedir}/libnl@MAJ_VERSION@
--- 
-2.1.0
-
diff --git a/package/libnl/libnl.hash b/package/libnl/libnl.hash
index d7cd5c9532..a0f1388528 100644
--- a/package/libnl/libnl.hash
+++ b/package/libnl/libnl.hash
@@ -1,6 +1,4 @@
-# From https://github.com/thom311/libnl/releases/download/libnl3_5_0/libnl-3.5.0.tar.gz.md5sum
-md5 74ba57b1b1d6f9f92268aa8141d8e8e4  libnl-3.5.0.tar.gz
-# From https://github.com/thom311/libnl/releases/download/libnl3_5_0/libnl-3.5.0.tar.gz.sha256sum
-sha256 352133ec9545da76f77e70ccb48c9d7e5324d67f6474744647a7ed382b5e05fa  libnl-3.5.0.tar.gz
+# From https://github.com/thom311/libnl/releases/download/libnl3_6_0/libnl-3.6.0.tar.gz.sha256sum
+sha256  532155fd011e5a805bd67121b87a01c757e2bb24112ac17e69cb86013b970009  libnl-3.6.0.tar.gz
 # Locally calculated
-sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551	COPYING
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libnl/libnl.mk b/package/libnl/libnl.mk
index fc9398b29a..d3bd185093 100644
--- a/package/libnl/libnl.mk
+++ b/package/libnl/libnl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNL_VERSION = 3.5.0
+LIBNL_VERSION = 3.6.0
 LIBNL_SITE = https://github.com/thom311/libnl/releases/download/libnl$(subst .,_,$(LIBNL_VERSION))
 LIBNL_LICENSE = LGPL-2.1+
 LIBNL_LICENSE_FILES = COPYING
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
