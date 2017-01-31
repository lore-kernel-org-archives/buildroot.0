From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 31 Jan 2017 11:26:53 -0600
Subject: [Buildroot] [PATCH 1/1] libcurl: optional verbose strings config
Message-ID: <1485883613-48485-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Judd Meinders <judd.meinders@rockwellcollins.com>

This patch enables a config to set --enable-verbose during the
configuration of libcurl.  The option is triggered by setting
BR2_PACKAGE_LIBCURL_VERBOSE.

Signed-off-by: Judd Meinders <judd.meinders@rockwellcollins.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---
 package/libcurl/Config.in  | 5 +++++
 package/libcurl/libcurl.mk | 9 ++++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/package/libcurl/Config.in b/package/libcurl/Config.in
index 026ae01..fc1527f 100644
--- a/package/libcurl/Config.in
+++ b/package/libcurl/Config.in
@@ -13,4 +13,9 @@ config BR2_PACKAGE_CURL
 	help
 	  Install curl binary as well
 
+config BR2_PACKAGE_LIBCURL_VERBOSE
+	bool "enable verbose strings"
+	help
+	  Enable verbose text strings
+
 endif
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index ea37309..e901a85 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -19,8 +19,15 @@ LIBCURL_INSTALL_STAGING = YES
 # on non-MMU platforms. Moreover, this authentication method is
 # probably almost never used. See
 # http://curl.haxx.se/docs/manpage.html#--ntlm.
-LIBCURL_CONF_OPTS = --disable-verbose --disable-manual --disable-ntlm-wb \
+LIBCURL_CONF_OPTS = --disable-manual --disable-ntlm-wb \
 	--enable-hidden-symbols --with-random=/dev/urandom --disable-curldebug
+
+# Make verbose strings optional via config
+ifeq ($(BR2_PACKAGE_LIBCURL_VERBOSE),y)
+LIBCURL_CONF_OPTS += --enable-verbose
+else
+LIBCURL_CONF_OPTS += --disable-verbose
+endif
 LIBCURL_CONFIG_SCRIPTS = curl-config
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-- 
1.9.1
