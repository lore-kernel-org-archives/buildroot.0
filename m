From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Dec 2017 18:04:29 +0100
Subject: [Buildroot] [PATCH] gnupg: add host package
Message-ID: <20171211170429.25644-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For E.G. post-build / post-image scripts as it generally cannot be expected
to be available on the build host and/or there are some differences in
behaviour between gnupg 1.x / 2.x.

Provide gnupg 1.x instead of 2.x, as it is simpler to build (less
dependencies) and easier to use in post-build / post-image scripts (E.G. no
gpg-agent that keeps running in the background).

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in.host       |  1 +
 package/gnupg/Config.in.host | 12 ++++++++++++
 package/gnupg/gnupg.mk       | 13 +++++++++++++
 3 files changed, 26 insertions(+)
 create mode 100644 package/gnupg/Config.in.host

diff --git a/package/Config.in.host b/package/Config.in.host
index 48b6f8c7a8..dd6415bba5 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -18,6 +18,7 @@ menu "Host utilities"
 	source "package/genext2fs/Config.in.host"
 	source "package/genimage/Config.in.host"
 	source "package/genpart/Config.in.host"
+	source "package/gnupg/Config.in.host"
 	source "package/go/Config.in.host"
 	source "package/go-bootstrap/Config.in.host"
 	source "package/google-breakpad/Config.in.host"
diff --git a/package/gnupg/Config.in.host b/package/gnupg/Config.in.host
new file mode 100644
index 0000000000..a872ec820f
--- /dev/null
+++ b/package/gnupg/Config.in.host
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_HOST_GNUPG
+	bool "host-gnupg"
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
diff --git a/package/gnupg/gnupg.mk b/package/gnupg/gnupg.mk
index 0ed3e1e063..3ff202b709 100644
--- a/package/gnupg/gnupg.mk
+++ b/package/gnupg/gnupg.mk
@@ -18,6 +18,18 @@ GNUPG_CONF_OPTS = \
 	--enable-sha256 \
 	--enable-sha512
 
+HOST_GNUPG_DEPENDENCIES = host-zlib host-ncurses
+HOST_GNUPG_CONF_OPTS = \
+	--disable-rpath \
+	--enable-minimal \
+	--disable-regex \
+	--enable-sha256 \
+	--enable-sha512 \
+	--enable-aes \
+	--enable-rsa \
+	--without-libcurl \
+	--without-readline
+
 # gnupg doesn't support assembly for coldfire
 ifeq ($(BR2_m68k_cf),y)
 GNUPG_CONF_OPTS += --disable-asm
@@ -68,3 +80,4 @@ GNUPG_POST_INSTALL_TARGET_HOOKS += GNUPG_REMOVE_GPGSPLIT
 endif
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.11.0
