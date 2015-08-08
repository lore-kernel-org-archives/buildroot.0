From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:57:11 -0000
Subject: [Buildroot] [git commit branch/next] package/nfs-utils: fix unmet
	direct dependency
Message-ID: <20150808105640.3F0107F8D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=64c10ae691e230935473f23ef71ab997293adf8f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Commit 182520a8af734c735c4dbdff29dc07af1d615a0a adds rpcbind as a dependency
without properly caring for the thread dependency.

rpcbind adds libtirpc as a dependendency which fails:
  fatal error: pthread.h: No such file or directory

Since we probably don't care much about using nfs-utils in a non-threaded
scenario, we simply disable nfs-utils for toolchains without thread support.

Fixes:
http://autobuild.buildroot.net/results/803/80321de8d4c6c0a00439b07289a5818962128b43/

Suggested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/nfs-utils/Config.in |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nfs-utils/Config.in b/package/nfs-utils/Config.in
index 2806551..1273092 100644
--- a/package/nfs-utils/Config.in
+++ b/package/nfs-utils/Config.in
@@ -1,10 +1,10 @@
 comment "nfs-utils needs a toolchain w/ threads"
 	depends on BR2_USE_MMU
-	depends on !(BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_HAS_NATIVE_RPC)
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_NFS_UTILS
 	bool "nfs-utils"
-	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC || BR2_TOOLCHAIN_HAS_THREADS # libtirpc
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libtirpc, rpcbind
 	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_PACKAGE_RPCBIND # runtime
 	depends on BR2_USE_MMU # fork()
