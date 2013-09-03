From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  3 Sep 2013 11:33:15 -0300
Subject: [Buildroot] [PATCH] pcre: fix C++ static build problem
Message-ID: <1378218795-1350-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

PCRE C++ unit tests fails to build properly for static scenarios since
it's not taken account for properly in the build system.
Just disable them, they're never installed to the target.
Fixes:
http://autobuild.buildroot.net/results/970/97027b981659502ff12c345c3caef4933cddb354/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...cre-no-compat.patch => pcre-01-no-compat.patch} |  0
 package/pcre/pcre-02-no-cpp-tests.patch            | 31 ++++++++++++++++++++++
 2 files changed, 31 insertions(+)
 rename package/pcre/{pcre-no-compat.patch => pcre-01-no-compat.patch} (100%)
 create mode 100644 package/pcre/pcre-02-no-cpp-tests.patch

diff --git a/package/pcre/pcre-no-compat.patch b/package/pcre/pcre-01-no-compat.patch
similarity index 100%
rename from package/pcre/pcre-no-compat.patch
rename to package/pcre/pcre-01-no-compat.patch
diff --git a/package/pcre/pcre-02-no-cpp-tests.patch b/package/pcre/pcre-02-no-cpp-tests.patch
new file mode 100644
index 0000000..0255028
--- /dev/null
+++ b/package/pcre/pcre-02-no-cpp-tests.patch
@@ -0,0 +1,31 @@
+Disable PCRE C++ unit tests, they fail to build on static scenarios
+and they're not installed.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura pcre-8.33.orig/Makefile.in pcre-8.33/Makefile.in
+--- pcre-8.33.orig/Makefile.in	2013-05-28 06:09:27.000000000 -0300
++++ pcre-8.33/Makefile.in	2013-09-03 11:28:28.398198832 -0300
+@@ -123,12 +123,6 @@
+ @WITH_PCRE8_TRUE at am__append_20 = libpcreposix.la
+ @WITH_GCOV_TRUE@@WITH_PCRE8_TRUE at am__append_21 = $(GCOV_CFLAGS)
+ @WITH_PCRE_CPP_TRUE at am__append_22 = libpcrecpp.la
+- at WITH_PCRE_CPP_TRUE@am__append_23 = pcrecpp_unittest \
+- at WITH_PCRE_CPP_TRUE@	pcre_scanner_unittest \
+- at WITH_PCRE_CPP_TRUE@	pcre_stringpiece_unittest
+- at WITH_PCRE_CPP_TRUE@am__append_24 = pcrecpp_unittest \
+- at WITH_PCRE_CPP_TRUE@	pcre_scanner_unittest \
+- at WITH_PCRE_CPP_TRUE@	pcre_stringpiece_unittest
+ @WITH_GCOV_TRUE@@WITH_PCRE_CPP_TRUE at am__append_25 = $(GCOV_CXXFLAGS)
+ @WITH_GCOV_TRUE@@WITH_PCRE_CPP_TRUE at am__append_26 = $(GCOV_LIBS)
+ @WITH_GCOV_TRUE@@WITH_PCRE_CPP_TRUE at am__append_27 = $(GCOV_LIBS)
+@@ -360,9 +354,6 @@
+ @WITH_PCRE8_TRUE at am__EXEEXT_1 = pcregrep$(EXEEXT)
+ @WITH_REBUILD_CHARTABLES_TRUE at am__EXEEXT_2 = dftables$(EXEEXT)
+ @WITH_JIT_TRUE at am__EXEEXT_3 = pcre_jit_test$(EXEEXT)
+- at WITH_PCRE_CPP_TRUE@am__EXEEXT_4 = pcrecpp_unittest$(EXEEXT) \
+- at WITH_PCRE_CPP_TRUE@	pcre_scanner_unittest$(EXEEXT) \
+- at WITH_PCRE_CPP_TRUE@	pcre_stringpiece_unittest$(EXEEXT)
+ PROGRAMS = $(bin_PROGRAMS) $(noinst_PROGRAMS)
+ am__dftables_SOURCES_DIST = dftables.c
+ @WITH_REBUILD_CHARTABLES_TRUE at am_dftables_OBJECTS =  \
-- 
1.8.1.5
