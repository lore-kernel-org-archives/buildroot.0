From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 1 Feb 2015 23:24:55 +0100
Subject: [Buildroot] [git commit] package/ipsec-tools: hybrid config support
Message-ID: <20150201222503.82525805EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9849366388f9695b2aa532302ab67dcc47c8924d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add config option for enabling hybrid mode.  Hybrid mode is required for
successful interoperability.

Signed-off-by: Doug Kehn <rdkehn@yahoo.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ipsec-tools/Config.in      |    6 ++++++
 package/ipsec-tools/ipsec-tools.mk |    7 ++++++-
 2 files changed, 12 insertions(+), 1 deletions(-)

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
