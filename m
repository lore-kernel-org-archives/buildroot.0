From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:56:41 -0000
Subject: [Buildroot] [git commit branch/next] toolchain-external: improve
	lib subdirectory matching
Message-ID: <20150808105630.811FA7FC31@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bacf2157193c1565f37c260685a03426a1be5656
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The toolchain from the Cavium Networks Octeon SDK provides a sysroot
with library directories lib32, lib32-fp, lib64 and lib64-fp. The -fp
variants are used for processors with hardware floating point unit, such
as the Octeon III variants.

When specifying -march=octeon3 in BR2_TARGET_OPTIMIZATION, the toolchain
will use lib32-fp, but currently Buildroot does not accept that pattern.

This patch improves the matching by accepting lib(32|64)?([^/]*)? as lib
directory name.

Signed-off-by: Bai Yingjie <byj.tea@gmail.com>
[ThomasDS: update commit message]
Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
[Thomas: add comment above the function being modified to illustrate
the various cases we try to handle.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/toolchain-external.mk |   17 ++++++++++++++---
 1 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 070f068..c8dd98f 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -436,15 +436,26 @@ define toolchain_find_libc_a
 $$(readlink -f $$(LANG=C $(1) -print-file-name=libc.a))
 endef
 
-# Returns the sysroot location for the given compiler + flags
+# Returns the sysroot location for the given compiler + flags. We need
+# to handle cases where libc.a is in:
+#
+#  - lib/
+#  - usr/lib/
+#  - lib32/
+#  - lib64/
+#  - lib32-fp/ (Cavium toolchain)
+#  - lib64-fp/ (Cavium toolchain)
+#  - usr/lib/<tuple>/ (Linaro toolchain)
+#
+# And variations on these.
 define toolchain_find_sysroot
-$$(echo -n $(call toolchain_find_libc_a,$(1)) | sed -r -e 's:(usr/)?lib(32|64)?/([^/]*/)?libc\.a::')
+$$(echo -n $(call toolchain_find_libc_a,$(1)) | sed -r -e 's:(usr/)?lib(32|64)?([^/]*)?/([^/]*/)?libc\.a::')
 endef
 
 # Returns the lib subdirectory for the given compiler + flags (i.e
 # typically lib32 or lib64 for some toolchains)
 define toolchain_find_libdir
-$$(echo -n $(call toolchain_find_libc_a,$(1)) | sed -r -e 's:.*/(usr/)?(lib(32|64)?)/([^/]*/)?libc.a:\2:')
+$$(echo -n $(call toolchain_find_libc_a,$(1)) | sed -r -e 's:.*/(usr/)?(lib(32|64)?([^/]*)?)/([^/]*/)?libc.a:\2:')
 endef
 
 # Checks for an already installed toolchain: check the toolchain
