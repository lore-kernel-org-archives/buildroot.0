Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A00F0C433EF
	for <buildroot@archiver.kernel.org>; Mon, 22 Nov 2021 23:07:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 317BF402B2;
	Mon, 22 Nov 2021 23:07:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4SZsPOez2xlo; Mon, 22 Nov 2021 23:07:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 73F5140299;
	Mon, 22 Nov 2021 23:07:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EDA821BF3E9
 for <buildroot@lists.busybox.net>; Mon, 22 Nov 2021 23:07:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DD1EF60646
 for <buildroot@lists.busybox.net>; Mon, 22 Nov 2021 23:07:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6UsZbXjICo2d for <buildroot@lists.busybox.net>;
 Mon, 22 Nov 2021 23:07:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6E80260626
 for <buildroot@buildroot.org>; Mon, 22 Nov 2021 23:07:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id C849F8F013; Mon, 22 Nov 2021 23:02:35 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 23 Nov 2021 00:06:23 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: b134c8a2409aca6921a94e2e12c8062ad483c08e
X-Git-Newrev: 351dbaef4e9c5bc94a67b8a92a92f6e101cf6bf6
X-Patchwork-Hint: ignore
Message-Id: <20211122230235.C849F8F013@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libpeas: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=351dbaef4e9c5bc94a67b8a92a92f6e101cf6bf6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

midori 9.0 requires libpeas.

Lua and python loaders are disabled since they have not been tested.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/Config.in            |  1 +
 package/libpeas/Config.in    | 45 ++++++++++++++++++++++++++++++++++++++++++++
 package/libpeas/libpeas.hash |  4 ++++
 package/libpeas/libpeas.mk   | 41 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 91 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index e355ab1987..4dc7bca443 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1959,6 +1959,7 @@ menu "Other"
 	source "package/libnpth/Config.in"
 	source "package/libnspr/Config.in"
 	source "package/libosmium/Config.in"
+	source "package/libpeas/Config.in"
 	source "package/libpfm4/Config.in"
 	source "package/libplatform/Config.in"
 	source "package/libplist/Config.in"
diff --git a/package/libpeas/Config.in b/package/libpeas/Config.in
new file mode 100644
index 0000000000..430e668ee7
--- /dev/null
+++ b/package/libpeas/Config.in
@@ -0,0 +1,45 @@
+config BR2_PACKAGE_LIBPEAS
+	bool "libpeas"
+	depends on BR2_USE_MMU # gobject-introspection
+	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # gobject-introspection
+	depends on BR2_HOST_GCC_AT_LEAST_8 # gobject-introspection -> host-qemu
+	depends on BR2_TOOLCHAIN_USES_GLIBC # gobject-introspection
+	depends on BR2_PACKAGE_PYTHON3 # gobject-introspection
+	select BR2_PACKAGE_GOBJECT_INTROSPECTION
+	select BR2_PACKAGE_LIBGLIB2
+	help
+	  libpeas is a gobject-based plugins engine, and is targetted at
+	  giving every application the chance to assume its own
+	  extensibility. It also has a set of features including, but
+	  not limited to:
+	    - multiple extension points
+	    - On demand (lazy) programming language support for C,
+	      Python and Lua
+	    - Simplicity of the API
+
+	  https://wiki.gnome.org/Projects/Libpeas
+
+if BR2_PACKAGE_LIBPEAS
+
+config BR2_PACKAGE_LIBPEAS_WIDGETS
+	bool "widgets"
+	depends on BR2_PACKAGE_LIBGTK3
+	help
+	  Build GTK+ widgetry
+
+comment "widget support needs libgtk3"
+	depends on !BR2_PACKAGE_LIBGTK3
+
+endif
+
+comment "libpeas needs python3"
+	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS
+	depends on BR2_USE_MMU
+	depends on !BR2_PACKAGE_PYTHON3
+
+comment "libpeas needs a glibc toolchain, gcc >= 4.9, host gcc >= 8"
+	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_USES_GLIBC || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || !BR2_HOST_GCC_AT_LEAST_8
diff --git a/package/libpeas/libpeas.hash b/package/libpeas/libpeas.hash
new file mode 100644
index 0000000000..2b030c01c5
--- /dev/null
+++ b/package/libpeas/libpeas.hash
@@ -0,0 +1,4 @@
+# From https://ftp.gnome.org/pub/GNOME/sources/libpeas/1.30/libpeas-1.30.0.sha256sum
+sha256  0bf5562e9bfc0382a9dcb81f64340787542568762a3a367d9d90f6185898b9a3  libpeas-1.30.0.tar.xz
+# Locally calculated
+sha256  592987e8510228d546540b84a22444bde98e48d03078d3b2eefcd889bec5ce8c  COPYING
diff --git a/package/libpeas/libpeas.mk b/package/libpeas/libpeas.mk
new file mode 100644
index 0000000000..097cc860eb
--- /dev/null
+++ b/package/libpeas/libpeas.mk
@@ -0,0 +1,41 @@
+################################################################################
+#
+# libpeas
+#
+################################################################################
+
+LIBPEAS_VERSION_MAJOR = 1.30
+LIBPEAS_VERSION = $(LIBPEAS_VERSION_MAJOR).0
+LIBPEAS_SOURCE = libpeas-$(LIBPEAS_VERSION).tar.xz
+LIBPEAS_SITE = http://ftp.gnome.org/pub/gnome/sources/libpeas/$(LIBPEAS_VERSION_MAJOR)
+LIBPEAS_LICENSE = LGPL-2.1+
+LIBPEAS_LICENSE_FILES = COPYING
+LIBPEAS_CPE_ID_VENDOR = gnome
+LIBPEAS_INSTALL_STAGING = YES
+LIBPEAS_DEPENDENCIES = \
+	host-libglib2 \
+	host-pkgconf \
+	gobject-introspection \
+	libglib2 \
+	$(TARGET_NLS_DEPENDENCIES)
+
+LIBPEAS_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
+
+LIBPEAS_CONF_OPTS = \
+	-Ddemos=false \
+	-Dglade_catalog=false \
+	-Dgtk_doc=false \
+	-Dintrospection=true \
+	-Dlua51=false \
+	-Dpython2=false \
+	-Dpython3=false \
+	-Dvapi=false
+
+ifeq ($(BR2_PACKAGE_LIBPEAS_WIDGETS),y)
+LIBPEAS_DEPENDENCIES += libgtk3
+LIBPEAS_CONF_OPTS += -Dwidgetry=true
+else
+LIBPEAS_CONF_OPTS += -Dwidgetry=false
+endif
+
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
