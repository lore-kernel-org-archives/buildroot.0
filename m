From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Nov 2017 21:41:08 +0100
Subject: [Buildroot] [git commit] libupnp18: new package
Message-ID: <20171201205334.0F7557FAAC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=daa10662c02da1a0db7fb59a2e12614a2d0015fd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Branch 1.8.x of libupnp is not compatible with branch 1.6.x so add a
dedicated package and make it depends on !BR2_PACKAGE_LIBUPNP as
suggested by Thomas Petazzoni and Arnout Vandecappelle during review
of "libupnp: add 1.8.3 version" patch.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[Thomas: fix the dependencies of the Config.in comment.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS                       |  1 +
 package/Config.in                |  1 +
 package/libupnp18/Config.in      | 16 ++++++++++++++++
 package/libupnp18/libupnp18.hash |  3 +++
 package/libupnp18/libupnp18.mk   | 15 +++++++++++++++
 5 files changed, 36 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 442dc05..f93c617 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -611,6 +611,7 @@ F:	package/gupnp-dlna/
 F:	package/gupnp-tools/
 F:	package/hiredis/
 F:	package/igd2-for-linux/
+F:	package/libupnp18/
 F:	package/minissdpd/
 F:	package/motion/
 F:	package/tinycbor/
diff --git a/package/Config.in b/package/Config.in
index a207de8..4a7327c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1383,6 +1383,7 @@ menu "Networking"
 	source "package/libtirpc/Config.in"
 	source "package/libtorrent/Config.in"
 	source "package/libupnp/Config.in"
+	source "package/libupnp18/Config.in"
 	source "package/libupnpp/Config.in"
 	source "package/liburiparser/Config.in"
 	source "package/libvncserver/Config.in"
diff --git a/package/libupnp18/Config.in b/package/libupnp18/Config.in
new file mode 100644
index 0000000..58508e4
--- /dev/null
+++ b/package/libupnp18/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_LIBUPNP18
+	bool "libupnp18"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_PACKAGE_LIBUPNP
+	help
+	  The portable SDK for UPnP(tm) Devices (libupnp) provides
+	  developers with an API and open source code for building
+	  control points, devices, and bridges that are compliant with
+	  Version 1.0 of the Universal Plug and Play Device Architecture
+	  Specification
+
+	  http://pupnp.sourceforge.net/
+
+comment "libupnp18 needs a toolchain w/ threads"
+	depends on !BR2_PACKAGE_LIBUPNP
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libupnp18/libupnp18.hash b/package/libupnp18/libupnp18.hash
new file mode 100644
index 0000000..a5b5b07
--- /dev/null
+++ b/package/libupnp18/libupnp18.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256	9afa0b09faa9ebd9e8a6425ddbfe8d1d856544c49b1f86fde221219e569a308d	libupnp-1.8.3.tar.bz2
+sha256	0375955c8a79d6e8fa0792d45d00fc4e7710d7ac95bcbd27f9225a83f5c946fd	LICENSE
diff --git a/package/libupnp18/libupnp18.mk b/package/libupnp18/libupnp18.mk
new file mode 100644
index 0000000..a75558e
--- /dev/null
+++ b/package/libupnp18/libupnp18.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# libupnp18
+#
+################################################################################
+
+LIBUPNP18_VERSION = 1.8.3
+LIBUPNP18_SOURCE = libupnp-$(LIBUPNP18_VERSION).tar.bz2
+LIBUPNP18_SITE = http://downloads.sourceforge.net/project/pupnp/pupnp/libUPnP%20$(LIBUPNP18_VERSION)
+LIBUPNP18_CONF_ENV = ac_cv_lib_compat_ftime=no
+LIBUPNP18_INSTALL_STAGING = YES
+LIBUPNP18_LICENSE = BSD-3-Clause
+LIBUPNP18_LICENSE_FILES = LICENSE
+
+$(eval $(autotools-package))
