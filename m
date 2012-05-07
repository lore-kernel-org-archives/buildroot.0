From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  7 May 2012 18:39:31 +0200
Subject: [Buildroot] [PATCH 1/2] iperf: fix build on !MMU platforms
Message-ID: <1336408773-27312-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build tested on sh2a and blackfin architectures.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/iperf/iperf-add-pthread.patch      |   25 +++++++++++++++
 package/iperf/iperf-man-installation.patch |   15 +++++++++
 package/iperf/iperf-no-mmu.patch           |   48 ++++++++++++++++++++++++++++
 package/iperf/iperf.mk                     |    2 +-
 4 files changed, 89 insertions(+), 1 deletion(-)
 create mode 100644 package/iperf/iperf-add-pthread.patch
 create mode 100644 package/iperf/iperf-man-installation.patch
 create mode 100644 package/iperf/iperf-no-mmu.patch

diff --git a/package/iperf/iperf-add-pthread.patch b/package/iperf/iperf-add-pthread.patch
new file mode 100644
index 0000000..4997b75
--- /dev/null
+++ b/package/iperf/iperf-add-pthread.patch
@@ -0,0 +1,25 @@
+Fix pthread link problem
+
+Some toolchains support linking against pthread by passing
+-pthread. For such toolchains, iperf was working because
+ at PTHREAD_CFLAGS@ was used.
+
+However, some other toolchains (ex: Renesas 2010.09) requires passing
+-lpthread to link against the pthread library. And this was breaking
+in iperf because @PTHREAD_LIBS@ wasn't used. We fix this here.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/src/Makefile.am
+===================================================================
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -12,7 +12,7 @@
+ AM_CXXFLAGS = -Wall
+ AM_CFLAGS = -Wall
+ 
+-iperf_LDFLAGS = @CFLAGS@ @PTHREAD_CFLAGS@ @WEB100_CFLAGS@ @DEFS@
++iperf_LDFLAGS = @CFLAGS@ @PTHREAD_CFLAGS@ @PTHREAD_LIBS@ @WEB100_CFLAGS@ @DEFS@
+ 
+ iperf_SOURCES = \
+ 		Client.cpp \
diff --git a/package/iperf/iperf-man-installation.patch b/package/iperf/iperf-man-installation.patch
new file mode 100644
index 0000000..7c63b2d
--- /dev/null
+++ b/package/iperf/iperf-man-installation.patch
@@ -0,0 +1,15 @@
+Fix man installation
+
+Using man_MANS and dist_man_MANS is redundant, and makes the Makefile
+try to install twice the iperf.1 manpage, which fails.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/man/Makefile.am
+===================================================================
+--- a/man/Makefile.am
++++ b/man/Makefile.am
+@@ -1,2 +1 @@
+-man_MANS = iperf.1
+-dist_man_MANS = $(man_MANS)
++dist_man_MANS = iperf.1
diff --git a/package/iperf/iperf-no-mmu.patch b/package/iperf/iperf-no-mmu.patch
new file mode 100644
index 0000000..b9f89b2
--- /dev/null
+++ b/package/iperf/iperf-no-mmu.patch
@@ -0,0 +1,48 @@
+Add support for building in no-MMU mode
+
+This adds a check for the fork() function in configure.ac, then
+conditionnally calls either fork() or vfork() depending on which one
+is available.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/configure.ac
+===================================================================
+--- a/configure.ac
++++ b/configure.ac
+@@ -66,6 +66,7 @@
+ dnl check for -lnsl, -lsocket
+ AC_CHECK_FUNC(gethostbyname,,AC_CHECK_LIB(nsl, gethostbyname))
+ AC_CHECK_FUNC(socket,,AC_CHECK_LIB(socket, socket))
++AC_CHECK_FUNC(fork)
+ 
+ dnl Checks for header files.
+ AC_HEADER_STDC
+Index: b/src/Listener.cpp
+===================================================================
+--- a/src/Listener.cpp
++++ b/src/Listener.cpp
+@@ -679,7 +679,11 @@
+     pid_t pid; 
+ 
+     /* Create a child process & if successful, exit from the parent process */ 
++#ifndef HAVE_FORK
++    if ( (pid = vfork()) == -1 ) {
++#else
+     if ( (pid = fork()) == -1 ) {
++#endif
+         fprintf( stderr, "error in first child create\n");     
+         exit(0); 
+     } else if ( pid != 0 ) {
+@@ -695,7 +699,11 @@
+ 
+ 
+     /* Now fork() and get released from the terminal */  
++#ifndef HAVE_FORK
++    if ( (pid = vfork()) == -1 ) {
++#else
+     if ( (pid = fork()) == -1 ) {
++#endif
+         fprintf( stderr, "error\n");   
+         exit(0); 
+     } else if ( pid != 0 ) {
diff --git a/package/iperf/iperf.mk b/package/iperf/iperf.mk
index 26cd3fb..614f8f6 100644
--- a/package/iperf/iperf.mk
+++ b/package/iperf/iperf.mk
@@ -6,7 +6,7 @@
 IPERF_VERSION = 2.0.5
 IPERF_SOURCE = iperf-$(IPERF_VERSION).tar.gz
 IPERF_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/iperf
-
+IPERF_AUTORECONF = YES
 IPERF_CONF_ENV = \
 	ac_cv_func_malloc_0_nonnull=yes \
 	ac_cv_type_bool=yes \
-- 
1.7.9.5
