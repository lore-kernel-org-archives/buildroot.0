From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Jun 2018 22:23:15 +0200
Subject: [Buildroot] [git commit] llvm: bump to version 6.0.0
Message-ID: <20180615204840.72A5388760@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2d8ce733b852a09764eeea57f73ab4b5859a3da4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
Tested-by: Valentin Korenblit <valentin.korenblit@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...turn-type-in-ORC-readMem-client-interface.patch | 37 ----------------------
 package/llvm/llvm.hash                             |  2 +-
 package/llvm/llvm.mk                               |  2 +-
 3 files changed, 2 insertions(+), 39 deletions(-)

diff --git a/package/llvm/0001-Fix-return-type-in-ORC-readMem-client-interface.patch b/package/llvm/0001-Fix-return-type-in-ORC-readMem-client-interface.patch
deleted file mode 100644
index 0343b4c7e8..0000000000
--- a/package/llvm/0001-Fix-return-type-in-ORC-readMem-client-interface.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 72ea6ea635d5b5a88f411710daf7e1d340d232d8 Mon Sep 17 00:00:00 2001
-From: Tilmann Scheller <tschelle@redhat.com>
-Date: Thu, 1 Feb 2018 11:40:01 -0600
-Subject: [PATCH] Fix return type in ORC readMem() client interface.
-
-GCC 8.0.1 detects the type mismatch and causes the compilation to fail. Clang
-and earlier versions of GCC don't detect the issue.
-
-Fixes rhbz#1540620.
-
-This patch was taken from llvm5.0-5.0.1-7.fc28.src.rpm
-
-Link to bug: https://bugzilla.redhat.com/show_bug.cgi?id=1540620
-
-Signed-off-by: Valentin Korenblit <valentin.korenblit@smile.fr>
----
- include/llvm/ExecutionEngine/Orc/OrcRemoteTargetClient.h | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/include/llvm/ExecutionEngine/Orc/OrcRemoteTargetClient.h b/include/llvm/ExecutionEngine/Orc/OrcRemoteTargetClient.h
-index da02250ba16..bed472e2e0e 100644
---- a/include/llvm/ExecutionEngine/Orc/OrcRemoteTargetClient.h
-+++ b/include/llvm/ExecutionEngine/Orc/OrcRemoteTargetClient.h
-@@ -713,8 +713,8 @@ private:
- 
-   uint32_t getTrampolineSize() const { return RemoteTrampolineSize; }
- 
--  Expected<std::vector<char>> readMem(char *Dst, JITTargetAddress Src,
--                                      uint64_t Size) {
-+  Expected<std::vector<uint8_t>> readMem(char *Dst, JITTargetAddress Src,
-+                                         uint64_t Size) {
-     // Check for an 'out-of-band' error, e.g. from an MM destructor.
-     if (ExistingError)
-       return std::move(ExistingError);
--- 
-2.14.3
-
diff --git a/package/llvm/llvm.hash b/package/llvm/llvm.hash
index 14f8bb4488..93bdf2e20e 100644
--- a/package/llvm/llvm.hash
+++ b/package/llvm/llvm.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256 d522eda97835a9c75f0b88ddc81437e5edbb87dc2740686cb8647763855c2b3c  llvm-5.0.2.src.tar.xz
+sha256 1ff53c915b4e761ef400b803f07261ade637b0c269d99569f18040f3dcee4408  llvm-6.0.0.src.tar.xz
 sha256 abd4d8794808bacb1eb6924d49efafd9ab6eef88faaaeb5d3cfa13ee3670d672 LICENSE.TXT
diff --git a/package/llvm/llvm.mk b/package/llvm/llvm.mk
index 3abf428989..fb0ae4ce5c 100644
--- a/package/llvm/llvm.mk
+++ b/package/llvm/llvm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LLVM_VERSION = 5.0.2
+LLVM_VERSION = 6.0.0
 LLVM_SITE = http://llvm.org/releases/$(LLVM_VERSION)
 LLVM_SOURCE = llvm-$(LLVM_VERSION).src.tar.xz
 LLVM_LICENSE = NCSA
