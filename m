From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 Apr 2014 22:31:25 +0200
Subject: [Buildroot] [git commit] bustle: fix static build
Message-ID: <20140427203319.C3FF89C9F6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bf232dd02de49d34a39443b94d99b147f396f8db
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use pcap-config to list optional libpcap dependencies needed for static link.

Fixes:
http://autobuild.buildroot.net/results/569/56987b9c39376d2443b96160485f4fd8eefda9bb/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bustle/bustle.mk |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/package/bustle/bustle.mk b/package/bustle/bustle.mk
index 7bc3e97..9222cdb 100644
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
