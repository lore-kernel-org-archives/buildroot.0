From: Romain Naour <romain.naour@smile.fr>
Date: Sat,  7 Sep 2019 11:40:16 +0200
Subject: [Buildroot] [PATCH v2 01/12] package/clang: help host-clang to find
 our external toolchain
In-Reply-To: <20190907094027.9537-1-romain.naour@smile.fr>
References: <20190907094027.9537-1-romain.naour@smile.fr>
Message-ID: <20190907094027.9537-2-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To build libfuzzer package Matthew Weber noticed that (host) clang
doesn't run on the host without "-B $(HOST_DIR)/opt/ext-toolchain"
option. This option add a new search path for binaries and object
files used implicitly.

Without -B clang fail to link due to missing crtbeging.o file and libgcc:
output/host/bin/aarch64-linux-gnu-ld: cannot find crtbegin.o: No such file or directory
output/host/bin/aarch64-linux-gnu-ld: cannot find -lgcc

Indeed, clang search path doesn't include the dafault cross-gcc's search paths:

$ output/host/bin/clang -print-search-dirs
programs: = output/host/bin:output/host/bin:/..//bin
libraries: = output/host/lib/clang/8.0.0:
             output/host/bin/../lib64:
             /lib/../lib64:
             /usr/lib/../lib64:
             output/host/bin/../lib:
             /lib:/usr/lib

Here is the same command for cross-gcc:

$ output/host/bin/aarch64-linux-gnu-gcc -print-search-dirs
install: output/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/
programs: = output/host/opt/ext-toolchain/bin/../libexec/gcc/aarch64-linux-gnu/8.3.0/:
            output/host/opt/ext-toolchain/bin/../libexec/gcc/:
            output/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/aarch64-linux-gnu/8.3.0/:
            output/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/
libraries: = output/opt/ext-toolchain/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/:
             output/host/opt/ext-toolchain/bin/../lib/gcc/:
             output/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/lib/aarch64-linux-gnu/8.3.0/:
             output/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/lib/../lib64/:
             output/host/aarch64-buildroot-linux-gnu/sysroot/lib/aarch64-linux-gnu/8.3.0/:
             output/host/aarch64-buildroot-linux-gnu/sysroot/lib/../lib64/:
             output/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/aarch64-linux-gnu/8.3.0/:
             output/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/../lib64/:
             output/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/lib/:
             output/host/aarch64-buildroot-linux-gnu/sysroot/lib/:
             output/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/

We can see that gcc default search path contains
"output/host/opt/ext-toolchain" directory where the external toolchain
has been extracted.

Since we want to use clang without additional option like -B,
patch clang in order to use GCC_INSTALL_PREFIX instead of
using automatic detection (which doesn't work for Buildroot).

We eventually want to relocate the Buildroot SDK containing the clang
cross-compiler, so we provide a relative path to GCC_INSTALL_PREFIX
in order to avoid to hardcode the path to the GCC toolchain.

Also the path between clang and the GCC external toolchain is not always
the same, we have the following case:

* Toolchain to be downloaded and installed
  The toolchain is extracted into $(HOST_DIR)/opt/ext-toolchain, so the
  path is "../opt/ext-toolchain".

* Pre-installed toolchain
  The toolchain is localed somewhere in the host filesystem and
  defined by the user using BR2_TOOLCHAIN_EXTERNAL_PATH.

So, set GCC_INSTALL_PREFIX using realpath:

-DGCC_INSTALL_PREFIX:PATH=`realpath --relative-to=$(HOST_DIR)/bin/ $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)`

When we use a Buildroot's internal toolchain, clang will find theses
crt*.o files and libgcc.

http://lists.busybox.net/pipermail/buildroot/2019-August/256204.html

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Matthew Weber <matthew.weber@rockwellcollins.com>
Cc: Valentin Korenblit <valentinkorenblit@gmail.com>
---
v2: don't hack the external toolchain infra.
    patch clang and provide GCC_INSTALL_PREFIX
---
 ...hains-Gnu-Use-GCC_INSTALL_PREFIX-in-.patch | 76 +++++++++++++++++++
 package/clang/clang.mk                        |  7 ++
 2 files changed, 83 insertions(+)
 create mode 100644 package/clang/0001-lib-Driver-ToolChains-Gnu-Use-GCC_INSTALL_PREFIX-in-.patch

diff --git a/package/clang/0001-lib-Driver-ToolChains-Gnu-Use-GCC_INSTALL_PREFIX-in-.patch b/package/clang/0001-lib-Driver-ToolChains-Gnu-Use-GCC_INSTALL_PREFIX-in-.patch
new file mode 100644
index 0000000000..63ddbaf35f
--- /dev/null
+++ b/package/clang/0001-lib-Driver-ToolChains-Gnu-Use-GCC_INSTALL_PREFIX-in-.patch
@@ -0,0 +1,76 @@
+From fe21cede3939a435d62efbd5799547fab6af1b0a Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@smile.fr>
+Date: Mon, 5 Aug 2019 16:06:48 +0200
+Subject: [PATCH] lib/Driver/ToolChains/Gnu: Use GCC_INSTALL_PREFIX in the set
+ of prefixes for searching the gcc toolchain
+
+By default, the Gnu Toolchains driver is looking at the parent
+directory while looking for the gcc toolchain when clang is installed
+at "D.InstalledDir"
+
+But this doesn't work with Buildroot since the external
+toolchain is installed in host/opt/ext-toolchain and the sysroot is
+moved to host/<arch>-buildroot-linux-gnu/sysroot/ directory.
+
+We tried by setting GCC_INSTALL_PREFIX in clang.mk for host-clang
+but it doesn't work since we already provide a sysroot [1].
+
+Help the Gnu Toolchains driver by using GCC_INSTALL_PREFIX path.
+
+Since we want to be able to relocate the clang toolchain,
+allow to use a relative path with GCC_INSTALL_PREFIX.
+
+Buildroot will provide such relative path by using:
+HOST_CLANG_CONF_OPTS += -DGCC_INSTALL_PREFIX:PATH=`realpath --relative-to=$(HOST_DIR)/bin/ $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)`
+
+Doing so allow to use clang without providing additional search
+paths with -B option on the clang's command line.
+
+[1] https://reviews.llvm.org/D49244
+[2] http://lists.busybox.net/pipermail/buildroot/2019-August/256204.html
+
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+---
+This issue needs to be reported and discussed with upstream.
+---
+ lib/Driver/ToolChains/Gnu.cpp | 17 +++++++++++++++++
+ 1 file changed, 17 insertions(+)
+
+diff --git a/lib/Driver/ToolChains/Gnu.cpp b/lib/Driver/ToolChains/Gnu.cpp
+index 2ad45097dc..90d6b5b748 100644
+--- a/lib/Driver/ToolChains/Gnu.cpp
++++ b/lib/Driver/ToolChains/Gnu.cpp
+@@ -1725,6 +1725,8 @@ void Generic_GCC::GCCInstallationDetector::init(
+ 
+     Prefixes.push_back(GCCToolchainDir);
+   } else {
++    StringRef GccIinstallPrefix = GCC_INSTALL_PREFIX;
++
+     // If we have a SysRoot, try that first.
+     if (!D.SysRoot.empty()) {
+       Prefixes.push_back(D.SysRoot);
+@@ -1734,6 +1736,21 @@ void Generic_GCC::GCCInstallationDetector::init(
+     // Then look for gcc installed alongside clang.
+     Prefixes.push_back(D.InstalledDir + "/..");
+ 
++    // Use GCC_INSTALL_PREFIX if provided by the buildsystem.
++    if (!GccIinstallPrefix.empty())
++    {
++        if (llvm::sys::path::is_relative(GccIinstallPrefix))
++        {
++            // Use a relative path to gcc from clang install path.
++            Prefixes.push_back(D.InstalledDir + "/" + GccIinstallPrefix.str());
++        }
++        else
++        {
++            // Hardcode the absolute path provided by GCC_INSTALL_PREFIX.
++            Prefixes.push_back(GCC_INSTALL_PREFIX);
++        }
++    }
++
+     // Next, look for prefix(es) that correspond to distribution-supplied gcc
+     // installations.
+     if (D.SysRoot.empty()) {
+-- 
+2.20.1
+
diff --git a/package/clang/clang.mk b/package/clang/clang.mk
index 3796ca8605..ed6f9bf90e 100644
--- a/package/clang/clang.mk
+++ b/package/clang/clang.mk
@@ -102,5 +102,12 @@ CLANG_CONF_OPTS += -DLLVM_LINK_LLVM_DYLIB=ON
 HOST_CLANG_CONF_OPTS += -DLLVM_DYLIB_COMPONENTS=all
 CLANG_CONF_OPTS += -DLLVM_DYLIB_COMPONENTS=all
 
+# Help host-clang to find our external toolchain, use a relative path from the clang
+# installation directory to the external toolchain installation directory in order to
+# not hardcode the toolchain absolute path.
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
+HOST_CLANG_CONF_OPTS += -DGCC_INSTALL_PREFIX:PATH=`realpath --relative-to=$(HOST_DIR)/bin/ $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)`
+endif
+
 $(eval $(cmake-package))
 $(eval $(host-cmake-package))
-- 
2.21.0
