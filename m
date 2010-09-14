From: Martin Banky <martin.banky@gmail.com>
Date: Mon, 13 Sep 2010 20:40:29 -0700
Subject: [Buildroot] [PATCH 02/21] alsa-utils: bump to 1.0.23
In-Reply-To: <1284435648-15238-1-git-send-email-Martin.Banky@gmail.com>
References: <1284435648-15238-1-git-send-email-Martin.Banky@gmail.com>
Message-ID: <1284435648-15238-2-git-send-email-Martin.Banky@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
---
 CHANGES                                            |    4 ++--
 ...tils-1.0.18-check-if-__use_bsd-is-defined.patch |   13 -------------
 .../alsa-utils-1.0.18-fix-intl-support.patch       |   11 -----------
 .../alsa-utils-1.0.18-fix_sysv_legacy.patch        |   20 --------------------
 .../alsa-utils/alsa-utils-1.0.18-remove_man.patch  |   11 -----------
 .../alsa-utils-1.0.23-fix-intl-support.patch       |   11 +++++++++++
 .../alsa-utils/alsa-utils-1.0.23-remove_man.patch  |   11 +++++++++++
 package/multimedia/alsa-utils/alsa-utils.mk        |    2 +-
 8 files changed, 25 insertions(+), 58 deletions(-)
 delete mode 100644 package/multimedia/alsa-utils/alsa-utils-1.0.18-check-if-__use_bsd-is-defined.patch
 delete mode 100644 package/multimedia/alsa-utils/alsa-utils-1.0.18-fix-intl-support.patch
 delete mode 100644 package/multimedia/alsa-utils/alsa-utils-1.0.18-fix_sysv_legacy.patch
 delete mode 100644 package/multimedia/alsa-utils/alsa-utils-1.0.18-remove_man.patch
 create mode 100644 package/multimedia/alsa-utils/alsa-utils-1.0.23-fix-intl-support.patch
 create mode 100644 package/multimedia/alsa-utils/alsa-utils-1.0.23-remove_man.patch

diff --git a/CHANGES b/CHANGES
index 1851543..7b5875c 100644
--- a/CHANGES
+++ b/CHANGES
@@ -7,8 +7,8 @@
 
 	Toolchain: ARM cortex A9 support
 
-	Updated/fixed packages: alsa-lib, berkeleydb, busybox, dropbear,
-	iptables, kismet, openvpn, qt, usbutils
+	Updated/fixed packages: alsa-lib, alsa-utils, berkeleydb, busybox,
+	dropbear, iptables, kismet, openvpn, qt, usbutils
 
 	Removed packages: dillo, libglib12, libgtk12, microwin, pcmcia
 
diff --git a/package/multimedia/alsa-utils/alsa-utils-1.0.18-check-if-__use_bsd-is-defined.patch b/package/multimedia/alsa-utils/alsa-utils-1.0.18-check-if-__use_bsd-is-defined.patch
deleted file mode 100644
index f0d3209..0000000
--- a/package/multimedia/alsa-utils/alsa-utils-1.0.18-check-if-__use_bsd-is-defined.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Index: alsa-utils-1.0.18/alsactl/init_sysdeps.c
-===================================================================
---- alsa-utils-1.0.18.orig/alsactl/init_sysdeps.c	2008-12-01 08:27:16.000000000 +0100
-+++ alsa-utils-1.0.18/alsactl/init_sysdeps.c	2008-12-01 08:27:22.000000000 +0100
-@@ -17,7 +17,7 @@
-  *
-  */
- 
--#ifdef __GLIBC__
-+#if defined(__GLIBC__) && !defined(__USE_BSD)
- static size_t strlcpy(char *dst, const char *src, size_t size)
- {
- 	size_t bytes = 0;
diff --git a/package/multimedia/alsa-utils/alsa-utils-1.0.18-fix-intl-support.patch b/package/multimedia/alsa-utils/alsa-utils-1.0.18-fix-intl-support.patch
deleted file mode 100644
index 317c472..0000000
--- a/package/multimedia/alsa-utils/alsa-utils-1.0.18-fix-intl-support.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- a/seq/aseqnet/Makefile.in
-+++ b/seq/aseqnet/Makefile.in
-@@ -252,7 +252,7 @@ clean-binPROGRAMS:
- 	-test -z "$(bin_PROGRAMS)" || rm -f $(bin_PROGRAMS)
- aseqnet$(EXEEXT): $(aseqnet_OBJECTS) $(aseqnet_DEPENDENCIES) 
- 	@rm -f aseqnet$(EXEEXT)
--	$(LINK) $(aseqnet_LDFLAGS) $(aseqnet_OBJECTS) $(aseqnet_LDADD) $(LIBS)
-+	$(LINK) $(aseqnet_LDFLAGS) $(aseqnet_OBJECTS) $(aseqnet_LDADD) $(LIBS) $(INTLLIBS)
- 
- mostlyclean-compile:
- 	-rm -f *.$(OBJEXT)
diff --git a/package/multimedia/alsa-utils/alsa-utils-1.0.18-fix_sysv_legacy.patch b/package/multimedia/alsa-utils/alsa-utils-1.0.18-fix_sysv_legacy.patch
deleted file mode 100644
index c6135b4..0000000
--- a/package/multimedia/alsa-utils/alsa-utils-1.0.18-fix_sysv_legacy.patch
+++ /dev/null
@@ -1,20 +0,0 @@
---- a/alsactl/init_parse.c	2009-01-15 10:44:48.000000000 +0000
-+++ b/alsactl/init_parse.c	2009-01-15 10:46:41.000000000 +0000
-@@ -381,7 +381,7 @@ static int set_ctl_value(struct space *s
- 				snd_ctl_elem_value_set_integer(space->ctl_value, idx, val);
- 			} else if (items > 2 && value[items-2] == 'd' && value[items-1] == 'B') {
- 				val = strtol(value, NULL, 0) * 100;
--				if ((pos2 = index(value, '.')) != NULL) {
-+				if ((pos2 = strchr(value, '.')) != NULL) {
- 					if (isdigit(*(pos2-1)) && isdigit(*(pos2-2))) {
- 						if (val < 0)
- 							val -= strtol(pos2 + 1, NULL, 0);
-@@ -1253,7 +1253,7 @@ static char *new_root_dir(const char *fi
- 
- 	res = strdup(filename);
- 	if (res) {
--		tmp = rindex(res, '/');
-+		tmp = strrchr(res, '/');
- 		if (tmp)
- 			*tmp = '\0';
- 	}
diff --git a/package/multimedia/alsa-utils/alsa-utils-1.0.18-remove_man.patch b/package/multimedia/alsa-utils/alsa-utils-1.0.18-remove_man.patch
deleted file mode 100644
index a7d4679..0000000
--- a/package/multimedia/alsa-utils/alsa-utils-1.0.18-remove_man.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- a/alsactl/Makefile.in	2009-01-15 10:59:38.000000000 +0000
-+++ b/alsactl/Makefile.in	2009-01-15 10:59:34.000000000 +0000
-@@ -204,7 +204,7 @@ sharedstatedir = @sharedstatedir@
- sysconfdir = @sysconfdir@
- target_alias = @target_alias@
- SUBDIRS = init
--man_MANS = alsactl.1 alsactl_init.7
-+man_MANS = alsactl.1
- EXTRA_DIST = alsactl.1 alsactl_init.xml
- alsactl_SOURCES = alsactl.c state.c utils.c init_parse.c
- noinst_HEADERS = alsactl.h list.h init_sysdeps.c init_utils_string.c init_utils_run.c init_sysfs.c
diff --git a/package/multimedia/alsa-utils/alsa-utils-1.0.23-fix-intl-support.patch b/package/multimedia/alsa-utils/alsa-utils-1.0.23-fix-intl-support.patch
new file mode 100644
index 0000000..317c472
--- /dev/null
+++ b/package/multimedia/alsa-utils/alsa-utils-1.0.23-fix-intl-support.patch
@@ -0,0 +1,11 @@
+--- a/seq/aseqnet/Makefile.in
++++ b/seq/aseqnet/Makefile.in
+@@ -252,7 +252,7 @@ clean-binPROGRAMS:
+ 	-test -z "$(bin_PROGRAMS)" || rm -f $(bin_PROGRAMS)
+ aseqnet$(EXEEXT): $(aseqnet_OBJECTS) $(aseqnet_DEPENDENCIES) 
+ 	@rm -f aseqnet$(EXEEXT)
+-	$(LINK) $(aseqnet_LDFLAGS) $(aseqnet_OBJECTS) $(aseqnet_LDADD) $(LIBS)
++	$(LINK) $(aseqnet_LDFLAGS) $(aseqnet_OBJECTS) $(aseqnet_LDADD) $(LIBS) $(INTLLIBS)
+ 
+ mostlyclean-compile:
+ 	-rm -f *.$(OBJEXT)
diff --git a/package/multimedia/alsa-utils/alsa-utils-1.0.23-remove_man.patch b/package/multimedia/alsa-utils/alsa-utils-1.0.23-remove_man.patch
new file mode 100644
index 0000000..34b14ca
--- /dev/null
+++ b/package/multimedia/alsa-utils/alsa-utils-1.0.23-remove_man.patch
@@ -0,0 +1,11 @@
+--- a/alsactl/Makefile.in	2009-01-15 10:59:38.000000000 +0000
++++ b/alsactl/Makefile.in	2009-01-15 10:59:34.000000000 +0000
+@@ -217,7 +217,7 @@ sharedstatedir = @sharedstatedir@
+ target_alias = @target_alias@
+ xmlto = @xmlto@
+ SUBDIRS = init
+-man_MANS = alsactl.1 $(am__append_1)
++man_MANS = alsactl.1
+ EXTRA_DIST = alsactl.1 alsactl_init.xml
+ alsactl_SOURCES = alsactl.c state.c utils.c init_parse.c
+ noinst_HEADERS = alsactl.h list.h init_sysdeps.c init_utils_string.c init_utils_run.c init_sysfs.c
diff --git a/package/multimedia/alsa-utils/alsa-utils.mk b/package/multimedia/alsa-utils/alsa-utils.mk
index 3d1b0ef..20f682a 100644
--- a/package/multimedia/alsa-utils/alsa-utils.mk
+++ b/package/multimedia/alsa-utils/alsa-utils.mk
@@ -3,7 +3,7 @@
 # alsa-utils
 #
 #############################################################
-ALSA_UTILS_VERSION:=1.0.22
+ALSA_UTILS_VERSION:=1.0.23
 ALSA_UTILS_SOURCE:=alsa-utils-$(ALSA_UTILS_VERSION).tar.bz2
 ALSA_UTILS_SITE:=ftp://ftp.alsa-project.org/pub/utils
 ALSA_UTILS_DIR:=$(BUILD_DIR)/alsa-utils-$(ALSA_UTILS_VERSION)
-- 
1.7.2.3
