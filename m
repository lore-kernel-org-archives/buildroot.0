From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 21 May 2015 23:22:52 +0200
Subject: [Buildroot] [git commit] iproute2: needs host-pkgconf
Message-ID: <20150521212656.BF7DE800F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a9aa2ba02f5457ff4cbb10d0812568e0f8174492
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The (handwritten) configure script uses pkg-config, so ensure it is
available.

With this in place XT and IPT_LIB_DIR detection works correctly, so drop the
overrides.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/iproute2/iproute2.mk |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index 3315d67..ab374e1 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -7,7 +7,7 @@
 IPROUTE2_VERSION = 4.0.0
 IPROUTE2_SOURCE = iproute2-$(IPROUTE2_VERSION).tar.xz
 IPROUTE2_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/net/iproute2
-IPROUTE2_DEPENDENCIES = host-bison host-flex
+IPROUTE2_DEPENDENCIES = host-bison host-flex host-pkgconf
 IPROUTE2_LICENSE = GPLv2
 IPROUTE2_LICENSE_FILES = COPYING
 
@@ -23,7 +23,6 @@ IPROUTE2_DEPENDENCIES += iptables
 define IPROUTE2_WITH_IPTABLES
 	# Makefile is busted so it never passes IPT_LIB_DIR properly
 	$(SED) "s/-DIPT/-DXT/" $(IPROUTE2_DIR)/tc/Makefile
-	echo "TC_CONFIG_XT:=y" >>$(IPROUTE2_DIR)/Config
 endef
 else
 define IPROUTE2_WITH_IPTABLES
@@ -53,7 +52,6 @@ define IPROUTE2_CONFIGURE_CMDS
 	$(SED) 's/gcc/$$CC $$CFLAGS/g' $(@D)/configure
 	cd $(@D) && $(TARGET_CONFIGURE_OPTS) ./configure
 	$(SED) 's/-Werror//' $(IPROUTE2_DIR)/Makefile
-	echo "IPT_LIB_DIR:=/usr/lib/xtables" >>$(IPROUTE2_DIR)/Config
 	$(IPROUTE2_DISABLE_ARPD)
 	$(IPROUTE2_WITH_IPTABLES)
 endef
