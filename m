From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 Jul 2013 13:49:07 +0200
Subject: [Buildroot] [git commit] libassuan: new package
Message-ID: <20130731114959.19CDC9AF51@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=266d50245af003e316d5a74a1b0362bcc2c06be0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: bump version, adjust license informations, add
--with-gpg-error-prefix option.]

Signed-off-by: Philipp Claves <claves@budelmann-elektronik.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in              |    1 +
 package/libassuan/Config.in    |   12 ++++++++++++
 package/libassuan/libassuan.mk |   17 +++++++++++++++++
 3 files changed, 30 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index a653809..b6d6020 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -418,6 +418,7 @@ source "package/cryptodev/Config.in"
 source "package/gnutls/Config.in"
 source "package/libgcrypt/Config.in"
 source "package/libgpg-error/Config.in"
+source "package/libassuan/Config.in"
 source "package/libmcrypt/Config.in"
 source "package/libmhash/Config.in"
 source "package/libnss/Config.in"
diff --git a/package/libassuan/Config.in b/package/libassuan/Config.in
new file mode 100644
index 0000000..e97ebdc
--- /dev/null
+++ b/package/libassuan/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_LIBASSUAN
+	bool "libassuan"
+	select BR2_PACKAGE_LIBGPG_ERROR
+	help
+	  Libassuan is a small library implementing the so-called
+	  Assuan protocol.
+
+	  This protocol is used for IPC between most newer GnuPG
+	  components.  Both, server and client side functions are
+	  provided.
+
+	  http://www.gnupg.org/related_software/libassuan/
diff --git a/package/libassuan/libassuan.mk b/package/libassuan/libassuan.mk
new file mode 100644
index 0000000..6d4f7e5
--- /dev/null
+++ b/package/libassuan/libassuan.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# libassuan
+#
+################################################################################
+
+LIBASSUAN_VERSION = 2.1.1
+LIBASSUAN_SITE = ftp://ftp.gnupg.org/gcrypt/libassuan/
+LIBASSUAN_SOURCE = libassuan-$(LIBASSUAN_VERSION).tar.bz2
+LIBASSUAN_LICENSE = LGPLv2.1+
+LIBASSUAN_LICENSE_FILES = COPYING.LIB
+LIBASSUAN_INSTALL_STAGING = YES
+LIBASSUAN_DEPENDENCIES = libgpg-error
+LIBASSUAN_CONF_OPT = \
+	--with-gpg-error-prefix=$(STAGING_DIR)/usr
+
+$(eval $(autotools-package))
