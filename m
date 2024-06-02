Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7856BC25B74
	for <buildroot@archiver.kernel.org>; Sun,  2 Jun 2024 14:21:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 192518144C;
	Sun,  2 Jun 2024 14:21:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o6P0QSqjiX-b; Sun,  2 Jun 2024 14:21:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F405A833B7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F405A833B7;
	Sun,  2 Jun 2024 14:21:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 497641BF82C
 for <buildroot@lists.busybox.net>; Sun,  2 Jun 2024 14:21:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 33908833B7
 for <buildroot@lists.busybox.net>; Sun,  2 Jun 2024 14:21:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id swg81j06qSzD for <buildroot@lists.busybox.net>;
 Sun,  2 Jun 2024 14:21:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E66468144C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E66468144C
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E66468144C
 for <buildroot@buildroot.org>; Sun,  2 Jun 2024 14:20:59 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a62ef52e837so443377366b.3
 for <buildroot@buildroot.org>; Sun, 02 Jun 2024 07:20:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717338056; x=1717942856;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yCbIJthrvNrH7vja6HWaQt0ndkRM/PaFx5WIFCKIQD0=;
 b=V7KCjBREe/J5VCn2Mty/aVZCNyIxHDEQ88Y1g9PQq8E5beBc4BzYItl6pudnOfW3he
 k9DgqriLV5/SkRbEFgGvQ2wzapYd4gFrrC9iUzsc66MYVfbmvGZERPzTusQ+MKYkPdpI
 TlMrCuTsf9U173eEi6opPx92TKFPvvq9fdpO5VvuShWR1McbCiRS7aElhQyr161NcqeE
 JbZYJCfwlXvuNFetFIqJ0csphE/L5iFk1x2Q8C2sSqGx2J/JE3y0FR1iLnFfdzaD4CXk
 2RPQj9aQle7SsqPg0k78Cj72cIBTtQBIym5/gxDKl2bnIoYrnSluZHrG7PgVMQg5HaqJ
 xVEQ==
X-Gm-Message-State: AOJu0YxMztiqaO+Q9FjvRfoaIt7Pd2OCt4lPvvRr4BNbLLn0GTHFP9yY
 5f6QbBM/8Ujdm6T080EMMS2eM0EJiO9rBWt36MoN8K5wOguvUfWVDBFb4A==
X-Google-Smtp-Source: AGHT+IHtpllcdWYV7acFAefX0pxyzf/onP/CkE+B+o+0dsBP6GmR29iMxXPLyargBk26b+VJbzp+bw==
X-Received: by 2002:a17:906:d0c3:b0:a67:403a:4bf0 with SMTP id
 a640c23a62f3a-a681fe4e3c5mr441166066b.3.1717338056157; 
 Sun, 02 Jun 2024 07:20:56 -0700 (PDT)
Received: from development2.visionsystems.de (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6843c5eee3sm317461366b.135.2024.06.02.07.20.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jun 2024 07:20:55 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sun,  2 Jun 2024 16:19:54 +0200
Message-Id: <20240602141954.2667787-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1717338056; x=1717942856; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yCbIJthrvNrH7vja6HWaQt0ndkRM/PaFx5WIFCKIQD0=;
 b=YiuWtqBQCg2hTGosQ+5539cOU+vu5jeThkvks401qm3ilIdM53caZ9V/FiPKPolqFm
 eV3z9UjdFPcfO8bXmGm+Mux1/50SAXkEinbiTMrOh3BnqI0bZzZWsWdYlqY3c4bo2Tp/
 rylMBLnWW1897VrTCKGIPWIeo+Wi3K6swX9EXPBwslzGhsBQoZBE8EXaKZV9m6XvoNA6
 MHvHAk+QC5DYR2De5Xm5ZEBcdseSwm2/enOsBh2qeWZAjEevfu69iGOZXWn/6aW+tEMi
 zZCCg7RSGqD2r9YFJfOP8bQLvoqO9VauWrU9rjc+PXxQKnemAmeUniUrWrBsLoqGX5Rb
 ie7A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20230601 header.b=YiuWtqBQ
Subject: [Buildroot] [PATCH v2] package/ncftp: bump to version 3.2.7
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
From: yegorslists--- via buildroot <buildroot@buildroot.org>
Reply-To: yegorslists@googlemail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

Change download location as the new version is not available at the
old location.

Remove already upstreamed patch.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
Changes v1 -> v2:
    - Rework download location change explanation (Peter Korsgaard)
    - remove the patch from .checkpackageignore (Peter Korsgaard)
    - download xz version (Peter Korsgaard)

 .checkpackageignore                 |  1 -
 package/ncftp/0001-fix-gcc-10.patch | 24 ------------------------
 package/ncftp/ncftp.hash            |  2 +-
 package/ncftp/ncftp.mk              |  8 +++-----
 4 files changed, 4 insertions(+), 31 deletions(-)
 delete mode 100644 package/ncftp/0001-fix-gcc-10.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 8f5fc0a476..80b4643489 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1087,7 +1087,6 @@ package/musl/0001-avoid-kernel-if_ether.h.patch lib_patch.Upstream
 package/musl/0002-package-musl-Make-scheduler-functions-Linux-compatib.patch lib_patch.Upstream
 package/nano/0001-lib-getrandom.c-fix-build-with-uclibc-1.0.35.patch lib_patch.Upstream
 package/nanocom/0001-fix-build-with-gcc-10.patch lib_patch.Upstream
-package/ncftp/0001-fix-gcc-10.patch lib_patch.Upstream
 package/ncmpc/0001-meson.build-add-atomic-dependency-for-sparc.patch lib_patch.Upstream
 package/ne10/0001-CMakeLists-don-t-hard-code-thumb-code-generation.patch lib_patch.Upstream
 package/ne10/0002-fix-build-without-C.patch lib_patch.Upstream
diff --git a/package/ncftp/0001-fix-gcc-10.patch b/package/ncftp/0001-fix-gcc-10.patch
deleted file mode 100644
index 8ff9c44c50..0000000000
--- a/package/ncftp/0001-fix-gcc-10.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-Fix build with gcc 10
-
-Add missing extern to gBm to fix the following build failure with
--fno-common which is enabled by default with gcc 10:
-
-/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/10.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: bookmark.o:(.bss+0x10): multiple definition of `gBm'; gpshare.o:(.bss+0x24): first defined here
-
-Fixes:
- - http://autobuild.buildroot.org/results/78822bc0e0039e8f8949011a256cac022863276f
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-
-diff -Nura ncftp-3.2.6-orig/sh_util/gpshare.c ncftp-3.2.6/sh_util/gpshare.c
---- ncftp-3.2.6-orig/sh_util/gpshare.c	2020-08-21 10:46:34.173816750 +0200
-+++ ncftp-3.2.6/sh_util/gpshare.c	2020-08-21 10:52:25.407976319 +0200
-@@ -28,7 +28,7 @@
-
- static int gIsAtty1 = 1, gIsAtty2 = 1;
- extern int gLoadedBm, gBookmarkMatchMode;
--Bookmark gBm;
-+extern Bookmark gBm;
-
- double
- FileSize(double size, const char **uStr0, double *uMult0)
diff --git a/package/ncftp/ncftp.hash b/package/ncftp/ncftp.hash
index 3ab27df5cc..3e390b1015 100644
--- a/package/ncftp/ncftp.hash
+++ b/package/ncftp/ncftp.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  129e5954850290da98af012559e6743de193de0012e972ff939df9b604f81c23  ncftp-3.2.6-src.tar.gz
+sha256  d41c5c4d6614a8eae2ed4e4d7ada6b6d3afcc9fb65a4ed9b8711344bef24f7e8  ncftp-3.2.7-src.tar.xz
 sha256  4fe2f063d25d79c49712a272ebb68e050c703eed9c66c80108427edfe3285580  doc/LICENSE.txt
diff --git a/package/ncftp/ncftp.mk b/package/ncftp/ncftp.mk
index 676a9c5895..a3aa3fb194 100644
--- a/package/ncftp/ncftp.mk
+++ b/package/ncftp/ncftp.mk
@@ -4,11 +4,9 @@
 #
 ################################################################################

-NCFTP_VERSION = 3.2.6
-# use .gz as upstream .xz tarball has changed after the hash was added for
-# 2017.02. Can be changed back to .xz when version is bumped
-NCFTP_SOURCE = ncftp-$(NCFTP_VERSION)-src.tar.gz
-NCFTP_SITE = ftp://ftp.ncftp.com/ncftp
+NCFTP_VERSION = 3.2.7
+NCFTP_SOURCE = ncftp-$(NCFTP_VERSION)-src.tar.xz
+NCFTP_SITE = https://www.ncftp.com/public_ftp/ncftp
 NCFTP_TARGET_BINS = ncftp
 NCFTP_LICENSE = Clarified Artistic License
 NCFTP_LICENSE_FILES = doc/LICENSE.txt
--
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
