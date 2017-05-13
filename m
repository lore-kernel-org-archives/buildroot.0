From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 13 May 2017 15:33:35 +0200
Subject: [Buildroot] [git commit] libcdio: disable on ARC,
	triggers a toolchain bug
Message-ID: <20170513133501.DE58F82894@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=459f7302df8cdc45aa0f7f2581ebb6f05fb6432a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libcdio doesn't build on ARC, with the following compiler error:

iso9660.c:155:1: error: unrecognized supposed constant
[...]
iso9660.c:155:1: internal compiler error: in arc_legitimate_constant_p, at config/arc/arc.c:6028
Please submit a full bug report,

Since this has been happening for a while and is quite noisy in the
autobuilders results, we disable this package on ARC.

Fixes:

  http://autobuild.buildroot.net/results/e837737abaea851bea428a35ea9d3395a6565c54/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libcdio/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libcdio/Config.in b/package/libcdio/Config.in
index fdc001e..531af3b 100644
--- a/package/libcdio/Config.in
+++ b/package/libcdio/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_LIBCDIO
 	bool "libcdio"
 	depends on BR2_USE_MMU # fork()
+	# ARC toolchain issue
+	depends on !BR2_arc
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
 	  The GNU Compact Disc Input and Control library.
