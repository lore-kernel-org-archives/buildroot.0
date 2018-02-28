From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 28 Feb 2018 09:15:47 +0100
Subject: [Buildroot] [git commit] package/tvheadend: disable for microblazeel
Message-ID: <20180228081631.0D1D5813C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e1a59357e4dfe8fe9c9119d4b2bc9e4ec36eb3d0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

tvheadend does not build on microblazeel, because of some assertion
failure in binutils:

    [...]/microblazeel-buildroot-linux-uclibc/bin/ld: FDE encoding in [...]/lib/gcc/microblazeel-buildroot-linux-uclibc/6.4.0/libgcc.a(_divdi3.o)(.eh_frame) prevents .eh_frame_hdr table being created.
    [...]/microblazeel-buildroot-linux-uclibc/bin/ld: FDE encoding in [...]/lib/gcc/microblazeel-buildroot-linux-uclibc/6.4.0/libgcc.a(_udivdi3.o)(.eh_frame) prevents .eh_frame_hdr table being created.
    [...]/microblazeel-buildroot-linux-uclibc/bin/ld: FDE encoding in [...]/lib/gcc/microblazeel-buildroot-linux-uclibc/6.4.0/libgcc.a(_umoddi3.o)(.eh_frame) prevents .eh_frame_hdr table being created.
    [...]/microblazeel-buildroot-linux-uclibc/bin/ld: BFD (GNU Binutils) 2.29.1 assertion fail elf32-microblaze.c:1494
    [...]/microblazeel-buildroot-linux-uclibc/bin/ld: [...]/sysroot/usr/lib/Scrt1.o: probably compiled without -fPIC?
    [...]/microblazeel-buildroot-linux-uclibc/bin/ld: final link failed: Bad value
    collect2: error: ld returned 1 exit status

Fixes:
    http://autobuild.buildroot.org/results/85475885a95f23f3dbc88e5b162108a458233bc4/
    [...]

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tvheadend/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/tvheadend/Config.in b/package/tvheadend/Config.in
index 44a69a27ba..de37b61483 100644
--- a/package/tvheadend/Config.in
+++ b/package/tvheadend/Config.in
@@ -1,10 +1,12 @@
 comment "tvheadend needs a toolchain w/ NPTL, headers >= 3.2, dynamic library"
+	depends on !BR2_microblazeel
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
 		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2 || BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 
 config BR2_PACKAGE_TVHEADEND
 	bool "tvheadend"
+	depends on !BR2_microblazeel # assertion failure in binutils
 	depends on !BR2_STATIC_LIBS # dladdr()
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
