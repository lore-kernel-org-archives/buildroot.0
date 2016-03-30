From: Matt Weber <matt@thewebers.ws>
Date: Tue, 29 Mar 2016 20:47:25 -0500
Subject: [Buildroot] [PATCH 1/1] buildroot-test: enable toolchains based on
	hostarch
Message-ID: <1459302445-1256-1-git-send-email-matt@thewebers.ws>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- updated toolchain csv to include hostarch
- fixed logic in autobuild-run to correctly select x86_64 vs x86

Signed-off-by: Matt Weber <matt@thewebers.ws>
---
 scripts/autobuild-run                        |  4 +-
 web/toolchains/configs/toolchain-configs.csv | 56 ++++++++++++++--------------
 2 files changed, 31 insertions(+), 29 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index ca5bdfc..bb4dcfa 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -259,8 +259,10 @@ def get_toolchain_configs():
     configs = []
 
     (_, _, _, _, hostarch) = os.uname()
-    if hostarch == 'i686' or hostarch == 'x86_64':
+    # ~2015 distros report x86 when on a 32bit install
+    if hostarch == 'i686' or hostarch == 'i386' or hostarch == 'x86':
         hostarch = 'x86'
+    # x86_64 defaults correctly, so not setting
 
     for row in csv.reader(l):
         config = {}
diff --git a/web/toolchains/configs/toolchain-configs.csv b/web/toolchains/configs/toolchain-configs.csv
index 56fbdf7..acd2741 100644
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
+http://autobuild.buildroot.org/toolchains/configs/br-arc-full-internal.config,x86_64,uclibc
+http://autobuild.buildroot.org/toolchains/configs/br-arcle-hs38.config,x86_64,uclibc
+http://autobuild.buildroot.org/toolchains/configs/br-arm-basic.config,x86_64,uclibc
+http://autobuild.buildroot.org/toolchains/configs/br-arm-cortex-a9-glibc.config,x86_64,glibc
+http://autobuild.buildroot.org/toolchains/configs/br-arm-cortex-a9-musl.config,x86_64,musl
+http://autobuild.buildroot.org/toolchains/configs/br-arm-full.config,x86_64,uclibc
+http://autobuild.buildroot.org/toolchains/configs/br-arm-full-nothread.config,x86_64,uclibc
+http://autobuild.buildroot.org/toolchains/configs/br-arm-full-static.config,x86_64,uclibc
+http://autobuild.buildroot.org/toolchains/configs/br-arm-internal-full.config,x86_64,uclibc
+http://autobuild.buildroot.org/toolchains/configs/br-i386-pentium4-full.config,x86_64,uclibc
+http://autobuild.buildroot.org/toolchains/configs/br-microblazeel-full.config,x86_64,glibc
+http://autobuild.buildroot.org/toolchains/configs/br-microblazeel-full-internal.config,x86_64,glibc
+http://autobuild.buildroot.org/toolchains/configs/br-mips64-n64-full.config,x86_64,uclibc
+http://autobuild.buildroot.org/toolchains/configs/br-mips32r6-el-hf-glibc.config,x86_64,glibc
+http://autobuild.buildroot.org/toolchains/configs/br-mips64r6-el-hf-glibc.config,x86_64,glibc
+http://autobuild.buildroot.org/toolchains/configs/br-mipsel-o32-full.config,x86_64,uclibc
+http://autobuild.buildroot.org/toolchains/configs/br-nios2-glibc.config,x86_64,glibc
+http://autobuild.buildroot.org/toolchains/configs/br-powerpc-603e-basic-cpp.config,x86_64,uclibc
+http://autobuild.buildroot.org/toolchains/configs/br-powerpc-e500mc-full.config,x86_64,uclibc
+http://autobuild.buildroot.org/toolchains/configs/br-powerpc-internal-full.config,x86_64,uclibc
+http://autobuild.buildroot.org/toolchains/configs/br-sh4-full.config,x86_64,uclibc
+http://autobuild.buildroot.org/toolchains/configs/br-sparc-glibc.config,x86_64,glibc
+http://autobuild.buildroot.org/toolchains/configs/br-sparc64-glibc.config,x86_64,glibc
+http://autobuild.buildroot.org/toolchains/configs/br-x86-64-core2-full.config,x86_64,uclibc
+http://autobuild.buildroot.org/toolchains/configs/br-x86-64-musl.config,x86_64,musl
+http://autobuild.buildroot.org/toolchains/configs/br-xtensa-full.config,x86_64,uclibc
+http://autobuild.buildroot.org/toolchains/configs/br-xtensa-full-internal.config,x86_64,uclibc
 http://autobuild.buildroot.org/toolchains/configs/i686-ctng-linux-gnu.config,x86,glibc
 http://autobuild.buildroot.org/toolchains/configs/linaro-aarch64.config,x86,glibc
 http://autobuild.buildroot.org/toolchains/configs/linaro-arm.config,x86,glibc
-- 
2.5.0
