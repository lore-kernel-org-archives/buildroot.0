From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 2 Sep 2013 22:42:52 +0200
Subject: [Buildroot] [git commit] libsecret: New package
Message-ID: <20130902213321.DC3329B6B0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6492fb02423c091c1c2227a13dfa7e6ee4ba3e1e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libsecret is a library for storing and retrieving passwords
and other secrets. It communicates with the "Secret Service"
using DBus. gnome-keyring and ksecretservice are both
implementations of a Secret Service.

libsecret replaces libgnome-keyring.

https://wiki.gnome.org/Libsecret

[Peter: also needs host-intltool]
Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in              |    1 +
 package/libsecret/Config.in    |   15 +++++++++++++++
 package/libsecret/libsecret.mk |   24 ++++++++++++++++++++++++
 3 files changed, 40 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 6306947..9b8bc70 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -431,6 +431,7 @@ source "package/libassuan/Config.in"
 source "package/libmcrypt/Config.in"
 source "package/libmhash/Config.in"
 source "package/libnss/Config.in"
+source "package/libsecret/Config.in"
 source "package/libsha1/Config.in"
 source "package/nettle/Config.in"
 source "package/openssl/Config.in"
diff --git a/package/libsecret/Config.in b/package/libsecret/Config.in
new file mode 100644
index 0000000..a15f995
--- /dev/null
+++ b/package/libsecret/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_LIBSECRET
+	bool "libsecret"
+	select BR2_PACKAGE_LIBGLIB2
+	depends on BR2_USE_WCHAR # gettext dep in libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	help
+	  libsecret is a library for storing and retrieving passwords and other
+	  secrets. It communicates with the "Secret Service" using DBus.
+	  gnome-keyring and ksecretservice are both implementations of a Secret
+	  Service.
+
+	  https://wiki.gnome.org/Libsecret
+
+comment "libsecret requires a toolchain with WCHAR and threading support."
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libsecret/libsecret.mk b/package/libsecret/libsecret.mk
new file mode 100644
index 0000000..e445ea6
--- /dev/null
+++ b/package/libsecret/libsecret.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# libsecret
+#
+################################################################################
+
+LIBSECRET_VERSION = 0.15
+LIBSECRET_SITE = http://ftp.gnome.org/pub/GNOME/sources/libsecret/$(LIBSECRET_VERSION)
+LIBSECRET_SOURCE = libsecret-$(LIBSECRET_VERSION).tar.xz
+LIBSECRET_LICENSE = LGPLv2.1+
+LIBSECRET_LICENSE_FILES = COPYING
+LIBSECRET_INSTALL_STAGING = YES
+
+LIBSECRET_DEPENDENCIES = libglib2 host-intltool
+LIBSECRET_CONF_OPT = --disable-manpages --disable-strict --disable-coverage --enable-vala=no
+
+ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
+	LIBSECRET_DEPENDENCIES += libgcrypt
+	LIBSECRET_CONF_OPT += --enable-gcrypt
+else
+	LIBSECRET_CONF_OPT += --disable-gcrypt
+endif
+
+$(eval $(autotools-package))
