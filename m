From: Charles Duffy <charles@dyfis.net>
Date: Mon, 19 Oct 2015 09:18:16 -0500
Subject: [Buildroot] [[PATCH v4] 1/1] nwipe: new package
Message-ID: <1445264296-24025-1-git-send-email-chaduffy@cisco.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Charles Duffy <chaduffy@cisco.com>
---
 package/Config.in                                  |   1 +
 ...off_t-to-off64_t-for-musl-libc-support-11.patch | 169 +++++++++++++++++++++
 ...-libuuid-dependencies-to-allow-parted-sta.patch |  45 ++++++
 package/nwipe/Config.in                            |  12 ++
 package/nwipe/nwipe.hash                           |   1 +
 package/nwipe/nwipe.mk                             |  16 ++
 6 files changed, 244 insertions(+)
 create mode 100644 package/nwipe/0001-Move-from-loff_t-to-off64_t-for-musl-libc-support-11.patch
 create mode 100644 package/nwipe/0002-Add-libintl-libuuid-dependencies-to-allow-parted-sta.patch
 create mode 100644 package/nwipe/Config.in
 create mode 100644 package/nwipe/nwipe.hash
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
diff --git a/package/nwipe/0001-Move-from-loff_t-to-off64_t-for-musl-libc-support-11.patch b/package/nwipe/0001-Move-from-loff_t-to-off64_t-for-musl-libc-support-11.patch
new file mode 100644
index 0000000..d147878
--- /dev/null
+++ b/package/nwipe/0001-Move-from-loff_t-to-off64_t-for-musl-libc-support-11.patch
@@ -0,0 +1,169 @@
+From 2f44978db430101baeb643db160c9a5190ef7fa8 Mon Sep 17 00:00:00 2001
+From: Charles Duffy <charles@dyfis.net>
+Date: Wed, 14 Oct 2015 16:26:30 -0500
+Subject: [PATCH 1/2] Move from loff_t to off64_t for musl libc support (#11)
+
+Using musl libc, the loff_t type is unavailable. This is only exported by the
+kernel when building with GNU_SOURCE, so there's an argument to be made that
+it's desired behavior; see http://www.openwall.com/lists/musl/2013/01/23/6 for
+discussion on this point.
+
+https://github.com/martijnvanbrummelen/nwipe/pull/14
+
+Signed-off-by: Charles Duffy <chaduffy@cisco.com>
+---
+ src/context.h |  2 +-
+ src/nwipe.c   |  4 ++--
+ src/pass.c    | 24 ++++++++++++------------
+ 3 files changed, 15 insertions(+), 15 deletions(-)
+
+diff --git a/src/context.h b/src/context.h
+index ca13d0c..fbb5b41 100644
+--- a/src/context.h
++++ b/src/context.h
+@@ -82,7 +82,7 @@ typedef struct nwipe_context_t_
+ 	int               device_minor;  /* The minor device number.                                       */
+ 	int               device_part;   /* The device partition or slice number.                          */
+ 	char*             device_name;   /* The device file name.                                          */
+-	loff_t            device_size;   /* The device size in bytes.                                      */
++	off64_t           device_size;   /* The device size in bytes.                                      */
+ 	struct stat       device_stat;   /* The device file state from fstat().                            */
+ 	nwipe_device_t    device_type;   /* Indicates an IDE, SCSI, or Compaq SMART device.                */
+ 	int               device_target; /* The device target.                                             */
+diff --git a/src/nwipe.c b/src/nwipe.c
+index 8a84eb1..7423124 100644
+--- a/src/nwipe.c
++++ b/src/nwipe.c
+@@ -354,7 +354,7 @@ int main( int argc, char** argv )
+                 }
+ 
+ 
+-                if( c2[i]->device_size == (loff_t)-1 )
++                if( c2[i]->device_size == (off64_t)-1 )
+                 {
+                         /* We cannot determine the size of this device. */
+                         nwipe_perror( errno, __FUNCTION__, "lseek" );
+@@ -367,7 +367,7 @@ int main( int argc, char** argv )
+                         /* Reset the file pointer. */
+                         r = lseek( c2[i]->device_fd, 0, SEEK_SET );
+         
+-                        if( r == (loff_t)-1 )
++                        if( r == (off64_t)-1 )
+                         {
+                                 nwipe_perror( errno, __FUNCTION__, "lseek" );
+                                 nwipe_log( NWIPE_LOG_ERROR, "Unable to reset the '%s' file offset.", c2[i]->device_name );
+diff --git a/src/pass.c b/src/pass.c
+index 1cf5c74..3c6dfab 100644
+--- a/src/pass.c
++++ b/src/pass.c
+@@ -46,7 +46,7 @@ int nwipe_random_verify( nwipe_context_t* c )
+ 	size_t blocksize;
+ 
+ 	/* The result buffer for calls to lseek. */
+-	loff_t offset;
++	off64_t offset;
+ 
+ 	/* The input buffer. */
+ 	char* b;
+@@ -98,7 +98,7 @@ int nwipe_random_verify( nwipe_context_t* c )
+ 	/* Reset the pass byte counter. */
+ 	c->pass_done = 0;
+ 
+-	if( offset == (loff_t)-1 )
++	if( offset == (off64_t)-1 )
+ 	{
+ 		nwipe_perror( errno, __FUNCTION__, "lseek" );
+ 		nwipe_log( NWIPE_LOG_FATAL, "Unable to reset the '%s' file offset.", c->device_name );
+@@ -177,7 +177,7 @@ int nwipe_random_verify( nwipe_context_t* c )
+ 			/* Bump the file pointer to the next block. */
+ 			offset = lseek( c->device_fd, s, SEEK_CUR );
+ 
+-			if( offset == (loff_t)-1 )
++			if( offset == (off64_t)-1 )
+ 			{
+ 				nwipe_perror( errno, __FUNCTION__, "lseek" );
+ 				nwipe_log( NWIPE_LOG_ERROR, "Unable to bump the '%s' file offset after a partial read.", c->device_name );
+@@ -225,7 +225,7 @@ int nwipe_random_pass( NWIPE_METHOD_SIGNATURE )
+ 	size_t blocksize;
+ 
+ 	/* The result buffer for calls to lseek. */
+-	loff_t offset;
++	off64_t offset;
+ 
+ 	/* The output buffer. */
+ 	char* b;
+@@ -267,7 +267,7 @@ int nwipe_random_pass( NWIPE_METHOD_SIGNATURE )
+ 	/* Reset the pass byte counter. */
+ 	c->pass_done = 0;
+ 
+-	if( offset == (loff_t)-1 )
++	if( offset == (off64_t)-1 )
+ 	{
+ 		nwipe_perror( errno, __FUNCTION__, "lseek" );
+ 		nwipe_log( NWIPE_LOG_FATAL, "Unable to reset the '%s' file offset.", c->device_name );
+@@ -328,7 +328,7 @@ int nwipe_random_pass( NWIPE_METHOD_SIGNATURE )
+ 			/* Bump the file pointer to the next block. */
+ 			offset = lseek( c->device_fd, s, SEEK_CUR );
+ 
+-			if( offset == (loff_t)-1 )
++			if( offset == (off64_t)-1 )
+ 			{
+ 				nwipe_perror( errno, __FUNCTION__, "lseek" );
+ 				nwipe_log( NWIPE_LOG_ERROR, "Unable to bump the '%s' file offset after a partial write.", c->device_name );
+@@ -388,7 +388,7 @@ int nwipe_static_verify( NWIPE_METHOD_SIGNATURE, nwipe_pattern_t* pattern )
+ 	size_t blocksize;
+ 
+ 	/* The result buffer for calls to lseek. */
+-	loff_t offset;
++	off64_t offset;
+ 
+ 	/* The input buffer. */
+ 	char* b;
+@@ -470,7 +470,7 @@ int nwipe_static_verify( NWIPE_METHOD_SIGNATURE, nwipe_pattern_t* pattern )
+ 	/* Reset the pass byte counter. */
+ 	c->pass_done = 0;
+ 
+-	if( offset == (loff_t)-1 )
++	if( offset == (off64_t)-1 )
+ 	{
+ 		nwipe_perror( errno, __FUNCTION__, "lseek" );
+ 		nwipe_log( NWIPE_LOG_FATAL, "Unable to reset the '%s' file offset.", c->device_name );
+@@ -534,7 +534,7 @@ int nwipe_static_verify( NWIPE_METHOD_SIGNATURE, nwipe_pattern_t* pattern )
+ 			/* Bump the file pointer to the next block. */
+ 			offset = lseek( c->device_fd, s, SEEK_CUR );
+ 
+-			if( offset == (loff_t)-1 )
++			if( offset == (off64_t)-1 )
+ 			{
+ 				nwipe_perror( errno, __FUNCTION__, "lseek" );
+ 				nwipe_log( NWIPE_LOG_ERROR, "Unable to bump the '%s' file offset after a partial read.", c->device_name );
+@@ -587,7 +587,7 @@ int nwipe_static_pass( NWIPE_METHOD_SIGNATURE, nwipe_pattern_t* pattern )
+ 	size_t blocksize;
+ 
+ 	/* The result buffer for calls to lseek. */
+-	loff_t offset;
++	off64_t offset;
+ 
+ 	/* The output buffer. */
+ 	char* b;
+@@ -638,7 +638,7 @@ int nwipe_static_pass( NWIPE_METHOD_SIGNATURE, nwipe_pattern_t* pattern )
+ 	/* Reset the pass byte counter. */
+ 	c->pass_done = 0;
+ 
+-	if( offset == (loff_t)-1 )
++	if( offset == (off64_t)-1 )
+ 	{
+ 		nwipe_perror( errno, __FUNCTION__, "lseek" );
+ 		nwipe_log( NWIPE_LOG_FATAL, "Unable to reset the '%s' file offset.", c->device_name );
+@@ -697,7 +697,7 @@ int nwipe_static_pass( NWIPE_METHOD_SIGNATURE, nwipe_pattern_t* pattern )
+ 			/* Bump the file pointer to the next block. */
+ 			offset = lseek( c->device_fd, s, SEEK_CUR );
+ 
+-			if( offset == (loff_t)-1 )
++			if( offset == (off64_t)-1 )
+ 			{
+ 				nwipe_perror( errno, __FUNCTION__, "lseek" );
+ 				nwipe_log( NWIPE_LOG_ERROR, "Unable to bump the '%s' file offset after a partial write.", c->device_name );
+-- 
+2.0.0
+
diff --git a/package/nwipe/0002-Add-libintl-libuuid-dependencies-to-allow-parted-sta.patch b/package/nwipe/0002-Add-libintl-libuuid-dependencies-to-allow-parted-sta.patch
new file mode 100644
index 0000000..1d04084
--- /dev/null
+++ b/package/nwipe/0002-Add-libintl-libuuid-dependencies-to-allow-parted-sta.patch
@@ -0,0 +1,45 @@
+From 7e0773c4738362f030f431a35b4e13cc2b4f36be Mon Sep 17 00:00:00 2001
+From: Charles Duffy <charles@dyfis.net>
+Date: Wed, 14 Oct 2015 16:24:01 -0500
+Subject: [PATCH 2/2] Add libintl, libuuid dependencies to allow parted static
+ link (#12)
+
+libparted requires libuuid; both require libintl. Static builds currently fail
+with link errors due to these missing dependencies.
+
+https://github.com/martijnvanbrummelen/nwipe/pull/13
+
+Signed-off-by: Charles Duffy <chaduffy@cisco.com>
+---
+ configure.ac    | 4 +++-
+ src/Makefile.am | 2 ++
+ 2 files changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 375c775..78f6624 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -42,7 +42,9 @@ PKG_CHECK_MODULES(
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
+diff --git a/src/Makefile.am b/src/Makefile.am
+index c123372..a5f5740 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -7,3 +7,5 @@ AM_LDFLAGS =
+ # the previous manual Makefile
+ bin_PROGRAMS = nwipe
+ nwipe_SOURCES = context.h isaac_rand.c logging.h options.h prng.h nwipe.c gui.c isaac_rand.h method.h pass.c device.c gui.h isaac_standard.h mt19937ar-cok.c nwipe.h mt19937ar-cok.h pass.h device.h logging.c method.c options.c prng.c version.c version.h
++nwipe_CFLAGS = $(PARTED_CFLAGS)
++nwipe_LDADD = $(PARTED_LIBS)
+-- 
+2.0.0
+
diff --git a/package/nwipe/Config.in b/package/nwipe/Config.in
new file mode 100644
index 0000000..8a41015
--- /dev/null
+++ b/package/nwipe/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_NWIPE
+	bool "nwipe"
+	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_PARTED
+	help
+	  nwipe thoroughly overwrites block devices, forked from a component at
+	  the core of the venerable DBAN.
+	
+	  https://github.com/martijnvanbrummelen/nwipe
+
+comment "nwipe needs a toolchain w/ wchar"
+	depends on !BR2_USE_WCHAR
diff --git a/package/nwipe/nwipe.hash b/package/nwipe/nwipe.hash
new file mode 100644
index 0000000..f66b5c3
--- /dev/null
+++ b/package/nwipe/nwipe.hash
@@ -0,0 +1 @@
+sha256	63a3f5fbcaf0c013790345ece2cf04c3d85a15c4505b9d92dc779465aafbd52f  nwipe-8a9a71822148cb9c82d971030dafd8d374fd1f48.tar.gz
diff --git a/package/nwipe/nwipe.mk b/package/nwipe/nwipe.mk
new file mode 100644
index 0000000..6a26d9c
--- /dev/null
+++ b/package/nwipe/nwipe.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# nwipe
+#
+################################################################################
+
+NWIPE_VERSION = 8a9a71822148cb9c82d971030dafd8d374fd1f48
+NWIPE_SITE = $(call github,martijnvanbrummelen,nwipe,$(NWIPE_VERSION))
+NWIPE_DEPENDENCIES = ncurses parted host-pkgconf
+NWIPE_LICENSE = GPLv2
+NWIPE_LICENSE_FILES = COPYING
+
+# no ./configure in source repository
+NWIPE_AUTORECONF = YES
+
+$(eval $(autotools-package))
-- 
2.0.0
