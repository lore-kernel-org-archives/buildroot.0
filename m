From: Carlos Santos <casantos@datacom.ind.br>
Date: Tue, 23 Jan 2018 12:03:24 -0200
Subject: [Buildroot] [PATCH] pcm-tools: new package
In-Reply-To: <20180123140324.20801-1-casantos@datacom.ind.br>
References: <20180123140324.20801-1-casantos@datacom.ind.br>
Message-ID: <20180123140324.20801-2-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Processor Counter Monitor (PCM) is an application programming interface
(API) and a set of tools based on the API to monitor performance and
energy metrics of Intel(R) Core(TM), Xeon(R), Atom(TM) and Xeon Phi(TM)
processors.

The package pulls a patch from upstream that prevents output truncation.

Two Buildroot-specific changes make it use the pci.ids file provided by
the hwdata pacakge and look for executable files at /usr/bin.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
 package/Config.in                                  |  1 +
 ...-snprintf-outut-size-larger-than-destinat.patch | 40 ++++++++++++++++++++++
 ...0002-Look-for-pci.ids-at-usr-share-hwdata.patch | 34 ++++++++++++++++++
 .../0003-Look-for-pcm-core-at-usr-bin.patch        | 28 +++++++++++++++
 package/pcm-tools/Config.in                        | 33 ++++++++++++++++++
 package/pcm-tools/pcm-tools.hash                   |  3 ++
 package/pcm-tools/pcm-tools.mk                     | 31 +++++++++++++++++
 7 files changed, 170 insertions(+)
 create mode 100644 package/pcm-tools/0001-Appease-GCC-snprintf-outut-size-larger-than-destinat.patch
 create mode 100644 package/pcm-tools/0002-Look-for-pci.ids-at-usr-share-hwdata.patch
 create mode 100644 package/pcm-tools/0003-Look-for-pcm-core-at-usr-bin.patch
 create mode 100644 package/pcm-tools/Config.in
 create mode 100644 package/pcm-tools/pcm-tools.hash
 create mode 100644 package/pcm-tools/pcm-tools.mk

diff --git a/package/Config.in b/package/Config.in
index ca2a4107b1..3b359348b2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -113,6 +113,7 @@ menu "Debugging, profiling and benchmark"
 	source "package/nmon/Config.in"
 	source "package/oprofile/Config.in"
 	source "package/pax-utils/Config.in"
+	source "package/pcm-tools/Config.in"
 	source "package/pv/Config.in"
 	source "package/racehound/Config.in"
 	source "package/ramsmp/Config.in"
diff --git a/package/pcm-tools/0001-Appease-GCC-snprintf-outut-size-larger-than-destinat.patch b/package/pcm-tools/0001-Appease-GCC-snprintf-outut-size-larger-than-destinat.patch
new file mode 100644
index 0000000000..5d77ebfcb6
--- /dev/null
+++ b/package/pcm-tools/0001-Appease-GCC-snprintf-outut-size-larger-than-destinat.patch
@@ -0,0 +1,40 @@
+From d07d6602ac2d4c90f7e448bdc5b780e8aa9faf7c Mon Sep 17 00:00:00 2001
+From: Carlos Santos <casantos@datacom.ind.br>
+Date: Sun, 21 Jan 2018 23:44:46 -0200
+Subject: [PATCH 1/3] Appease GCC: snprintf outut size larger than destination
+ size
+
+GCC ignores that PCI function numbers range from 0 to 7, generations are
+up to 4 (5, by 2019 Q2) and link speeds are up to 16x. So it warns that
+snprintf output may be truncated in build_pci_header (in pcm-iio.cpp).
+
+Solve this by increasing the buffer sizes, since the additional three
+bytes are harmless. We could satisfy GCC by masking p.bdf.funcno and
+p.link_speed to 0x07, thus limitting the output to one decimal digit,
+and p.link_width to 0x1f (two decimal digits). This approach, however,
+would hide invalid arguments, preventing the user from noticing the
+error.
+
+Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
+---
+ pcm-iio.cpp | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/pcm-iio.cpp b/pcm-iio.cpp
+index f336bf3..1904296 100644
+--- a/pcm-iio.cpp
++++ b/pcm-iio.cpp
+@@ -153,8 +153,8 @@ vector<struct data> prepare_data(const vector<uint64_t> &values, const vector<st
+ string build_pci_header(const PCIDB & pciDB, uint32_t column_width, struct pci p, int part = -1, uint32_t level = 0)
+ {
+     string s = "|";
+-    char bdf_buf[8];
+-    char speed_buf[9];
++    char bdf_buf[10];
++    char speed_buf[10];
+     char vid_did_buf[10];
+     char device_name_buf[128];
+ 
+-- 
+2.14.3
+
diff --git a/package/pcm-tools/0002-Look-for-pci.ids-at-usr-share-hwdata.patch b/package/pcm-tools/0002-Look-for-pci.ids-at-usr-share-hwdata.patch
new file mode 100644
index 0000000000..4c04589867
--- /dev/null
+++ b/package/pcm-tools/0002-Look-for-pci.ids-at-usr-share-hwdata.patch
@@ -0,0 +1,34 @@
+From 9213e92ec5aaee0e319b94f9501458e44e7873ba Mon Sep 17 00:00:00 2001
+From: Carlos Santos <casantos@datacom.ind.br>
+Date: Tue, 23 Jan 2018 08:27:49 -0200
+Subject: [PATCH 2/3] Look for pci.ids at /usr/share/hwdata
+
+For Buildroot, on which pci.ids is provided by the "hwdata" package.
+
+Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
+---
+ lspci.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/lspci.h b/lspci.h
+index 29312a7..1d922fc 100644
+--- a/lspci.h
++++ b/lspci.h
+@@ -179,12 +179,12 @@ void print_pci(struct pci p, const PCIDB & pciDB)
+ 
+ void load_PCIDB(PCIDB & pciDB)
+ {
+-    std::ifstream in("pci.ids");
++    std::ifstream in("/usr/share/hwdata/pci.ids");
+     std::string line, item;
+ 
+     if (!in.is_open())
+     {
+-        std::cerr << "pci.ids file is not available. Download it from https://raw.githubusercontent.com/pciutils/pciids/master/pci.ids " << endl;
++        std::cerr << "/usr/share/hwdata/pci.ids file is not available. Ensure that the \"hwdata\" package is properly installed." << endl;
+         return;
+     }
+ 
+-- 
+2.14.3
+
diff --git a/package/pcm-tools/0003-Look-for-pcm-core-at-usr-bin.patch b/package/pcm-tools/0003-Look-for-pcm-core-at-usr-bin.patch
new file mode 100644
index 0000000000..92dc06c197
--- /dev/null
+++ b/package/pcm-tools/0003-Look-for-pcm-core-at-usr-bin.patch
@@ -0,0 +1,28 @@
+From bef36c901e7f2cca3c21ee057b75f73065830774 Mon Sep 17 00:00:00 2001
+From: Carlos Santos <casantos@datacom.ind.br>
+Date: Tue, 23 Jan 2018 10:56:55 -0200
+Subject: [PATCH 3/3] Look for pcm-core at /usr/bin
+
+For Buildroot, on which pcm-core.x ins installed as /usr/bin/pcm-core.
+
+Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
+---
+ pmu-query.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pmu-query.py b/pmu-query.py
+index 4c596c7..71aa1b1 100755
+--- a/pmu-query.py
++++ b/pmu-query.py
+@@ -43,7 +43,7 @@ if filename == None:
+     elif platform.system() == 'Windows':
+         p = subprocess.Popen(['pcm-core.exe -c'],stdout=subprocess.PIPE,shell=True)
+     else:
+-        p = subprocess.Popen(['./pcm-core.x -c'],stdout=subprocess.PIPE,shell=True)
++        p = subprocess.Popen(['/usr/bin/pcm-core -c'],stdout=subprocess.PIPE,shell=True)
+ 
+     (output, err) = p.communicate()
+     p_status = p.wait()
+-- 
+2.14.3
+
diff --git a/package/pcm-tools/Config.in b/package/pcm-tools/Config.in
new file mode 100644
index 0000000000..a59c41c3e6
--- /dev/null
+++ b/package/pcm-tools/Config.in
@@ -0,0 +1,33 @@
+config BR2_PACKAGE_PCM_TOOLS
+	bool "pcm-tools"
+	depends on BR2_i386 || BR2_x86_64
+	select BR2_PACKAGE_HWDATA
+	select BR2_PACKAGE_HWDATA_PCI_IDS
+	help
+	  Processor Counter Monitor (PCM) is an application programming
+	  interface (API) and a set of tools based on the API to monitor
+	  performance and energy metrics of Intel(R) Core(TM), Xeon(R),
+	  Atom(TM) and Xeon Phi(TM) processors.
+
+	  Requires a kernel with X86_MSR enabled.
+
+	  https://github.com/opcm/pcm
+
+if BR2_PACKAGE_PCM_TOOLS
+
+# The pmu-query script is not compatible with Python 3
+config BR2_PACKAGE_PCM_TOOLS_PMU_QUERY_REQS
+	bool
+	default y
+	depends on BR2_PACKAGE_PYTHON && BR2_PACKAGE_PYTHON_SSL && BR2_PACKAGE_PYTHON_HASHLIB # urllib2
+	depends on BR2_PACKAGE_CA_CERTIFICATES # https
+
+config BR2_PACKAGE_PCM_TOOLS_PMU_QUERY
+	bool "install the pmu-query script"
+	default y
+	depends on BR2_PACKAGE_PCM_TOOLS_PMU_QUERY_REQS
+
+comment "pmu-query needs Python 2.x w/ ssl + hashlib modules, ca-certificates"
+	depends on !BR2_PACKAGE_PCM_TOOLS_PMU_QUERY_REQS
+
+endif
diff --git a/package/pcm-tools/pcm-tools.hash b/package/pcm-tools/pcm-tools.hash
new file mode 100644
index 0000000000..7646dfddee
--- /dev/null
+++ b/package/pcm-tools/pcm-tools.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 772c7b6310ba9c89931ff6108cc71fa0cbe20540ab6a53503f5f61594c9f661d pcm-tools-201710.tar.gz
+sha256 fac73f62c4d665c82622862a2be2b89713e0f480c93e593af2d8ef29a13d814b LICENSE
diff --git a/package/pcm-tools/pcm-tools.mk b/package/pcm-tools/pcm-tools.mk
new file mode 100644
index 0000000000..53c73621c9
--- /dev/null
+++ b/package/pcm-tools/pcm-tools.mk
@@ -0,0 +1,31 @@
+################################################################################
+#
+# pcm-tools
+#
+################################################################################
+
+PCM_TOOLS_VERSION = 201710
+PCM_TOOLS_SITE = $(call github,opcm,pcm,$(PCM_TOOLS_VERSION))
+PCM_TOOLS_LICENSE = BSD-3-Clause
+PCM_TOOLS_LICENSE_FILES = LICENSE
+
+PCM_TOOLS_EXE_FILES = \
+	pcm-core pcm-iio pcm-lspci pcm-memory pcm-msr pcm-numa \
+	pcm-pcie pcm-power pcm-sensor pcm-tsx pcm
+
+define PCM_TOOLS_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
+		UNAME=Linux HOST=_LINUX CC="$(TARGET_CC)"
+endef
+
+define PCM_TOOLS_INSTALL_TARGET_CMDS
+	$(Q) set -x -e; \
+	for f in $(PCM_TOOLS_EXE_FILES); do \
+		$(INSTALL) -D -m 755 $(@D)/$$f.x $(TARGET_DIR)/usr/bin/$$f; \
+	done;
+	if test "$(BR2_PACKAGE_PCM_TOOLS_PMU_QUERY)" = "y"; then \
+		$(INSTALL) -D -m 755 $(@D)/pmu-query.py $(TARGET_DIR)/usr/bin/pmu-query; \
+	fi
+endef
+
+$(eval $(generic-package))
-- 
2.14.3
