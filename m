From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Aug 2017 15:34:15 +0200
Subject: [Buildroot] [PATCH 1/2] cc-tool: pass -latomic in LIBS
Message-ID: <20170820133416.11231-1-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Just like -lpthread was passed in LIBS, -latomic should also be passed
in LIBS. In order for this to work, we however need to first fix
cc-tool's Makefile.am so that it does not overwrite LIBS.

This is the first part of fixing the build of cc-tool in a static
linking scenario on SPARC, i.e to fix:

  http://autobuild.buildroot.net/results/ed9f2524d0ccef318ff1bc99e5dea980111de989/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
Note: I believe that the -lpthread conditionally added to LIBS when
static linking is useless now. Indeed, the two C libraries that
support static linking (musl and uclibc) now have a single libc
library, so -lpthread is not needed. Glibc does not support static
linking.

This can be cleaned up in next.
---
 .../0003-Makefile.am-do-not-overwrite-LIBS.patch   | 49 ++++++++++++++++++++++
 package/cc-tool/cc-tool.mk                         |  5 ++-
 2 files changed, 52 insertions(+), 2 deletions(-)
 create mode 100644 package/cc-tool/0003-Makefile.am-do-not-overwrite-LIBS.patch

diff --git a/package/cc-tool/0003-Makefile.am-do-not-overwrite-LIBS.patch b/package/cc-tool/0003-Makefile.am-do-not-overwrite-LIBS.patch
new file mode 100644
index 0000000..db62d97
--- /dev/null
+++ b/package/cc-tool/0003-Makefile.am-do-not-overwrite-LIBS.patch
@@ -0,0 +1,49 @@
+From af3098e05535ddb93bb065770d87738e46089efc Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Sun, 20 Aug 2017 15:06:01 +0200
+Subject: [PATCH] Makefile.am: do not overwrite LIBS
+
+LIBS is meant to be passed on the command line with additional
+libraries, it should not be overwritten by Makefile.am.
+
+Instead:
+
+ - Use LDADD to link with external libraries
+
+ - Use <target>_LDFLAGS for additional, non-libraries, linker flags
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ Makefile.am | 8 +++-----
+ 1 file changed, 3 insertions(+), 5 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index e79e47b..ed83d91 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -10,14 +10,12 @@ AM_LDFLAGS = \
+ 
+ #	$(BOOST_THREADS_LDFLAGS)
+       
+-LDADD = $(LIBUSB_LIBS) 
+-
+-LIBS = -s \
++LDADD = $(LIBUSB_LIBS) \
+ 	$(BOOST_FILESYSTEM_LIBS) \
+ 	$(BOOST_REGEX_LIBS) \
+ 	$(BOOST_SYSTEM_LIBS) \
+ 	$(BOOST_PROGRAM_OPTIONS_LIBS)
+-   
++
+ #	$(BOOST_THREADS_LIBS)
+ 
+ bin_PROGRAMS=cc-tool
+@@ -30,4 +28,4 @@ cc_tool_SOURCES=src/main.cpp src/application/cc_flasher.cpp src/application/cc_b
+ 		src/programmer/cc_253x_254x.cpp src/programmer/cc_251x_111x.cpp \
+ 		src/programmer/cc_243x.cpp src/programmer/cc_programmer.cpp \
+ 		src/programmer/cc_unit_driver.cpp src/programmer/cc_unit_info.cpp
+-
++cc_tool_LDFLAGS=-s
+-- 
+2.9.4
+
diff --git a/package/cc-tool/cc-tool.mk b/package/cc-tool/cc-tool.mk
index 37ac57e..e170e06 100644
--- a/package/cc-tool/cc-tool.mk
+++ b/package/cc-tool/cc-tool.mk
@@ -16,15 +16,16 @@ CC_TOOL_AUTORECONF = YES
 
 # Configure script "discovers" boost in /usr/local if not given explicitly
 CC_TOOL_CONF_OPTS = --with-boost=$(STAGING_DIR)/usr
+CC_TOOL_CONF_ENV = LIBS="$(CC_TOOL_LIBS)"
 
 # Help boost.m4 find the Boost Regex library, which needs the pthread
 # library, but isn't detected using a modern (pkg-config) mechanism.
 ifeq ($(BR2_STATIC_LIBS),y)
-CC_TOOL_CONF_ENV += LIBS="-lpthread"
+CC_TOOL_LIBS += -lpthread
 endif
 
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
-CC_TOOL_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) -latomic"
+CC_TOOL_LIBS += -latomic
 endif
 
 $(eval $(autotools-package))
-- 
2.9.4
