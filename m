From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 8 Dec 2018 10:44:05 +0100
Subject: [Buildroot] [git commit] pcm-tools: new package
Message-ID: <20181208094055.C0B908B472@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=60eb2cec80e5258a0c43090f539749606744e182
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Processor Counter Monitor (PCM) is an application programming interface
(API) and a set of tools based on the API to monitor performance and
energy metrics of Intel(R) Core(TM), Xeon(R), Atom(TM) and Xeon Phi(TM)
processors.

This package contains a patch on the pmu-query.py script to look for the
pcm-core program at the default path. It's not nice to have a Buildroot
specific patch but let's use one while we look for a solution that is
acceptable upstream.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
[Peter: Needs C++, force X86_MSR on in linux]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.mk                                     |  2 +
 package/Config.in                                  |  1 +
 ...001-Look-for-pcm-core-at-the-default-path.patch | 46 ++++++++++++++++++++++
 package/pcm-tools/Config.in                        | 33 ++++++++++++++++
 package/pcm-tools/pcm-tools.hash                   |  3 ++
 package/pcm-tools/pcm-tools.mk                     | 35 ++++++++++++++++
 6 files changed, 120 insertions(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index 110260723b..6bf2b88038 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -334,6 +334,8 @@ define LINUX_KCONFIG_FIXUP_CMDS
 		$(call KCONFIG_ENABLE_OPT,CONFIG_FUNCTION_TRACER,$(@D)/.config))
 	$(if $(BR2_PACKAGE_LINUX_TOOLS_PERF),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_PERF_EVENTS,$(@D)/.config))
+	$(if $(BR2_PACKAGE_PCM_TOOLS),
+		$(call KCONFIG_ENABLE_OPT,CONFIG_X86_MSR,$(@D)/.config))
 	$(if $(BR2_PACKAGE_SYSTEMD),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_CGROUPS,$(@D)/.config)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_INOTIFY_USER,$(@D)/.config)
diff --git a/package/Config.in b/package/Config.in
index f6252f2abb..1726066f8a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -115,6 +115,7 @@ menu "Debugging, profiling and benchmark"
 	source "package/nmon/Config.in"
 	source "package/oprofile/Config.in"
 	source "package/pax-utils/Config.in"
+	source "package/pcm-tools/Config.in"
 	source "package/pv/Config.in"
 	source "package/racehound/Config.in"
 	source "package/ramsmp/Config.in"
diff --git a/package/pcm-tools/0001-Look-for-pcm-core-at-the-default-path.patch b/package/pcm-tools/0001-Look-for-pcm-core-at-the-default-path.patch
new file mode 100644
index 0000000000..933eec0237
--- /dev/null
+++ b/package/pcm-tools/0001-Look-for-pcm-core-at-the-default-path.patch
@@ -0,0 +1,46 @@
+From 53b6161d2413406778fa222274069c82846f0297 Mon Sep 17 00:00:00 2001
+From: Carlos Santos <casantos@datacom.com.br>
+Date: Thu, 6 Dec 2018 21:17:02 -0200
+Subject: [PATCH] Look for pcm-core at the default path
+
+On Buildroot, pcm-core.x is installed as /usr/bin/pcm-core. Remove the
+platform test, since we know that it's neither CigWin nor Windows, and
+use the default path.
+
+It's not nice to have a Buildroot specific patch but let's use one while
+we look for a solution that is acceptable upstream.
+
+Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
+---
+ pmu-query.py | 8 +-------
+ 1 file changed, 1 insertion(+), 7 deletions(-)
+
+diff --git a/pmu-query.py b/pmu-query.py
+index 4c596c7..dc39df6 100755
+--- a/pmu-query.py
++++ b/pmu-query.py
+@@ -3,7 +3,6 @@ import urllib2
+ import json, csv
+ import subprocess
+ import sys
+-import platform
+ import getopt
+ 
+ all_flag = False
+@@ -38,12 +37,7 @@ if filename == None:
+         except StopIteration:
+             break
+ 
+-    if platform.system() == 'CYGWIN_NT-6.1':
+-        p = subprocess.Popen(['./pcm-core.exe -c'],stdout=subprocess.PIPE,shell=True) 
+-    elif platform.system() == 'Windows':
+-        p = subprocess.Popen(['pcm-core.exe -c'],stdout=subprocess.PIPE,shell=True)
+-    else:
+-        p = subprocess.Popen(['./pcm-core.x -c'],stdout=subprocess.PIPE,shell=True)
++    p = subprocess.Popen(['/usr/bin/pcm-core -c'],stdout=subprocess.PIPE,shell=True)
+ 
+     (output, err) = p.communicate()
+     p_status = p.wait()
+-- 
+2.19.2
+
diff --git a/package/pcm-tools/Config.in b/package/pcm-tools/Config.in
new file mode 100644
index 0000000000..f347a265a4
--- /dev/null
+++ b/package/pcm-tools/Config.in
@@ -0,0 +1,33 @@
+comment "pcm-tools needs a toolchain w/ C++"
+	depends on BR2_i386 || BR2_x86_64
+	depends on !BR2_INSTALL_LIBSTDCPP
+
+config BR2_PACKAGE_PCM_TOOLS
+	bool "pcm-tools"
+	depends on BR2_i386 || BR2_x86_64
+	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_HWDATA
+	select BR2_PACKAGE_HWDATA_PCI_IDS
+	help
+	  Processor Counter Monitor (PCM) is an application programming
+	  interface (API) and a set of tools based on the API to monitor
+	  performance and energy metrics of Intel(R) Core(TM), Xeon(R),
+	  Atom(TM) and Xeon Phi(TM) processors.
+
+	  https://github.com/opcm/pcm
+
+if BR2_PACKAGE_PCM_TOOLS
+
+# The pmu-query script is not compatible with Python 3
+config BR2_PACKAGE_PCM_TOOLS_PMU_QUERY
+	bool "install the pmu-query script"
+	default y
+	depends on BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_CA_CERTIFICATES # https
+	select BR2_PACKAGE_PYTHON_HASHLIB # urllib2
+	select BR2_PACKAGE_PYTHON_SSL # urllib2
+
+comment "pmu-query needs Python 2.x"
+	depends on !BR2_PACKAGE_PYTHON
+
+endif
diff --git a/package/pcm-tools/pcm-tools.hash b/package/pcm-tools/pcm-tools.hash
new file mode 100644
index 0000000000..77f1482462
--- /dev/null
+++ b/package/pcm-tools/pcm-tools.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 798eb1bc5d9c34fa107de21b2100e8d4326cb45b613bc35baa1e1efb1dd13b04  pcm-tools-201812.tar.gz
+sha256 fac73f62c4d665c82622862a2be2b89713e0f480c93e593af2d8ef29a13d814b  LICENSE
diff --git a/package/pcm-tools/pcm-tools.mk b/package/pcm-tools/pcm-tools.mk
new file mode 100644
index 0000000000..c0d6d8bc52
--- /dev/null
+++ b/package/pcm-tools/pcm-tools.mk
@@ -0,0 +1,35 @@
+################################################################################
+#
+# pcm-tools
+#
+################################################################################
+
+PCM_TOOLS_VERSION = 201812
+PCM_TOOLS_SITE = $(call github,opcm,pcm,$(PCM_TOOLS_VERSION))
+PCM_TOOLS_LICENSE = BSD-3-Clause
+PCM_TOOLS_LICENSE_FILES = LICENSE
+
+PCM_TOOLS_EXE_FILES = \
+	pcm-core pcm-iio pcm-lspci pcm-memory pcm-msr pcm-numa \
+	pcm-pcicfg pcm-pcie pcm-power pcm-sensor pcm-tsx pcm
+
+define PCM_TOOLS_BUILD_CMDS
+	touch $(@D)/daemon-binaries
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
+		UNAME=Linux HOST=_LINUX
+endef
+
+ifeq ($(BR2_PACKAGE_PCM_TOOLS_PMU_QUERY),y)
+define PCM_TOOLS_INSTALL_PMU_QUERY
+	$(INSTALL) -D -m 755 $(@D)/pmu-query.py $(TARGET_DIR)/usr/bin/pmu-query
+endef
+endif
+
+define PCM_TOOLS_INSTALL_TARGET_CMDS
+	$(foreach f,$(PCM_TOOLS_EXE_FILES),\
+		$(INSTALL) -D -m 755 $(@D)/$(f).x $(TARGET_DIR)/usr/bin/$(f)
+	)
+	$(PCM_TOOLS_INSTALL_PMU_QUERY)
+endef
+
+$(eval $(generic-package))
