From: Thomas Claveirole <thomas.claveirole@green-communications.fr>
Date: Fri, 29 May 2015 18:15:10 +0200
Subject: [Buildroot] [PATCH v3 1/2] libfcgi (0003-link-against-math.patch):
	Do actually link when needed.
In-Reply-To: <55679467.7090801@mind.be>
References: <55679467.7090801@mind.be>
Message-ID: <1432916111-1122-1-git-send-email-thomas.claveirole@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libfcgi uses frexp() and thus should link with libm, but fails to do
so.  Thus link errors with programs that use libfcgi (the bug does
appear only with uClibc, because the GNU libc provides frexp()
directly in libc.so).  Modify 0003-link-against-math.patch so libfcgi
links against math, instead of programs that need it.

Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>
---
 package/libfcgi/0003-link-against-math.patch | 36 ++++++++++------------------
 1 file changed, 12 insertions(+), 24 deletions(-)

diff --git a/package/libfcgi/0003-link-against-math.patch b/package/libfcgi/0003-link-against-math.patch
index 4c87ea6..c60c6d5 100644
--- a/package/libfcgi/0003-link-against-math.patch
+++ b/package/libfcgi/0003-link-against-math.patch
@@ -1,28 +1,16 @@
-Link against math libraries when needed
+Link libfcgi against the math library.
 
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>
 
-Index: b/cgi-fcgi/Makefile.am
+Index: b/libfcgi/Makefile.am
 ===================================================================
---- a/cgi-fcgi/Makefile.am
-+++ b/cgi-fcgi/Makefile.am
-@@ -11,5 +11,5 @@
- LIBDIR      = ../libfcgi
- LIBFCGI     = $(LIBDIR)/libfcgi.la
+--- a/libfcgi/Makefile.am
++++ b/libfcgi/Makefile.am
+@@ -18,6 +18,7 @@
+                      os_ at SYSTEM@.c
+ libfcgi_la_CC      = @PTHREAD_CC@
+ libfcgi_la_CFLAGS  = @PTHREAD_CFLAGS@
++libfcgi_la_LIBADD  = -lm
  
--LDADD = $(LIBFCGI)
-+LDADD = $(LIBFCGI) -lm
- cgi_fcgi_SOURCES = $(INCLUDE_FILES) cgi-fcgi.c
-Index: b/examples/Makefile.am
-===================================================================
---- a/examples/Makefile.am
-+++ b/examples/Makefile.am
-@@ -21,7 +21,7 @@
- LIBDIR      = ../libfcgi
- LIBFCGI     = $(LIBDIR)/libfcgi.la
- 
--LDADD = $(LIBFCGI)
-+LDADD = $(LIBFCGI) -lm
- 
- echo_SOURCES       = $(INCLUDE_FILES) echo.c
- echo_x_SOURCES     = $(INCLUDE_FILES) echo-x.c
+ libfcgi___la_SOURCES = $(INCLUDE_FILES)       \
+                        $(INCLUDEDIR)/fcgio.h  \
-- 
2.1.4
