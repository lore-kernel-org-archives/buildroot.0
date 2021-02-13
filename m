From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 13 Feb 2021 22:33:40 +0100
Subject: [Buildroot] [git commit] package/ply: needs dynamic library
Message-ID: <20210213211246.51E7D8157B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=debe9eb13ebd8b8d5596832030ec61032bdc99b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ply builds and installs a library. Some objects that go in that library
are tagged with a 'section' attribute (excerpt):

    __attribute__((section("providers")))

Later on, it references the bounds of that section, with the canonical
__start and __stop markers, which will eventually be created by the
linker:

    extern struct provider __start_providers;
    extern struct provider __stop_providers;

Sections only exists in an ELF file, and a static library id not an ELF.
So, when creating a static library, the markers are not created. Thus,
when linking the final executable, the link fails because of missing
symbols:

    .../powerpc-buildroot-linux-uclibc/bin/ld: ../libply/.libs/libply.a(libply_la-provider.o): in function `provider_get':
    provider.c:(.text+0xe): undefined reference to `__start_providers'
    .../powerpc-buildroot-linux-uclibc/bin/ld: provider.c:(.text+0x12): undefined reference to `__stop_providers'
    .../powerpc-buildroot-linux-uclibc/bin/ld: provider.c:(.text+0x2a): undefined reference to `__start_providers'
    .../powerpc-buildroot-linux-uclibc/bin/ld: provider.c:(.text+0x32): undefined reference to `__stop_providers'

So, conceptually, ply can not build in static-only.

Fixes:
 - http://autobuild.buildroot.net/results/3a586241d37614b644ff6c4674ae28df2b22fdf8

Signed-off-by: Andreas Klinger <ak@it-klinger.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/ply/Config.in | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/ply/Config.in b/package/ply/Config.in
index 35c2dc9bfc..16f5f8a267 100644
--- a/package/ply/Config.in
+++ b/package/ply/Config.in
@@ -5,11 +5,18 @@ config BR2_PACKAGE_PLY_ARCH_SUPPORTS
 	default y if BR2_powerpc
 	default y if BR2_x86_64
 
+comment "ply needs a toolchain w/ dynamic library"
+	depends on BR2_PACKAGE_PLY_ARCH_SUPPORTS
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14 # BPF_JLT
+	depends on BR2_STATIC_LIBS
+
 config BR2_PACKAGE_PLY
 	bool "ply"
 	depends on BR2_PACKAGE_PLY_ARCH_SUPPORTS
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14 # BPF_JLT
+	depends on !BR2_STATIC_LIBS
 	help
 	  ply is a light-weight dynamic tracer for Linux. By means of
 	  using the BPF it can attach probes to the linux kernel
