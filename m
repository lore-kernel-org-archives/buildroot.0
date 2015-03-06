From: Baruch Siach <baruch@tkos.co.il>
Date: Fri,  6 Mar 2015 06:21:15 +0200
Subject: [Buildroot] [PATCH v2] lmbench: fix build with libtirpc
Message-ID: <7760c8e2eb6de04f4acc5b4fd348cb35216bc2b7.1425615675.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When linking with an external libtirpc, -ltirpc must come after lmbench.a in
the linker command line. Use LDLIBS for that.

Fixes:
http://autobuild.buildroot.net/results/89e/89ee35561d3a49f38e9a747ed78a5846be4764c8/
http://autobuild.buildroot.net/results/409/4097b1c2585db2de517a8741174c02177aabee00/

and more.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
v2:
	Rebase on current master (Fabio Porcedda)
---
 package/lmbench/0001-allow-ldlibs-override.patch | 19 +++++++++++++++++++
 package/lmbench/lmbench.mk                       |  8 +++++---
 2 files changed, 24 insertions(+), 3 deletions(-)
 create mode 100644 package/lmbench/0001-allow-ldlibs-override.patch

diff --git a/package/lmbench/0001-allow-ldlibs-override.patch b/package/lmbench/0001-allow-ldlibs-override.patch
new file mode 100644
index 000000000000..8085e7e90a4c
--- /dev/null
+++ b/package/lmbench/0001-allow-ldlibs-override.patch
@@ -0,0 +1,19 @@
+Allow LDLIBS override
+
+The real make runs from the scripts/build script. Teach this script accept
+override value set in an environment variable.
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+diff -Nuar lmbench-3.0-a9.orig/scripts/build lmbench-3.0-a9/scripts/build
+--- lmbench-3.0-a9.orig/scripts/build	2006-06-27 19:25:18.000000000 +0300
++++ lmbench-3.0-a9/scripts/build	2015-02-24 09:59:30.302654994 +0200
+@@ -18,7 +18,7 @@
+ 
+ trap 'rm -f ${BASE}$$.s ${BASE}$$.c ${BASE}$$.o ${BASE}$$; exit 1' 1 2 15
+ 
+-LDLIBS=-lm
++LDLIBS="${LDLIBS} -lm"
+ 
+ # check for HP-UX's ANSI compiler
+ echo "main(int ac, char *av[]) { int i; }" > ${BASE}$$.c
diff --git a/package/lmbench/lmbench.mk b/package/lmbench/lmbench.mk
index 59e750c5892f..224ec6983a66 100644
--- a/package/lmbench/lmbench.mk
+++ b/package/lmbench/lmbench.mk
@@ -11,12 +11,11 @@ LMBENCH_LICENSE = lmbench license (based on GPLv2)
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
@@ -27,8 +26,11 @@ define LMBENCH_CONFIGURE_CMDS
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
-- 
2.1.4
