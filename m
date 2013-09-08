From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 8 Sep 2013 21:52:52 +0200
Subject: [Buildroot] [git commit] libssh2: add package
Message-ID: <20130908204534.54FA58191C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2ee180e3e2a4ddfabae9d1acdcb6b418d2174ea6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: minor white space tweaks]
Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in          |    1 +
 package/libssh2/Config.in  |   10 ++++++++++
 package/libssh2/libssh2.mk |   32 ++++++++++++++++++++++++++++++++
 3 files changed, 43 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 889533c..c3b345d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -456,6 +456,7 @@ source "package/libmhash/Config.in"
 source "package/libnss/Config.in"
 source "package/libsecret/Config.in"
 source "package/libsha1/Config.in"
+source "package/libssh2/Config.in"
 source "package/nettle/Config.in"
 source "package/openssl/Config.in"
 source "package/polarssl/Config.in"
diff --git a/package/libssh2/Config.in b/package/libssh2/Config.in
new file mode 100644
index 0000000..017fd40
--- /dev/null
+++ b/package/libssh2/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_LIBSSH2
+	bool "libssh2"
+	select BR2_PACKAGE_LIBGCRYPT if !BR2_PACKAGE_OPENSSL
+	help
+	  libssh2 is a client-side C library implementing the SSH2
+	  protocol as defined by Internet Drafts: SECSH-TRANS(22),
+	  SECSH-USERAUTH(25), SECSH-CONNECTION(23), SECSH-ARCH(20),
+	  SECSH-FILEXFER(06)*, SECSH-DHGEX(04), and SECSH-NUMBERS(10)
+
+	  http://www.libssh2.org/
diff --git a/package/libssh2/libssh2.mk b/package/libssh2/libssh2.mk
new file mode 100644
index 0000000..10eb5ed
--- /dev/null
+++ b/package/libssh2/libssh2.mk
@@ -0,0 +1,32 @@
+################################################################################
+#
+# libssh2
+#
+################################################################################
+
+LIBSSH2_VERSION = 1.4.3
+LIBSSH2_SITE = http://www.libssh2.org/download/
+LIBSSH2_LICENSE = BSD
+LIBSSH2_LICENSE_FILES = COPYING
+LIBSSH2_INSTALL_STAGING = YES
+LIBSSH2_CONF_OPT = --disable-examples-build
+
+# libssh2 must use either libgcrypt or OpenSSL
+# Only select openssl if libgcrypt is not selected
+ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
+LIBSSH2_DEPENDENCIES += libgcrypt
+LIBSSH2_CONF_OPT += --with-libgcrypt --without-openssl
+else
+LIBSSH2_DEPENDENCIES += openssl
+LIBSSH2_CONF_OPT += --with-openssl --without-libgcrypt
+endif
+
+# Add zlib support if enabled
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+LIBSSH2_DEPENDENCIES += zlib
+LIBSSH2_CONF_OPT += --with-libz
+else
+LIBSSH2_CONF_OPT += --without-libz
+endif
+
+$(eval $(autotools-package))
