From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 25 Sep 2016 23:24:27 +0200
Subject: [Buildroot] [git commit] u-boot: Fix building for ARC700
Message-ID: <20160925212615.5F7A3817D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6a4e0314a4cd457fec3a61aeb4adfc7e2be73605
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With newer ARC toolchain obsolete -marcXXX were finally deperecated
and so compiler throws errors now about unknown option.

Solution is as simple as switching to more generic -mcu-XXX
options. Which we do. Unfortunately that change in upstream U-Boot [1]
happened right after v2016.09 was released an so we need to have that fix
for v2016.07 which is mentioned in axs10x defconfigs and for the latest
U-Boot release v2016.09 (which is selected by default if no defconfig is
used).

Once we deprecate either U-Boot version in U-Boot corresponding patch
should be removed essentially.

[1] http://git.denx.de/?p=u-boot.git;a=commit;h=7c8d81605302e7d7fdd3e7d8eb69302bddc64a2c

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
[Thomas: handle the U-Boot bump to 2016.09.01.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...-Use-mcpu-XXX-instead-of-obsolete-marcXXX.patch | 39 ++++++++++++++++++++++
 ...-Use-mcpu-XXX-instead-of-obsolete-marcXXX.patch | 39 ++++++++++++++++++++++
 2 files changed, 78 insertions(+)

diff --git a/boot/uboot/2016.07/0001-arc-Use-mcpu-XXX-instead-of-obsolete-marcXXX.patch b/boot/uboot/2016.07/0001-arc-Use-mcpu-XXX-instead-of-obsolete-marcXXX.patch
new file mode 100644
index 0000000..eded9a3
--- /dev/null
+++ b/boot/uboot/2016.07/0001-arc-Use-mcpu-XXX-instead-of-obsolete-marcXXX.patch
@@ -0,0 +1,39 @@
+From 7c8d81605302e7d7fdd3e7d8eb69302bddc64a2c Mon Sep 17 00:00:00 2001
+From: Alexey Brodkin <abrodkin@synopsys.com>
+Date: Fri, 16 Sep 2016 12:12:26 +0300
+Subject: [PATCH] arc: Use -mcpu=XXX instead of obsolete -marcXXX
+
+With newer ARC tools old way of CPU specification gets obsolete,
+so we're switching to newer and more common way of setting "-mcpu".
+
+Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
+---
+ arch/arc/config.mk | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/arch/arc/config.mk b/arch/arc/config.mk
+index 7c974f0..13676bd 100644
+--- a/arch/arc/config.mk
++++ b/arch/arc/config.mk
+@@ -31,15 +31,15 @@ CONFIG_MMU = 1
+ endif
+ 
+ ifdef CONFIG_CPU_ARC750D
+-PLATFORM_CPPFLAGS += -marc700
++PLATFORM_CPPFLAGS += -mcpu=arc700
+ endif
+ 
+ ifdef CONFIG_CPU_ARC770D
+-PLATFORM_CPPFLAGS += -marc700 -mlock -mswape
++PLATFORM_CPPFLAGS += -mcpu=arc700 -mlock -mswape
+ endif
+ 
+ ifdef CONFIG_CPU_ARCEM6
+-PLATFORM_CPPFLAGS += -marcem
++PLATFORM_CPPFLAGS += -mcpu=arcem
+ endif
+ 
+ ifdef CONFIG_CPU_ARCHS34
+-- 
+2.7.4
+
diff --git a/boot/uboot/2016.09.01/0001-arc-Use-mcpu-XXX-instead-of-obsolete-marcXXX.patch b/boot/uboot/2016.09.01/0001-arc-Use-mcpu-XXX-instead-of-obsolete-marcXXX.patch
new file mode 100644
index 0000000..eded9a3
--- /dev/null
+++ b/boot/uboot/2016.09.01/0001-arc-Use-mcpu-XXX-instead-of-obsolete-marcXXX.patch
@@ -0,0 +1,39 @@
+From 7c8d81605302e7d7fdd3e7d8eb69302bddc64a2c Mon Sep 17 00:00:00 2001
+From: Alexey Brodkin <abrodkin@synopsys.com>
+Date: Fri, 16 Sep 2016 12:12:26 +0300
+Subject: [PATCH] arc: Use -mcpu=XXX instead of obsolete -marcXXX
+
+With newer ARC tools old way of CPU specification gets obsolete,
+so we're switching to newer and more common way of setting "-mcpu".
+
+Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
+---
+ arch/arc/config.mk | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/arch/arc/config.mk b/arch/arc/config.mk
+index 7c974f0..13676bd 100644
+--- a/arch/arc/config.mk
++++ b/arch/arc/config.mk
+@@ -31,15 +31,15 @@ CONFIG_MMU = 1
+ endif
+ 
+ ifdef CONFIG_CPU_ARC750D
+-PLATFORM_CPPFLAGS += -marc700
++PLATFORM_CPPFLAGS += -mcpu=arc700
+ endif
+ 
+ ifdef CONFIG_CPU_ARC770D
+-PLATFORM_CPPFLAGS += -marc700 -mlock -mswape
++PLATFORM_CPPFLAGS += -mcpu=arc700 -mlock -mswape
+ endif
+ 
+ ifdef CONFIG_CPU_ARCEM6
+-PLATFORM_CPPFLAGS += -marcem
++PLATFORM_CPPFLAGS += -mcpu=arcem
+ endif
+ 
+ ifdef CONFIG_CPU_ARCHS34
+-- 
+2.7.4
+
