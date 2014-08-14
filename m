From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 14 Aug 2014 19:38:04 +0200
Subject: [Buildroot] [PATCH] bandwidthd: fix build failures related to libpng
Message-ID: <1408037884-8720-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The build failures of bandwidthd observed in the autobuilders in
relation to libpng are caused by the usage of -L/usr/lib
-L/usr/local/lib in the compiler flags, which leads the configure
script to try to link against a host libpng library.

This commit fixes those build failures of bandwidthd by:

 - Adding a patch to the configure.ac script to remove the hardcoded
   -L/usr/local/lib and -I/usr/local/include. The bandwidthd package
   -was already autoreconfigured, so there is no need to add it.

 - Adding the --without-x option, which ensures that the configure.ac
   script will not add -L/usr/lib to the compiler flags (and we anyway
   haven't added any sort of X.org support to bandwidthd for the
   moment).

Fixes:

  http://autobuild.buildroot.org/results/a17/a179d13a180a7ce6a8854c5d52437877175f4727/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../bandwidthd/bandwidthd-0001-configure-fix.patch   | 20 ++++++++++++++++++++
 package/bandwidthd/bandwidthd.mk                     |  2 ++
 2 files changed, 22 insertions(+)
 create mode 100644 package/bandwidthd/bandwidthd-0001-configure-fix.patch

diff --git a/package/bandwidthd/bandwidthd-0001-configure-fix.patch b/package/bandwidthd/bandwidthd-0001-configure-fix.patch
new file mode 100644
index 0000000..5ab36d2
--- /dev/null
+++ b/package/bandwidthd/bandwidthd-0001-configure-fix.patch
@@ -0,0 +1,20 @@
+Don't hardcode /usr/local library and header paths
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/configure.ac
+===================================================================
+--- a/configure.ac
++++ b/configure.ac
+@@ -18,11 +18,6 @@
+ 	LDFLAGS="$LDFLAGS -L$x_libraries"
+ fi
+ 
+-# May be equired for BSD
+-LDFLAGS="$LDFLAGS -L/usr/local/lib"
+-
+-CPPFLAGS="$CPPFLAGS -I/usr/local/include"
+-
+ # Required for solaris
+ AC_CHECK_LIB(socket, connect)
+ AC_CHECK_LIB(nsl, gethostbyname)
diff --git a/package/bandwidthd/bandwidthd.mk b/package/bandwidthd/bandwidthd.mk
index 9b1eb32..f480d75 100644
--- a/package/bandwidthd/bandwidthd.mk
+++ b/package/bandwidthd/bandwidthd.mk
@@ -15,6 +15,8 @@ BANDWIDTHD_DEPENDENCIES = gd libpng libpcap
 
 BANDWIDTHD_AUTORECONF = YES
 
+BANDWIDTHD_CONF_OPT += --without-x
+
 ifeq ($(BR2_PACKAGE_BANDWIDTHD_POSTGRESQL),y)
 BANDWIDTHD_DEPENDENCIES += postgresql
 BANDWIDTHD_CONF_OPT += --with-postgresql-logging=true
-- 
2.0.0
