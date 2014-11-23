From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 23 Nov 2014 12:29:59 +0200
Subject: [Buildroot] [PATCH] xl2tp: fix static build
Message-ID: <83364a11d5a70fa1d3e52a9d44ea5c118dc3a4fe.1416738599.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use pcap-config to list dependencies of libpcap.

Fixes:
http://autobuild.buildroot.net/results/87f/87ff92831d265d437aa0dfcfb99e954f76597761/
http://autobuild.buildroot.net/results/cd5/cd5487e76259752cbe58b171f9a58970916f7bb8/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/xl2tp/xl2tp.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/xl2tp/xl2tp.mk b/package/xl2tp/xl2tp.mk
index 0b2f7f1758f5..abed7e851fa2 100644
--- a/package/xl2tp/xl2tp.mk
+++ b/package/xl2tp/xl2tp.mk
@@ -10,9 +10,13 @@ XL2TP_DEPENDENCIES = libpcap openssl
 XL2TP_LICENSE = GPLv2
 XL2TP_LICENSE_FILES = LICENSE
 
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+XL2TP_LDLIBS = LDLIBS="$(shell $(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs)"
+endif
+
 define XL2TP_BUILD_CMDS
 	$(SED) 's/ -O2 //' $(@D)/Makefile
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) $(XL2TP_LDLIBS) -C $(@D)
 endef
 
 define XL2TP_INSTALL_TARGET_CMDS
-- 
2.1.3
