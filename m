From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 2 Mar 2021 21:49:47 +0100
Subject: [Buildroot] [git commit] package/bustle: fix static build
Message-ID: <20210302202718.4EB0C8349A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=10e65c92fe67ef6c8eae9979ee3ea9eea532e1a3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 436cb9308a50b1007a42eb490405a3155307a771 wrongly removed --static
from pcap-config call

Fixes:
 - http://autobuild.buildroot.org/results/b5d8d8d8452342373c2446613ba3051c20a97c03

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/bustle/bustle.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/bustle/bustle.mk b/package/bustle/bustle.mk
index c6c3a72a91..b92d1a3ea9 100644
--- a/package/bustle/bustle.mk
+++ b/package/bustle/bustle.mk
@@ -9,7 +9,12 @@ BUSTLE_SITE = https://hackage.haskell.org/package/bustle-$(BUSTLE_VERSION)
 BUSTLE_LICENSE = LGPL-2.1+
 BUSTLE_LICENSE_FILES = LICENSE
 BUSTLE_DEPENDENCIES = libglib2 libpcap host-pkgconf
-BUSTLE_MAKE_OPTS = PCAP_CONFIG=$(STAGING_DIR)/usr/bin/pcap-config
+
+ifeq ($(BR2_STATIC_LIBS),y)
+BUSTLE_MAKE_OPTS += PCAP_CONFIG="$(STAGING_DIR)/usr/bin/pcap-config --static"
+else
+BUSTLE_MAKE_OPTS += PCAP_CONFIG="$(STAGING_DIR)/usr/bin/pcap-config"
+endif
 
 define BUSTLE_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
