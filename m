From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 27 Apr 2014 11:10:40 +0300
Subject: [Buildroot] [PATCH] bustle: fix static build
Message-ID: <0d6bd6c7f561940efe319ceabaec1968fb546282.1398586240.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use pcap-config to list optional libpcap dependencies needed for static link.

Fixes:
http://autobuild.buildroot.net/results/569/56987b9c39376d2443b96160485f4fd8eefda9bb/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/bustle/bustle.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/bustle/bustle.mk b/package/bustle/bustle.mk
index 7bc3e97bcf8c..9222cdbaad63 100644
--- a/package/bustle/bustle.mk
+++ b/package/bustle/bustle.mk
@@ -10,9 +10,14 @@ BUSTLE_LICENSE = LGPLv2.1+
 BUSTLE_LICENSE_FILES = LICENSE
 BUSTLE_DEPENDENCIES = libglib2 libpcap host-pkgconf
 
+BUSTLE_PCAP_FLAGS = "-lpcap"
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+BUSTLE_PCAP_FLAGS += $(shell $(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs)
+endif
+
 define BUSTLE_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
-		PCAP_FLAGS='-lpcap' -C $(@D) dist/build/bustle-pcap
+		PCAP_FLAGS="$(BUSTLE_PCAP_FLAGS)" -C $(@D) dist/build/bustle-pcap
 endef
 
 define BUSTLE_INSTALL_TARGET_CMDS
-- 
1.9.2
