From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 25 Jan 2015 19:21:51 +0100
Subject: [Buildroot] [git commit] cgic: new package
Message-ID: <20150125190116.05117800BD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5bda8c9681e4da5239b83558d6d38061206e2436
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Dave Bender <bender@benegon.com>
Signed-off-by: David Bender <codehero@gmail.com>
[yann.morin.1998 at free.fr: simplify rules to use -C $(@D); do not install
 in target/ ; add description to patches; split patches into independent
 changes; add hash]
[Thomas: fix minor typos in patch description.]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                  |    1 +
 package/cgic/0001-prepare_makefile.patch           |   44 +++++++++++++++
 package/cgic/0002-file_enhancements.patch          |   56 ++++++++++++++++++++
 .../0003-restore-cgiFormFileGetTempfileName.patch  |   43 +++++++++++++++
 package/cgic/Config.in                             |    6 ++
 package/cgic/cgic.hash                             |    2 +
 package/cgic/cgic.mk                               |   25 +++++++++
 7 files changed, 177 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 0f6addc..043a350 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -819,6 +819,7 @@ menu "Networking"
 	source "package/agentpp/Config.in"
 	source "package/c-ares/Config.in"
 	source "package/canfestival/Config.in"
+	source "package/cgic/Config.in"
 	source "package/cppzmq/Config.in"
 	source "package/czmq/Config.in"
 	source "package/filemq/Config.in"
diff --git a/package/cgic/0001-prepare_makefile.patch b/package/cgic/0001-prepare_makefile.patch
new file mode 100644
index 0000000..15adc4c
--- /dev/null
+++ b/package/cgic/0001-prepare_makefile.patch
@@ -0,0 +1,44 @@
+Makefile: fix for cross-compilation
+
+Probably-Signed-off-by: Dave Bender <bender@benegon.com>
+[yann.morin.1998 at free.fr: patch was made by Dave, but he
+ forgot his SoB line, so I added it]
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
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
diff --git a/package/cgic/0002-file_enhancements.patch b/package/cgic/0002-file_enhancements.patch
new file mode 100644
index 0000000..a6f82fc
--- /dev/null
+++ b/package/cgic/0002-file_enhancements.patch
@@ -0,0 +1,56 @@
+Create better temporary files.
+
+Probably-Signed-off-by: Dave Bender <bender@benegon.com>
+[yann.morin.1998 at free.fr: patch was made by Dave, but he
+ forgot his SoB line, so I added it; split the patch in two
+  independent fixes]
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+diff -rupN cgic206/cgic.c cgic206_tempfile/cgic.c
+--- cgic206/cgic.c	2014-03-16 18:17:11.000000000 -0400
++++ cgic206_tempfile/cgic.c	2015-01-21 11:58:45.436384908 -0500
+@@ -22,6 +22,8 @@
+ #define CGICDEBUGEND
+ #endif /* CGICDEBUG */
+ 
++#define _GNU_SOURCE
++
+ #include <stdio.h>
+ #include <string.h>
+ #include <ctype.h>
+@@ -34,11 +36,11 @@
+ #include <io.h>
+ 
+ /* cgic 2.01 */
+-#include <fcntl.h>
+ 
+ #else
+ #include <unistd.h>
+ #endif /* WIN32 */
++#include <fcntl.h>
+ #include "cgic.h"
+ 
+ #define cgiStrEq(a, b) (!strcmp((a), (b)))
+@@ -636,16 +638,17 @@ static cgiParseResultType getTempFileNam
+ 		window between the file's creation and the
+ 		chmod call (glibc 2.0.6 and lower might
+ 		otherwise have allowed this). */
++	mode_t umode;
+ 	int outfd; 
++	umode = umask(0600);
+ 	strcpy(tfileName, cgicTempDir "/cgicXXXXXX");
+-	outfd = mkstemp(tfileName);
++	outfd = mkostemp(tfileName, O_CLOEXEC | O_NOATIME);
++	umask(umode);
+ 	if (outfd == -1) {
+ 		return cgiParseIO;
+ 	}
+-	close(outfd);
+-	/* Fix the permissions */
+-	if (chmod(tfileName, 0600) != 0) {
+-		unlink(tfileName);
++
++	if (close(outfd)) {
+ 		return cgiParseIO;
+ 	}
+ #else
diff --git a/package/cgic/0003-restore-cgiFormFileGetTempfileName.patch b/package/cgic/0003-restore-cgiFormFileGetTempfileName.patch
new file mode 100644
index 0000000..f66227b
--- /dev/null
+++ b/package/cgic/0003-restore-cgiFormFileGetTempfileName.patch
@@ -0,0 +1,43 @@
+Restore lost functionality
+
+Probably-Signed-off-by: Dave Bender <bender@benegon.com>
+[yann.morin.1998 at free.fr: patch was made by Dave, but he
+ forgot his SoB line, so I added it]
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+diff -rupN cgic206/cgic.c cgic206_tempfile/cgic.c
+--- cgic206/cgic.c	2014-03-16 18:17:11.000000000 -0400
++++ cgic206_tempfile/cgic.c	2015-01-21 11:58:45.436384908 -0500
+@@ -1278,6 +1278,20 @@ cgiFormResultType cgiFormFileContentType
+ 	}
+ }
+ 
++const char* cgiFormFileGetTempfileName(
++	char* name)
++{
++	cgiFormEntry *e;
++	e = cgiFormEntryFindFirst(name);
++	if (!e) {
++		return NULL;
++	} else if (!strlen(e->tfileName)) {
++		return NULL;
++	} else {
++		return e->tfileName;
++	}
++}
++
+ cgiFormResultType cgiFormFileSize(
+ 	char *name, int *sizeP)
+ {
+diff -rupN cgic206/cgic.h cgic206_tempfile/cgic.h
+--- cgic206/cgic.h	2014-03-16 18:17:11.000000000 -0400
++++ cgic206_tempfile/cgic.h	2015-01-21 11:53:02.915148026 -0500
+@@ -141,6 +141,8 @@ extern cgiFormResultType cgiFormRadio(
+ 	char *name, char **valuesText, int valuesTotal, 
+ 	int *result, int defaultV);	
+ 
++extern const char* cgiFormFileGetTempfileName(char* name);
++
+ /* The paths returned by this function are the original names of files
+ 	as reported by the uploading web browser and shoult NOT be
+ 	blindly assumed to be "safe" names for server-side use! */
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
diff --git a/package/cgic/cgic.hash b/package/cgic/cgic.hash
new file mode 100644
index 0000000..6c0fee6
--- /dev/null
+++ b/package/cgic/cgic.hash
@@ -0,0 +1,2 @@
+# Localy computed
+sha256  9562e0b6af59ebc2090107eab5946ce0788a1de36146ad181970cf53e9be7a33  cgic206.tar.gz
diff --git a/package/cgic/cgic.mk b/package/cgic/cgic.mk
new file mode 100644
index 0000000..f07c62e
--- /dev/null
+++ b/package/cgic/cgic.mk
@@ -0,0 +1,25 @@
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
+# Installs only a static library and a header file
+CGIC_INSTALL_STAGING = YES
+CGIC_INSTALL_TARGET = NO
+
+define CGIC_BUILD_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) libcgic.a
+endef
+
+define CGIC_INSTALL_STAGING_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) PREFIX=$(STAGING_DIR) -C $(@D) install
+endef
+
+$(eval $(generic-package))
