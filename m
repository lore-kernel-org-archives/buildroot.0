From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 May 2017 23:04:53 +0200
Subject: [Buildroot] [git commit] fetchmail: adjust zlib handling
Message-ID: <20170601202901.5BAE27F945@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=281d8451c4082fb2e1f0e65c7e10aecfbe192482
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
