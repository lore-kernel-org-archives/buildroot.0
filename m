From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Mar 2016 23:40:03 +0100
Subject: [Buildroot] [git commit] toolchain: introduce
	BR2_TOOLCHAIN_HAS_LIBATOMIC
Message-ID: <20160320224043.2BF9F805FE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=42735cb9b9ca8290ee0566b4e1dce9d5ca2ed036
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Until now, we were assuming that whenever you have gcc 4.8, libatomic
is available. It turns out that this is not correct, since libatomic
will not be available if thread support is disabled in the toolchain.

Therefore, __atomic_*() intrinsics may not be available even if the
toolchain uses gcc 4.8.

To solve this problem, we introduce a BR2_TOOLCHAIN_HAS_LIBATOMIC
boolean, which indicates whether the toolchain has libatomic. It is
the case when you are using gcc >= 4.8 *and* thread support is
enabled. We then use this new BR2_TOOLCHAIN_HAS_LIBATOMIC to define
BR2_TOOLCHAIN_HAS_ATOMIC.

As explained in the comment, on certain architectures, libatomic is
technically not needed to provide the __atomic_*() intrinsics since
they might be all built-in. However, since libatomic is only absent in
non-thread capable toolchains, it is not worth making things more
complex for such seldomly used configuration.

Note that we are introducing the intermediate
BR2_TOOLCHAIN_HAS_LIBATOMIC option because it will be useful on its
own for certain packages.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
[Thomas: improve Config.in comment using a suggestion from Yann.]
---
 toolchain/toolchain-common.in | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index 46970a6..0907c5e 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -378,15 +378,30 @@ config BR2_TOOLCHAIN_HAS_SYNC_8
 	default y if BR2_TOOLCHAIN_ARM_HAS_SYNC_8
 	default y if BR2_TOOLCHAIN_X86_HAS_SYNC_8
 
+# libatomic is available since gcc 4.8, when thread support is
+# enabled.
+config BR2_TOOLCHAIN_HAS_LIBATOMIC
+	bool
+	default y if BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 && \
+		BR2_TOOLCHAIN_HAS_THREADS
+
 # __atomic intrinsics are available:
 # - with gcc 4.8, either through built-ins or libatomic, on all
-#   architectures
+#   architectures. Since we don't want to separate the cases where
+#   libatomic is needed vs. not needed, we simplify thing and only
+#   support situations where libatomic is available, even if on some
+#   architectures libatomic is not strictly needed as all __atomic
+#   intrinsics might be built-in. The only case where libatomic is
+#   missing entirely is when the toolchain does not have support for
+#   threads. However, a package that does not need threads but still
+#   uses atomics is quite a corner case, which does not warrant the
+#   added complexity.
 # - with gcc 4.7, libatomic did not exist, so only built-ins are
 #   available. This means that __atomic can only be used in a subset
 #   of the architectures
 config BR2_TOOLCHAIN_HAS_ATOMIC
 	bool
-	default y if BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+	default y if BR2_TOOLCHAIN_HAS_LIBATOMIC
 	default y if BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 && BR2_arm
 	default y if BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 && BR2_armeb
 	default y if BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 && BR2_xtensa
