From: David De Grave (Essensium/Mind) <david.degrave@mind.be>
Date: Wed,  1 Aug 2018 16:33:36 +0200
Subject: [Buildroot] [PATCH v2 1/1] boot/uboot: missing dtc build dependency
Message-ID: <20180801143336.25420-1-david.degrave@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When trying to include multiple DTBs in a FIT image for u-boot, the
device tree compiler (dtc) is not build as expected and fails with the
following error:

  DTC     arch/arm/dts/foo.dtb
/bin/sh: ./scripts/dtc/dtc: No such file or directory
make[4]: *** [scripts/Makefile.lib:329: arch/arm/dts/foo.dtb] Error 127

Using host-dtc instead leads to more problems than it solves and is
kept to support older versions of u-boot where dtc support were not
provided.

So better to keep using the U-Boot provided dtc and add a patch to fix
this issue by adding a dependency on OF_CONTROL for OF_LIST and
by selecting DTC for MULTI_DTB_FIT in dts/Kconfig.

Signed-off-by: David De Grave (Essensium/Mind) <david.degrave@mind.be>

---
 v2: Add patch to fix the dependencies in Kconfig as noticed by Arnout
 v1: Tried to use HOST_DTC
---
 .../0001-missing-dtc-dependency-in-kconfig.patch      | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 boot/uboot/2018.01/0001-missing-dtc-dependency-in-kconfig.patch

diff --git a/boot/uboot/2018.01/0001-missing-dtc-dependency-in-kconfig.patch b/boot/uboot/2018.01/0001-missing-dtc-dependency-in-kconfig.patch
new file mode 100644
index 0000000000..28ebf50185
--- /dev/null
+++ b/boot/uboot/2018.01/0001-missing-dtc-dependency-in-kconfig.patch
@@ -0,0 +1,19 @@
+diff -ru a/dts/Kconfig b/dts/Kconfig
+--- a/dts/Kconfig	2018-01-09 02:25:29.000000000 +0100
++++ b/dts/Kconfig	2018-08-01 15:35:57.676153869 +0200
+@@ -113,6 +113,7 @@
+ 
+ config OF_LIST
+ 	string "List of device tree files to include for DT control"
++	depends on OF_CONTROL
+ 	depends on SPL_LOAD_FIT || MULTI_DTB_FIT
+ 	default DEFAULT_DEVICE_TREE
+ 	help
+@@ -135,6 +136,7 @@
+ 
+ config MULTI_DTB_FIT
+ 	bool "Support embedding several DTBs in a FIT image for u-boot"
++	select DTC
+ 	help
+ 	  This option provides hooks to allow U-boot to parse an
+ 	  appended FIT image and enable board specific code to then select
-- 
2.13.6
