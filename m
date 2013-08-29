From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Thu, 29 Aug 2013 17:32:25 -0500
Subject: [Buildroot] [PATCH v2 1/2] libssh2: add support for new package
	libssh2
In-Reply-To: <1377815546-3125-1-git-send-email-rjbarnet@rockwellcollins.com>
References: <1377815546-3125-1-git-send-email-rjbarnet@rockwellcollins.com>
Message-ID: <1377815546-3125-2-git-send-email-rjbarnet@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adding new package - libssh2 - under
Target packages > Libraries > Crypto > libssh2

libssh2 is a client-side C library implementing the SSH2 protocol.

For more information on this package - see their website:
http://www.libssh2.org/

Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
---

Changes v1 -> v2:
  * removed details from libssh2/Config.in (suggested by Arnout)
  * added libssh2 to select libgcrypt by default (suggested by Arnout)
  * fixed up configuration options libssh2 in libssh.mk 
    (suggested by Arnout)
  * removed removal of documentation and static libraries since the
    target finalize step takes care of this (suggested by Arnout)
  * added check for zlib dependancy

 package/Config.in          |    1 +
 package/libssh2/Config.in  |   11 +++++++++++
 package/libssh2/libssh2.mk |   32 ++++++++++++++++++++++++++++++++
 3 files changed, 44 insertions(+), 0 deletions(-)
 create mode 100644 package/libssh2/Config.in
 create mode 100644 package/libssh2/libssh2.mk

diff --git a/package/Config.in b/package/Config.in
index 97cd7da..668f550 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -424,6 +424,7 @@ source "package/libmcrypt/Config.in"
 source "package/libmhash/Config.in"
 source "package/libnss/Config.in"
 source "package/libsha1/Config.in"
+source "package/libssh2/Config.in"
 source "package/nettle/Config.in"
 source "package/openssl/Config.in"
 source "package/polarssl/Config.in"
diff --git a/package/libssh2/Config.in b/package/libssh2/Config.in
new file mode 100644
index 0000000..1fb89ff
--- /dev/null
+++ b/package/libssh2/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_LIBSSH2
+	bool "libssh2"
+	select BR2_PACKAGE_LIBGCRYPT if !BR2_PACKAGE_OPENSSL
+	help
+	  libssh2 is a client-side C library implementing the SSH2 protocol 
+	  as defined by Internet Drafts: SECSH-TRANS(22), SECSH-USERAUTH(25), 
+	  SECSH-CONNECTION(23), SECSH-ARCH(20), SECSH-FILEXFER(06)*, 
+	  SECSH-DHGEX(04), and SECSH-NUMBERS(10)
+
+	  http://www.libssh2.org/
+
diff --git a/package/libssh2/libssh2.mk b/package/libssh2/libssh2.mk
new file mode 100644
index 0000000..a6b81f0
--- /dev/null
+++ b/package/libssh2/libssh2.mk
@@ -0,0 +1,32 @@
+#############################################################
+#
+# libssh2
+#
+#############################################################
+
+LIBSSH2_VERSION = 1.4.3
+LIBSSH2_SITE = http://www.libssh2.org/download/
+LIBSSH2_LICENSE = BSD
+LIBSSH2_LICENSE_FILES = COPYING
+LIBSSH2_INSTALL_STAGING = YES
+LIBSSH2_CONF_OPT = --disable-examples-build
+
+# libssh2 must use either libgcrypt or OpenSSL
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+LIBSSH2_DEPENDENCIES += openssl
+LIBSSH2_CONF_OPT += --with-openssl --without-libgcrypt
+endif
+ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
+LIBSSH2_DEPENDENCIES += libgcrypt
+LIBSSH2_CONF_OPT += --with-libgcrypt --without-openssl
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
-- 
1.7.1
