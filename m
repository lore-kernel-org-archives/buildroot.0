From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Aug 2016 15:03:34 +0200
Subject: [Buildroot] [git commit] package/protobuf: uses fork(),
	not available on no-MMU platforms
Message-ID: <20160827130620.E5C55818C0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a2825382a22f7b1d84d5fc2d8c2424d97663c9d6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This was not noticed until now because:

 1/ The older Blackfin toolchain doesn't have libatomic, so it didn't
    provide the atomic operations that protobuf needs, so protobuf was
    never built.

 2/ The ARM Cortex-M toolchain is static-only, and protobuf requires
    dynamic library support.

So it's only with the new Blackfin toolchain, which is based on gcc
6.x (and therefore provides libatomic) and is FDPIC-based (and therefore
has dynamic library support) that this problem appeared.

Since protobuf already has a BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS option,
we use it to add the BR2_USE_MMU dependency (which is architecture
related), which avoids the need to propagate the dependency.

Fixes:

  http://autobuild.buildroot.net/results/2c1/2c151e84d7854a810465dc16869023e0ada2d586/

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
[Thomas:
 - move the BR2_USE_MMU dependency under
   BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS and remove the propagation to
   reverse dependencies of protobuf, since they already depend on
   BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS.
 - improve commit log.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/protobuf/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/protobuf/Config.in b/package/protobuf/Config.in
index 3215a07..bccf258 100644
--- a/package/protobuf/Config.in
+++ b/package/protobuf/Config.in
@@ -27,6 +27,7 @@ config BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
 	default y if BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on !BR2_sparc64 # missing definition of Atomic64
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on BR2_USE_MMU # fork()
 
 config BR2_PACKAGE_PROTOBUF
 	bool "protobuf"
