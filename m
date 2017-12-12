From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Dec 2017 09:30:29 +0100
Subject: [Buildroot] [git commit] gnupg: add host package
Message-ID: <20171212082413.5DA6782849@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a4a74005af911e22a2a2fb10a2d011fbf074a5d1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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

diff --git a/package/Config.in.host b/package/Config.in.host
index 48b6f8c..dd6415b 100644
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
index 0000000..a872ec8
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
index 0ed3e1e..3ff202b 100644
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
