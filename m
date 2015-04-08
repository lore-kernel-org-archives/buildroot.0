From: Romain Naour <romain.naour@openwide.fr>
Date: Wed,  8 Apr 2015 22:26:21 +0200
Subject: [Buildroot] [PATCH v2] package/thrift: add dependency on
	host-autoconf-archive
Message-ID: <1428524781-20093-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The ax_cxx_compile_stdcxx_11 macro bundled in thrift package is
brocken [1] and out of date.

Add autoconf-archive as dependency to use an updated version of this macro.

Since Thrift actually doesn't use that particular C++11 feature, add a
patch to make C++11 support optional.

[1] https://savannah.gnu.org/patch/index.php?8287

Fixes:
[thrift]
http://autobuild.buildroot.net/results/21e/21e3fff1e0d714f94ac7e621289d1a59bc02a05f/build-end.log
[host-thrift]
http://autobuild.buildroot.net/results/b89/b89ffc2bff699eb10bb6abd92369a43d4900354d/build-end.log

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
v2: - as suggested by Arnout, don't remove the old ax_cxx_compile_stdcxx_11.m4 file.
    - make C++11 optional.
    - add a link to the ax_cxx_compile_stdcxx_11's bug report.
    - add host-autoconf-archive dependency for the target thrift.
---
 .../0005-configure.ac-C-11-is-optional.patch       | 28 ++++++++++++++++++++++
 package/thrift/thrift.mk                           |  7 +++---
 2 files changed, 32 insertions(+), 3 deletions(-)
 create mode 100644 package/thrift/0005-configure.ac-C-11-is-optional.patch

diff --git a/package/thrift/0005-configure.ac-C-11-is-optional.patch b/package/thrift/0005-configure.ac-C-11-is-optional.patch
new file mode 100644
index 0000000..9ed7e0a
--- /dev/null
+++ b/package/thrift/0005-configure.ac-C-11-is-optional.patch
@@ -0,0 +1,28 @@
+From 9c3a7e79b256730dd85a7acadbaf57ab018b3127 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@openwide.fr>
+Date: Tue, 7 Apr 2015 07:37:26 +0200
+Subject: [PATCH] configure.ac: C++11 is optional
+
+Thrift build fine whitout c++11 support.
+
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 8daeb03..bfd49ae 100755
+--- a/configure.ac
++++ b/configure.ac
+@@ -99,7 +99,7 @@ AC_PROG_AWK
+ AC_PROG_RANLIB
+ 
+ AC_LANG([C++])
+-AX_CXX_COMPILE_STDCXX_11([noext])
++AX_CXX_COMPILE_STDCXX_11([noext], [optional])
+ 
+ AC_ARG_ENABLE([libs],
+   AS_HELP_STRING([--enable-libs], [build the Apache Thrift libraries [default=yes]]),
+-- 
+1.9.3
+
diff --git a/package/thrift/thrift.mk b/package/thrift/thrift.mk
index 409b04d..b4b3a2c 100644
--- a/package/thrift/thrift.mk
+++ b/package/thrift/thrift.mk
@@ -6,10 +6,11 @@
 
 THRIFT_VERSION = 0.9.2
 THRIFT_SITE = http://www.us.apache.org/dist/thrift/$(THRIFT_VERSION)
-THRIFT_DEPENDENCIES = host-pkgconf host-thrift boost libevent openssl zlib
+THRIFT_DEPENDENCIES = host-autoconf-archive host-pkgconf host-thrift boost \
+	libevent openssl zlib
 THRIFT_INSTALL_STAGING = YES
-HOST_THRIFT_DEPENDENCIES = host-bison host-boost host-flex host-libevent \
-	host-openssl host-pkgconf host-zlib
+HOST_THRIFT_DEPENDENCIES = host-autoconf-archive host-bison host-boost \
+	host-flex host-libevent host-openssl host-pkgconf host-zlib
 
 THRIFT_CONF_OPTS = --with-sysroot=$(STAGING_DIR) \
 	--with-boost \
-- 
1.9.3
