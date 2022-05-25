Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAC1EC433F5
	for <buildroot@archiver.kernel.org>; Wed, 25 May 2022 06:50:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 51AC1840AE;
	Wed, 25 May 2022 06:50:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id raEJrDYkm6Z1; Wed, 25 May 2022 06:50:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 537FD84089;
	Wed, 25 May 2022 06:50:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5CF141BF319
 for <buildroot@lists.busybox.net>; Wed, 25 May 2022 06:50:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 50F8541BA0
 for <buildroot@lists.busybox.net>; Wed, 25 May 2022 06:50:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VX3wIfWvjZiS for <buildroot@lists.busybox.net>;
 Wed, 25 May 2022 06:50:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0B23641B99
 for <buildroot@buildroot.org>; Wed, 25 May 2022 06:50:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id DA62486490; Wed, 25 May 2022 06:38:40 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 25 May 2022 08:49:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b634d504cb5a0b621f115f36c50a712e85fc8027
X-Git-Newrev: 5452b5887005298a87650ff4003ecfaecfd9aca0
X-Patchwork-Hint: ignore
Message-Id: <20220525063840.DA62486490@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gcr: don't require gnupg2
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

commit: https://git.buildroot.net/buildroot/commit/?id=5452b5887005298a87650ff4003ecfaecfd9aca0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Requiring BR2_PACKAGE_GNUPG2 introduced a recursive dependency,
since it appears gcr also supports gnupg we don't need to depend
on !BR2_PACKAGE_GNUPG and can use gnupg if needed.

Fixes:
package/gstreamer1/gstreamer1/Config.in:5:error: recursive dependency detected!
package/gstreamer1/gstreamer1/Config.in:5:	symbol BR2_PACKAGE_GSTREAMER1 is selected by BR2_PACKAGE_WEBKITGTK_MULTIMEDIA
package/webkitgtk/Config.in:90:	symbol BR2_PACKAGE_WEBKITGTK_MULTIMEDIA depends on BR2_PACKAGE_WEBKITGTK
package/webkitgtk/Config.in:24:	symbol BR2_PACKAGE_WEBKITGTK is selected by BR2_PACKAGE_MIDORI
package/midori/Config.in:24:	symbol BR2_PACKAGE_MIDORI depends on BR2_PACKAGE_GNUPG
package/gnupg/Config.in:1:	symbol BR2_PACKAGE_GNUPG is selected by BR2_PACKAGE_PYTHON_GNUPG
package/python-gnupg/Config.in:1:	symbol BR2_PACKAGE_PYTHON_GNUPG depends on BR2_PACKAGE_PYTHON3
package/python3/Config.in:5:	symbol BR2_PACKAGE_PYTHON3 is selected by BR2_PACKAGE_JACK2_DBUS
package/jack2/Config.in:35:	symbol BR2_PACKAGE_JACK2_DBUS depends on BR2_PACKAGE_JACK2
package/jack2/Config.in:1:	symbol BR2_PACKAGE_JACK2 is selected by BR2_PACKAGE_FLUIDSYNTH_JACK2
package/fluidsynth/Config.in:38:	symbol BR2_PACKAGE_FLUIDSYNTH_JACK2 depends on BR2_PACKAGE_FLUIDSYNTH
package/fluidsynth/Config.in:1:	symbol BR2_PACKAGE_FLUIDSYNTH is selected by BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_FLUIDSYNTH
package/gstreamer1/gst1-plugins-bad/Config.in:438:	symbol BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_FLUIDSYNTH depends on BR2_PACKAGE_GSTREAMER1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/gcr/Config.in    | 14 ++------------
 package/gcr/gcr.mk       | 10 +++++++---
 package/midori/Config.in |  6 ------
 3 files changed, 9 insertions(+), 21 deletions(-)

diff --git a/package/gcr/Config.in b/package/gcr/Config.in
index afbec1a317..7c5fdba008 100644
--- a/package/gcr/Config.in
+++ b/package/gcr/Config.in
@@ -1,12 +1,11 @@
 config BR2_PACKAGE_GCR
 	bool "gcr"
-	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # gnupg2
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_MMU # libglib2
 	depends on !BR2_STATIC_LIBS # p11-kit
-	depends on !BR2_PACKAGE_GNUPG # gnupg2
-	select BR2_PACKAGE_GNUPG2 # runtime
+	select BR2_PACKAGE_GNUPG2 if BR2_PACKAGE_GNUPG2_DEPENDS && !BR2_PACKAGE_GNUPG # runtime
+	select BR2_PACKAGE_GNUPG if !BR2_PACKAGE_GNUPG2_DEPENDS # runtime
 	select BR2_PACKAGE_LIBGCRYPT
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_P11_KIT
@@ -16,15 +15,6 @@ config BR2_PACKAGE_GCR
 	  https://developer.gnome.org/gcr/
 
 comment "gcr needs a toolchain w/ wchar, threads, dynamic library"
-	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
 		BR2_STATIC_LIBS
-
-comment "gcr is incompatible with gnupg, gnupg2 only"
-	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
-	depends on BR2_USE_WCHAR
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
-	depends on BR2_PACKAGE_GNUPG # gnupg2
diff --git a/package/gcr/gcr.mk b/package/gcr/gcr.mk
index ef253b4ef9..d479de82d3 100644
--- a/package/gcr/gcr.mk
+++ b/package/gcr/gcr.mk
@@ -15,14 +15,18 @@ GCR_DEPENDENCIES = \
 	p11-kit \
 	$(TARGET_NLS_DEPENDENCIES)
 GCR_INSTALL_STAGING = YES
-GCR_CONF_OPTS = \
-	-Dgpg_path=/usr/bin/gpg2 \
-	-Dgtk_doc=false
+GCR_CONF_OPTS = -Dgtk_doc=false
 # Even though COPYING is v2 the code states v2.1+
 GCR_LICENSE = LGPL-2.1+
 GCR_LICENSE_FILES = COPYING
 GCR_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
 
+ifeq ($(BR2_PACKAGE_GNUPG2),y)
+GCR_CONF_OPTS += -Dgpg_path=/usr/bin/gpg2
+else
+GCR_CONF_OPTS += -Dgpg_path=/usr/bin/gpg
+endif
+
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
 GCR_DEPENDENCIES += gobject-introspection host-libxslt host-vala
 GCR_CONF_OPTS += -Dintrospection=true
diff --git a/package/midori/Config.in b/package/midori/Config.in
index 308b0a7a42..f45444a289 100644
--- a/package/midori/Config.in
+++ b/package/midori/Config.in
@@ -4,7 +4,6 @@ config BR2_PACKAGE_MIDORI_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS
-	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
 	depends on !BR2_BINFMT_FLAT # webkitgtk -> icu
 
@@ -21,15 +20,10 @@ comment "midori needs libgtk3 w/ X11 or wayland backend"
 	depends on !BR2_PACKAGE_LIBGTK3_X11 && \
 		!BR2_PACKAGE_LIBGTK3_WAYLAND
 
-comment "midori is incompatible with gnupg, gnupg2 only"
-	depends on BR2_PACKAGE_MIDORI_ARCH_SUPPORTS
-	depends on BR2_PACKAGE_GNUPG
-
 config BR2_PACKAGE_MIDORI
 	bool "midori"
 	depends on BR2_PACKAGE_MIDORI_ARCH_SUPPORTS
 	depends on !BR2_STATIC_LIBS # webkitgtk
-	depends on !BR2_PACKAGE_GNUPG # gcr
 	depends on BR2_INSTALL_LIBSTDCPP # webkitgtk
 	depends on BR2_HOST_GCC_AT_LEAST_8 # gobject-introspection
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # webkitgtk
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
