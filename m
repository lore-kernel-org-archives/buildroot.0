From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 5 Jan 2021 22:42:57 +0100
Subject: [Buildroot] [git commit] package/olsr: add pud plugin
Message-ID: <20210105213003.CCC4B814F2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=318d160fe5b080e421dc133dff82d5ea2cf7d893
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

pud plugin needs gpsd and has a specific license

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0002-lib-pud-Makefile-fix-parallel-build.patch | 33 ++++++++++++++++++++++
 package/olsr/olsr.mk                               | 11 ++++++--
 2 files changed, 42 insertions(+), 2 deletions(-)

diff --git a/package/olsr/0002-lib-pud-Makefile-fix-parallel-build.patch b/package/olsr/0002-lib-pud-Makefile-fix-parallel-build.patch
new file mode 100644
index 0000000000..b15df2408d
--- /dev/null
+++ b/package/olsr/0002-lib-pud-Makefile-fix-parallel-build.patch
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
index f930b3cacf..b2c8e7e001 100644
--- a/package/olsr/olsr.mk
+++ b/package/olsr/olsr.mk
@@ -10,8 +10,8 @@ OLSR_PLUGINS = arprefresh bmf dot_draw dyn_gw dyn_gw_plain httpinfo jsoninfo \
 	mdns nameservice netjson poprouting p2pd pgraph secure txtinfo watchdog
 # Doesn't really need quagga but not very useful without it
 OLSR_PLUGINS += $(if $(BR2_PACKAGE_QUAGGA),quagga)
-OLSR_LICENSE = BSD-3-Clause, LGPL-2.1+
-OLSR_LICENSE_FILES = license.txt lib/pud/nmealib/LICENSE
+OLSR_LICENSE = BSD-3-Clause
+OLSR_LICENSE_FILES = license.txt
 OLSR_DEPENDENCIES = host-flex host-bison
 
 OLSR_CFLAGS = $(TARGET_CFLAGS)
@@ -19,6 +19,13 @@ OLSR_CFLAGS = $(TARGET_CFLAGS)
 # it needs -fPIC to link on lot of architectures
 OLSR_CFLAGS += -fPIC
 
+ifeq ($(BR2_PACKAGE_GPSD),y)
+OLSR_LICENSE += , LGPL-2.1+ (nmealib)
+OLSR_LICENSE_FILES += lib/pud/nmealib/LICENSE
+OLSR_DEPENDENCIES += gpsd
+OLSR_PLUGINS += pud
+endif
+
 define OLSR_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) ARCH=$(KERNEL_ARCH) \
 		CFLAGS="$(OLSR_CFLAGS)" -C $(@D) olsrd
