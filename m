From: Matt Weber <mlweber1@rockwellcollins.com>
Date: Thu, 5 Sep 2013 12:26:22 -0500
Subject: [Buildroot] [PATCH 1/1] netsnmp: bugfix for openssl dependency
Message-ID: <1378401982-23239-1-git-send-email-mlweber1@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In the configure check of netsnmp (if using with openssl enabled)
it checks for openssl and gets a undefined reference to dl* error.
Adding an additional references to the libld.a lib resolves this bug.

Signed-off-by: Matt Weber <mlweber1@rockwellcollins.com>
---
 package/netsnmp/netsnmp.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
index 806f7a6..7d31b9f 100644
--- a/package/netsnmp/netsnmp.mk
+++ b/package/netsnmp/netsnmp.mk
@@ -38,7 +38,8 @@ endif
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 	NETSNMP_DEPENDENCIES += openssl
 	NETSNMP_CONF_OPT += \
-		--with-openssl=$(STAGING_DIR)/usr/include/openssl
+		--with-openssl=$(STAGING_DIR)/usr/include/openssl \
+		--with-libs=-ldl
 else
 	NETSNMP_CONF_OPT += --without-openssl
 endif
-- 
1.7.1
