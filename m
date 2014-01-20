From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Mon, 20 Jan 2014 09:38:34 +0100
Subject: [Buildroot] [PATCH] lvm2: fix static building when
	BR2_PREFER_STATIC_LIB is used
Message-ID: <1390207114-2808-1-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To fix static building:
- Add "--enable-static_link" to the configure options.
- Because the shared executables don't build with
  BR2_PREFER_STATIC_LIB add a patch to disable it.

Fixes:
http://autobuild.buildroot.net/results/b0b/b0b386969459dda9c294f1ccb4927ca225fa6bdd/

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 ...le-static_link-disable-building-of-shared.patch | 75 ++++++++++++++++++++++
 package/lvm2/lvm2.mk                               |  4 ++
 2 files changed, 79 insertions(+)
 create mode 100644 package/lvm2/lvm2-Option-enable-static_link-disable-building-of-shared.patch

diff --git a/package/lvm2/lvm2-Option-enable-static_link-disable-building-of-shared.patch b/package/lvm2/lvm2-Option-enable-static_link-disable-building-of-shared.patch
new file mode 100644
index 0000000..7824edd
--- /dev/null
+++ b/package/lvm2/lvm2-Option-enable-static_link-disable-building-of-shared.patch
@@ -0,0 +1,75 @@
+From 5c0c0bfcb876bc5a3a05e556854199ff7215d794 Mon Sep 17 00:00:00 2001
+From: Fabio Porcedda <fabio.porcedda@gmail.com>
+Date: Mon, 20 Jan 2014 09:09:06 +0100
+Subject: [PATCH] Option --enable-static_link disable building of shared
+ executables
+
+Also build the static executables without the ".static" suffix so use
+the same name of the shared executables.
+
+Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
+---
+ tools/Makefile.in | 21 +++++++++++----------
+ 1 file changed, 11 insertions(+), 10 deletions(-)
+
+diff --git a/tools/Makefile.in b/tools/Makefile.in
+index f90cfae..3d3524a 100644
+--- a/tools/Makefile.in
++++ b/tools/Makefile.in
+@@ -78,13 +78,10 @@ TARGETS_DM = dmsetup
+ 
+ INSTALL_LVM_TARGETS = install_tools_dynamic
+ INSTALL_DMSETUP_TARGETS = install_dmsetup_dynamic
++
+ INSTALL_CMDLIB_TARGETS = install_cmdlib_dynamic install_cmdlib_include 
+ 
+ ifeq ("@STATIC_LINK@", "yes")
+-  TARGETS += lvm.static
+-  TARGETS_DM += dmsetup.static
+-  INSTALL_LVM_TARGETS += install_tools_static
+-  INSTALL_DMSETUP_TARGETS += install_dmsetup_static
+   INSTALL_CMDLIB_TARGETS += install_cmdlib_static
+ endif
+ 
+@@ -121,28 +118,32 @@ LIBS += $(UDEV_LIBS)
+ 
+ device-mapper: $(TARGETS_DM)
+ 
++ifneq ("@STATIC_LINK@", "yes")
+ dmsetup: dmsetup.o $(top_builddir)/libdm/libdevmapper.$(LIB_SUFFIX)
+ 	$(CC) $(CFLAGS) $(LDFLAGS) -L$(top_builddir)/libdm \
+ 	      -o $@ dmsetup.o -ldevmapper $(LIBS)
+-
+-dmsetup.static: dmsetup.o $(interfacebuilddir)/libdevmapper.a
++else
++dmsetup: dmsetup.o $(interfacebuilddir)/libdevmapper.a
+ 	$(CC) $(CFLAGS) $(LDFLAGS) -static -L$(interfacebuilddir) \
+ 	      -o $@ dmsetup.o -ldevmapper $(STATIC_LIBS) $(LIBS)
++endif
+ 
+ all: device-mapper
+ 
++ifneq ("@STATIC_LINK@", "yes")
+ lvm: $(OBJECTS) lvm.o $(top_builddir)/lib/liblvm-internal.a
+ 	$(CC) $(CFLAGS) $(LDFLAGS) $(ELDFLAGS) -o $@ $(OBJECTS) lvm.o \
+ 		$(LVMLIBS) $(READLINE_LIBS) $(LIBS) -rdynamic
++else
++lvm: $(OBJECTS) lvm-static.o $(top_builddir)/lib/liblvm-internal.a  $(interfacebuilddir)/libdevmapper.a
++	$(CC) $(CFLAGS) $(LDFLAGS) -static -L$(interfacebuilddir) -o $@ \
++	      $(OBJECTS) lvm-static.o $(LVMLIBS) $(STATIC_LIBS) $(LIBS)
++endif
+ 
+ ifeq ("@BUILD_LVMETAD@", "yes")
+ lvm: $(top_builddir)/libdaemon/client/libdaemonclient.a
+ endif
+ 
+-lvm.static: $(OBJECTS) lvm-static.o $(top_builddir)/lib/liblvm-internal.a  $(interfacebuilddir)/libdevmapper.a
+-	$(CC) $(CFLAGS) $(LDFLAGS) -static -L$(interfacebuilddir) -o $@ \
+-	      $(OBJECTS) lvm-static.o $(LVMLIBS) $(STATIC_LIBS) $(LIBS)
+-
+ liblvm2cmd.a: $(top_builddir)/lib/liblvm-internal.a $(OBJECTS) lvmcmdlib.o lvm2cmd.o
+ 	cat $(top_builddir)/lib/liblvm-internal.a > $@
+ 	$(AR) rs $@ $(OBJECTS) lvmcmdlib.o lvm2cmd.o
+-- 
+1.8.5.2
+
diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 6566b32..35d5108 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -39,4 +39,8 @@ else
 LVM2_CONF_OPT += --disable-applib
 endif
 
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+LVM2_CONF_OPT += --enable-static_link
+endif
+
 $(eval $(autotools-package))
-- 
1.8.5.2
