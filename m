From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Mar 2016 23:30:20 +0100
Subject: [Buildroot] [git commit] libgee: new package
Message-ID: <20160322223623.C4C6380F3D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7b7ce072e58d23e110d23fd7c509ba7e62ed85ff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in          |  1 +
 package/libgee/Config.in   | 15 +++++++++++++++
 package/libgee/libgee.hash |  2 ++
 package/libgee/libgee.mk   | 16 ++++++++++++++++
 4 files changed, 34 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 27db639..6e7fffd 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1216,6 +1216,7 @@ menu "Other"
 	source "package/libevdev/Config.in"
 	source "package/libevent/Config.in"
 	source "package/libffi/Config.in"
+	source "package/libgee/Config.in"
 	source "package/libglib2/Config.in"
 	source "package/libical/Config.in"
 	source "package/liblinear/Config.in"
diff --git a/package/libgee/Config.in b/package/libgee/Config.in
new file mode 100644
index 0000000..07c387c
--- /dev/null
+++ b/package/libgee/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_LIBGEE
+	bool "libgee"
+	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_LIBGLIB2
+	help
+	  Libgee is an utility library providing GObject-based
+	  interfaces and classes for commonly used data structures.
+
+	  https://wiki.gnome.org/Projects/Libgee
+
+comment "libgee needs a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libgee/libgee.hash b/package/libgee/libgee.hash
new file mode 100644
index 0000000..4c38c78
--- /dev/null
+++ b/package/libgee/libgee.hash
@@ -0,0 +1,2 @@
+# From http://ftp.acc.umu.se/pub/gnome/sources/libgee/0.18/libgee-0.18.0.sha256sum
+sha256	4ad99ef937d071b4883c061df40bfe233f7649d50c354cf81235f180b4244399	libgee-0.18.0.tar.xz
diff --git a/package/libgee/libgee.mk b/package/libgee/libgee.mk
new file mode 100644
index 0000000..1df322c
--- /dev/null
+++ b/package/libgee/libgee.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# libgee
+#
+################################################################################
+
+LIBGEE_VERSION_MAJOR = 0.18
+LIBGEE_VERSION = $(LIBGEE_VERSION_MAJOR).0
+LIBGEE_SITE = http://ftp.gnome.org/pub/gnome/sources/libgee/$(LIBGEE_VERSION_MAJOR)
+LIBGEE_SOURCE = libgee-$(LIBGEE_VERSION).tar.xz
+LIBGEE_DEPENDENCIES = host-pkgconf host-vala libglib2
+LIBGEE_INSTALL_STAGING = YES
+LIBGEE_LICENSE = LGPLv2.1+
+LIBGEE_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
