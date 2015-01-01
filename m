From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 1 Jan 2015 11:22:52 +0100
Subject: [Buildroot] [git commit] libsrtp: new package
Message-ID: <20150101102326.4CB53807AA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=10f42fa8ae8d05bf36fd5e65f0ab2a1315cab18d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas:
 - Add better Config.in help text and fix its indentation
 - Fix comment header in .mk file
 - Uncomment useful commented lines in .mk file (SITE and AUTORECONF)
 - Add LICENSE_FILES variable.
 - Add handling of static/shared libraries build/installation.
 - Add dependency on host-pkgconf, so that libsrtp installs its own
   .pc file.
 - Add optional dependency on OpenSSL.
 - Use github helper.
 - Remove hash file, since we're downloading from Git.]

Signed-off-by: Gregory Dymarek <gregd72002@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in          |    1 +
 package/libsrtp/Config.in  |    8 ++++++++
 package/libsrtp/libsrtp.mk |   35 +++++++++++++++++++++++++++++++++++
 3 files changed, 44 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index ae6ffd7..78aa842 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -846,6 +846,7 @@ menu "Networking"
 	source "package/libshout/Config.in"
 	source "package/libsocketcan/Config.in"
 	source "package/libsoup/Config.in"
+	source "package/libsrtp/Config.in"
 	source "package/libstrophe/Config.in"
 	source "package/libtirpc/Config.in"
 	source "package/libtorrent/Config.in"
diff --git a/package/libsrtp/Config.in b/package/libsrtp/Config.in
new file mode 100644
index 0000000..ce37712
--- /dev/null
+++ b/package/libsrtp/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LIBSRTP
+	bool "libsrtp"
+	help
+	  This package provides an implementation of the Secure
+	  Real-time Transport Protocol (SRTP), the Universal Security
+	  Transform (UST), and a supporting cryptographic kernel.
+
+	  https://github.com/cisco/libsrtp
diff --git a/package/libsrtp/libsrtp.mk b/package/libsrtp/libsrtp.mk
new file mode 100644
index 0000000..5e62255
--- /dev/null
+++ b/package/libsrtp/libsrtp.mk
@@ -0,0 +1,35 @@
+################################################################################
+#
+# libsrtp
+#
+################################################################################
+
+LIBSRTP_VERSION = v1.5.0
+LIBSRTP_SITE = $(call github,cisco,libsrtp,$(LIBSRTP_VERSION))
+LIBSRTP_AUTORECONF = YES
+LIBSRTP_INSTALL_STAGING = YES
+LIBSRTP_LICENSE = BSD-3c
+LIBSRTP_LICENSE_FILES = LICENSE
+
+ifeq ($(BR2_STATIC_LIBS),y)
+LIBSRTP_MAKE_OPTS = libsrtp.a
+else ifeq ($(BR2_SHARED_LIBS),y)
+LIBSRTP_MAKE_OPTS = shared_library
+else
+LIBSRTP_MAKE_OPTS = libsrtp.a shared_library
+endif
+
+# While libsrtp is not using pkg-config itself, it checks if
+# pkg-config is available to determine whether it should install
+# libsrtp.pc. Since installing it seems useful, let's depend on
+# host-pkgconf to make sure pkg-config is installed.
+LIBSRTP_DEPENDENCIES = host-pkgconf
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+LIBSRTP_DEPENDENCIES += openssl
+LIBSRTP_CONF_OPTS += --enable-openssl
+else
+LIBSRTP_CONF_OPTS += --disable-openssl
+endif
+
+$(eval $(autotools-package))
