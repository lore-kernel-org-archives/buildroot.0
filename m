From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Mar 2013 19:19:29 +0100
Subject: [Buildroot] [PATCH 8/9] log4cxx: new package
In-Reply-To: <1364149170-5521-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1364149170-5521-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1364149170-5521-9-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Initial work done by Aleksandar Zivkovic at
http://patchwork.ozlabs.org/patch/171109/.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                  |    1 +
 package/log4cxx/Config.in                          |   15 +++++++
 package/log4cxx/log4cxx-0001-charset-fixes.patch   |   43 +++++++++++++++++++
 .../log4cxx/log4cxx-0002-missing-includes.patch    |   44 ++++++++++++++++++++
 .../log4cxx/log4cxx-0003-missing-includes.patch    |   21 ++++++++++
 package/log4cxx/log4cxx.mk                         |   20 +++++++++
 6 files changed, 144 insertions(+)
 create mode 100644 package/log4cxx/Config.in
 create mode 100644 package/log4cxx/log4cxx-0001-charset-fixes.patch
 create mode 100644 package/log4cxx/log4cxx-0002-missing-includes.patch
 create mode 100644 package/log4cxx/log4cxx-0003-missing-includes.patch
 create mode 100644 package/log4cxx/log4cxx.mk

diff --git a/package/Config.in b/package/Config.in
index 5f33e45..bdfc0f2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -568,6 +568,7 @@ source "package/libtpl/Config.in"
 source "package/libseccomp/Config.in"
 source "package/liburcu/Config.in"
 source "package/linux-pam/Config.in"
+source "package/log4cxx/Config.in"
 source "package/lttng-libust/Config.in"
 source "package/mpc/Config.in"
 source "package/mpfr/Config.in"
diff --git a/package/log4cxx/Config.in b/package/log4cxx/Config.in
new file mode 100644
index 0000000..b9c9990
--- /dev/null
+++ b/package/log4cxx/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_LOG4CXX
+	bool "log4cxx"
+	select BR2_PACKAGE_APR
+	select BR2_PACKAGE_APR_UTIL
+	# apr really needs shared library support
+	depends on !BR2_PREFER_STATIC_LIB
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  Apache log4cxx is a logging framework for C++ patterned
+	  after Apache log4j.
+
+	  http://apache.linux-mirror.org/logging/log4cxx/0.10.0
+
+comment "log4cxx requires C++ support in toolchain"
+	depends on !BR2_INSTALL_LIBSTDCPP
\ No newline at end of file
diff --git a/package/log4cxx/log4cxx-0001-charset-fixes.patch b/package/log4cxx/log4cxx-0001-charset-fixes.patch
new file mode 100644
index 0000000..75567fd
--- /dev/null
+++ b/package/log4cxx/log4cxx-0001-charset-fixes.patch
@@ -0,0 +1,43 @@
+Fix build when iconv support is not available
+
+When iconv support is not available, the apr-util library does not
+provide character set conversion features, and therefore APR_HAS_XLATE
+is false.
+
+However, on Linux !defined(_WIN32) is always true, but the part of the
+code that defines the APRCharsetDecoder and APRCharsetEncoder are only
+enclosed in a #if APR_HAS_XLATE, without the "|| defined(_WIN32)"
+which leads to build failures: the APRCharsetEncoder and
+APRCharsetDecoder classes are used without being defined.
+
+This patch removes the || !defined(_WIN32) so that when iconv support
+is not here, we fall back to raising an exception at runtime.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/src/main/cpp/charsetdecoder.cpp
+===================================================================
+--- a/src/main/cpp/charsetdecoder.cpp
++++ b/src/main/cpp/charsetdecoder.cpp
+@@ -476,7 +476,7 @@
+         StringHelper::equalsIgnoreCase(charset, LOG4CXX_STR("ISO-LATIN-1"), LOG4CXX_STR("iso-latin-1"))) {
+         return new ISOLatinCharsetDecoder();
+     }
+-#if APR_HAS_XLATE || !defined(_WIN32)
++#if APR_HAS_XLATE
+     return new APRCharsetDecoder(charset);
+ #else    
+     throw IllegalArgumentException(charset);
+Index: b/src/main/cpp/charsetencoder.cpp
+===================================================================
+--- a/src/main/cpp/charsetencoder.cpp
++++ b/src/main/cpp/charsetencoder.cpp
+@@ -484,7 +484,7 @@
+     } else if (StringHelper::equalsIgnoreCase(charset, LOG4CXX_STR("UTF-16LE"), LOG4CXX_STR("utf-16le"))) {
+         return new UTF16LECharsetEncoder();
+     }
+-#if APR_HAS_XLATE || !defined(_WIN32)
++#if APR_HAS_XLATE
+     return new APRCharsetEncoder(charset);
+ #else    
+     throw IllegalArgumentException(charset);
diff --git a/package/log4cxx/log4cxx-0002-missing-includes.patch b/package/log4cxx/log4cxx-0002-missing-includes.patch
new file mode 100644
index 0000000..dd4da11
--- /dev/null
+++ b/package/log4cxx/log4cxx-0002-missing-includes.patch
@@ -0,0 +1,44 @@
+commit bcaf1f8a682d641cee325142099c371464fd5946
+Author: Curtis William Arnold <carnold@apache.org>
+Date:   Tue May 20 16:05:37 2008 +0000
+
+    LOGCXX-286: gcc 4.3 requires #include <cstring>
+    
+    git-svn-id: https://svn.apache.org/repos/asf/logging/log4cxx/trunk at 658304 13f79535-47bb-0310-9956-ffa450edef68
+
+diff --git a/src/examples/cpp/console.cpp b/src/examples/cpp/console.cpp
+index 6a01d8a..a673a10 100755
+--- a/src/examples/cpp/console.cpp
++++ b/src/examples/cpp/console.cpp
+@@ -22,6 +22,7 @@
+ #include <log4cxx/logmanager.h>
+ #include <iostream>
+ #include <locale.h>
++#include <cstring>
+ 
+ using namespace log4cxx;
+ using namespace log4cxx::helpers;
+diff --git a/src/main/cpp/inputstreamreader.cpp b/src/main/cpp/inputstreamreader.cpp
+index 52b1c0a..cb45181 100644
+--- a/src/main/cpp/inputstreamreader.cpp
++++ b/src/main/cpp/inputstreamreader.cpp
+@@ -20,6 +20,7 @@
+ #include <log4cxx/helpers/exception.h>
+ #include <log4cxx/helpers/pool.h>
+ #include <log4cxx/helpers/bytebuffer.h>
++#include <cstring>
+ 
+ using namespace log4cxx;
+ using namespace log4cxx::helpers;
+diff --git a/src/main/cpp/socketoutputstream.cpp b/src/main/cpp/socketoutputstream.cpp
+index 185f835..c61eb11 100644
+--- a/src/main/cpp/socketoutputstream.cpp
++++ b/src/main/cpp/socketoutputstream.cpp
+@@ -19,6 +19,7 @@
+ #include <log4cxx/helpers/socketoutputstream.h>
+ #include <log4cxx/helpers/socket.h>
+ #include <log4cxx/helpers/bytebuffer.h>
++#include <cstring>
+ 
+ using namespace log4cxx;
+ using namespace log4cxx::helpers;
diff --git a/package/log4cxx/log4cxx-0003-missing-includes.patch b/package/log4cxx/log4cxx-0003-missing-includes.patch
new file mode 100644
index 0000000..cd21bba
--- /dev/null
+++ b/package/log4cxx/log4cxx-0003-missing-includes.patch
@@ -0,0 +1,21 @@
+commit ce62c00ea5f9bf2f0740ecde5b245c9b7edc80ff
+Author: Curtis William Arnold <carnold@apache.org>
+Date:   Mon Apr 27 03:53:50 2009 +0000
+
+    LOGCXX-332: fails to build with gcc 4.4
+    
+    git-svn-id: https://svn.apache.org/repos/asf/logging/log4cxx/trunk at 768863 13f79535-47bb-0310-9956-ffa450edef68
+
+diff --git a/src/examples/cpp/console.cpp b/src/examples/cpp/console.cpp
+index a673a10..f44c944 100755
+--- a/src/examples/cpp/console.cpp
++++ b/src/examples/cpp/console.cpp
+@@ -23,6 +23,8 @@
+ #include <iostream>
+ #include <locale.h>
+ #include <cstring>
++#include <cstdio>
++#include <stdint.h>
+ 
+ using namespace log4cxx;
+ using namespace log4cxx::helpers;
diff --git a/package/log4cxx/log4cxx.mk b/package/log4cxx/log4cxx.mk
new file mode 100644
index 0000000..83afded
--- /dev/null
+++ b/package/log4cxx/log4cxx.mk
@@ -0,0 +1,20 @@
+#############################################################
+#
+# log4cxx
+#
+#############################################################
+
+LOG4CXX_VERSION = 0.10.0
+LOG4CXX_SITE = http://archive.apache.org/dist/logging/log4cxx/$(LOG4CXX_VERSION)
+LOG4CXX_SOURCE = apache-log4cxx-$(LOG4CXX_VERSION).tar.gz
+LOG4CXX_INSTALL_STAGING = YES
+LOG4CXX_LICENSE = Apache-2.0
+LOG4CXX_LICENSE_FILES = LICENSE
+
+LOG4CXX_CONF_OPT = \
+	--with-apr=$(STAGING_DIR)/usr/bin/apr-1-config \
+	--with-apr-util=$(STAGING_DIR)/usr/bin/apu-1-config
+
+LOG4CXX_DEPENDENCIES = apr apr-util
+
+$(eval $(autotools-package))
-- 
1.7.9.5
