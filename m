Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFAE4C4332F
	for <buildroot@archiver.kernel.org>; Thu, 22 Dec 2022 10:50:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7AFDA40BF8;
	Thu, 22 Dec 2022 10:50:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7AFDA40BF8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rtRr8i0FdyJ9; Thu, 22 Dec 2022 10:50:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8F2A0405CA;
	Thu, 22 Dec 2022 10:50:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F2A0405CA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E8AC41BF304
 for <buildroot@lists.busybox.net>; Thu, 22 Dec 2022 10:50:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C3F4F405CA
 for <buildroot@lists.busybox.net>; Thu, 22 Dec 2022 10:50:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C3F4F405CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D28HUiMETu59 for <buildroot@lists.busybox.net>;
 Thu, 22 Dec 2022 10:50:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 748ED40424
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 748ED40424
 for <buildroot@buildroot.org>; Thu, 22 Dec 2022 10:50:18 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 i82-20020a1c3b55000000b003d1e906ca23so877619wma.3
 for <buildroot@buildroot.org>; Thu, 22 Dec 2022 02:50:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QubqoC+e/YiKI1RSZNlHhQm1V490h9IgRWDSeijTwk0=;
 b=DRgW7il9tnHzBHodPyusqbi1lLKDHeFAnedNMcKf/Ji6JSvyilJuXyncKCJL43jApM
 c60JN2/F+We4FawmUql/OGWNp/VyRYdZZR8NxyIwJIXh+TuLZZPsonvBdxWfADYNtk17
 paR0CDskqQuROcYrsc+6ZWhb89Qh/ILouYXMKSd7APPVJ68eGKm9ebjbfs5gWjMOFF5v
 jJqBD4dxVFYYhRjBTXGxo7SMnMOUiEQslzIJl2PwfPIe/PheIQ8UPaMXAB9O+RPvCWq2
 37QjTdSivn1JczaqNWAX5sWdK2bcahLRtR09XxgiYaz/82LneZrZeBF3Ws+gGbSmXO+o
 ZyNw==
X-Gm-Message-State: AFqh2kpf5jonMCvFV2jAiBU6jfsfqj4EohhCESc8njGZEK6832wuKZGf
 Yz9qUTbGFE1YHZhvorpdFfgIq9aPacM=
X-Google-Smtp-Source: AMrXdXvsfl25QphaXPpTIybI3X8PH1t7FGd9vPPcEhq6Peq5sHJBliiLniMxSFbL/DRUnlO9WogBSA==
X-Received: by 2002:a1c:2b04:0:b0:3d3:4f28:40c6 with SMTP id
 r4-20020a1c2b04000000b003d34f2840c6mr4057188wmr.1.1671706216049; 
 Thu, 22 Dec 2022 02:50:16 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 k30-20020a05600c1c9e00b003cf6e1df4a8sm709053wms.15.2022.12.22.02.50.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Dec 2022 02:50:15 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 22 Dec 2022 11:50:11 +0100
Message-Id: <20221222105011.366729-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QubqoC+e/YiKI1RSZNlHhQm1V490h9IgRWDSeijTwk0=;
 b=N2BoHoUW8ceMYunjbMBubYZ9oKBqSXdzr1DHLYVT+kPGCgUxiL5YQTqhiwgnGKwTI4
 VcPj9gEV1bHtYQ2ZNwimP6+/X4GHEHSgOYgfaPipQ1oSbT20+3fMUIoHMQA5RX4idi+3
 3ia3dy+AVUg2kG/UN0GjppJALFHLZTaUOH/Z63TEIle5dATqUBn2okt5l3Ol3g4Bm4fQ
 S5zWpqQ4gahYDGz5MT4OOU+5OVQ3z30fCONHJNR3l0TLjmXtavhIxwri15nVdzW+aHQx
 9yg39T2N1UcXXzydK8bBg6+/ngo+Df5Witur9xFBwqdbO3DxoN5PI9BsRhslwUNNik0G
 BADg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=N2BoHoUW
Subject: [Buildroot] [PATCH 1/1] package/libraw: bump to version 0.21.0
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

- Drop patch (already in version)
- Drop autoreconf
- Update hash of README.md (year updated with
  https://github.com/LibRaw/LibRaw/commit/4c954948ba2de262b9cb23a1843fb8651aa3dcc1
  and licensing terms slightly reworded with
  https://github.com/LibRaw/LibRaw/commit/2a9a4de21ea7f5d15314da8ee5f27feebf239655)

https://www.libraw.org/news/libraw-0-21-release

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-Add-Libs.private-to-libraw.pc.patch  | 67 -------------------
 package/libraw/libraw.hash                    |  4 +-
 package/libraw/libraw.mk                      |  4 +-
 3 files changed, 3 insertions(+), 72 deletions(-)
 delete mode 100644 package/libraw/0001-Add-Libs.private-to-libraw.pc.patch

diff --git a/package/libraw/0001-Add-Libs.private-to-libraw.pc.patch b/package/libraw/0001-Add-Libs.private-to-libraw.pc.patch
deleted file mode 100644
index a90af23178..0000000000
--- a/package/libraw/0001-Add-Libs.private-to-libraw.pc.patch
+++ /dev/null
@@ -1,67 +0,0 @@
-From ad911cbc3c16397cf9d326c30571a4d1edaaa03f Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Wed, 2 Jun 2021 07:45:40 +0200
-Subject: [PATCH] Add Libs.private to libraw.pc
-
-Add Libs.private to libraw.pc to avoid the following static build
-failure when enabling libraw with jasper support in imagemagick:
-
-/home/giuliobenetti/autobuild/run/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: /home/giuliobenetti/autobuild/run/instance-1/output-1/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libjasper.a(jpg_enc.c.o): in function `jpg_encode':
-jpg_enc.c:(.text+0x1f4): undefined reference to `jpeg_stdio_dest'
-
--ljpeg must be added after -ljasper because jasper depends on jpeg
-
-Fixes:
- - http://autobuild.buildroot.org/results/88e43a1ea2059a684e50b0f5f2af407e8c6df2e1
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/LibRaw/LibRaw/pull/406]
----
- configure.ac   | 2 ++
- libraw.pc.in   | 1 +
- libraw_r.pc.in | 1 +
- 3 files changed, 4 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index 4ab2f313..7bf5fdfd 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -57,6 +57,7 @@ if test x$jpeg = xtrue; then
-                         AC_CHECK_HEADERS([jpeglib.h], [
-                                 CPPFLAGS="$CPPFLAGS -DUSE_JPEG -DUSE_JPEG8"
-                                 LIBS="$LIBS -ljpeg"
-+                                AC_SUBST([PACKAGE_LIBS_PRIVATE],"-ljpeg $PACKAGE_LIBS_PRIVATE")
-                         ], AC_MSG_WARN([no jpeg headers found]))
-                 ],
-                 AC_MSG_WARN([libjpeg not found])
-@@ -78,6 +79,7 @@ if test x$jasper = xtrue; then
-                         AC_CHECK_HEADERS([jasper/jasper.h], [
-                                 CPPFLAGS="$CPPFLAGS -DUSE_JASPER"
-                                 LIBS="$LIBS -ljasper"
-+                                AC_SUBST([PACKAGE_LIBS_PRIVATE],"-ljasper $PACKAGE_LIBS_PRIVATE")
-                         ], AC_MSG_WARN([no jasper headers found]))
-                 ],
-                 AC_MSG_WARN([libjasper not found])
-diff --git a/libraw.pc.in b/libraw.pc.in
-index 1bab18b8..c95fbc48 100644
---- a/libraw.pc.in
-+++ b/libraw.pc.in
-@@ -8,4 +8,5 @@ Description: Raw image decoder library (non-thread-safe)
- Requires: @PACKAGE_REQUIRES@
- Version: @PACKAGE_VERSION@
- Libs: -L${libdir} -lraw -lstdc++@PC_OPENMP@
-+Libs.private: @PACKAGE_LIBS_PRIVATE@
- Cflags: -I${includedir}/libraw -I${includedir}
-diff --git a/libraw_r.pc.in b/libraw_r.pc.in
-index e8427271..92bbbffa 100644
---- a/libraw_r.pc.in
-+++ b/libraw_r.pc.in
-@@ -8,4 +8,5 @@ Description: Raw image decoder library (thread-safe)
- Requires: @PACKAGE_REQUIRES@
- Version: @PACKAGE_VERSION@
- Libs: -L${libdir} -lraw_r -lstdc++@PC_OPENMP@
-+Libs.private: @PACKAGE_LIBS_PRIVATE@
- Cflags: -I${includedir}/libraw -I${includedir}
--- 
-2.30.2
-
diff --git a/package/libraw/libraw.hash b/package/libraw/libraw.hash
index f2a01c277b..3076810cca 100644
--- a/package/libraw/libraw.hash
+++ b/package/libraw/libraw.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  dc1b486c2003435733043e4e05273477326e51c3ea554c6864a4eafaff1004a6  LibRaw-0.20.2.tar.gz
+sha256  8747b34e8534cc2dd7ef8c92c436414b3578904fd4bf9b87ea60f17aa99fb0bd  LibRaw-0.21.0.tar.gz
 sha256  eea173a556abac0370461e57e12aab266894ea6be3874c2be05fd87871f75449  LICENSE.LGPL
 sha256  0e3098d2d54a12434715f6679ea408d57da5e8d613c385c58ecc6fe5d30cc81f  LICENSE.CDDL
-sha256  313415f7f48f6cd3cc78856626aab4bbe97dbb1e9a11db9c25396ca8d0e76cd9  README.md
+sha256  7d6650cef6cf892abe95e55a6bda1e1c42f221fd411b807deb2fc0b805b868d4  README.md
diff --git a/package/libraw/libraw.mk b/package/libraw/libraw.mk
index fc02c7915f..176acf6a44 100644
--- a/package/libraw/libraw.mk
+++ b/package/libraw/libraw.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBRAW_VERSION = 0.20.2
+LIBRAW_VERSION = 0.21.0
 LIBRAW_SOURCE = LibRaw-$(LIBRAW_VERSION).tar.gz
 LIBRAW_SITE = http://www.libraw.org/data
 LIBRAW_INSTALL_STAGING = YES
@@ -15,8 +15,6 @@ LIBRAW_LICENSE = LGPL-2.1 or CDDL-1.0
 LIBRAW_LICENSE_FILES = LICENSE.LGPL LICENSE.CDDL README.md
 LIBRAW_CPE_ID_VENDOR = libraw
 LIBRAW_DEPENDENCIES = host-pkgconf
-# https://github.com/LibRaw/LibRaw/issues/353
-LIBRAW_AUTORECONF = YES
 LIBRAW_CXXFLAGS = $(TARGET_CXXFLAGS)
 LIBRAW_CONF_ENV = CXXFLAGS="$(LIBRAW_CXXFLAGS)"
 
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
