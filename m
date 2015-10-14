From: Charles Duffy <charles@dyfis.net>
Date: Wed, 14 Oct 2015 16:22:25 -0500
Subject: [Buildroot] [PATCH 1/1] introduce nwipe package [r2]
Message-ID: <1444857745-16506-1-git-send-email-chaduffy@cisco.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Charles Duffy <charles@dyfis.net>

Signed-off-by: Charles Duffy <chaduffy@cisco.com>
---
 package/Config.in                                  |   1 +
 .../nwipe/0001-parted-use-autoconf-module.patch    |  21 +++
 package/nwipe/0002-use-off64t_not_lofft.patch      | 144 +++++++++++++++++++++
 package/nwipe/Config.in                            |  10 ++
 package/nwipe/nwipe.mk                             |  14 ++
 5 files changed, 190 insertions(+)
 create mode 100644 package/nwipe/0001-parted-use-autoconf-module.patch
 create mode 100644 package/nwipe/0002-use-off64t_not_lofft.patch
 create mode 100644 package/nwipe/Config.in
 create mode 100644 package/nwipe/nwipe.mk

diff --git a/package/Config.in b/package/Config.in
index 8e3c64a..32affcc 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1496,6 +1496,7 @@ endif
 	source "package/ncdu/Config.in"
 	source "package/numactl/Config.in"
 	source "package/nut/Config.in"
+	source "package/nwipe/Config.in"
 	source "package/openvmtools/Config.in"
 	source "package/polkit/Config.in"
 	source "package/powerpc-utils/Config.in"
diff --git a/package/nwipe/0001-parted-use-autoconf-module.patch b/package/nwipe/0001-parted-use-autoconf-module.patch
new file mode 100644
index 0000000..b78cf95
--- /dev/null
+++ b/package/nwipe/0001-parted-use-autoconf-module.patch
@@ -0,0 +1,21 @@
+--- nwipe-0.17/configure.ac.orig	2015-10-14 16:03:50.602422801 -0500
++++ nwipe-0.17/configure.ac	2015-10-14 16:04:44.542421602 -0500
+@@ -42,7 +42,9 @@
+ 	)]
+ )
+ 
+-AC_CHECK_LIB([parted], [ped_device_probe_all], ,[AC_MSG_ERROR([parted development library not found])])
++AC_CHECK_LIB([intl], [libintl_dgettext]) # needed to statically link libparted, but not given in its pkgconfig file
++AC_CHECK_LIB([uuid], [uuid_generate])    # needed to statically link libparted, but not given in its pkgconfig file
++PKG_CHECK_MODULES([PARTED], [libparted])
+ AC_CHECK_LIB([pthread], [main], ,[AC_MSG_ERROR([pthread development library not found])])
+ 
+ # Checks for header files.
+--- nwipe-0.17.orig/src/Makefile.am	2014-10-19 14:49:22.000000000 -0500
++++ nwipe-0.17/src/Makefile.am	2015-10-14 16:06:34.763419154 -0500
+@@ -7,3 +7,5 @@
+ # the previous manual Makefile
+ bin_PROGRAMS = nwipe
+ nwipe_SOURCES = context.h isaac_rand.c logging.h options.h prng.h nwipe.c gui.c isaac_rand.h method.h pass.c device.c gui.h isaac_standard.h mt19937ar-cok.c nwipe.h mt19937ar-cok.h pass.h device.h logging.c method.c options.c prng.c version.c version.h
++nwipe_CFLAGS = ${PARTED_CFLAGS}
++nwipe_LDADD = ${PARTED_LIBS}
diff --git a/package/nwipe/0002-use-off64t_not_lofft.patch b/package/nwipe/0002-use-off64t_not_lofft.patch
new file mode 100644
index 0000000..3c4c7a3
--- /dev/null
+++ b/package/nwipe/0002-use-off64t_not_lofft.patch
@@ -0,0 +1,144 @@
+diff -ru nwipe-0.17.orig/src/context.h nwipe-0.17/src/context.h
+--- nwipe-0.17.orig/src/context.h	2014-10-19 14:49:22.000000000 -0500
++++ nwipe-0.17/src/context.h	2015-10-14 01:34:48.376581181 -0500
+@@ -82,7 +82,7 @@
+ 	int               device_minor;  /* The minor device number.                                       */
+ 	int               device_part;   /* The device partition or slice number.                          */
+ 	char*             device_name;   /* The device file name.                                          */
+-	loff_t            device_size;   /* The device size in bytes.                                      */
++	off64_t           device_size;   /* The device size in bytes.                                      */
+ 	struct stat       device_stat;   /* The device file state from fstat().                            */
+ 	nwipe_device_t    device_type;   /* Indicates an IDE, SCSI, or Compaq SMART device.                */
+ 	int               device_target; /* The device target.                                             */
+diff -ru nwipe-0.17.orig/src/nwipe.c nwipe-0.17/src/nwipe.c
+--- nwipe-0.17.orig/src/nwipe.c	2014-10-19 14:49:22.000000000 -0500
++++ nwipe-0.17/src/nwipe.c	2015-10-14 01:34:48.387581181 -0500
+@@ -354,7 +354,7 @@
+                 }
+ 
+ 
+-                if( c2[i]->device_size == (loff_t)-1 )
++                if( c2[i]->device_size == (off64_t)-1 )
+                 {
+                         /* We cannot determine the size of this device. */
+                         nwipe_perror( errno, __FUNCTION__, "lseek" );
+@@ -367,7 +367,7 @@
+                         /* Reset the file pointer. */
+                         r = lseek( c2[i]->device_fd, 0, SEEK_SET );
+         
+-                        if( r == (loff_t)-1 )
++                        if( r == (off64_t)-1 )
+                         {
+                                 nwipe_perror( errno, __FUNCTION__, "lseek" );
+                                 nwipe_log( NWIPE_LOG_ERROR, "Unable to reset the '%s' file offset.", c2[i]->device_name );
+diff -ru nwipe-0.17.orig/src/pass.c nwipe-0.17/src/pass.c
+--- nwipe-0.17.orig/src/pass.c	2014-10-19 14:49:22.000000000 -0500
++++ nwipe-0.17/src/pass.c	2015-10-14 01:34:48.389581181 -0500
+@@ -46,7 +46,7 @@
+ 	size_t blocksize;
+ 
+ 	/* The result buffer for calls to lseek. */
+-	loff_t offset;
++	off64_t offset;
+ 
+ 	/* The input buffer. */
+ 	char* b;
+@@ -98,7 +98,7 @@
+ 	/* Reset the pass byte counter. */
+ 	c->pass_done = 0;
+ 
+-	if( offset == (loff_t)-1 )
++	if( offset == (off64_t)-1 )
+ 	{
+ 		nwipe_perror( errno, __FUNCTION__, "lseek" );
+ 		nwipe_log( NWIPE_LOG_FATAL, "Unable to reset the '%s' file offset.", c->device_name );
+@@ -177,7 +177,7 @@
+ 			/* Bump the file pointer to the next block. */
+ 			offset = lseek( c->device_fd, s, SEEK_CUR );
+ 
+-			if( offset == (loff_t)-1 )
++			if( offset == (off64_t)-1 )
+ 			{
+ 				nwipe_perror( errno, __FUNCTION__, "lseek" );
+ 				nwipe_log( NWIPE_LOG_ERROR, "Unable to bump the '%s' file offset after a partial read.", c->device_name );
+@@ -225,7 +225,7 @@
+ 	size_t blocksize;
+ 
+ 	/* The result buffer for calls to lseek. */
+-	loff_t offset;
++	off64_t offset;
+ 
+ 	/* The output buffer. */
+ 	char* b;
+@@ -267,7 +267,7 @@
+ 	/* Reset the pass byte counter. */
+ 	c->pass_done = 0;
+ 
+-	if( offset == (loff_t)-1 )
++	if( offset == (off64_t)-1 )
+ 	{
+ 		nwipe_perror( errno, __FUNCTION__, "lseek" );
+ 		nwipe_log( NWIPE_LOG_FATAL, "Unable to reset the '%s' file offset.", c->device_name );
+@@ -328,7 +328,7 @@
+ 			/* Bump the file pointer to the next block. */
+ 			offset = lseek( c->device_fd, s, SEEK_CUR );
+ 
+-			if( offset == (loff_t)-1 )
++			if( offset == (off64_t)-1 )
+ 			{
+ 				nwipe_perror( errno, __FUNCTION__, "lseek" );
+ 				nwipe_log( NWIPE_LOG_ERROR, "Unable to bump the '%s' file offset after a partial write.", c->device_name );
+@@ -388,7 +388,7 @@
+ 	size_t blocksize;
+ 
+ 	/* The result buffer for calls to lseek. */
+-	loff_t offset;
++	off64_t offset;
+ 
+ 	/* The input buffer. */
+ 	char* b;
+@@ -470,7 +470,7 @@
+ 	/* Reset the pass byte counter. */
+ 	c->pass_done = 0;
+ 
+-	if( offset == (loff_t)-1 )
++	if( offset == (off64_t)-1 )
+ 	{
+ 		nwipe_perror( errno, __FUNCTION__, "lseek" );
+ 		nwipe_log( NWIPE_LOG_FATAL, "Unable to reset the '%s' file offset.", c->device_name );
+@@ -534,7 +534,7 @@
+ 			/* Bump the file pointer to the next block. */
+ 			offset = lseek( c->device_fd, s, SEEK_CUR );
+ 
+-			if( offset == (loff_t)-1 )
++			if( offset == (off64_t)-1 )
+ 			{
+ 				nwipe_perror( errno, __FUNCTION__, "lseek" );
+ 				nwipe_log( NWIPE_LOG_ERROR, "Unable to bump the '%s' file offset after a partial read.", c->device_name );
+@@ -587,7 +587,7 @@
+ 	size_t blocksize;
+ 
+ 	/* The result buffer for calls to lseek. */
+-	loff_t offset;
++	off64_t offset;
+ 
+ 	/* The output buffer. */
+ 	char* b;
+@@ -638,7 +638,7 @@
+ 	/* Reset the pass byte counter. */
+ 	c->pass_done = 0;
+ 
+-	if( offset == (loff_t)-1 )
++	if( offset == (off64_t)-1 )
+ 	{
+ 		nwipe_perror( errno, __FUNCTION__, "lseek" );
+ 		nwipe_log( NWIPE_LOG_FATAL, "Unable to reset the '%s' file offset.", c->device_name );
+@@ -697,7 +697,7 @@
+ 			/* Bump the file pointer to the next block. */
+ 			offset = lseek( c->device_fd, s, SEEK_CUR );
+ 
+-			if( offset == (loff_t)-1 )
++			if( offset == (off64_t)-1 )
+ 			{
+ 				nwipe_perror( errno, __FUNCTION__, "lseek" );
+ 				nwipe_log( NWIPE_LOG_ERROR, "Unable to bump the '%s' file offset after a partial write.", c->device_name );
diff --git a/package/nwipe/Config.in b/package/nwipe/Config.in
new file mode 100644
index 0000000..7c13f30
--- /dev/null
+++ b/package/nwipe/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_NWIPE
+	bool "nwipe"
+	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_PARTED
+	help
+	  nwipe thoroughly overwrites block devices, forked from a component at
+	  the core of the venerable DBAN.
+	
+	  https://github.com/martijnvanbrummelen/nwipe
diff --git a/package/nwipe/nwipe.mk b/package/nwipe/nwipe.mk
new file mode 100644
index 0000000..58f560f
--- /dev/null
+++ b/package/nwipe/nwipe.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# nwipe
+#
+################################################################################
+
+NWIPE_VERSION = 0.17
+NWIPE_SITE = $(call github,martijnvanbrummelen,nwipe,$(NWIPE_VERSION))
+NWIPE_DEPENDENCIES = ncurses parted host-pkgconf
+NWIPE_LICENSE = GPLv2
+NWIPE_LICENSE_FILES = COPYING
+NWIPE_AUTORECONF = YES
+
+$(eval $(autotools-package))
-- 
2.0.0
