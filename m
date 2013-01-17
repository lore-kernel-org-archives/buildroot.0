From: Antony Vennard <arv@vx9.co.uk>
Date: Thu, 17 Jan 2013 11:56:18 +0000
Subject: [Buildroot] [PATCH] Update dmraid from 1.0.0-rc15 to 1.0.0-rc16-3.
Message-ID: <1358423778-27638-1-git-send-email-arv@vx9.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

dmraid rc15 does not support later Intel Software RAID (isw)
chipsets correctly. Updating dmraid to a later edition
fixes this issue.

In order to use the later dmraid, the lvm2 package needs
to be compiled with --enable-cmdlib --enable-dmeventd, which
dmraid can then invoke on boot. dmeventd must be copied
to /usr/sbin/ on the target.

Signed-off-by: Antony Vennard <arv@vx9.co.uk>
---
 package/dmraid/dmraid-fix-make-remove.patch     | 22 ----------------------
 package/dmraid/dmraid.mk                        |  4 ++--
 package/dmraid/dmraid.patch                     | 20 --------------------
 package/dmraid/dmraid_library-linking-fix.patch | 15 ---------------
 package/lvm2/lvm2.mk                            |  5 +++--
 5 files changed, 5 insertions(+), 61 deletions(-)
 delete mode 100644 package/dmraid/dmraid-fix-make-remove.patch
 delete mode 100644 package/dmraid/dmraid.patch
 delete mode 100644 package/dmraid/dmraid_library-linking-fix.patch

diff --git a/package/dmraid/dmraid-fix-make-remove.patch b/package/dmraid/dmraid-fix-make-remove.patch
deleted file mode 100644
index 0d6ae75..0000000
--- a/package/dmraid/dmraid-fix-make-remove.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-[PATCH]: dmraid: fix make remove for header files
-
-prefix/include/dmraid is not empty, so we need rm -rf
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- 1.0.0.rc15/include/Makefile.in |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-Index: dmraid/1.0.0.rc15/include/Makefile.in
-===================================================================
---- dmraid.orig/1.0.0.rc15/include/Makefile.in
-+++ dmraid/1.0.0.rc15/include/Makefile.in
-@@ -24,7 +24,7 @@ install: install_dmraid_headers
- 
- remove_dmraid_headers:
- 	@echo "Removing $(HEADERS) from $(includedir)/dmraid"
--	rm -f $(includedir)/dmraid
-+	rm -rf $(includedir)/dmraid
- 
- remove:        remove_dmraid_headers
- 
diff --git a/package/dmraid/dmraid.mk b/package/dmraid/dmraid.mk
index 3fb2375..c262fcc 100644
--- a/package/dmraid/dmraid.mk
+++ b/package/dmraid/dmraid.mk
@@ -3,10 +3,10 @@
 # dmraid
 #
 #############################################################
-DMRAID_VERSION:=1.0.0.rc15
+DMRAID_VERSION:=1.0.0.rc16-3
 DMRAID_SOURCE:=dmraid-$(DMRAID_VERSION).tar.bz2
 DMRAID_SITE:=http://people.redhat.com/~heinzm/sw/dmraid/src
-DMRAID_SUBDIR:=$(DMRAID_VERSION)
+DMRAID_SUBDIR:=$(DMRAID_VERSION)/dmraid
 # lib and tools race with parallel make
 DMRAID_MAKE = $(MAKE1)
 DMRAID_INSTALL_STAGING = YES
diff --git a/package/dmraid/dmraid.patch b/package/dmraid/dmraid.patch
deleted file mode 100644
index fbe2894..0000000
--- a/package/dmraid/dmraid.patch
+++ /dev/null
@@ -1,20 +0,0 @@
---- a/1.0.0.rc15/lib/device/scan.c.orig	2008-06-20 09:32:05.000000000 -0500
-+++ b/1.0.0.rc15/lib/device/scan.c	2008-12-01 17:15:25.000000000 -0600
-@@ -69,7 +69,7 @@
- 	static char *ret = NULL, *sysfs_mp;
- 
- 	if (!(sysfs_mp = find_sysfs_mp(lc)))
--		LOG_ERR(lc, NULL, "finding sysfs mount point");
-+		{ log_notice(lc, "finding sysfs mount point"); return NULL; }
- 
- 	if ((ret = dbg_malloc(strlen(sysfs_mp) + strlen(path) + 1)))
- 		sprintf(ret, "%s%s", sysfs_mp, path);
-@@ -315,7 +315,7 @@
- 	} else {
- 		sysfs = 0;
- 		path = (char *) _PATH_DEV;
--		log_print(lc, "carrying on with %s", path);
-+		log_notice(lc, "carrying on with %s", path);
- 	}
- 
- 	if (!(d = opendir(path))) {
diff --git a/package/dmraid/dmraid_library-linking-fix.patch b/package/dmraid/dmraid_library-linking-fix.patch
deleted file mode 100644
index a1c33c7..0000000
--- a/package/dmraid/dmraid_library-linking-fix.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Why on earth are we trying to link against the libdir in DESTDIR?
-
-Signed-Off-By: Nigel Kukard  <nkukard@lbsd.net>
-diff -ur dmraid_vanilla/1.0.0.rc15/tools/Makefile.in dmraid_library-linking-fix/1.0.0.rc15/tools/Makefile.in
---- dmraid_vanilla/1.0.0.rc15/tools/Makefile.in	2008-09-17 13:24:00.000000000 +0000
-+++ dmraid_library-linking-fix/1.0.0.rc15/tools/Makefile.in	2009-06-01 10:50:52.000000000 +0000
-@@ -56,7 +56,7 @@
- 
- dmraid:	$(OBJECTS) $(top_srcdir)/lib/libdmraid.a
- 	$(CC) -o $@ $(OBJECTS) $(LDFLAGS) -L$(top_srcdir)/lib \
--	      -L$(DESTDIR)$(libdir) $(DMRAIDLIBS) $(LIBS) 
-+	      $(DMRAIDLIBS) $(LIBS) 
- 
- install_dmraid_tools: $(TARGETS)
- 	@echo "Installing $(TARGETS) in $(sbindir)"; \
diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 52326ea..f0622e3 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -17,11 +17,12 @@ LVM2_BINS = \
 	pvresize pvs pvscan vgcfgbackup vgcfgrestore 	\
 	vgchange vgck vgconvert vgcreate vgdisplay 	\
 	vgexport vgextend vgimport vgmerge vgmknodes 	\
-	vgreduce vgremove vgrename vgs vgscan vgsplit
+	vgreduce vgremove vgrename vgs vgscan vgsplit   \
+        dmeventd
 
 # Make sure that binaries and libraries are installed with write
 # permissions for the owner.
-LVM2_CONF_OPT += --enable-write_install
+LVM2_CONF_OPT += --enable-write_install --enable-cmdlib --enable-dmeventd
 
 # LVM2 uses autoconf, but not automake, and the build system does not
 # take into account the CC passed at configure time.
-- 
1.7.11.7
