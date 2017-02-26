From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Feb 2017 21:45:22 +0100
Subject: [Buildroot] [git commit] package/directfb: disable for static builds
Message-ID: <20170226204527.7F43C801F6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dbd30cd5d8d1970e2838ffb59d0179a1524b0ce4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

DirectFB is written in C++, but can be linked to by a C library or
program.

When doing shared link, this is fine because the linker gets help from
the DT_NEEDED flags and knows what libraries to pull in during the link.

However, during a static link, the linker does not get such help.

Properly fixing this would require that there is support in pkg-config
and autotools to specify that the C++ runtime must be linked. Alas there
is no sush support. The only option is to add -lstdc++ to the
Libs.Private field in directfb.pc. But this is not upstreamable, because
there are other C++ runtimes in the wild (e.g. -lc++ from llvm/clang).

However, DirectFB in a static scenario is probably not a very common
scenario.

Disable DirectFB for static builds.

Fixes:
    http://autobuild.buildroot.org/results/3d3/3d3036d40ddad71d872d910aae7a24975706d2e9/
    http://autobuild.buildroot.org/results/d1c/d1c35a6003396942b584f2f2a5e8bf4ac2fbe370/
    http://autobuild.buildroot.org/results/d45/d4504871bd47930e8363032d380cdfcc5bb8aee7/
    [...]

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/directfb/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/directfb/Config.in b/package/directfb/Config.in
index b552164..6a3d718 100644
--- a/package/directfb/Config.in
+++ b/package/directfb/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_DIRECTFB
 	bool "directfb"
+	depends on !BR2_STATIC_LIBS # static link issues
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_5
@@ -161,7 +162,8 @@ config BR2_PACKAGE_DIRECTFB_TESTS
 
 endif # BR2_PACKAGE_DIRECTFB
 
-comment "directfb needs a glibc or uClibc toolchain w/ C++, NPTL, gcc >= 4.5"
+comment "directfb needs a glibc or uClibc toolchain w/ C++, NPTL, gcc >= 4.5, dynamic library"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_5 || BR2_TOOLCHAIN_USES_MUSL
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_5 || BR2_TOOLCHAIN_USES_MUSL || \
+		BR2_STATIC_LIBS
