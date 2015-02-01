From: Doug Kehn <rdkehn@yahoo.com>
Date: Sat, 31 Jan 2015 23:26:52 -0600
Subject: [Buildroot] [PATCH] package/ipsec-tools: hybrid config support
Message-ID: <1422768412-13155-1-git-send-email-rdkehn@yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add config option for enabling hybrid mode.  Hybrid mode is required for
successful interoperability.

Signed-off-by: Doug Kehn <rdkehn@yahoo.com>
---
 package/ipsec-tools/Config.in      | 6 ++++++
 package/ipsec-tools/ipsec-tools.mk | 7 ++++++-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/package/ipsec-tools/Config.in b/package/ipsec-tools/Config.in
index a0d7600..4af4095 100644
--- a/package/ipsec-tools/Config.in
+++ b/package/ipsec-tools/Config.in
@@ -48,6 +48,12 @@ config BR2_PACKAGE_IPSEC_TOOLS_READLINE
 	select BR2_PACKAGE_READLINE
 	bool "Enable readline input support"
 
+config BR2_PACKAGE_IPSEC_TOOLS_HYBRID
+	bool "Enable hybrid, both mode-cfg and xauth support"
+	help
+	  Hybrid mode is required for successful interoperability
+	  (e.g. Cisco VPN Client).
+
 choice
 	prompt "Security context"
 	default BR2_PACKAGE_IPSEC_SECCTX_DISABLE
diff --git a/package/ipsec-tools/ipsec-tools.mk b/package/ipsec-tools/ipsec-tools.mk
index d916027..56e2bed 100644
--- a/package/ipsec-tools/ipsec-tools.mk
+++ b/package/ipsec-tools/ipsec-tools.mk
@@ -21,7 +21,6 @@ IPSEC_TOOLS_CONF_ENV += LIBS=-lz
 endif
 
 IPSEC_TOOLS_CONF_OPTS = \
-	  --disable-hybrid \
 	  --without-libpam \
 	  --disable-gssapi \
 	  --with-kernel-headers=$(STAGING_DIR)/usr/include
@@ -62,6 +61,12 @@ else
 IPSEC_DEPENDENCIES += readline
 endif
 
+ifeq ($(BR2_PACKAGE_IPSEC_TOOLS_HYBRID), y)
+IPSEC_TOOLS_CONF_OPTS += --enable-hybrid
+else
+IPSEC_TOOLS_CONF_OPTS += --disable-hybrid
+endif
+
 ifeq ($(BR2_PACKAGE_IPSEC_SECCTX_DISABLE),y)
 IPSEC_TOOLS_CONF_OPTS += --enable-security-context=no
 endif
-- 
2.2.2
