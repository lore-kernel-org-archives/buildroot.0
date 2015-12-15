From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Dec 2015 22:36:24 +0100
Subject: [Buildroot] [git commit] libcroco: new package
Message-ID: <20151215213939.A568181DF8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=52d7c9b9d131051a8f420fddd3f9661c28270870
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It's required for the librsvg upgrade (ditto host variant).

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in              |  1 +
 package/libcroco/Config.in     | 20 ++++++++++++++++++++
 package/libcroco/libcroco.hash |  2 ++
 package/libcroco/libcroco.mk   | 20 ++++++++++++++++++++
 4 files changed, 43 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 26009fb..c3c1776 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1113,6 +1113,7 @@ menu "Other"
 	source "package/libcap-ng/Config.in"
 	source "package/libcgroup/Config.in"
 	source "package/libcofi/Config.in"
+	source "package/libcroco/Config.in"
 	source "package/libcrossguid/Config.in"
 	source "package/libdaemon/Config.in"
 	source "package/libee/Config.in"
diff --git a/package/libcroco/Config.in b/package/libcroco/Config.in
new file mode 100644
index 0000000..5baf83d
--- /dev/null
+++ b/package/libcroco/Config.in
@@ -0,0 +1,20 @@
+config BR2_PACKAGE_LIBCROCO
+	bool "libcroco"
+	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_LIBGLIB2
+	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
+	depends on BR2_USE_MMU # glib2
+	help
+	  Libcroco is a standalone css2 parsing and manipulation
+	  library. The parser provides a low level event driven SAC
+	  like api and a css object model like api.
+
+	  Libcroco provides a CSS2 selection engine and an
+	  experimental xml/css rendering engine.
+
+	  https://github.com/GNOME/libcroco
+
+comment "libcroco needs a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libcroco/libcroco.hash b/package/libcroco/libcroco.hash
new file mode 100644
index 0000000..20328e4
--- /dev/null
+++ b/package/libcroco/libcroco.hash
@@ -0,0 +1,2 @@
+# From http://ftp.acc.umu.se/pub/gnome/sources/libcroco/0.6/libcroco-0.6.10.sha256sum
+sha256	72066611df77f5c4fb28268cfc7306ecc1517212a6182c2ea756c326a154246c	libcroco-0.6.10.tar.xz
diff --git a/package/libcroco/libcroco.mk b/package/libcroco/libcroco.mk
new file mode 100644
index 0000000..2376684
--- /dev/null
+++ b/package/libcroco/libcroco.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# libcroco
+#
+################################################################################
+
+LIBCROCO_VERSION_MAJOR = 0.6
+LIBCROCO_VERSION = $(LIBCROCO_VERSION_MAJOR).10
+LIBCROCO_SITE = http://ftp.gnome.org/pub/gnome/sources/libcroco/$(LIBCROCO_VERSION_MAJOR)
+LIBCROCO_SOURCE = libcroco-$(LIBCROCO_VERSION).tar.xz
+LIBCROCO_INSTALL_STAGING = YES
+LIBCROCO_DEPENDENCIES = host-pkgconf libglib2 libxml2
+LIBCROCO_CONFIG_SCRIPTS = croco-$(LIBCROCO_VERSION_MAJOR)-config
+# NEWS states that it's only LGPL
+# Source code says v2.1+ even though COPYING.LIB is v2
+LIBCROCO_LICENSE = LGPLv2.1+
+LIBCROSO_LICENSE_FILES = COPYING.LIB
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
