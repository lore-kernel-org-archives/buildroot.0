From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 23 Apr 2014 22:59:59 +0300
Subject: [Buildroot] [PATCH] dhcpdump: fix static build
Message-ID: <a2d055301fd7b62deb7599263ad3ff0ee94c1870.1398283199.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use pcap-config to list optional libpcap dependencies that we need to list
when building statically.

Fixes:
http://autobuild.buildroot.net/results/110/1107c21cdf656763bf7048c6c5c7899369724f5f/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/dhcpdump/dhcpdump.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/dhcpdump/dhcpdump.mk b/package/dhcpdump/dhcpdump.mk
index cb2daa973177..ded7c295c3ae 100644
--- a/package/dhcpdump/dhcpdump.mk
+++ b/package/dhcpdump/dhcpdump.mk
@@ -10,8 +10,13 @@ DHCPDUMP_DEPENDENCIES = libpcap
 DHCPDUMP_LICENSE = BSD-2c
 DHCPDUMP_LICENSE_FILES = LICENSE
 
+DHCPDUMP_LIBS = -lpcap
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+DHCPDUMP_LIBS += $(shell $(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs)
+endif
+
 define DHCPDUMP_BUILD_CMDS
-	$(MAKE) -C $(@D) CC="$(TARGET_CC) $(TARGET_CFLAGS)"
+	$(MAKE) -C $(@D) CC="$(TARGET_CC) $(TARGET_CFLAGS)" LIBS="$(DHCPDUMP_LIBS)"
 endef
 
 define DHCPDUMP_INSTALL_TARGET_CMDS
-- 
1.9.2
