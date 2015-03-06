From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 6 Mar 2015 12:55:44 +0100
Subject: [Buildroot] [git commit] lmbench: fix build with libtirpc
Message-ID: <20150306115552.5495181819@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cf2f41c20aa2589fc5713197d920eb824909ff69
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When linking with an external libtirpc, -ltirpc must come after lmbench.a in
the linker command line. Use LDLIBS for that.

Fixes:
http://autobuild.buildroot.net/results/89e/89ee35561d3a49f38e9a747ed78a5846be4764c8/
http://autobuild.buildroot.net/results/409/4097b1c2585db2de517a8741174c02177aabee00/

and more.

Also, remove LMBENCH_LDLIBS assignment. This variable was not used before.

Reviewed-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Tested-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lmbench/lmbench.mk |    9 ++++++---
 1 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/lmbench/lmbench.mk b/package/lmbench/lmbench.mk
index 59e750c..f593428 100644
--- a/package/lmbench/lmbench.mk
+++ b/package/lmbench/lmbench.mk
@@ -11,24 +11,27 @@ LMBENCH_LICENSE = lmbench license (based on GPLv2)
 LMBENCH_LICENSE_FILES = COPYING COPYING-2
 
 LMBENCH_CFLAGS = $(TARGET_CFLAGS)
-LMBENCH_LDLIBS = $(TARGET_LDFLAGS)
 
 ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
 LMBENCH_DEPENDENCIES += host-pkgconf libtirpc
 LMBENCH_CFLAGS += $(shell $(PKG_CONFIG_HOST_BINARY) --cflags libtirpc)
-LMBENCH_LDFLAGS += $(shell $(PKG_CONFIG_HOST_BINARY) --libs libtirpc)
+LMBENCH_LDLIBS = $(shell $(PKG_CONFIG_HOST_BINARY) --libs libtirpc)
 endif
 
 define LMBENCH_CONFIGURE_CMDS
 	$(call CONFIG_UPDATE,$(@D))
 	sed -i 's/CFLAGS=/CFLAGS+=/g' $(@D)/src/Makefile
+	sed -i 's/LDLIBS=/LDLIBS+=/g' $(@D)/scripts/build
 	sed -i '/cd .*doc/d' $(@D)/src/Makefile
 	sed -i '/include/d' $(@D)/src/Makefile
 	touch $@
 endef
 
+# Note: there is a second stage 'make' invocation from the 'scripts/build'
+# script. So the variables override below don't take direct effect in
+# src/Makefile.
 define LMBENCH_BUILD_CMDS
-	$(MAKE) CFLAGS="$(LMBENCH_CFLAGS)" LDFLAGS="$(LMBENCH_LDFLAGS)" OS=$(ARCH) CC="$(TARGET_CC)" -C $(@D)/src
+	$(MAKE) CFLAGS="$(LMBENCH_CFLAGS)" LDLIBS="$(LMBENCH_LDLIBS)" OS=$(ARCH) CC="$(TARGET_CC)" -C $(@D)/src
 endef
 
 define LMBENCH_INSTALL_TARGET_CMDS
