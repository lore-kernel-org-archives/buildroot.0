From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 27 Sep 2016 17:00:45 +0200
Subject: [Buildroot] [PATCH 1/1] openzwave: fix compilation of MinOZW
Message-ID: <1474988445-22639-1-git-send-email-fabrice.fontaine@orange.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

LIBDIR was used in cpp/examples/MinOZW/Makefile to add dynamic
libraries. However, as it was unset by default, the cross-compilation
could fail if the host had a library such as libnss3.so in /.
To fix this issue, this patch sets LIBDIR to top_buildir if it is unset

Fixes:
  http://autobuild.buildroot.net/results/68719fdf1320a69310bada6d3c47654dacdb5898

Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
---
 .../openzwave/0003-Fix-compilation-of-MinOZW.patch | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 package/openzwave/0003-Fix-compilation-of-MinOZW.patch

diff --git a/package/openzwave/0003-Fix-compilation-of-MinOZW.patch b/package/openzwave/0003-Fix-compilation-of-MinOZW.patch
new file mode 100644
index 0000000..99a590e
--- /dev/null
+++ b/package/openzwave/0003-Fix-compilation-of-MinOZW.patch
@@ -0,0 +1,38 @@
+From 5916ec261d3bb9a62c3951959ceb6c79d2389b3b Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fabrice.fontaine@orange.com>
+Date: Tue, 27 Sep 2016 15:50:21 +0200
+Subject: [PATCH] Fix compilation of MinOZW
+
+LIBDIR was used in cpp/examples/MinOZW/Makefile to add dynamic
+libraries. However, as it was unset by default, the cross-compilation
+could fail if the host had a library such as libnss3.so in /.
+To fix this issue, this patch sets LIBDIR to top_buildir if it is unset
+
+Fixes:
+  http://autobuild.buildroot.net/results/68719fdf1320a69310bada6d3c47654dacdb5898
+
+Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
+---
+ cpp/examples/MinOZW/Makefile | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/cpp/examples/MinOZW/Makefile b/cpp/examples/MinOZW/Makefile
+index e575632..95d684b 100644
+--- a/cpp/examples/MinOZW/Makefile
++++ b/cpp/examples/MinOZW/Makefile
+@@ -17,9 +17,11 @@ DEBUG_LDFLAGS	:= -g
+ 
+ top_srcdir := $(abspath $(dir $(lastword $(MAKEFILE_LIST)))../../../)
+ 
++#where is put the temporary library
++LIBDIR  	?= $(top_builddir)
+ 
+ INCLUDES	:= -I $(top_srcdir)/cpp/src -I $(top_srcdir)/cpp/tinyxml/ -I $(top_srcdir)/cpp/hidapi/hidapi/
+-LIBS =  $(wildcard $(LIBDIR)/*.so $(LIBDIR)/*.dylib $(top_builddir)/*.so $(top_builddir)/*.dylib $(top_builddir)/cpp/build/*.so $(top_builddir)/cpp/build/*.dylib )
++LIBS =  $(wildcard $(LIBDIR)/*.so $(LIBDIR)/*.dylib $(top_builddir)/cpp/build/*.so $(top_builddir)/cpp/build/*.dylib )
+ LIBSDIR = $(abspath $(dir $(firstword $(LIBS))))
+ minozwsrc := $(notdir $(wildcard $(top_srcdir)/cpp/examples/MinOZW/*.cpp))
+ VPATH := $(top_srcdir)/cpp/examples/MinOZW
+-- 
+2.7.4
+
-- 
2.7.4
