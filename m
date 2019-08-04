From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 4 Aug 2019 12:11:19 +0200
Subject: [Buildroot] [git commit] package/libcurl: introduce options to
 extend/reduce feature set
Message-ID: <20190804100829.B33598DFE2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=02e6805010725c75d855b0e4ee938c0db70e3307
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Libcurl is more than 250 KiB (libcurl) / 100 KiB (curl binary) in size.
About 50 KiB / 15 KiB of this can be saved by disabling features/protocols
that are not commonly needed:

- proxy support: 15 KiB
- cookies support: 10 KiB
- various less common protocols: 25 KiB (libcurl) + 15 KiB (curl binary)

Note that the exact amount of space saved depends on the architecture,
toolchain, and other factors.

Other packages that are selecting libcurl might require protocols from the
'extra' set. But, there is no clear way to find out which packages are in
this situation, in particular because issues may only be visible at runtime.

Note: remove the text 'enable' on the option for 'verbose strings' as that
is more common in Buildroot.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
[Peter: unconditionally remove the libcurl-option to generate C code]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcurl/Config.in  | 28 +++++++++++++++++++++++++++-
 package/libcurl/libcurl.mk | 44 +++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 70 insertions(+), 2 deletions(-)

diff --git a/package/libcurl/Config.in b/package/libcurl/Config.in
index 9c62539e4d..0511786dc6 100644
--- a/package/libcurl/Config.in
+++ b/package/libcurl/Config.in
@@ -15,10 +15,36 @@ config BR2_PACKAGE_CURL
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
+config BR2_PACKAGE_LIBCURL_EXTRA_PROTOCOLS_FEATURES
+	bool "enable extra protocols and features"
+	default y
+	help
+	  Enable the following extra protocols and features:
+	  - LDAP / LDAPS
+	  - POP3 / IMAP / SMTP
+	  - Telnet
+	  - TFTP
+	  - RTSP
+	  - SMB / CIFS
+	  - DICT
+	  - Gopher
+
 config BR2_PACKAGE_LIBCURL_TLS_SUPPORT
 	bool
 	default y if BR2_PACKAGE_OPENSSL
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 8bb215381c..bab7c8e1be 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -18,9 +18,11 @@ LIBCURL_INSTALL_STAGING = YES
 # on non-MMU platforms. Moreover, this authentication method is
 # probably almost never used. See
 # http://curl.haxx.se/docs/manpage.html#--ntlm.
+# Likewise, there is no compiler on the target, so libcurl-option (to
+# generate C code) isn't very useful
 LIBCURL_CONF_OPTS = --disable-manual --disable-ntlm-wb \
 	--enable-hidden-symbols --with-random=/dev/urandom --disable-curldebug \
-	--without-polarssl
+	--without-polarssl --disable-libcurl-option
 
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 LIBCURL_CONF_OPTS += --enable-threaded-resolver
@@ -108,6 +110,46 @@ else
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
+ifeq ($(BR2_PACKAGE_LIBCURL_EXTRA_PROTOCOLS_FEATURES),y)
+LIBCURL_CONF_OPTS += \
+	--enable-dict \
+	--enable-gopher \
+	--enable-imap \
+	--enable-ldap \
+	--enable-ldaps \
+	--enable-pop3 \
+	--enable-rtsp \
+	--enable-smb \
+	--enable-smtp \
+	--enable-telnet \
+	--enable-tftp
+else
+LIBCURL_CONF_OPTS += \
+	--disable-dict \
+	--disable-gopher \
+	--disable-imap \
+	--disable-ldap \
+	--disable-ldaps \
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
