From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 2 Aug 2016 23:33:46 +0200
Subject: [Buildroot] [git commit] toolchain: libatomic is not built on
	"uclinux" platforms
Message-ID: <20160802214109.91A5F81999@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b3d1fb26dcadd8c570e2c415ce05398ecc810b32
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The cairo package fails to build on some architectures:
BR2_TOOLCHAIN_HAS_LIBATOMIC is enabled, but libatomic is in fact not
available.

This happens because the gcc logic in libatomic/configure.tgt does not
recognize "uclinux" as a valid OS part of the target tuple, and
therefore it does not build libatomic.

The "uclinux" part of the tuple is used by Buildroot when
BR2_BINFMT_FLAT=y, so we make BR2_TOOLCHAIN_HAS_LIBATOMIC enabled only
if !BR2_BINFMT_FLAT.

It is worth mentioning that support for the uclinux tuple could most
likely very easily be added to gcc: it could rely on the generic
"posix" implementation of libatomic, which uses pthread locks,
available on all architectures where thread support is available.

Fixes:

 [arm]  http://autobuild.buildroot.net/results/3d8dc45e41a043d2c2c26bfb26c3617499fbe671
 [m68k] http://autobuild.buildroot.net/results/318e01406e3e92eb589ee5b2231c671a4dbb6da4

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
[Thomas: adjust dependency after analysis of the gcc code.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-common.in | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index 5611b5b..ff667c0 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -403,11 +403,14 @@ config BR2_TOOLCHAIN_HAS_SYNC_8
 	default y if BR2_TOOLCHAIN_X86_HAS_SYNC_8
 
 # libatomic is available since gcc 4.8, when thread support is
-# enabled.
+# enabled. Also, libatomic doesn't recognize "uclinux" as a valid OS
+# part of the tuple, and is therefore not build on uclinux targets,
+# which is why BR2_BINFMT_FLAT configurations are excluded.
 config BR2_TOOLCHAIN_HAS_LIBATOMIC
 	bool
 	default y if BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 && \
-		BR2_TOOLCHAIN_HAS_THREADS
+		BR2_TOOLCHAIN_HAS_THREADS && \
+		!BR2_BINFMT_FLAT
 
 # __atomic intrinsics are available:
 # - with gcc 4.8, either through built-ins or libatomic, on all
