From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 7 May 2014 22:42:35 +0200
Subject: [Buildroot] [git commit] dhcpdump: fix static build
Message-ID: <20140507204846.36A599CB25@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=429f4415cd153c6809394a8b3245d4d15bba3ec3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use pcap-config to list optional libpcap dependencies that we need to list
when building statically.

Fixes:
http://autobuild.buildroot.net/results/110/1107c21cdf656763bf7048c6c5c7899369724f5f/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dhcpdump/dhcpdump.mk |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/package/dhcpdump/dhcpdump.mk b/package/dhcpdump/dhcpdump.mk
index cb2daa9..ded7c29 100644
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
