From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 Aug 2019 23:16:01 +0200
Subject: [Buildroot] [git commit] package/gdb: update host gdb minimum host
 gcc version
Message-ID: <20190803211353.1ED8F83900@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9ac50d30c34049cd076a7f84454a6c28f70e4282
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Following gdb 7.12.1 removal [1] the host gcc version needs to be updated
since gdb >= 8.x now requires a C++11 compiler (gcc >= 4.8).

While at it, move BR2_HOST_GCC_AT_LEAST_4_8 under BR2_PACKAGE_HOST_GDB since
it's not an architecture dependency.  Add a comment when the host gcc is too
old to build host gdb.

[1] d36f2c73331b3ab4e238eeb47d7d79d81a895a59

Fixes:
http://autobuild.buildroot.org/results/822/822a747a6717db57705d1ce198a61988aa1173b1

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gdb/Config.in.host | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 8cec2d083e..7baa652a60 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -1,8 +1,6 @@
 config BR2_PACKAGE_HOST_GDB_ARCH_SUPPORTS
 	bool
 	default y
-	# The ARC version needs C++11, thus gcc >= 4.8, like gdb >= 8.x
-	depends on BR2_HOST_GCC_AT_LEAST_4_8 || !BR2_arc
 	depends on !((BR2_arm || BR2_armeb) && BR2_BINFMT_FLAT)
 	depends on !BR2_microblaze
 	depends on !BR2_nios2
@@ -14,8 +12,14 @@ comment "Host GDB Options"
 	depends on !BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY
 	depends on BR2_PACKAGE_HOST_GDB_ARCH_SUPPORTS
 
+comment "host gdb needs a host gcc >= 4.8"
+	depends on BR2_PACKAGE_HOST_GDB_ARCH_SUPPORTS
+	depends on !BR2_HOST_GCC_AT_LEAST_4_8
+
 config BR2_PACKAGE_HOST_GDB
 	bool "Build cross gdb for the host"
+	# gdb >= 8.x needs C++11
+	depends on BR2_HOST_GCC_AT_LEAST_4_8
 	# When the external toolchain gdbserver is used, we shouldn't
 	# allow to build a cross-gdb, as the one of the external
 	# toolchain should be used.
