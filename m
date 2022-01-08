Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09F6EC433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 10:03:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4B358146F;
	Sat,  8 Jan 2022 10:03:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dWKkPu52d8Dc; Sat,  8 Jan 2022 10:03:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E877A81442;
	Sat,  8 Jan 2022 10:03:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 98AE81BF957
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 10:03:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 933F340886
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 10:03:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZGJ9agdnfJqn for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 10:03:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C26EF405A6
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 10:03:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id B7B0882AB7; Sat,  8 Jan 2022 09:57:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jan 2022 11:01:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 315ba5c26dd6bb0c01067e8346b4a7eceb7d0ee1
X-Git-Newrev: 21648affd254d1cfe9e10735d558832ecb576155
X-Patchwork-Hint: ignore
Message-Id: <20220108095719.B7B0882AB7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/matchbox-lib: bump to version 1.12
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=21648affd254d1cfe9e10735d558832ecb576155
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop second and third patches (already in version)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/matchbox-lib/0002-libpng15.patch         | 26 ------------------------
 package/matchbox-lib/0003-include-setjmp-h.patch | 17 ----------------
 package/matchbox-lib/matchbox-lib.hash           |  3 +--
 package/matchbox-lib/matchbox-lib.mk             |  6 ++++--
 4 files changed, 5 insertions(+), 47 deletions(-)

diff --git a/package/matchbox-lib/0002-libpng15.patch b/package/matchbox-lib/0002-libpng15.patch
deleted file mode 100644
index 3d68573b5f..0000000000
--- a/package/matchbox-lib/0002-libpng15.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-Support for libpng 1.5+ shamelessly taken from Gentoo.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
---- a/libmb/mbpixbuf.c
-+++ b/libmb/mbpixbuf.c
-@@ -247,7 +247,7 @@
-     return NULL;
-   }
- 
--  if ( setjmp( png_ptr->jmpbuf ) ) {
-+  if ( setjmp( png_jmpbuf(png_ptr) ) ) {
-     png_destroy_read_struct( &png_ptr, &info_ptr, NULL);
-     fclose(fd);
-     return NULL;
-@@ -269,8 +269,8 @@
-       ( color_type == PNG_COLOR_TYPE_GRAY_ALPHA ))
-     png_set_gray_to_rgb(png_ptr);
-  
--  if ( info_ptr->color_type == PNG_COLOR_TYPE_RGB_ALPHA 
--       || info_ptr->color_type == PNG_COLOR_TYPE_GRAY_ALPHA
-+  if ( color_type == PNG_COLOR_TYPE_RGB_ALPHA 
-+       || color_type == PNG_COLOR_TYPE_GRAY_ALPHA
-        )
-     *has_alpha = 1;
-   else
diff --git a/package/matchbox-lib/0003-include-setjmp-h.patch b/package/matchbox-lib/0003-include-setjmp-h.patch
deleted file mode 100644
index 72e1e45d8f..0000000000
--- a/package/matchbox-lib/0003-include-setjmp-h.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-matchbox-lib: include setjmp.h
-
-Based on this upstream patch:
-
-   http://git.yoctoproject.org/cgit/cgit.cgi/libmatchbox/commit/?id=9315bcce1f01e7d6c00161442d61d3c676794d9d
-
-Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---- libmatchbox-1.9/libmb/mbpixbuf.c.orig	2014-02-21 12:45:46.867035956 +0000
-+++ libmatchbox-1.9/libmb/mbpixbuf.c	2014-02-21 12:46:43.482949583 +0000
-@@ -22,6 +22,7 @@
- 
- #include <strings.h>
- #include "mbpixbuf.h"
-+#include <setjmp.h>
- 
- #define BYTE_ORD_24_RGB  0
- #define BYTE_ORD_24_RBG  1
diff --git a/package/matchbox-lib/matchbox-lib.hash b/package/matchbox-lib/matchbox-lib.hash
index d48fb32043..8144c10258 100644
--- a/package/matchbox-lib/matchbox-lib.hash
+++ b/package/matchbox-lib/matchbox-lib.hash
@@ -1,4 +1,3 @@
-# From http://downloads.yoctoproject.org/releases/matchbox/libmatchbox/1.9/libmatchbox-1.9.tar.bz2.md5
-md5	9f73e7515cc4679171a5db180dc1343b	libmatchbox-1.9.tar.bz2
 # Locally computed
+sha256  5c7795e46c24d848a2b960f3b994911165d95e5d5731e39105ee0d808d2373eb  libmatchbox-1.12.tar.bz2
 sha256  a190dc9c8043755d90f8b0a75fa66b9e42d4af4c980bf5ddc633f0124db3cee7  COPYING
diff --git a/package/matchbox-lib/matchbox-lib.mk b/package/matchbox-lib/matchbox-lib.mk
index 5541867699..00ca4a0d15 100644
--- a/package/matchbox-lib/matchbox-lib.mk
+++ b/package/matchbox-lib/matchbox-lib.mk
@@ -4,11 +4,13 @@
 #
 ################################################################################
 
-MATCHBOX_LIB_VERSION = 1.9
+MATCHBOX_LIB_VERSION = 1.12
 MATCHBOX_LIB_SOURCE = libmatchbox-$(MATCHBOX_LIB_VERSION).tar.bz2
-MATCHBOX_LIB_SITE = http://downloads.yoctoproject.org/releases/matchbox/libmatchbox/$(MATCHBOX_LIB_VERSION)
+MATCHBOX_LIB_SITE = http://git.yoctoproject.org/cgit/cgit.cgi/libmatchbox/snapshot
 MATCHBOX_LIB_LICENSE = LGPL-2.1+
 MATCHBOX_LIB_LICENSE_FILES = COPYING
+# From git
+MATCHBOX_LIB_AUTORECONF = YES
 MATCHBOX_LIB_INSTALL_STAGING = YES
 MATCHBOX_LIB_DEPENDENCIES = host-pkgconf xlib_libXext
 MATCHBOX_LIB_CONF_OPTS = --disable-doxygen-docs
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
