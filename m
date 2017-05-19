From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 19 May 2017 23:04:41 +0200
Subject: [Buildroot] [PATCH 2/2] fetchmail: adjust zlib handling
In-Reply-To: <1495227881-1899-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1495227881-1899-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1495227881-1899-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

fetchmail itself does not need zlib, there is no reference to it in its
source, so the "select BR2_PACKAGE_ZLIB" is not necessary. Moreover,
"zlib" was not added to FETCHMAIL_DEPENDENCIES (but was anyway in the
dependency chain through openssl).

In addition, LIBS="-lz" is only needed in static linking configurations,
to help fetchmail's configure script find OpenSSL (it doesn't use
pkg-config unfortunately).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/fetchmail/Config.in    | 1 -
 package/fetchmail/fetchmail.mk | 4 ++++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/fetchmail/Config.in b/package/fetchmail/Config.in
index 7c14176..62f4f84 100644
--- a/package/fetchmail/Config.in
+++ b/package/fetchmail/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_FETCHMAIL
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_CA_CERTIFICATES
 	select BR2_PACKAGE_OPENSSL
-	select BR2_PACKAGE_ZLIB
 	help
 	  Fetchmail - the mail-retrieval daemon
 	  Client daemon to move mail from POP and IMAP to your local computer
diff --git a/package/fetchmail/fetchmail.mk b/package/fetchmail/fetchmail.mk
index 49ce0d3..164b2f8 100644
--- a/package/fetchmail/fetchmail.mk
+++ b/package/fetchmail/fetchmail.mk
@@ -13,7 +13,11 @@ FETCHMAIL_LICENSE_FILES = COPYING
 FETCHMAIL_AUTORECONF = YES
 FETCHMAIL_GETTEXTIZE = YES
 
+# needed to help fetchmail detecting the availability of openssl,
+# because it doesn't use pkg-config
+ifeq ($(BR2_STATIC_LIBS),y)
 FETCHMAIL_CONF_ENV += LIBS="-lz"
+endif
 
 FETCHMAIL_CONF_OPTS = \
 	--with-ssl=$(STAGING_DIR)/usr
-- 
2.7.4
