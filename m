From: Valentin Korenblit <valentin.korenblit@smile.fr>
Date: Wed, 16 May 2018 17:26:35 +0200
Subject: [Buildroot] [PATCH] package/llvm: fix host-llvm build with GCC8
Message-ID: <20180516152635.19330-1-valentin.korenblit@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch fixes the build of lli for host-llvm when using GCC 8.

It was taken from llvm-5.0 package for Fedora 28.

Link to bug: https://bugzilla.redhat.com/show_bug.cgi?id=1540620

Fixes:

http://autobuild.buildroot.net/results/824c70e982d8ec7e518cf4db058767df42db6b04/

Signed-off-by: Valentin Korenblit <valentin.korenblit@smile.fr>
---
 ...turn-type-in-ORC-readMem-client-interface.patch | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 package/llvm/0001-Fix-return-type-in-ORC-readMem-client-interface.patch

diff --git a/package/llvm/0001-Fix-return-type-in-ORC-readMem-client-interface.patch b/package/llvm/0001-Fix-return-type-in-ORC-readMem-client-interface.patch
new file mode 100644
index 0000000000..0343b4c7e8
--- /dev/null
+++ b/package/llvm/0001-Fix-return-type-in-ORC-readMem-client-interface.patch
@@ -0,0 +1,37 @@
+From 72ea6ea635d5b5a88f411710daf7e1d340d232d8 Mon Sep 17 00:00:00 2001
+From: Tilmann Scheller <tschelle@redhat.com>
+Date: Thu, 1 Feb 2018 11:40:01 -0600
+Subject: [PATCH] Fix return type in ORC readMem() client interface.
+
+GCC 8.0.1 detects the type mismatch and causes the compilation to fail. Clang
+and earlier versions of GCC don't detect the issue.
+
+Fixes rhbz#1540620.
+
+This patch was taken from llvm5.0-5.0.1-7.fc28.src.rpm
+
+Link to bug: https://bugzilla.redhat.com/show_bug.cgi?id=1540620
+
+Signed-off-by: Valentin Korenblit <valentin.korenblit@smile.fr>
+---
+ include/llvm/ExecutionEngine/Orc/OrcRemoteTargetClient.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/include/llvm/ExecutionEngine/Orc/OrcRemoteTargetClient.h b/include/llvm/ExecutionEngine/Orc/OrcRemoteTargetClient.h
+index da02250ba16..bed472e2e0e 100644
+--- a/include/llvm/ExecutionEngine/Orc/OrcRemoteTargetClient.h
++++ b/include/llvm/ExecutionEngine/Orc/OrcRemoteTargetClient.h
+@@ -713,8 +713,8 @@ private:
+ 
+   uint32_t getTrampolineSize() const { return RemoteTrampolineSize; }
+ 
+-  Expected<std::vector<char>> readMem(char *Dst, JITTargetAddress Src,
+-                                      uint64_t Size) {
++  Expected<std::vector<uint8_t>> readMem(char *Dst, JITTargetAddress Src,
++                                         uint64_t Size) {
+     // Check for an 'out-of-band' error, e.g. from an MM destructor.
+     if (ExistingError)
+       return std::move(ExistingError);
+-- 
+2.14.3
+
-- 
2.14.3
