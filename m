From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Jul 2014 23:32:05 +0200
Subject: [Buildroot] [git commit] gnupg2: new package
Message-ID: <20140723213300.35A269CDC4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=beb49d882e03d4596d40dafad21e50460a6f1ef0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: use libpthsem instead of pth, remove !uclibc dependency,
minor formatting fixes in the .mk file.]

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Reviewed-by: Markos Chandras <Markos.Chandras@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                  |    1 +
 package/gnupg2/Config.in                           |   36 ++++++++++++++++++++
 .../gnupg2/gnupg2-0001-fix-pth-config-usage.patch  |   27 +++++++++++++++
 package/gnupg2/gnupg2.mk                           |   28 +++++++++++++++
 4 files changed, 92 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 7c9f3ad..b232284 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1119,6 +1119,7 @@ comment "Utilities"
 	source "package/dtach/Config.in"
 	source "package/file/Config.in"
 	source "package/gnupg/Config.in"
+	source "package/gnupg2/Config.in"
 	source "package/inotify-tools/Config.in"
 	source "package/lockfile-progs/Config.in"
 	source "package/logrotate/Config.in"
diff --git a/package/gnupg2/Config.in b/package/gnupg2/Config.in
new file mode 100644
index 0000000..ea74404
--- /dev/null
+++ b/package/gnupg2/Config.in
@@ -0,0 +1,36 @@
+config BR2_PACKAGE_GNUPG2
+	bool "gnupg2"
+	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_LIBGPG_ERROR
+	select BR2_PACKAGE_LIBGCRYPT
+	select BR2_PACKAGE_LIBASSUAN
+	select BR2_PACKAGE_LIBKSBA
+	select BR2_PACKAGE_PTHSEM
+	select BR2_PACKAGE_PTHSEM_COMPAT
+	depends on BR2_USE_MMU # libassuan
+	help
+	  GnuPG is the GNU project's complete and free implementation
+	  of the OpenPGP standard as defined by RFC4880. GnuPG allows
+	  to encrypt and sign your data and communication, features a
+	  versatile key management system as well as access modules
+	  for all kinds of public key directories. GnuPG, also known
+	  as GPG, is a command line tool with features for easy
+	  integration with other applications.
+
+	  http://gnupg.org/
+
+if BR2_PACKAGE_GNUPG2
+
+config BR2_PACKAGE_GNUPG2_GPGV2
+	bool "gpgv2"
+	help
+	  gpgv2 is an OpenPGP signature verification tool.
+
+	  This program is actually a stripped-down version of gpg
+	  which is only able to check signatures. It is somewhat
+	  smaller than the fully-blown gpg and uses a different (and
+	  simpler) way to check that the public keys used to make the
+	  signature are valid. There are no configuration files and
+	  only a few options are implemented.
+
+endif
diff --git a/package/gnupg2/gnupg2-0001-fix-pth-config-usage.patch b/package/gnupg2/gnupg2-0001-fix-pth-config-usage.patch
new file mode 100644
index 0000000..e58aad3
--- /dev/null
+++ b/package/gnupg2/gnupg2-0001-fix-pth-config-usage.patch
@@ -0,0 +1,27 @@
+Fix usage of PTH_CONFIG to work with pthsem
+
+The pthsem re-implement of pth provides a compatibility layer for pth,
+but its pth-config script behaves slightly differently than the
+original one when reporting the version number. This patch to gnupg2's
+configure script adjusts the version checking to support this
+difference, since Buildroot uses pth-config from pthsem.
+
+We patch directly the configure script, because triggering the entire
+autoreconf dance for just a one byte change in the configure script
+seems a bit silly.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/configure
+===================================================================
+--- a/configure
++++ b/configure
+@@ -8346,7 +8346,7 @@
+   tmp=1.3.7
+   if test "$PTH_CONFIG" != "no"; then
+ 
+-    _pth_version=`$PTH_CONFIG --version | awk 'NR==1 {print $3}'`
++    _pth_version=`$PTH_CONFIG --version | awk 'NR==1 {print $2}'`
+     _req_version="$tmp"
+ 
+     { $as_echo "$as_me:${as_lineno-$LINENO}: checking for PTH - version >= $_req_version" >&5
diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
new file mode 100644
index 0000000..fd35e6e
--- /dev/null
+++ b/package/gnupg2/gnupg2.mk
@@ -0,0 +1,28 @@
+################################################################################
+#
+# gnupg2
+#
+################################################################################
+
+GNUPG2_VERSION = 2.0.23
+GNUPG2_SOURCE = gnupg-$(GNUPG2_VERSION).tar.bz2
+GNUPG2_SITE = ftp://ftp.gnupg.org/gcrypt/gnupg
+GNUPG2_LICENSE = GPLv3+
+GNUPG2_LICENSE_FILES = COPYING
+GNUPG2_DEPENDENCIES = zlib libgpg-error libgcrypt libassuan libksba libpthsem
+GNUPG2_CONF_OPT = \
+	--disable-rpath --disable-regex --disable-doc \
+	--with-libgpg-error-prefix=$(STAGING_DIR)/usr \
+	--with-libgcrypt-prefix=$(STAGING_DIR)/usr \
+	--with-libassuan-prefix=$(STAGING_DIR)/usr \
+	--with-ksba-prefix=$(STAGING_DIR)/usr \
+	--with-pth-prefix=$(STAGING_DIR)/usr
+
+ifneq ($(BR2_PACKAGE_GNUPG2_GPGV2),y)
+define GNUPG2_REMOVE_GPGV2
+	rm -f $(TARGET_DIR)/usr/bin/gpgv2
+endef
+GNUPG2_POST_INSTALL_TARGET_HOOKS += GNUPG2_REMOVE_GPGV2
+endif
+
+$(eval $(autotools-package))
