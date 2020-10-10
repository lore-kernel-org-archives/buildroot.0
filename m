From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 10 Oct 2020 21:37:39 +0200
Subject: [Buildroot] [git commit branch/2020.08.x] package/ti-utils: fix
 build with gcc 10
Message-ID: <20201010195947.06FD68EC6F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e804712435a7e8ce5def458d59de04320e0689a2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

Fixes:
 - http://autobuild.buildroot.org/results/e96c70910544085dc5299fa59f80ab9c5922fde2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 55b54c8d4466bbc429dee3d55dd096bb8da66b35)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-plt.h-fix-build-with-gcc-10.patch         | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/package/ti-utils/0001-plt.h-fix-build-with-gcc-10.patch b/package/ti-utils/0001-plt.h-fix-build-with-gcc-10.patch
new file mode 100644
index 0000000000..e36b735e89
--- /dev/null
+++ b/package/ti-utils/0001-plt.h-fix-build-with-gcc-10.patch
@@ -0,0 +1,35 @@
+From 9ed1946cef876acd5346ae806eecd7fc2e1e5341 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 3 Oct 2020 10:32:48 +0200
+Subject: [PATCH] plt.h: fix build with gcc 10
+
+Drop EFUSE_PARAMETER_TYPE_ENM to avoid the following build failure with
+gcc 10 (which defaults to -fno-common):
+
+/home/naourr/work/instance-1/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/10.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: misc_cmds.o:(.bss+0x0): multiple definition of `EFUSE_PARAMETER_TYPE_ENM'; nvs.o:(.bss+0x0): first defined here
+
+Fixes:
+ - http://autobuild.buildroot.org/results/e96c70910544085dc5299fa59f80ab9c5922fde2
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/gxk/ti-utils/pull/2]
+---
+ plt.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/plt.h b/plt.h
+index 523fded..8ba01c9 100644
+--- a/plt.h
++++ b/plt.h
+@@ -363,7 +363,7 @@ enum EFUSE_PARAMETER_TYPE_ENMT {
+ 	TX_BIP_PD_BUFFER_VBIAS_ERROR_E,
+ 	EFUSE_NUMBER_OF_PARAMETERS_E,
+ 	EFUSE_LAST_PARAMETER_E = (EFUSE_NUMBER_OF_PARAMETERS_E - 1)
+-} EFUSE_PARAMETER_TYPE_ENM;
++};
+ 
+ int get_mac_addr(int ifc_num, unsigned char *mac_addr);
+ 
+-- 
+2.28.0
+
