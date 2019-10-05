From: Romain Naour <romain.naour@gmail.com>
Date: Sat,  5 Oct 2019 19:04:10 +0200
Subject: [Buildroot] [PATCH 1/3] package/llvm: bump to version 9.0.0
Message-ID: <20191005170412.4077137-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The github download url doesn't contain the llvm 9.0.0 archive,
so use the previous url.

Since v9.0.0, it was relicensed to the Apache License 2.0 with
LLVM Exceptions. Update the license file hash.

Use host-python3 to build llvm [1]

Disable explicitely Z3 support since there is no such package
in Buildroot.

[1] https://github.com/llvm-mirror/llvm/commit/213d1037e9f8b837d61eda9668112d17b0f956d0

See:
http://releases.llvm.org/9.0.0/docs/ReleaseNotes.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Valentin Korenblit <valentinkorenblit@gmail.com>
Cc: Joseph Kogut <joseph.kogut@gmail.com>
---
 package/llvm/llvm.hash |  4 ++--
 package/llvm/llvm.mk   | 15 +++++++++------
 2 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/package/llvm/llvm.hash b/package/llvm/llvm.hash
index 3e74706dfd..a10b66ded2 100644
--- a/package/llvm/llvm.hash
+++ b/package/llvm/llvm.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256 44787a6d02f7140f145e2250d56c9f849334e11f9ae379827510ed72f12b75e7 llvm-8.0.1.src.tar.xz
-sha256 24b67da19b1422a819395738cb83ea34eee3fdce52870b0d1758524ba1615069 LICENSE.TXT
+sha256 d6a0565cf21f22e9b4353b2eb92622e8365000a9e90a16b09b56f8157eabfe84 llvm-9.0.0.src.tar.xz
+sha256 8d85c1057d742e597985c7d4e6320b015a9139385cff4cbae06ffc0ebe89afee LICENSE.TXT
diff --git a/package/llvm/llvm.mk b/package/llvm/llvm.mk
index 27a9f41860..a2e49f48c2 100644
--- a/package/llvm/llvm.mk
+++ b/package/llvm/llvm.mk
@@ -5,17 +5,16 @@
 ################################################################################
 
 # LLVM and Clang should be version bumped together
-LLVM_VERSION = 8.0.1
-LLVM_SITE = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(LLVM_VERSION)
+LLVM_VERSION = 9.0.0
+LLVM_SITE = http://llvm.org/releases/$(LLVM_VERSION)
 LLVM_SOURCE = llvm-$(LLVM_VERSION).src.tar.xz
-LLVM_LICENSE = NCSA
+LLVM_LICENSE = Apache-2.0 with exceptions
 LLVM_LICENSE_FILES = LICENSE.TXT
 LLVM_SUPPORTS_IN_SOURCE_BUILD = NO
 LLVM_INSTALL_STAGING = YES
 
-# http://llvm.org/docs/GettingStarted.html#software
-# host-python: Python interpreter 2.7 or newer is required for builds and testing.
-HOST_LLVM_DEPENDENCIES = host-python
+# LLVM >= 9.0 can use python3 to build.
+HOST_LLVM_DEPENDENCIES = host-python3
 LLVM_DEPENDENCIES = host-llvm
 
 # LLVM >= 9.0 will soon require C++14 support, building llvm 8.x using a
@@ -138,6 +137,10 @@ LLVM_CONF_OPTS += -DLLVM_ENABLE_ZLIB=OFF
 HOST_LLVM_CONF_OPTS += -DLLVM_ENABLE_LIBXML2=OFF
 LLVM_CONF_OPTS += -DLLVM_ENABLE_LIBXML2=OFF
 
+# Disable optional Z3Prover since there is no such package in Buildroot.
+HOST_LLVM_CONF_OPTS += -DLLVM_ENABLE_Z3_SOLVER=OFF
+LLVM_CONF_OPTS += -DLLVM_ENABLE_Z3_SOLVER=OFF
+
 # We don't use llvm for static only build, so enable PIC
 HOST_LLVM_CONF_OPTS += -DLLVM_ENABLE_PIC=ON
 LLVM_CONF_OPTS += -DLLVM_ENABLE_PIC=ON
-- 
2.23.0
