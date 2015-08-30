From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 30 Aug 2015 23:38:32 +0200
Subject: [Buildroot] [git commit branch/next] libssh: new package
Message-ID: <20150830213903.9593781D89@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=aa016797444017d4379a139e39697e38ed2e2357
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

libssh2 and libssh both implement SSH and provide a library API for apps.
Both support SSH, SFTP, auth, channels etc. Both are 25K-30K lines of code.

[libssh2 vs libssh - A comparison]
http://www.libssh2.org/libssh2-vs-libssh.html

[Peter: add sha256 hash, fix typo in help text]
Signed-off-by: Scott Fan <fancp2007@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in          |    1 +
 package/libssh/Config.in   |   11 +++++++++++
 package/libssh/libssh.hash |    4 ++++
 package/libssh/libssh.mk   |   36 ++++++++++++++++++++++++++++++++++++
 4 files changed, 52 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index cb548bb..914b838 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -757,6 +757,7 @@ menu "Crypto"
 	source "package/libsecret/Config.in"
 	source "package/libsha1/Config.in"
 	source "package/libsodium/Config.in"
+	source "package/libssh/Config.in"
 	source "package/libssh2/Config.in"
 	source "package/nettle/Config.in"
 	source "package/openssl/Config.in"
diff --git a/package/libssh/Config.in b/package/libssh/Config.in
new file mode 100644
index 0000000..080ad18
--- /dev/null
+++ b/package/libssh/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_LIBSSH
+        bool "libssh"
+        # Either OpenSSL or libgcrypt are mandatory
+        select BR2_PACKAGE_LIBGCRYPT if !BR2_PACKAGE_OPENSSL
+        help
+          libssh is a multiplatform C library implementing the SSHv2
+          and SSHv1 protocol on client and server side. With libssh,
+          you can remotely execute programs, transfer files, use a
+          secure and transparent tunnel for your remote applications.
+
+          http://www.libssh.org/
diff --git a/package/libssh/libssh.hash b/package/libssh/libssh.hash
new file mode 100644
index 0000000..473ced3
--- /dev/null
+++ b/package/libssh/libssh.hash
@@ -0,0 +1,4 @@
+# from https://red.libssh.org/projects/libssh/files/
+md5	bffc9dc548c3bae3a3afc5ac1654b272	libssh-0.7.1.tar.xz
+# Locally calculated
+sha256	2fc7ccf96d3263cbd8ab520118cb94d9a2e11714c61e22b3f761fc5352fd046d  libssh-0.7.1.tar.xz
diff --git a/package/libssh/libssh.mk b/package/libssh/libssh.mk
new file mode 100644
index 0000000..39cff50
--- /dev/null
+++ b/package/libssh/libssh.mk
@@ -0,0 +1,36 @@
+################################################################################
+#
+## libssh
+#
+#################################################################################
+
+LIBSSH_VERSION = 0.7.1
+LIBSSH_SOURCE = libssh-$(LIBSSH_VERSION).tar.xz
+LIBSSH_SITE = https://red.libssh.org/attachments/download/154
+LIBSSH_LICENSE = LGPLv2.1
+LIBSSH_LICENSE_FILES = COPYING
+LIBSSH_INSTALL_STAGING = YES
+LIBSSH_SUPPORTS_IN_SOURCE_BUILD = NO
+LIBSSH_CONF_OPTS = \
+        -DWITH_STACK_PROTECTOR=OFF \
+        -DWITH_SERVER=OFF \
+        -DWITH_EXAMPLES=OFF
+
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+LIBSSH_CONF_OPTS += -DWITH_ZLIB=ON
+LIBSSH_DEPENDENCIES += zlib
+else
+LIBSSH_CONF_OPTS += -DWITH_ZLIB=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
+LIBSSH_CONF_OPTS += -DWITH_GCRYPT=ON
+LIBSSH_DEPENDENCIES += libgcrypt
+else
+LIBSSH_CONF_OPTS += -DWITH_GCRYPT=OFF
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+LIBSSH_DEPENDENCIES += openssl
+endif
+endif
+
+$(eval $(cmake-package))
