From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 May 2015 16:21:30 +0200
Subject: [Buildroot] [git commit] gptfdisk: reinstate ldlibs support patch
Message-ID: <20150501142303.C7E707FE1B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9238795c2aaae2cb9ceaf6575529ff77a4894773
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

I removed that in fac3042cc53a9aff87cb047f55a12d23c9973f4d because the
ICU part was no longer required.
However the LDLIBS part is for static builds and should have been a
separate patch to avoid confusion. Fixes:
http://autobuild.buildroot.net/results/a90/a9092d01a71e2d799e5b7b3afb9fd3e304370d0c/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gptfdisk/0001-ldlibs.patch |   31 +++++++++++++++++++++++++++++++
 1 files changed, 31 insertions(+), 0 deletions(-)

diff --git a/package/gptfdisk/0001-ldlibs.patch b/package/gptfdisk/0001-ldlibs.patch
new file mode 100644
index 0000000..ca1d7fb
--- /dev/null
+++ b/package/gptfdisk/0001-ldlibs.patch
@@ -0,0 +1,31 @@
+Add $(LDLIBS) support to enable clean static builds (for libintl).
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura gptfdisk-0.8.10.orig/Makefile gptfdisk-0.8.10/Makefile
+--- gptfdisk-0.8.10.orig/Makefile	2015-05-01 08:45:14.667748141 -0300
++++ gptfdisk-0.8.10/Makefile	2015-05-01 08:45:42.685699419 -0300
+@@ -14,19 +14,19 @@
+ all:	cgdisk gdisk sgdisk fixparts
+ 
+ gdisk:	$(LIB_OBJS) gdisk.o gpttext.o
+-	$(CXX) $(LIB_OBJS) gdisk.o gpttext.o $(LDFLAGS) -luuid -o gdisk
++	$(CXX) $(LIB_OBJS) gdisk.o gpttext.o $(LDFLAGS) -luuid $(LDLIBS) -o gdisk
+ #	$(CXX) $(LIB_OBJS) gdisk.o gpttext.o $(LDFLAGS) -licuio -licuuc -luuid -o gdisk
+ 
+ cgdisk: $(LIB_OBJS) cgdisk.o gptcurses.o
+-	$(CXX) $(LIB_OBJS) cgdisk.o gptcurses.o $(LDFLAGS) -luuid -lncursesw -o cgdisk
++	$(CXX) $(LIB_OBJS) cgdisk.o gptcurses.o $(LDFLAGS) -luuid -lncursesw $(LDLIBS) -o cgdisk
+ #	$(CXX) $(LIB_OBJS) cgdisk.o gptcurses.o $(LDFLAGS) -licuio -licuuc -luuid -lncurses -o cgdisk
+ 
+ sgdisk: $(LIB_OBJS) sgdisk.o gptcl.o
+-	$(CXX) $(LIB_OBJS) sgdisk.o gptcl.o $(LDFLAGS) -luuid -lpopt -o sgdisk
++	$(CXX) $(LIB_OBJS) sgdisk.o gptcl.o $(LDFLAGS) -luuid -lpopt $(LDLIBS) -o sgdisk
+ #	$(CXX) $(LIB_OBJS) sgdisk.o gptcl.o $(LDFLAGS) -licuio -licuuc -luuid -lpopt -o sgdisk
+ 
+ fixparts: $(MBR_LIB_OBJS) fixparts.o
+-	$(CXX) $(MBR_LIB_OBJS) fixparts.o $(LDFLAGS) -o fixparts
++	$(CXX) $(MBR_LIB_OBJS) fixparts.o $(LDFLAGS) $(LDLIBS) -o fixparts
+ 
+ lint:	#no pre-reqs
+ 	lint $(SRCS)
