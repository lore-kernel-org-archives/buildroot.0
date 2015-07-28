From: Scott Fan <fancp2007@gmail.com>
Date: Tue, 28 Jul 2015 16:15:27 +0800
Subject: [Buildroot] [PATCH 1/2] libssh: new package
Message-ID: <1438071328-12502-1-git-send-email-fancp2007@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libssh2 and libssh both implement SSH and provide a library API for apps.
Both support SSH, SFTP, auth, channels etc. Both are 25K-30K lines of code.

[libssh2 vs libssh - A comparison]
http://www.libssh2.org/libssh2-vs-libssh.html

Signed-off-by: Scott Fan <fancp2007@gmail.com>
---
 package/Config.in          |  1 +
 package/libssh/Config.in   |  9 +++++++++
 package/libssh/libssh.hash |  2 ++
 package/libssh/libssh.mk   | 16 ++++++++++++++++
 4 files changed, 28 insertions(+)
 create mode 100644 package/libssh/Config.in
 create mode 100644 package/libssh/libssh.hash
 create mode 100644 package/libssh/libssh.mk

diff --git a/package/Config.in b/package/Config.in
index 1e39c74..8d9511c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -748,6 +748,7 @@ menu "Crypto"
 	source "package/libsecret/Config.in"
 	source "package/libsha1/Config.in"
 	source "package/libsodium/Config.in"
+	source "package/libssh/Config.in"
 	source "package/libssh2/Config.in"
 	source "package/nettle/Config.in"
 	source "package/openssl/Config.in"
diff --git a/package/libssh/Config.in b/package/libssh/Config.in
new file mode 100644
index 0000000..f5c4405
--- /dev/null
+++ b/package/libssh/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_LIBSSH
+	bool "libssh"
+	help
+	  libssh is a mulitplatform C library implementing the SSHv2 and SSHv1
+	  protocol on client and server side. With libssh, you can remotely execute
+	  programs, transfer files, use a secure and transparent tunnel for your
+	  remote applications.
+
+	  http://www.libssh.org/
diff --git a/package/libssh/libssh.hash b/package/libssh/libssh.hash
new file mode 100644
index 0000000..81466cc
--- /dev/null
+++ b/package/libssh/libssh.hash
@@ -0,0 +1,2 @@
+# from https://red.libssh.org/projects/libssh/files/
+md5	bffc9dc548c3bae3a3afc5ac1654b272	libssh-0.7.1.tar.xz
diff --git a/package/libssh/libssh.mk b/package/libssh/libssh.mk
new file mode 100644
index 0000000..9d5422f
--- /dev/null
+++ b/package/libssh/libssh.mk
@@ -0,0 +1,16 @@
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
+LIBSSH_CONF_OPTS += -DWITH_SERVER=OFF
+
+$(eval $(cmake-package))
-- 
2.4.6
