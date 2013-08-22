From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 22 Aug 2013 23:06:52 +0200
Subject: [Buildroot] [git commit] gcc: fix libstdc++_pic for AVR32
Message-ID: <20130822210649.0D3F69B52F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=24c5dbcef21d61bc4482587eb8821159f69b245d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It is not clear why 300-libstdc++-pic.patch pre-applied to
gcc-4.2.2-avr32-2.1.5 seems to have come from some older version
of gcc (as early as 4.0.3). This older patch incorrectly refers to
object files to be included in the library libstdc++_pic.a as *.o,
while their location seems to be in .libs/*.o (see the contents at
e.g. https://github.com/ZigFisher/Midge/blob/master/toolchain/gcc/4.0.3/300-libstdc%2B%2B-pic.patch ).
The same patch for gcc 4.1.0 refers to the files as .libs/*.o (see
https://github.com/ZigFisher/Midge/blob/master/toolchain/gcc/4.1.0/300-libstdc%2B%2B-pic.patch ).
This patch corrects rules in Makefile.in.

Signed-off-by: Alexander Lukichev <alexander.lukichev@gmail.com>
Acked-by: Simon Dawson <spdawson@gmail.com>
Tested-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../990-fix-300-libstdc++-pic.patch                |   20 ++++++++++++++++++++
 1 files changed, 20 insertions(+), 0 deletions(-)

diff --git a/package/gcc/4.2.2-avr32-2.1.5/990-fix-300-libstdc++-pic.patch b/package/gcc/4.2.2-avr32-2.1.5/990-fix-300-libstdc++-pic.patch
new file mode 100644
index 0000000..a63b3ad
--- /dev/null
+++ b/package/gcc/4.2.2-avr32-2.1.5/990-fix-300-libstdc++-pic.patch
@@ -0,0 +1,20 @@
+libstdc++-v3: fix the effects of pre-applied 300-libstdc++-pic.patch
+
+This version of GCC comes with a number of pre-applied patches, among which is
+300-libstdc++-pic.patch that makes a PIC version of libstdc++. The resulting
+Makefile.in incorrectly refers to object files that should be insde the library.
+
+Signed-off-by: Alexander Lukichev <alexander.lukichev@gmail.com>
+
+diff -uNrp host-gcc-final-4.2.2-avr32-2.1.5.orig/libstdc++-v3/src/Makefile.in host-gcc-final-4.2.2-avr32-2.1.5/libstdc++-v3/src/Makefile.in
+--- host-gcc-final-4.2.2-avr32-2.1.5.orig/libstdc++-v3/src/Makefile.in	2008-07-04 00:18:42.000000000 +0300
++++ host-gcc-final-4.2.2-avr32-2.1.5/libstdc++-v3/src/Makefile.in	2013-08-08 16:15:56.201258882 +0300
+@@ -804,7 +804,7 @@ install_debug:
+ 
+ install-exec-local:
+ ifeq ($(enable_shared),yes)
+-	$(AR) cru libstdc++_pic.a *.o $(top_builddir)/libsupc++/*.o
++	$(AR) cru libstdc++_pic.a .libs/*.o $(top_builddir)/libsupc++/*.o
+ 	$(INSTALL_DATA) libstdc++_pic.a $(DESTDIR)$(toolexeclibdir)
+ endif
+ 
