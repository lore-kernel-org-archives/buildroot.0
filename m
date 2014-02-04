From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Tue,  4 Feb 2014 11:06:04 +0100
Subject: [Buildroot] [PATCH 2/3] dmraid: bump version
In-Reply-To: <1391508365-30961-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1391508365-30961-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1391508365-30961-2-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

dmraid rc15 does not support later Intel Software RAID (isw)
chipsets correctly. Updating dmraid to a later edition
fixes this issue.

Also cleanup and remove now useless patch.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: Antony Vennard <arv@vx9.co.uk>
---
 package/dmraid/dmraid-fix-make-remove.patch     | 22 ----------------------
 package/dmraid/dmraid.mk                        |  4 ++--
 package/dmraid/dmraid.patch                     | 20 --------------------
 package/dmraid/dmraid_library-linking-fix.patch | 15 ---------------
 4 files changed, 2 insertions(+), 59 deletions(-)
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
index 067df0b..089e33a 100644
--- a/package/dmraid/dmraid.mk
+++ b/package/dmraid/dmraid.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-DMRAID_VERSION = 1.0.0.rc15
+DMRAID_VERSION = 1.0.0.rc16-3
 DMRAID_SOURCE = dmraid-$(DMRAID_VERSION).tar.bz2
 DMRAID_SITE = http://people.redhat.com/~heinzm/sw/dmraid/src
-DMRAID_SUBDIR = $(DMRAID_VERSION)
+DMRAID_SUBDIR = $(DMRAID_VERSION)/dmraid
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
-- 
1.8.5.3
