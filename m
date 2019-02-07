From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu,  7 Feb 2019 21:55:09 +0100
Subject: [Buildroot] [PATCHv2 1/1] package/libcurl: introduce options to
 reduce feature set
Message-ID: <20190207205510.11172-1-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Libcurl is more than 250 KiB (libcurl) / 100 KiB (curl binary) in size.
About 50 KiB / 15 KiB of this can be saved by disabling features/protocols
that are not commonly needed:

- proxy support: 15 KiB
- cookies support: 10 KiB
- various less common protocols: 25 KiB (libcurl) + 15 KiB (curl binary)

Note that the exact amount of space saved depends on the architecture,
toolchain, and other factors (for example the 'reduced' set disables the
--libcurl option which only has impact on the curl binary).

Other packages that are selecting libcurl could be incompatible with these
reduced options. But, there is no clear way to find out which packages are in
this situation, in particular because issues may only be visible at runtime.

Note: remove the text 'enable' on the option for 'verbose strings' as that
is more common in Buildroot.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 package/libcurl/Config.in  | 30 +++++++++++++++++++++++++++++-
 package/libcurl/libcurl.mk | 28 ++++++++++++++++++++++++++++
 2 files changed, 57 insertions(+), 1 deletion(-)


v2:
- steer proxy and cookies support via separate options
- reword option and help text

diff --git a/package/libcurl/Config.in b/package/libcurl/Config.in
index 9c62539e4d..8e2af61f7d 100644
--- a/package/libcurl/Config.in
+++ b/package/libcurl/Config.in
@@ -15,10 +15,38 @@ config BR2_PACKAGE_CURL
 	  Install curl binary as well
 
 config BR2_PACKAGE_LIBCURL_VERBOSE
-	bool "enable verbose strings"
+	bool "verbose strings"
 	help
 	  Enable verbose text strings
 
+config BR2_PACKAGE_LIBCURL_PROXY_SUPPORT
+	bool "proxy support"
+	default y
+	help
+	  Enable proxy support.
+
+config BR2_PACKAGE_LIBCURL_COOKIES_SUPPORT
+	bool "cookies support"
+	default y
+	help
+	  Enable support for cookies.
+
+config BR2_PACKAGE_LIBCURL_SMALL
+	bool "reduced protocol/feature selection"
+	help
+	  Reduce the selection of supported protocols and features.
+	  Following protocols/features are disabled:
+	  - LDAP / LDAPS
+	  - POP3 / IMAP / SMTP
+	  - Telnet
+	  - TFTP
+	  - RTSP
+	  - SMB / CIFS
+	  - DICT
+	  - Gopher
+	  - The --libcurl option of the curl binary to generate C
+	    programs
+
 config BR2_PACKAGE_LIBCURL_TLS_SUPPORT
 	bool
 	default y if BR2_PACKAGE_OPENSSL
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 3bc5207951..8c5bc4a485 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -108,6 +108,34 @@ else
 LIBCURL_CONF_OPTS += --without-nghttp2
 endif
 
+ifeq ($(BR2_PACKAGE_LIBCURL_COOKIES_SUPPORT),y)
+LIBCURL_CONF_OPTS += --enable-cookies
+else
+LIBCURL_CONF_OPTS += --disable-cookies
+endif
+
+ifeq ($(BR2_PACKAGE_LIBCURL_PROXY_SUPPORT),y)
+LIBCURL_CONF_OPTS += --enable-proxy
+else
+LIBCURL_CONF_OPTS += --disable-proxy
+endif
+
+ifeq ($(BR2_PACKAGE_LIBCURL_SMALL),y)
+LIBCURL_CONF_OPTS += \
+	--disable-dict \
+	--disable-gopher \
+	--disable-imap \
+	--disable-ldap \
+	--disable-ldaps \
+	--disable-libcurl-option \
+	--disable-pop3 \
+	--disable-rtsp \
+	--disable-smb \
+	--disable-smtp \
+	--disable-telnet \
+	--disable-tftp
+endif
+
 define LIBCURL_FIX_DOT_PC
 	printf 'Requires: openssl\n' >>$(@D)/libcurl.pc.in
 endef
-- 
2.19.2
