From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 8 May 2010 00:11:46 +0200
Subject: [Buildroot] [git commit master] Add -rpath option for host package
	compilation
Message-ID: <20100507223514.5B0FE8F341@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=6b939d40f6a29a43277566adc9d4312d49cb3abf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In c1b6242fdcf2cff7ebf09fec4cc1be58963e8427, we added
$(HOST_DIR)/usr/lib to LD_LIBRARY_PATH when building target packages,
because the build of target packages sometimes require host tools
installed in $(HOST_DIR)/usr/bin which themselves require host
libaries installed in $(HOST_DIR)/usr/lib.

Unfortunately, this solution didn't work, as libtool then tried to
link target binaries against host libraries. So $(HOST_DIR)/usr/lib
got removed from LD_LIBRARY_PATH in
0d1830b07db4ebfd14e77a258de6fb391e57e960.

However, this meant that we went back to the previous situation, in
which host tools used during compilation of target components might
require host libraries. An example :

make[2]: Entering directory `/home/test/buildroot/output.ctng-arm-eglibc-2010-05-04-12-41-00/build/xfont_font-adobe-100dpi-1.0.1'
/home/test/buildroot/output.ctng-arm-eglibc-2010-05-04-12-41-00/host/usr/bin/mkfontdir /home/test/buildroot/output.ctng-arm-eglibc-2010-05-04-12-41-00/target/usr/share/fonts/X11/100dpi
/home/test/buildroot/output.ctng-arm-eglibc-2010-05-04-12-41-00/host/usr/bin/mkfontscale: error while loading shared libraries: libfontenc.so.1: cannot open shared object file: No such file or directory

Therefore, we try another solution: make sure that host binaries are
linked with an -rpath option, so that $(HOST_DIR)/usr/lib doesn't need
to be in LD_LIBRARY_PATH for them to find their libraries.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Makefile.in |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index eab9168..0bec9a1 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -77,6 +77,11 @@ ifeq ($(BR2_LARGEFILE),y)
 TARGET_CFLAGS+=-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
 endif
 
+# Host packages are sometimes linked against host libraries installed
+# in $(HOST_DIR)/usr/lib. As we cannot add $(HOST_DIR)/usr/lib to
+# LD_LIBRARY_PATH when building target packages because it causes
+# libtool breakage, we force a rpath to be added to host binaries.
+HOST_CFLAGS+=-Wl,-rpath -Wl,$(HOST_DIR)/usr/lib
 
 #########################################################################
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
-- 
1.6.3.3
