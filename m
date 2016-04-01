From: Matt Weber <matt@thewebers.ws>
Date: Thu, 31 Mar 2016 19:02:51 -0500
Subject: [Buildroot] [PATCH v2 1/2] buildroot-test: enable toolchains based
	on hostarch
Message-ID: <1459468972-31420-1-git-send-email-matt@thewebers.ws>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- updated toolchain csv to include hostarch
- fixed logic in autobuild-run to correctly select any, x86_64 vs x86

Signed-off-by: Matt Weber <matt@thewebers.ws>

--
Changes for v2
- Updated toolchain csv file to have internal configs
  listed as any type (Suggested by Thomas)
- Updated autobuild-run script to account for 'any' hostarch
  type as well as x86_64 being capable of running x86 toolchains
  (Sgggested by Thomas)
---
 scripts/autobuild-run                        | 25 +++++++++++--
 web/toolchains/configs/toolchain-configs.csv | 56 ++++++++++++++--------------
 2 files changed, 49 insertions(+), 32 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index ca5bdfc..1fbf482 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -259,17 +259,34 @@ def get_toolchain_configs():
     configs = []
 
     (_, _, _, _, hostarch) = os.uname()
-    if hostarch == 'i686' or hostarch == 'x86_64':
+    # ~2015 distros report x86 when on a 32bit install
+    if hostarch == 'i686' or hostarch == 'i386' or hostarch == 'x86':
         hostarch = 'x86'
 
     for row in csv.reader(l):
         config = {}
         config["url"] = row[0]
         config["hostarch"] = row[1]
-        # Ignore toolchains that are not built for the appropriate
-        # host architecture
-        if hostarch != config["hostarch"]:
+        keep = False
+
+        # Keep all toolchain configs that work regardless of the host
+        # architecture
+        if config['hostarch'] == "any":
+            keep = True
+
+        # Keep all toolchain configs that can work on the current host
+        # architecture
+        if hostarch == config["hostarch"]:
+            keep = True
+
+        # Assume that x86 32 bits toolchains work on x86_64 build
+        # machines
+        if hostarch == 'x86_64' and config["hostarch"] == "x86":
+            keep = True
+
+        if not keep:
             continue
+
         config["libc"] = row[2]
         with urlopen_closing(config["url"]) as r:
             config["contents"] = decode_byte_list(r.readlines())
diff --git a/web/toolchains/configs/toolchain-configs.csv b/web/toolchains/configs/toolchain-configs.csv
index 56fbdf7..6872b69 100644
--- a/web/toolchains/configs/toolchain-configs.csv
+++ b/web/toolchains/configs/toolchain-configs.csv
@@ -2,34 +2,34 @@ http://autobuild.buildroot.org/toolchains/configs/armv5-ctng-linux-gnueabi.confi
 http://autobuild.buildroot.org/toolchains/configs/armv7-ctng-linux-gnueabihf.config,x86,glibc
 http://autobuild.buildroot.org/toolchains/configs/bfin-linux-uclibc.config,x86,uclibc
 http://autobuild.buildroot.org/toolchains/configs/bfin-uclinux.config,x86,uclibc
-http://autobuild.buildroot.org/toolchains/configs/br-aarch64-glibc.config,x86,glibc
-http://autobuild.buildroot.org/toolchains/configs/br-arc-full-internal.config,x86,uclibc
-http://autobuild.buildroot.org/toolchains/configs/br-arcle-hs38.config,x86,uclibc
-http://autobuild.buildroot.org/toolchains/configs/br-arm-basic.config,x86,uclibc
-http://autobuild.buildroot.org/toolchains/configs/br-arm-cortex-a9-glibc.config,x86,glibc
-http://autobuild.buildroot.org/toolchains/configs/br-arm-cortex-a9-musl.config,x86,musl
-http://autobuild.buildroot.org/toolchains/configs/br-arm-full.config,x86,uclibc
-http://autobuild.buildroot.org/toolchains/configs/br-arm-full-nothread.config,x86,uclibc
-http://autobuild.buildroot.org/toolchains/configs/br-arm-full-static.config,x86,uclibc
-http://autobuild.buildroot.org/toolchains/configs/br-arm-internal-full.config,x86,uclibc
-http://autobuild.buildroot.org/toolchains/configs/br-i386-pentium4-full.config,x86,uclibc
-http://autobuild.buildroot.org/toolchains/configs/br-microblazeel-full.config,x86,glibc
-http://autobuild.buildroot.org/toolchains/configs/br-microblazeel-full-internal.config,x86,glibc
-http://autobuild.buildroot.org/toolchains/configs/br-mips64-n64-full.config,x86,uclibc
-http://autobuild.buildroot.org/toolchains/configs/br-mips32r6-el-hf-glibc.config,x86,glibc
-http://autobuild.buildroot.org/toolchains/configs/br-mips64r6-el-hf-glibc.config,x86,glibc
-http://autobuild.buildroot.org/toolchains/configs/br-mipsel-o32-full.config,x86,uclibc
-http://autobuild.buildroot.org/toolchains/configs/br-nios2-glibc.config,x86,glibc
-http://autobuild.buildroot.org/toolchains/configs/br-powerpc-603e-basic-cpp.config,x86,uclibc
-http://autobuild.buildroot.org/toolchains/configs/br-powerpc-e500mc-full.config,x86,uclibc
-http://autobuild.buildroot.org/toolchains/configs/br-powerpc-internal-full.config,x86,uclibc
-http://autobuild.buildroot.org/toolchains/configs/br-sh4-full.config,x86,uclibc
-http://autobuild.buildroot.org/toolchains/configs/br-sparc-glibc.config,x86,glibc
-http://autobuild.buildroot.org/toolchains/configs/br-sparc64-glibc.config,x86,glibc
-http://autobuild.buildroot.org/toolchains/configs/br-x86-64-core2-full.config,x86,uclibc
-http://autobuild.buildroot.org/toolchains/configs/br-x86-64-musl.config,x86,musl
-http://autobuild.buildroot.org/toolchains/configs/br-xtensa-full.config,x86,uclibc
-http://autobuild.buildroot.org/toolchains/configs/br-xtensa-full-internal.config,x86,uclibc
+http://autobuild.buildroot.org/toolchains/configs/br-aarch64-glibc.config,x86_64,glibc
+http://autobuild.buildroot.org/toolchains/configs/br-arc-full-internal.config,any,uclibc
+http://autobuild.buildroot.org/toolchains/configs/br-arcle-hs38.config,x86_64,uclibc
+http://autobuild.buildroot.org/toolchains/configs/br-arm-basic.config,x86_64,uclibc
+http://autobuild.buildroot.org/toolchains/configs/br-arm-cortex-a9-glibc.config,x86_64,glibc
+http://autobuild.buildroot.org/toolchains/configs/br-arm-cortex-a9-musl.config,x86_64,musl
+http://autobuild.buildroot.org/toolchains/configs/br-arm-full.config,x86_64,uclibc
+http://autobuild.buildroot.org/toolchains/configs/br-arm-full-nothread.config,x86_64,uclibc
+http://autobuild.buildroot.org/toolchains/configs/br-arm-full-static.config,x86_64,uclibc
+http://autobuild.buildroot.org/toolchains/configs/br-arm-internal-full.config,any,uclibc
+http://autobuild.buildroot.org/toolchains/configs/br-i386-pentium4-full.config,x86_64,uclibc
+http://autobuild.buildroot.org/toolchains/configs/br-microblazeel-full.config,x86_64,glibc
+http://autobuild.buildroot.org/toolchains/configs/br-microblazeel-full-internal.config,any,glibc
+http://autobuild.buildroot.org/toolchains/configs/br-mips64-n64-full.config,x86_64,uclibc
+http://autobuild.buildroot.org/toolchains/configs/br-mips32r6-el-hf-glibc.config,x86_64,glibc
+http://autobuild.buildroot.org/toolchains/configs/br-mips64r6-el-hf-glibc.config,x86_64,glibc
+http://autobuild.buildroot.org/toolchains/configs/br-mipsel-o32-full.config,x86_64,uclibc
+http://autobuild.buildroot.org/toolchains/configs/br-nios2-glibc.config,x86_64,glibc
+http://autobuild.buildroot.org/toolchains/configs/br-powerpc-603e-basic-cpp.config,x86_64,uclibc
+http://autobuild.buildroot.org/toolchains/configs/br-powerpc-e500mc-full.config,x86_64,uclibc
+http://autobuild.buildroot.org/toolchains/configs/br-powerpc-internal-full.config,any,uclibc
+http://autobuild.buildroot.org/toolchains/configs/br-sh4-full.config,x86_64,uclibc
+http://autobuild.buildroot.org/toolchains/configs/br-sparc-glibc.config,x86_64,glibc
+http://autobuild.buildroot.org/toolchains/configs/br-sparc64-glibc.config,x86_64,glibc
+http://autobuild.buildroot.org/toolchains/configs/br-x86-64-core2-full.config,x86_64,uclibc
+http://autobuild.buildroot.org/toolchains/configs/br-x86-64-musl.config,x86_64,musl
+http://autobuild.buildroot.org/toolchains/configs/br-xtensa-full.config,x86_64,uclibc
+http://autobuild.buildroot.org/toolchains/configs/br-xtensa-full-internal.config,any,uclibc
 http://autobuild.buildroot.org/toolchains/configs/i686-ctng-linux-gnu.config,x86,glibc
 http://autobuild.buildroot.org/toolchains/configs/linaro-aarch64.config,x86,glibc
 http://autobuild.buildroot.org/toolchains/configs/linaro-arm.config,x86,glibc
-- 
2.5.0
