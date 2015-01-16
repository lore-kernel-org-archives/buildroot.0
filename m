From: David Bender <codehero@gmail.com>
Date: Fri, 16 Jan 2015 11:23:35 -0500
Subject: [Buildroot] [PATCH 1/1] cgic: new package
Message-ID: <1421425415-6601-1-git-send-email-codehero@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added cgic library.

Signed-off-by: Dave Bender <bender@benegon.com>
---
 package/Config.in                             |    1 +
 package/cgic/Config.in                        |    6 ++++
 package/cgic/cgic-0000-prepare_makefile.patch |   40 +++++++++++++++++++++++++
 package/cgic/cgic.mk                          |   36 ++++++++++++++++++++++
 4 files changed, 83 insertions(+), 0 deletions(-)
 create mode 100644 package/cgic/Config.in
 create mode 100644 package/cgic/cgic-0000-prepare_makefile.patch
 create mode 100644 package/cgic/cgic.mk

diff --git a/package/Config.in b/package/Config.in
index 266de13..a6fa27d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -816,6 +816,7 @@ menu "Networking"
 	source "package/agentpp/Config.in"
 	source "package/c-ares/Config.in"
 	source "package/canfestival/Config.in"
+	source "package/cgic/Config.in"
 	source "package/cppzmq/Config.in"
 	source "package/czmq/Config.in"
 	source "package/filemq/Config.in"
diff --git a/package/cgic/Config.in b/package/cgic/Config.in
new file mode 100644
index 0000000..402460d
--- /dev/null
+++ b/package/cgic/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_CGIC
+	bool "cgic"
+	help
+	  C CGI library
+
+	  http://www.boutell.com/cgic/
diff --git a/package/cgic/cgic-0000-prepare_makefile.patch b/package/cgic/cgic-0000-prepare_makefile.patch
new file mode 100644
index 0000000..46b7a81
--- /dev/null
+++ b/package/cgic/cgic-0000-prepare_makefile.patch
@@ -0,0 +1,40 @@
+Binary files cgic206/cgic.o and cgic206-br/cgic.o differ
+Binary files cgic206/libcgic.a and cgic206-br/libcgic.a differ
+diff -rupN cgic206/Makefile cgic206-br/Makefile
+--- cgic206/Makefile	2014-03-16 18:17:11.000000000 -0400
++++ cgic206-br/Makefile	2015-01-16 11:18:03.714874000 -0500
+@@ -1,15 +1,14 @@
+-CFLAGS=-g -Wall
+-CC=gcc
+-AR=ar
+-RANLIB=ranlib
+ LIBS=-L./ -lcgic
+ 
+ all: libcgic.a cgictest.cgi capture
+ 
+ install: libcgic.a
+-	cp libcgic.a /usr/local/lib
+-	cp cgic.h /usr/local/include
+-	@echo libcgic.a is in /usr/local/lib. cgic.h is in /usr/local/include.
++	cp libcgic.a $(PREFIX)/usr/lib
++	cp cgic.h $(PREFIX)/usr/include
++	@echo libcgic.a is in $(PREFIX)/usr/lib. cgic.h is in $(PREFIX)/usr/include.
++
++cgi.o: cgic.c cgic.h
++	$(CC) $(CFLAGS) cgic.c -o cgic.o
+ 
+ libcgic.a: cgic.o cgic.h
+ 	rm -f libcgic.a
+@@ -19,10 +18,10 @@ libcgic.a: cgic.o cgic.h
+ #mingw32 and cygwin users: replace .cgi with .exe
+ 
+ cgictest.cgi: cgictest.o libcgic.a
+-	gcc cgictest.o -o cgictest.cgi ${LIBS}
++	$(CC) cgictest.o -o cgictest.cgi ${LIBS}
+ 
+ capture: capture.o libcgic.a
+-	gcc capture.o -o capture ${LIBS}
++	$(CC) capture.o -o capture ${LIBS}
+ 
+ clean:
+ 	rm -f *.o *.a cgictest.cgi capture
diff --git a/package/cgic/cgic.mk b/package/cgic/cgic.mk
new file mode 100644
index 0000000..378e1cd
--- /dev/null
+++ b/package/cgic/cgic.mk
@@ -0,0 +1,36 @@
+################################################################################
+#
+# cgic
+#
+################################################################################
+
+CGIC_VERSION = 2.06
+CGIC_SOURCE = cgic206.tar.gz
+CGIC_SITE = http://boutell.com/cgic
+CGIC_LICENSE = Custom
+CGIC_LICENSE_FILES = license.txt
+
+CGIC_ENV = AR=$(TARGET_CROSS)ar \
+	CC=$(TARGET_CROSS)gcc \
+	RANLIB=$(TARGET_CROSS)ranlib
+
+define CGIC_BUILD_CMDS
+	(cd $(@D); \
+		$(CGIC_ENV) \
+		make libcgic.a \
+		)
+endef
+
+define CGIC_INSTALL_STAGING_CMDS
+	(cd $(@D); \
+		PREFIX=$(STAGING_DIR) make install \
+		)
+endef
+
+define CGIC_INSTALL_TARGET_CMDS
+	(cd $(@D); \
+		PREFIX=$(TARGET_DIR) make install \
+		)
+endef
+
+$(eval $(generic-package))
-- 
1.7.8.6
