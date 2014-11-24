From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 Nov 2014 22:14:22 +0100
Subject: [Buildroot] [git commit] xl2tp: fix static build
Message-ID: <20141124211428.107C37FED1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5f423a8ad93c6d9365f7e03d3a8121aecfd22055
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use pcap-config to list dependencies of libpcap.

Fixes:
http://autobuild.buildroot.net/results/87f/87ff92831d265d437aa0dfcfb99e954f76597761/
http://autobuild.buildroot.net/results/cd5/cd5487e76259752cbe58b171f9a58970916f7bb8/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/xl2tp/xl2tp.mk |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/package/xl2tp/xl2tp.mk b/package/xl2tp/xl2tp.mk
index 0b2f7f1..abed7e8 100644
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
