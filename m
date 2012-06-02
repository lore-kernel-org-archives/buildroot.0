From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  2 Jun 2012 18:13:54 +0200
Subject: [Buildroot] [PATCH 04/10] llrp-toolkit: new package
In-Reply-To: <cover.1338653505.git.thomas.petazzoni@free-electrons.com>
References: <cover.1338653505.git.thomas.petazzoni@free-electrons.com>
Message-ID: <71b28cede191521cdbc3302e9c5c46131c1e0120.1338653505.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                  |    1 +
 package/llrp-toolkit/Config.in                     |   11 ++
 .../llrp-toolkit-01-ltkcpp-fix-headers.patch       |   74 +++++++++
 ...toolkit-02-ltkcpp-generate-shared-library.patch |   43 +++++
 ...-toolkit-03-ltkcpp-normalize-build-system.patch |  174 ++++++++++++++++++++
 .../llrp-toolkit-04-ltkcpp-disable-warning.patch   |   43 +++++
 .../llrp-toolkit-05-ltkc-shared-library.patch      |   26 +++
 ...rp-toolkit-06-ltkc-normalize-build-system.patch |  163 ++++++++++++++++++
 package/llrp-toolkit/llrp-toolkit.mk               |   77 +++++++++
 9 files changed, 612 insertions(+)
 create mode 100644 package/llrp-toolkit/Config.in
 create mode 100644 package/llrp-toolkit/llrp-toolkit-01-ltkcpp-fix-headers.patch
 create mode 100644 package/llrp-toolkit/llrp-toolkit-02-ltkcpp-generate-shared-library.patch
 create mode 100644 package/llrp-toolkit/llrp-toolkit-03-ltkcpp-normalize-build-system.patch
 create mode 100644 package/llrp-toolkit/llrp-toolkit-04-ltkcpp-disable-warning.patch
 create mode 100644 package/llrp-toolkit/llrp-toolkit-05-ltkc-shared-library.patch
 create mode 100644 package/llrp-toolkit/llrp-toolkit-06-ltkc-normalize-build-system.patch
 create mode 100644 package/llrp-toolkit/llrp-toolkit.mk

diff --git a/package/Config.in b/package/Config.in
index 044b59b..4af638f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -368,6 +368,7 @@ source "package/libnfc/Config.in"
 source "package/libusb/Config.in"
 source "package/libusb-compat/Config.in"
 source "package/libv4l/Config.in"
+source "package/llrp-toolkit/Config.in"
 endmenu
 
 menu "Javascript"
diff --git a/package/llrp-toolkit/Config.in b/package/llrp-toolkit/Config.in
new file mode 100644
index 0000000..c0cac32
--- /dev/null
+++ b/package/llrp-toolkit/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_LLRP_TOOLKIT
+	bool "llrp-toolkit"
+	select BR2_PACKAGE_LIBXML2
+	help
+	  A software toolkit for using the EPCglobal Low Level Reader
+	  Protocol (LLRP) to communicate with conforming RFID readers.
+
+	  This package installs the C and C++ libraries of LLRP
+	  Toolkit, respectively called ltkc and ltkcpp.
+
+	  http://sourceforge.net/projects/llrp-toolkit/
diff --git a/package/llrp-toolkit/llrp-toolkit-01-ltkcpp-fix-headers.patch b/package/llrp-toolkit/llrp-toolkit-01-ltkcpp-fix-headers.patch
new file mode 100644
index 0000000..5fd40ed
--- /dev/null
+++ b/package/llrp-toolkit/llrp-toolkit-01-ltkcpp-fix-headers.patch
@@ -0,0 +1,74 @@
+ltkcpp: Add missing header inclusions
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/LTKCPP/Examples/example1.cpp
+===================================================================
+--- a/LTKCPP/Examples/example1.cpp
++++ b/LTKCPP/Examples/example1.cpp
+@@ -49,6 +49,7 @@
+ 
+ 
+ #include <stdio.h>
++#include <stdlib.h>
+ 
+ #include "ltkcpp.h"
+ 
+Index: b/LTKCPP/Library/ltkcpp_connection.h
+===================================================================
+--- a/LTKCPP/Library/ltkcpp_connection.h
++++ b/LTKCPP/Library/ltkcpp_connection.h
+@@ -27,6 +27,7 @@
+  **
+  *****************************************************************************/
+  
++#include <time.h>
+ 
+ namespace LLRP
+ {
+Index: b/LTKCPP/Library/ltkcpp_platform.h
+===================================================================
+--- a/LTKCPP/Library/ltkcpp_platform.h
++++ b/LTKCPP/Library/ltkcpp_platform.h
+@@ -36,6 +36,9 @@
+ 
+ #include <list>
+ #include <string.h>         /* memcpy() */
++#ifdef linux
++#include <stdint.h>
++#endif
+ 
+ #define FALSE       0
+ #define TRUE        1
+@@ -52,7 +55,6 @@
+  */
+ 
+ #ifdef linux
+-#include <stdint.h>
+ /** Basic type for LLRP 8-bit unsigned data values*/
+ typedef uint8_t                 llrp_u8_t;
+ /** Basic type for LLRP 8-bit signed data values*/
+Index: b/LTKCPP/Tests/dx201.cpp
+===================================================================
+--- a/LTKCPP/Tests/dx201.cpp
++++ b/LTKCPP/Tests/dx201.cpp
+@@ -57,6 +57,7 @@
+ #ifdef linux
+ #include <unistd.h>
+ #endif
++#include <stdlib.h>
+ 
+ #include "ltkcpp.h"
+ 
+Index: b/LTKCPP/Tests/llrp2xml.cpp
+===================================================================
+--- a/LTKCPP/Tests/llrp2xml.cpp
++++ b/LTKCPP/Tests/llrp2xml.cpp
+@@ -54,6 +54,7 @@
+ 
+ 
+ #include <stdio.h>
++#include <stdlib.h>
+ 
+ #include "ltkcpp.h"
+ 
diff --git a/package/llrp-toolkit/llrp-toolkit-02-ltkcpp-generate-shared-library.patch b/package/llrp-toolkit/llrp-toolkit-02-ltkcpp-generate-shared-library.patch
new file mode 100644
index 0000000..b0b87be
--- /dev/null
+++ b/package/llrp-toolkit/llrp-toolkit-02-ltkcpp-generate-shared-library.patch
@@ -0,0 +1,43 @@
+ltkcpp: Generate shared library instead of static one
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/LTKCPP/Library/Makefile
+===================================================================
+--- a/LTKCPP/Library/Makefile
++++ b/LTKCPP/Library/Makefile
+@@ -16,7 +16,6 @@
+ ############################################################################
+ 
+ #CPPFLAGS = -O -Wall
+-AR              = ar
+ CXX             = g++
+ CPPFLAGS        = -g -Wall -I../../opensource/include/libxml2
+ 
+@@ -34,7 +33,7 @@
+ 	ltkcpp_xmltext.h	\
+ 	out_ltkcpp.h
+ 
+-LTKCPP_LIB = libltkcpp.a
++LTKCPP_LIB = libltkcpp.so
+ LTKCPP_OBJS = \
+ 	ltkcpp_array.o		\
+ 	ltkcpp_connection.o	\
+@@ -58,7 +57,7 @@
+ 	make all
+ 
+ $(LTKCPP_LIB) : $(LTKCPP_OBJS)
+-	$(AR) crv $(LTKCPP_LIB) $(LTKCPP_OBJS)
++	$(CXX) $(CPPFLAGS) -shared -lxml2 -o $@ $^
+ 
+ $(LTKCPP_OBJS) :  $(LTKCPP_HDRS)
+ 
+@@ -122,7 +121,7 @@
+ clean:
+ 	rm -f *.o *.core core.[0-9]*
+ 	rm -f out_*.inc out_*.h
+-	rm -f *.a
++	rm -f *.so
+ 	cd LLRP.org; make clean
+ 
+ # Handy target to generate code when building with Visual Studio
diff --git a/package/llrp-toolkit/llrp-toolkit-03-ltkcpp-normalize-build-system.patch b/package/llrp-toolkit/llrp-toolkit-03-ltkcpp-normalize-build-system.patch
new file mode 100644
index 0000000..d5587a7
--- /dev/null
+++ b/package/llrp-toolkit/llrp-toolkit-03-ltkcpp-normalize-build-system.patch
@@ -0,0 +1,174 @@
+ltkcpp: normalize build system
+
+ * Use the system provided libxml2
+
+ * Don't override CXX/CPPFLAGS
+
+ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/LTKCPP/Examples/Makefile
+===================================================================
+--- a/LTKCPP/Examples/Makefile
++++ b/LTKCPP/Examples/Makefile
+@@ -18,12 +18,6 @@
+ LIBDIR=../Library
+ INCL = -I$(LIBDIR)
+ 
+-#CPPFLAGS = -O -Wall $(INCL)
+-AR              = ar
+-CXX             = g++
+-CPPFLAGS        = -g -Wall $(INCL)
+-
+-LTKCPP_LIB = $(LIBDIR)/libltkcpp.a
+ LTKCPP_HDRS = \
+ 	$(LIBDIR)/ltkcpp.h		\
+ 	$(LIBDIR)/ltkcpp_base.h		\
+@@ -39,10 +33,10 @@
+ 	make all
+ 
+ example1 : example1.o $(LTKCPP_LIB)
+-	$(CXX) $(CPPFLAGS) -o example1 example1.o $(LTKCPP_LIB)
++	$(CXX) $(CXXFLAGS) -o example1 example1.o -lltkcpp
+ 
+ example1.o : example1.cpp $(LTKCPP_HDRS)
+-	$(CXX) -c $(CPPFLAGS) example1.cpp -o example1.o
++	$(CXX) -c $(CXXFLAGS) example1.cpp -o example1.o
+ 
+ clean:
+ 	rm -f *.o *.core core.[0-9]*
+Index: b/LTKCPP/Library/Makefile
+===================================================================
+--- a/LTKCPP/Library/Makefile
++++ b/LTKCPP/Library/Makefile
+@@ -15,10 +15,6 @@
+ #
+ ############################################################################
+ 
+-#CPPFLAGS = -O -Wall
+-CXX             = g++
+-CPPFLAGS        = -g -Wall -I../../opensource/include/libxml2
+-
+ LLRPDEF         = ../../Definitions/Core/llrp-1x0-def.xml
+ 
+ CODE_GEN_H_XSLT = ltkcpp_gen_h.xslt
+@@ -57,57 +53,57 @@
+ 	make all
+ 
+ $(LTKCPP_LIB) : $(LTKCPP_OBJS)
+-	$(CXX) $(CPPFLAGS) -shared -lxml2 -o $@ $^
++	$(CXX) $(CXXFLAGS) -shared -lxml2 -o $@ $^
+ 
+ $(LTKCPP_OBJS) :  $(LTKCPP_HDRS)
+ 
+ ltkcpp_array.o         : ltkcpp_array.cpp
+-	$(CXX) -c $(CPPFLAGS) ltkcpp_array.cpp \
++	$(CXX) -c $(CXXFLAGS) ltkcpp_array.cpp \
+ 		-o ltkcpp_array.o
+ 
+ ltkcpp_connection.o    : ltkcpp_connection.cpp
+-	$(CXX) -c $(CPPFLAGS) ltkcpp_connection.cpp \
++	$(CXX) -c $(CXXFLAGS) ltkcpp_connection.cpp \
+ 		-o ltkcpp_connection.o
+ 
+ ltkcpp_element.o       : ltkcpp_element.cpp
+-	$(CXX) -c $(CPPFLAGS) ltkcpp_element.cpp \
++	$(CXX) -c $(CXXFLAGS) ltkcpp_element.cpp \
+ 		-o ltkcpp_element.o
+ 
+ ltkcpp_encdec.o        : ltkcpp_encdec.cpp
+-	$(CXX) -c $(CPPFLAGS) ltkcpp_encdec.cpp \
++	$(CXX) -c $(CXXFLAGS) ltkcpp_encdec.cpp \
+ 		-o ltkcpp_encdec.o
+ 
+ ltkcpp_error.o         : ltkcpp_error.cpp
+-	$(CXX) -c $(CPPFLAGS) ltkcpp_error.cpp \
++	$(CXX) -c $(CXXFLAGS) ltkcpp_error.cpp \
+ 		-o ltkcpp_error.o
+ 
+ ltkcpp_framedecode.o   : ltkcpp_framedecode.cpp
+-	$(CXX) -c $(CPPFLAGS) ltkcpp_framedecode.cpp \
++	$(CXX) -c $(CXXFLAGS) ltkcpp_framedecode.cpp \
+ 		-o ltkcpp_framedecode.o
+ 
+ ltkcpp_frameencode.o   : ltkcpp_frameencode.cpp
+-	$(CXX) -c $(CPPFLAGS) ltkcpp_frameencode.cpp \
++	$(CXX) -c $(CXXFLAGS) ltkcpp_frameencode.cpp \
+ 		-o ltkcpp_frameencode.o
+ 
+ ltkcpp_frameextract.o  : ltkcpp_frameextract.cpp
+-	$(CXX) -c $(CPPFLAGS) ltkcpp_frameextract.cpp \
++	$(CXX) -c $(CXXFLAGS) ltkcpp_frameextract.cpp \
+ 		-o ltkcpp_frameextract.o
+ 
+ ltkcpp_hdrfd.o         : ltkcpp_hdrfd.cpp
+-	$(CXX) -c $(CPPFLAGS) ltkcpp_hdrfd.cpp \
++	$(CXX) -c $(CXXFLAGS) ltkcpp_hdrfd.cpp \
+ 		-o ltkcpp_hdrfd.o
+ 
+ ltkcpp_xmltextencode.o : ltkcpp_xmltextencode.cpp
+-	$(CXX) -c $(CPPFLAGS) ltkcpp_xmltextencode.cpp \
++	$(CXX) -c $(CXXFLAGS) ltkcpp_xmltextencode.cpp \
+ 		-o ltkcpp_xmltextencode.o
+ 
+ ltkcpp_typeregistry.o  : ltkcpp_typeregistry.cpp
+-	$(CXX) -c $(CPPFLAGS) ltkcpp_typeregistry.cpp \
++	$(CXX) -c $(CXXFLAGS) ltkcpp_typeregistry.cpp \
+ 		-o ltkcpp_typeregistry.o
+ 
+ ltkcpp_genout.o        : out_ltkcpp.inc out_ltkcpp.h
+ ltkcpp_genout.o        : ltkcpp_genout.cpp
+-	$(CXX) -c $(CPPFLAGS) -Wno-unused ltkcpp_genout.cpp \
++	$(CXX) -c $(CXXFLAGS) -Wno-unused ltkcpp_genout.cpp \
+ 		-o ltkcpp_genout.o
+ 
+ out_ltkcpp.h:  ltkcpp_gen_h.xslt     $(LLRPDEF)
+Index: b/LTKCPP/Tests/Makefile
+===================================================================
+--- a/LTKCPP/Tests/Makefile
++++ b/LTKCPP/Tests/Makefile
+@@ -16,16 +16,7 @@
+ ############################################################################
+ 
+ LIBDIR=../Library
+-XML2DIR=../../opensource/include/libxml2
+-INCL = -I$(LIBDIR) -I$(XML2DIR)
+ 
+-#CPPFLAGS = -O -Wall $(INCL)
+-AR              = ar
+-CXX             = g++
+-CPPFLAGS        = -g -Wall $(INCL)
+-
+-LTKCPP_LIB = $(LIBDIR)/libltkcpp.a
+-XML2_LIB = ../../opensource/lib/libxml2.a
+ LTKCPP_HDRS = \
+ 	$(LIBDIR)/ltkcpp.h		\
+ 	$(LIBDIR)/ltkcpp_base.h		\
+@@ -41,22 +32,22 @@
+ 	make all
+ 
+ xml2llrp : xml2llrp.o $(LTKCPP_LIB) $(XML2_LIB)
+-	$(CXX) $(CPPFLAGS) -o xml2llrp xml2llrp.o $(LTKCPP_LIB) $(XML2_LIB) 
++	$(CXX) $(CXXFLAGS) -o xml2llrp xml2llrp.o -lltkcpp -lxml2
+ 
+ xml2llrp.o : xml2llrp.cpp $(LTKCPP_HDRS)
+-	$(CXX) -c $(CPPFLAGS) xml2llrp.cpp -o xml2llrp.o
++	$(CXX) -c $(CXXFLAGS) xml2llrp.cpp -o xml2llrp.o
+ 
+ llrp2xml : llrp2xml.o $(LTKCPP_LIB)
+-	$(CXX) $(CPPFLAGS) -o llrp2xml llrp2xml.o $(LTKCPP_LIB)
++	$(CXX) $(CXXFLAGS) -o llrp2xml llrp2xml.o -lltkcpp
+ 
+ llrp2xml.o : llrp2xml.cpp $(LTKCPP_HDRS)
+-	$(CXX) -c $(CPPFLAGS) llrp2xml.cpp -o llrp2xml.o
++	$(CXX) -c $(CXXFLAGS) llrp2xml.cpp -o llrp2xml.o
+ 
+ dx201 : dx201.o $(LTKCPP_LIB)
+-	$(CXX) $(CPPFLAGS) -o dx201 dx201.o $(LTKCPP_LIB)
++	$(CXX) $(CXXFLAGS) -o dx201 dx201.o -lltkcpp
+ 
+ dx201.o : dx201.cpp $(LTKCPP_HDRS)
+-	$(CXX) -c $(CPPFLAGS) dx201.cpp -o dx201.o
++	$(CXX) -c $(CXXFLAGS) dx201.cpp -o dx201.o
+ 
+ clean:
+ 	rm -f *.o *.core core.[0-9]*
diff --git a/package/llrp-toolkit/llrp-toolkit-04-ltkcpp-disable-warning.patch b/package/llrp-toolkit/llrp-toolkit-04-ltkcpp-disable-warning.patch
new file mode 100644
index 0000000..964a47f
--- /dev/null
+++ b/package/llrp-toolkit/llrp-toolkit-04-ltkcpp-disable-warning.patch
@@ -0,0 +1,43 @@
+ltkcpp: add -Wno-write-strings to silence warnings
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/LTKCPP/Examples/Makefile
+===================================================================
+--- a/LTKCPP/Examples/Makefile
++++ b/LTKCPP/Examples/Makefile
+@@ -18,6 +18,8 @@
+ LIBDIR=../Library
+ INCL = -I$(LIBDIR)
+ 
++override CXXFLAGS += -Wno-write-strings
++
+ LTKCPP_HDRS = \
+ 	$(LIBDIR)/ltkcpp.h		\
+ 	$(LIBDIR)/ltkcpp_base.h		\
+Index: b/LTKCPP/Library/Makefile
+===================================================================
+--- a/LTKCPP/Library/Makefile
++++ b/LTKCPP/Library/Makefile
+@@ -17,6 +17,8 @@
+ 
+ LLRPDEF         = ../../Definitions/Core/llrp-1x0-def.xml
+ 
++override CXXFLAGS += -Wno-write-strings
++
+ CODE_GEN_H_XSLT = ltkcpp_gen_h.xslt
+ CODE_GEN_CPP_XSLT = ltkcpp_gen_cpp.xslt
+ 
+Index: b/LTKCPP/Tests/Makefile
+===================================================================
+--- a/LTKCPP/Tests/Makefile
++++ b/LTKCPP/Tests/Makefile
+@@ -17,6 +17,8 @@
+ 
+ LIBDIR=../Library
+ 
++override CXXFLAGS += -Wno-write-strings
++
+ LTKCPP_HDRS = \
+ 	$(LIBDIR)/ltkcpp.h		\
+ 	$(LIBDIR)/ltkcpp_base.h		\
diff --git a/package/llrp-toolkit/llrp-toolkit-05-ltkc-shared-library.patch b/package/llrp-toolkit/llrp-toolkit-05-ltkc-shared-library.patch
new file mode 100644
index 0000000..e562d5c
--- /dev/null
+++ b/package/llrp-toolkit/llrp-toolkit-05-ltkc-shared-library.patch
@@ -0,0 +1,26 @@
+ltkc: generate shared library instead of static one
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/LTKC/Library/Makefile
+===================================================================
+--- a/LTKC/Library/Makefile
++++ b/LTKC/Library/Makefile
+@@ -35,7 +35,7 @@
+ 	ltkc_xmltext.h		\
+ 	out_ltkc.h
+ 
+-LTKC_LIB = libltkc.a
++LTKC_LIB = libltkc.so
+ LTKC_OBJS = \
+ 	ltkc_array.o		\
+ 	ltkc_connection.o	\
+@@ -59,7 +59,7 @@
+ 	make all
+ 
+ $(LTKC_LIB) : $(LTKC_OBJS)
+-	$(AR) crv $(LTKC_LIB) $(LTKC_OBJS)
++	$(CC) $(CFLAGS) -shared -o $@ $^
+ 
+ $(LTKC_OBJS) : $(LTKC_HDRS)
+ 
diff --git a/package/llrp-toolkit/llrp-toolkit-06-ltkc-normalize-build-system.patch b/package/llrp-toolkit/llrp-toolkit-06-ltkc-normalize-build-system.patch
new file mode 100644
index 0000000..8bca417
--- /dev/null
+++ b/package/llrp-toolkit/llrp-toolkit-06-ltkc-normalize-build-system.patch
@@ -0,0 +1,163 @@
+ltkc: normalize build system
+
+ * Use system libxml2 instead of the one bundled with llrp-toolkit
+
+ * Do not redefine variables like CC, CFLAGS, etc.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/LTKC/Examples/Makefile
+===================================================================
+--- a/LTKC/Examples/Makefile
++++ b/LTKC/Examples/Makefile
+@@ -18,12 +18,6 @@
+ LIBDIR=../Library
+ INCL = -I$(LIBDIR)
+ 
+-#CFLAGS = -O -Wall $(INCL)
+-AR          = ar
+-CC          = gcc
+-CFLAGS      = -g -Wall $(INCL)
+-
+-LTKC_LIB = $(LIBDIR)/libltkc.a
+ LTKC_HDRS = \
+ 	$(LIBDIR)/ltkc.h		\
+ 	$(LIBDIR)/ltkc_base.h		\
+@@ -39,7 +33,7 @@
+ 	make all
+ 
+ example1 : example1.o $(LTKC_LIB)
+-	$(CC) $(CFLAGS) -o example1 example1.o $(LTKC_LIB)
++	$(CC) $(CFLAGS) -o example1 example1.o -lltkc
+ 
+ example1.o : example1.c $(LTKC_HDRS)
+ 	$(CC) -c $(CFLAGS) example1.c -o example1.o
+Index: b/LTKC/Library/Makefile
+===================================================================
+--- a/LTKC/Library/Makefile
++++ b/LTKC/Library/Makefile
+@@ -15,12 +15,6 @@
+ #
+ ############################################################################
+ 
+-#CFLAGS = -O -Wall
+-AR              = ar
+-CC              = gcc
+-CFLAGS          = -g -Wall
+-CINCLUDES	= -I ../../opensource/include/libxml2
+-
+ LLRPDEF         = ../../Definitions/Core/llrp-1x0-def.xml
+ 
+ CODE_GEN_H_XSLT = ltkc_gen_h.xslt
+@@ -64,56 +58,56 @@
+ $(LTKC_OBJS) : $(LTKC_HDRS)
+ 
+ ltkc_array.o       : ltkc_array.c
+-	$(CC) -c $(CFLAGS) $(CINCLUDES) ltkc_array.c \
++	$(CC) -c $(CFLAGS) ltkc_array.c \
+ 		-o ltkc_array.o
+ 
+ ltkc_connection.o  : ltkc_connection.c
+-	$(CC) -c $(CFLAGS) $(CINCLUDES) ltkc_connection.c \
++	$(CC) -c $(CFLAGS) ltkc_connection.c \
+ 		-o ltkc_connection.o
+ 
+ ltkc_element.o     : ltkc_element.c
+-	$(CC) -c $(CFLAGS) $(CINCLUDES) ltkc_element.c \
++	$(CC) -c $(CFLAGS) ltkc_element.c \
+ 		-o ltkc_element.o
+ 
+ ltkc_encdec.o      : ltkc_encdec.c
+-	$(CC) -c $(CFLAGS) $(CINCLUDES) ltkc_encdec.c \
++	$(CC) -c $(CFLAGS) ltkc_encdec.c \
+ 		-o ltkc_encdec.o
+ 
+ ltkc_error.o       : ltkc_error.c
+-	$(CC) -c $(CFLAGS) $(CINCLUDES) ltkc_error.c \
++	$(CC) -c $(CFLAGS) ltkc_error.c \
+ 		-o ltkc_error.o
+ 
+ ltkc_framedecode.o : ltkc_framedecode.c
+-	$(CC) -c $(CFLAGS) $(CINCLUDES) ltkc_framedecode.c \
++	$(CC) -c $(CFLAGS) ltkc_framedecode.c \
+ 		-o ltkc_framedecode.o
+ 
+ ltkc_frameencode.o : ltkc_frameencode.c
+-	$(CC) -c $(CFLAGS) $(CINCLUDES) ltkc_frameencode.c \
++	$(CC) -c $(CFLAGS) ltkc_frameencode.c \
+ 		-o ltkc_frameencode.o
+ 
+ ltkc_frameextract.o : ltkc_frameextract.c
+-	$(CC) -c $(CFLAGS) $(CINCLUDES) ltkc_frameextract.c \
++	$(CC) -c $(CFLAGS) ltkc_frameextract.c \
+ 		-o ltkc_frameextract.o
+ 
+ ltkc_hdrfd.o       : ltkc_hdrfd.c
+-	$(CC) -c $(CFLAGS) $(CINCLUDES) ltkc_hdrfd.c \
++	$(CC) -c $(CFLAGS) ltkc_hdrfd.c \
+ 		-o ltkc_hdrfd.o
+ 
+ ltkc_xmltextdecode.o : ltkc_xmltextdecode.c
+-	$(CC) -c $(CFLAGS) $(CINCLUDES) ltkc_xmltextdecode.c \
++	$(CC) -c $(CFLAGS) ltkc_xmltextdecode.c \
+ 		-o ltkc_xmltextdecode.o
+ 
+ ltkc_xmltextencode.o : ltkc_xmltextencode.c
+-	$(CC) -c $(CFLAGS) $(CINCLUDES) ltkc_xmltextencode.c \
++	$(CC) -c $(CFLAGS) ltkc_xmltextencode.c \
+ 		-o ltkc_xmltextencode.o
+ 
+ ltkc_typeregistry.o : ltkc_typeregistry.c
+-	$(CC) -c $(CFLAGS) $(CINCLUDES) ltkc_typeregistry.c \
++	$(CC) -c $(CFLAGS) ltkc_typeregistry.c \
+ 		-o ltkc_typeregistry.o
+ 
+ ltkc_genout.o      : out_ltkc.inc out_ltkc.h
+ ltkc_genout.o      : ltkc_genout.c
+-	$(CC) -c $(CFLAGS) $(CINCLUDES) -Wno-unused ltkc_genout.c \
++	$(CC) -c $(CFLAGS) -Wno-unused ltkc_genout.c \
+ 		-o ltkc_genout.o
+ 
+ out_ltkc.h: ltkc_gen_h.xslt $(LLRPDEF)
+Index: b/LTKC/Tests/Makefile
+===================================================================
+--- a/LTKC/Tests/Makefile
++++ b/LTKC/Tests/Makefile
+@@ -16,16 +16,8 @@
+ ############################################################################
+ 
+ LIBDIR=../Library
+-XML2DIR=../../opensource/include/libxml2
+-INCL = -I$(LIBDIR) -I$(XML2DIR)
++INCL = -I$(LIBDIR)
+ 
+-#CFLAGS = -O -Wall $(INCL)
+-AR          = ar
+-CC          = gcc
+-CFLAGS      = -g -Wall $(INCL)
+-
+-LTKC_LIB = $(LIBDIR)/libltkc.a
+-XML2_LIB = ../../opensource/lib/libxml2.a
+ LTKC_HDRS = \
+ 	$(LIBDIR)/ltkc.h		\
+ 	$(LIBDIR)/ltkc_base.h		\
+@@ -44,16 +36,16 @@
+ 	$(CC) -c $(CFLAGS) llrp2xml.c -o llrp2xml.o
+ 
+ llrp2xml : llrp2xml.o $(LTKC_LIB)
+-	$(CC) $(CFLAGS) -o llrp2xml llrp2xml.o $(LTKC_LIB) $(XML2_LIB)
++	$(CC) $(CFLAGS) -o llrp2xml llrp2xml.o -lltkc
+ 
+ xml2llrp.o : xml2llrp.c $(LTKC_HDRS)
+ 	$(CC) -c $(CFLAGS) xml2llrp.c -o xml2llrp.o
+ 
+ xml2llrp : xml2llrp.o $(LTKC_LIB) $(XML2_LIB)
+-	$(CC) $(CFLAGS) -o xml2llrp xml2llrp.o $(LTKC_LIB) $(XML2_LIB)
++	$(CC) $(CFLAGS) -o xml2llrp xml2llrp.o -lltkc -lxml2
+ 
+ dx201 : dx201.o $(LTKC_LIB)
+-	$(CC) $(CFLAGS) -o dx201 dx201.o $(LTKC_LIB)
++	$(CC) $(CFLAGS) -o dx201 dx201.o -lltkc
+ 
+ dx201.o : dx201.c $(LTKC_HDRS)
+ 	$(CC) -c $(CFLAGS) dx201.c -o dx201.o
diff --git a/package/llrp-toolkit/llrp-toolkit.mk b/package/llrp-toolkit/llrp-toolkit.mk
new file mode 100644
index 0000000..8c98065
--- /dev/null
+++ b/package/llrp-toolkit/llrp-toolkit.mk
@@ -0,0 +1,77 @@
+#############################################################
+#
+# llrp-toolkit
+#
+#############################################################
+
+LLRP_TOOLKIT_VERSION = 1.0.0.8
+LLRP_TOOLKIT_SOURCE = llrp-toolkit-$(LLRP_TOOLKIT_VERSION).tar.gz
+LLRP_TOOLKIT_SITE = "http://llrp-toolkit.cvs.sourceforge.net/viewvc/llrp-toolkit/LTK/?view=tar&pathrev=ltkcpp_1_0_0_8"
+LLRP_TOOLKIT_INSTALL_STAGING = YES
+LLRP_TOOLKIT_DEPENDENCIES = host-libxslt libxml2
+
+ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
+define LLRP_TOOLKIT_BUILD_CPP_LIBRARY
+	$(TARGET_CONFIGURE_OPTS) \
+	CXXFLAGS="$(TARGET_CXXFLAGS) -I$(STAGING_DIR)/usr/include/libxml2" \
+	$(MAKE) -C $(@D)/LTKCPP/Library
+endef
+endif
+
+define LLRP_TOOLKIT_BUILD_C_LIBRARY
+	$(TARGET_CONFIGURE_OPTS) \
+	CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include/libxml2" \
+	$(MAKE) -C $(@D)/LTKC/Library
+endef
+
+define LLRP_TOOLKIT_BUILD_CMDS
+	$(LLRP_TOOLKIT_BUILD_CPP_LIBRARY)
+	$(LLRP_TOOLKIT_BUILD_C_LIBRARY)
+endef
+
+ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
+define LLRP_TOOLKIT_INSTALL_STAGING_CPP_LIBRARY
+	$(INSTALL) -D -m 0755 $(@D)/LTKCPP/Library/libltkcpp.so $(STAGING_DIR)/usr/lib/libltkcpp.so
+	for header in $(@D)/LTKCPP/Library/*.h; do \
+		$(INSTALL) -D -m 0644 $${header} $(STAGING_DIR)/usr/include/ltkcpp/`basename $${header}` ; \
+	done
+endef
+endif
+
+define LLRP_TOOLKIT_INSTALL_STAGING_C_LIBRARY
+	$(INSTALL) -D -m 0755 $(@D)/LTKC/Library/libltkc.so $(STAGING_DIR)/usr/lib/libltkc.so
+	for header in $(@D)/LTKC/Library/*.h; do \
+		$(INSTALL) -D -m 0644 $${header} $(STAGING_DIR)/usr/include/ltkc/`basename $${header}` ; \
+	done
+endef
+
+define LLRP_TOOLKIT_INSTALL_STAGING_CMDS
+	$(LLRP_TOOLKIT_INSTALL_STAGING_CPP_LIBRARY)
+	$(LLRP_TOOLKIT_INSTALL_STAGING_C_LIBRARY)
+endef
+
+ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
+define LLRP_TOOLKIT_INSTALL_TARGET_CPP_LIBRARY
+	$(INSTALL) -D -m 0755 $(@D)/LTKCPP/Library/libltkcpp.so $(TARGET_DIR)/usr/lib/libltkcpp.so
+endef
+endif
+
+define LLRP_TOOLKIT_INSTALL_TARGET_C_LIBRARY
+	$(INSTALL) -D -m 0755 $(@D)/LTKC/Library/libltkc.so $(TARGET_DIR)/usr/lib/libltkc.so
+endef
+
+define LLRP_TOOLKIT_INSTALL_TARGET_CMDS
+	$(LLRP_TOOLKIT_INSTALL_TARGET_CPP_LIBRARY)
+	$(LLRP_TOOLKIT_INSTALL_TARGET_C_LIBRARY)
+endef
+
+$(eval $(call GENTARGETS))
+
+# Override the download step since we don't have the normal
+# site/source split (where site is the URL of the directory and source
+# is the name of the tarball file).
+$(LLRP_TOOLKIT_DIR)/.stamp_downloaded:
+	$(Q)$(call MESSAGE,"Downloading")
+	$(call DOWNLOAD,$(LLRP_TOOLKIT_SITE),$(LLRP_TOOLKIT_SOURCE))
+	$(Q)mkdir -p $(@D)
+	$(Q)touch $@
-- 
1.7.9.5
