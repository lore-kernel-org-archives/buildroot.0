From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 18 Jan 2020 17:36:18 +0100
Subject: [Buildroot] [PATCH 1/1] package/olsr: add pud plugin
Message-ID: <20200118163618.662596-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

pud plugin needs gpsd and has a specific license

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-lib-pud-Makefile-fix-parallel-build.patch | 33 +++++++++++++++++++
 package/olsr/olsr.mk                          | 11 +++++--
 2 files changed, 42 insertions(+), 2 deletions(-)
 create mode 100644 package/olsr/0001-lib-pud-Makefile-fix-parallel-build.patch

diff --git a/package/olsr/0001-lib-pud-Makefile-fix-parallel-build.patch b/package/olsr/0001-lib-pud-Makefile-fix-parallel-build.patch
new file mode 100644
index 0000000000..b15df2408d
--- /dev/null
+++ b/package/olsr/0001-lib-pud-Makefile-fix-parallel-build.patch
@@ -0,0 +1,33 @@
+From 2f9311668dfdeee0453f5fceb27e8c95c065c4b6 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 18 Jan 2020 17:29:56 +0100
+Subject: [PATCH] lib/pud/Makefile: fix parallel build
+
+nmealib is needed to build olsrd_pud plugin otherwise build fails on:
+
+[LD] olsrd_pud.so.3.0.0 (nmealib dynamically linked)
+/home/fabrice/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-none-linux-gnueabi/4.8.3/../../../../arm-none-linux-gnueabi/bin/ld: cannot find -lnmea
+wireformat/lib/libOlsrdPudWireFormat.so: file not recognized: File truncated
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/OLSR/olsrd/pull/78]
+---
+ lib/pud/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/pud/Makefile b/lib/pud/Makefile
+index e2524421..28330d92 100644
+--- a/lib/pud/Makefile
++++ b/lib/pud/Makefile
+@@ -108,7 +108,7 @@ endif
+ 
+ default_target: nmealib library $(PLUGIN_FULLNAME)
+ 
+-$(PLUGIN_FULLNAME): $(OBJS) version-script.txt
++$(PLUGIN_FULLNAME): $(OBJS) version-script.txt nmealib
+ ifeq ($(PUD_NMEALIB_STATICALLY_LINKED),)
+ ifeq ($(VERBOSE),0)
+ 	@echo "[LD] $@ (nmealib dynamically linked)"
+-- 
+2.24.1
+
diff --git a/package/olsr/olsr.mk b/package/olsr/olsr.mk
index 31c601f80e..4a24cda442 100644
--- a/package/olsr/olsr.mk
+++ b/package/olsr/olsr.mk
@@ -10,10 +10,17 @@ OLSR_PLUGINS = arprefresh bmf dot_draw dyn_gw dyn_gw_plain httpinfo jsoninfo \
 	mdns nameservice netjson poprouting p2pd pgraph secure txtinfo watchdog
 # Doesn't really need quagga but not very useful without it
 OLSR_PLUGINS += $(if $(BR2_PACKAGE_QUAGGA),quagga)
-OLSR_LICENSE = BSD-3-Clause, LGPL-2.1+
-OLSR_LICENSE_FILES = license.txt lib/pud/nmealib/LICENSE
+OLSR_LICENSE = BSD-3-Clause
+OLSR_LICENSE_FILES = license.txt
 OLSR_DEPENDENCIES = host-flex host-bison
 
+ifeq ($(BR2_PACKAGE_GPSD),y)
+OLSR_LICENSE += , LGPL-2.1+ (nmealib)
+OLSR_LICENSE_FILES += lib/pud/nmealib/LICENSE
+OLSR_DEPENDENCIES += gpsd
+OLSR_PLUGINS += pud
+endif
+
 define OLSR_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) ARCH=$(KERNEL_ARCH) -C $(@D) olsrd
 	$(foreach p,$(OLSR_PLUGINS), \
-- 
2.24.1
