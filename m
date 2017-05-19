From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 19 May 2017 23:04:40 +0200
Subject: [Buildroot] [PATCH 1/2] fetchmail: gettext is not mandatory
Message-ID: <1495227881-1899-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Even when locales are enabled, gettext is not mandatory to build
fetchmail, i.e the following defconfig builds fine:

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2017.02-1096-g54a5333.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_4_8=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_10=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
BR2_PACKAGE_FETCHMAIL=y

However, if gettext provides libintl, it gets used. Therefore this
commit moves gettext from a mandatory dependency to an optional
dependency.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/fetchmail/Config.in    | 1 -
 package/fetchmail/fetchmail.mk | 8 ++++++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/fetchmail/Config.in b/package/fetchmail/Config.in
index 1e829a0..7c14176 100644
--- a/package/fetchmail/Config.in
+++ b/package/fetchmail/Config.in
@@ -4,7 +4,6 @@ config BR2_PACKAGE_FETCHMAIL
 	select BR2_PACKAGE_CA_CERTIFICATES
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_ZLIB
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  Fetchmail - the mail-retrieval daemon
 	  Client daemon to move mail from POP and IMAP to your local computer
diff --git a/package/fetchmail/fetchmail.mk b/package/fetchmail/fetchmail.mk
index 2c3786f..49ce0d3 100644
--- a/package/fetchmail/fetchmail.mk
+++ b/package/fetchmail/fetchmail.mk
@@ -20,8 +20,12 @@ FETCHMAIL_CONF_OPTS = \
 
 FETCHMAIL_DEPENDENCIES = \
 	ca-certificates \
-	openssl \
-	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
+	openssl
+
+# libintl is an optional dependency
+ifeq ($(BR2_PACKAGE_GETTEXT),y)
+FETCHMAIL_DEPENDENCIES += gettext
+endif
 
 # fetchmailconf.py script is not (yet) python3-compliant.
 # Prevent the pyc-compilation with python-3 from failing by removing this
-- 
2.7.4
