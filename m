From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Jun 2015 21:59:06 +0200
Subject: [Buildroot] [git commit] iproute2: tipc support needs 3.18+ headers
Message-ID: <20150629195912.9B09781663@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c2a3d1f8d6b5cbfb5ff225d26dcaeea986ebae39
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/173/173c9dbed6422a3cc4f9d1f998bc25ce2e9538c7/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/iproute2/iproute2.mk |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index dabc8b4..b2627ec 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -17,8 +17,13 @@ ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 IPROUTE2_DEPENDENCIES += busybox
 endif
 
-ifeq ($(BR2_PACKAGE_LIBMNL),y)
+# tipc support needs 3.18+ headers and libmnl
+ifeq ($(BR2_PACKAGE_LIBMNL)$(BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18),yy)
 IPROUTE2_DEPENDENCIES += libmnl
+else
+define IPROUTE2_DISABLE_TIPC
+	$(SED) '/HAVE_MNL/d' $(@D)/Config
+endef
 endif
 
 # If we've got iptables enable xtables support for tc
@@ -57,6 +62,7 @@ define IPROUTE2_CONFIGURE_CMDS
 	cd $(@D) && $(TARGET_CONFIGURE_OPTS) ./configure
 	$(IPROUTE2_DISABLE_ARPD)
 	$(IPROUTE2_WITH_IPTABLES)
+	$(IPROUTE2_DISABLE_TIPC)
 endef
 
 define IPROUTE2_BUILD_CMDS
