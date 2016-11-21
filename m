From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 22 Nov 2016 00:43:40 +0100
Subject: [Buildroot] [PATCH 2/2] toolchain: simplify the conditions for
	BR2_TOOLCHAIN_ARM_HAS_SYNC_8
In-Reply-To: <20161121234340.30463-1-arnout@mind.be>
References: <20161121234340.30463-1-arnout@mind.be>
Message-ID: <20161121234340.30463-2-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since we patch the internal toolchain to remove the call to __write in
the 8-byte __sync implementation, this now also works for uClibc and
musl in gcc 4.8 and 4.9. gcc 5 and 6 were already working, but the
condition on BR2_TOOLCHAIN_ARM_HAS_SYNC_8 hadn't been updated.

We can simplify the condition quite a bit by just requiring gcc 4.8+.
This means that gcc 4.7 + (glibc or ARMv7) is no longer considered to
have 8-byte __sync, but it's not possible to build an internal
toolchain with gcc 4.7, and there is no common external toolchain that
uses gcc 4.7 for ARM. In addition, very few packages depend on
BR2_TOOLCHAIN_ARM_HAS_SYNC_8 so nobody will miss it.

Note that we assume that external toolchains with gcc 4.8 and 4.9 have
been fixed. Since most external toolchains use glibc, and the musl
external toolchain uses gcc 5.3.0, this is a relatively safe assumption.
And again, very few packages are affected.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
I guess this change is for next, not for master. But it depends on
patch 1/2 (though not in the sense of causing a merge conflict).
Perhaps it's best to leave it lingering in patchwork until after the
release of 2016.11, or after a master->next merge.

I build-tested kodi on a uClibc arm926t with the gcc patch applied.
---
 toolchain/toolchain-common.in | 26 ++++++++------------------
 1 file changed, 8 insertions(+), 18 deletions(-)

diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index bf9dc7b..4699e8d 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -332,29 +332,19 @@ config BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_sparc
 	depends on !(BR2_arc && !BR2_ARC_ATOMIC_EXT)
 
-# The availability of __sync for 8-byte types on ARM is somewhat
-# complicated:
-#
-#  - It appeared in gcc starting with gcc 4.7.
-#
-#  - On ARMv7, there is no problem, it can be directly implemented in
-#    userspace.
-#
-#  - On < ARMv7, it requires help from the kernel. Unfortunately, the
-#    libgcc code implementing 8-byte __sync with the help from the
-#    kernel calls __write() when a failure occurs, which is a function
-#    internal to glibc, not available in uClibc and musl. This means
-#    that the 8-byte __sync operations are not available on < ARMv7
-#    with uClibc and musl. This problem was fixed as part of gcc
-#    PR68059, which was backported to the gcc 5 branch, but isn't yet
-#    part of any gcc 5.x release.
+# __sync for 8-byte types on ARM appeared in gcc starting with gcc 4.7.
+# However, this implementation called the glibc-internal __write() function
+# for < ARMv7, which caused link failures with uClibc and musl. This problem
+# was fixed as part of gcc PR68059, which was backported to gcc 5.2.0.
+# In the internal toolchain we also backported to gcc 4.8 and 4.9. To simplify
+# things, and since most external toolchains are glibc, we assume the 8-byte
+# __sync type is available for gcc >= 4.8.
 #
 config BR2_TOOLCHAIN_ARM_HAS_SYNC_8
 	bool
 	default y
 	depends on BR2_arm || BR2_armeb
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
-	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_ARM_CPU_ARMV7A
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 
 # 8-byte intrinsics available on most x86 CPUs, except a few old ones
 config BR2_TOOLCHAIN_X86_HAS_SYNC_8
-- 
2.10.2
