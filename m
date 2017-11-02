From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Nov 2017 22:25:16 +0100
Subject: [Buildroot] [git commit] uboot-tools: disable pylibfdt
Message-ID: <20171102212420.3216D810B0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0bcd09ffcabbcce74ed00bc38620f71a34a59b45
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The current U-Boot build system assumes that if swig is installed on
the host system, it should build pylibfdt, without checking if other
dependencies are available. This causes a number of build failures.

This commit fixes that by using concepts from the future upstream fix
(post 2017.11), which sets up a kconfig variable for pylibfdt and
conditionally enables the swig wrapper creation (default=n).

Relevant upstream patches under review:

 - https://patchwork.ozlabs.org/patch/826742/
 - https://patchwork.ozlabs.org/patch/826752/

This patch only affects uboot-tools, in which we never need
pylibfdt. The logic in the uboot package, with its
BR2_TARGET_UBOOT_NEEDS_PYLIBFDT option, remains unchanged.

Fixes (one of many):

  http://autobuild.buildroot.net/results/f9e13caae9b31c9dcde7d24caecc036324f269cc

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Tested-by: Jan Kundr??t <jan.kundrat@cesnet.cz>
Reviewed-by: Jan Kundr??t <jan.kundrat@cesnet.cz>
[Thomas: improved commit log.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0004-uboot-tools-disable-pylibfdt.patch        | 63 ++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/package/uboot-tools/0004-uboot-tools-disable-pylibfdt.patch b/package/uboot-tools/0004-uboot-tools-disable-pylibfdt.patch
new file mode 100644
index 0000000..0c2f54d
--- /dev/null
+++ b/package/uboot-tools/0004-uboot-tools-disable-pylibfdt.patch
@@ -0,0 +1,63 @@
+From d882c99de59316e50bfee7f5fce10fe9062dfa32 Mon Sep 17 00:00:00 2001
+From: Matt Weber <matthew.weber@rockwellcollins.com>
+Date: Wed, 1 Nov 2017 10:57:31 -0500
+Subject: [PATCH] uboot-tools: disable pylibfdt
+
+The current U-Boot build system assumes that if swig is installed on
+the host system, it should build pylibfdt, without checking if other
+dependencies are available. This causes a number of build failures.
+
+This patch fixes that by using concepts from the future upstream fix
+(post 2017.11), which sets up a kconfig variable for pylibfdt and
+conditionally enables the swig wrapper creation (default=n).
+
+Relevant upstream patches under review:
+
+ - https://patchwork.ozlabs.org/patch/826742/
+ - https://patchwork.ozlabs.org/patch/826752/
+
+Fixes (one of many):
+http://autobuild.buildroot.net/results/f9e13caae9b31c9dcde7d24caecc036324f269cc
+
+Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
+---
+ Kconfig        | 5 +++++
+ tools/Makefile | 6 +++---
+ 2 files changed, 8 insertions(+), 3 deletions(-)
+
+diff --git a/Kconfig b/Kconfig
+index bb80ada..99b0258 100644
+--- a/Kconfig
++++ b/Kconfig
+@@ -358,6 +358,11 @@ source "disk/Kconfig"
+ 
+ source "dts/Kconfig"
+ 
++config PYLIBFDT
++	bool
++	help
++	  Enables the generation of the pylibfdt swig wrapper.
++
+ source "net/Kconfig"
+ 
+ source "drivers/Kconfig"
+diff --git a/tools/Makefile b/tools/Makefile
+index 77706a9..cb6cb7a 100644
+--- a/tools/Makefile
++++ b/tools/Makefile
+@@ -226,9 +226,9 @@ clean-dirs := lib common
+ 
+ always := $(hostprogs-y)
+ 
+-# Build a libfdt Python module if swig is available
+-# Use 'sudo apt-get install swig libpython-dev' to enable this
+-always += $(if $(shell which swig 2> /dev/null),_libfdt.so)
++ifneq ($(CONFIG_PYLIBFDT),)
++always += _libfdt.so
++endif
+ 
+ # Generated LCD/video logo
+ LOGO_H = $(objtree)/include/bmp_logo.h
+-- 
+1.8.3.1
+
