From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 15 Oct 2012 10:20:59 +0200
Subject: [Buildroot] [git commit] package: add gnupg
Message-ID: <20121015082204.6813A99871@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=260a5820180760d4b00e530041d98eab4bab60fc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in       |    1 +
 package/gnupg/Config.in |   35 ++++++++++++++++++++++++++++++++++
 package/gnupg/gnupg.mk  |   48 +++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 84 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index c56f438..d7b3db6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -664,6 +664,7 @@ source "package/dash/Config.in"
 endif
 source "package/dialog/Config.in"
 source "package/file/Config.in"
+source "package/gnupg/Config.in"
 source "package/inotify-tools/Config.in"
 source "package/lockfile-progs/Config.in"
 source "package/logrotate/Config.in"
diff --git a/package/gnupg/Config.in b/package/gnupg/Config.in
new file mode 100644
index 0000000..8ddffaa
--- /dev/null
+++ b/package/gnupg/Config.in
@@ -0,0 +1,35 @@
+config BR2_PACKAGE_GNUPG
+	bool "gnupg"
+	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_NCURSES
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
+if BR2_PACKAGE_GNUPG
+
+config BR2_PACKAGE_GNUPG_GPGV
+	bool "gpgv"
+	help
+	  gpgv is an OpenPGP signature verification tool.
+
+	  This program is actually a stripped-down version of gpg
+	  which is only able to check signatures. It is somewhat
+	  smaller than the fully-blown gpg and uses a different (and
+	  simpler) way to check that the public keys used to make the
+	  signature are valid. There are no configuration files and
+	  only a few options are implemented.
+
+config BR2_PACKAGE_GNUPG_GPGSPLIT
+	bool "gpgsplit"
+	help
+	  gpgsplit splits an OpenPGP message into packets.
+
+endif
diff --git a/package/gnupg/gnupg.mk b/package/gnupg/gnupg.mk
new file mode 100644
index 0000000..4b5c0a1
--- /dev/null
+++ b/package/gnupg/gnupg.mk
@@ -0,0 +1,48 @@
+#############################################################
+#
+# gnupg
+#
+#############################################################
+
+GNUPG_VERSION = 1.4.12
+GNUPG_SOURCE = gnupg-$(GNUPG_VERSION).tar.bz2
+GNUPG_SITE = ftp://ftp.gnupg.org/gcrypt/gnupg
+GNUPG_LICENSE = GPLv3+
+GNUPG_LICENSE_FILES = COPYING
+GNUPG_DEPENDENCIES = zlib ncurses
+GNUPG_CONF_OPT = --disable-rpath --enable-minimal --disable-regex
+
+ifeq ($(BR2_PACKAGE_BZIP2),y)
+GNUPG_CONF_OPT += --enable-bzip2
+GNUPG_DEPENDENCIES += bzip2
+endif
+
+ifeq ($(BR2_PACKAGE_LIBCURL),y)
+GNUPG_CONF_ENV += ac_cv_path__libcurl_config=$(STAGING_DIR)/usr/bin/curl-config
+GNUPG_DEPENDENCIES += libcurl
+else
+GNUPG_CONF_OPT += --without-libcurl
+endif
+
+ifeq ($(BR2_PACKAGE_READLINE),y)
+GNUPG_DEPENDENCIES += readline
+else
+GNUPG_CONF_OPT += --without-readline
+endif
+
+ifneq ($(BR2_PACKAGE_GNUPG_GPGV),y)
+define GNUPG_REMOVE_GPGV
+	rm -f $(TARGET_DIR)/usr/bin/gpgv \
+		$(TARGET_DIR)/usr/share/man/man1/gpgv.1
+endef
+GNUPG_POST_INSTALL_TARGET_HOOKS += GNUPG_REMOVE_GPGV
+endif
+
+ifneq ($(BR2_PACKAGE_GNUPG_GPGSPLIT),y)
+define GNUPG_REMOVE_GPGSPLIT
+	rm -f $(TARGET_DIR)/usr/bin/gpgsplit
+endef
+GNUPG_POST_INSTALL_TARGET_HOOKS += GNUPG_REMOVE_GPGSPLIT
+endif
+
+$(eval $(autotools-package))
