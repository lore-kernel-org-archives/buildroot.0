From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 27 Nov 2015 23:39:14 +0100
Subject: [Buildroot] [PATCH 7/7 v3] autobuild: check for Linaro toolchains
	earlier
In-Reply-To: <cover.1448663846.git.yann.morin.1998@free.fr>
References: <cover.1448663846.git.yann.morin.1998@free.fr>
Message-ID: <a89f4ae40bd1f7d5600226eb0ac20f27098413fb.1448663846.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When we get a configuration with those toolchains, we can not fix it.
So we need to abort that configuration.

Fix the glibc version we check against (2.14, not 2.24).

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 scripts/autobuild-run | 29 +++++++++++++++++++----------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 1c7c91f..55619b6 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -339,6 +339,25 @@ def is_config_fixable(**kwargs):
     any unfixable options.
     """
 
+    idir = "instance-%d" % kwargs['instance']
+    sysinfo = kwargs['sysinfo']
+
+    outputdir = os.path.join(idir, "output")
+    with open(os.path.join(outputdir, ".config")) as configf:
+        configlines = configf.readlines()
+
+    # The latest Linaro toolchains on x86-64 hosts requires glibc
+    # 2.14+ on the host.
+    if platform.machine() == 'x86_64':
+        if 'BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM=y\n' in configlines or \
+           'BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64=y\n' in configlines or \
+           'BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB=y\n' in configlines:
+            ldd_version_output = subprocess.Popen(['ldd', '--version'], stdout=subprocess.PIPE).communicate()[0]
+            glibc_version = ldd_version_output.splitlines()[0].split()[-1]
+            if StrictVersion('2.14') > StrictVersion(glibc_version):
+                log_write(log, "WARN: ignoring the Linaro ARM toolchains becausee too old host glibc")
+                return False
+
     return True
 
 def fixup_config(**kwargs):
@@ -457,16 +476,6 @@ def fixup_config(**kwargs):
     if 'BR2_PACKAGE_WESTON=y\n' in configlines and \
        'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/mipsel-ctng-linux-uclibc.tar.xz"\n' in configlines:
         return False
-    # The latest Linaro toolchains on x86-64 hosts requires glibc
-    # 2.24+ on the host.
-    if platform.machine() == 'x86_64':
-        if 'BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM=y\n' in configlines or \
-           'BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64=y\n' in configlines or \
-           'BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB=y\n' in configlines:
-            ldd_version_output = subprocess.Popen(['ldd', '--version'], stdout=subprocess.PIPE).communicate()[0]
-            glibc_version = ldd_version_output.splitlines()[0].split()[-1]
-            if StrictVersion('2.24') > StrictVersion(glibc_version):
-                return False
 
     with open(os.path.join(outputdir, ".config"), "w+") as configf:
         configf.writelines(configlines)
-- 
1.9.1
