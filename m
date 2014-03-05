From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 5 Mar 2014 15:30:00 +0000
Subject: [Buildroot] [PATCH 1/2] cups: fix static linking
Message-ID: <1394033401-23331-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Append -lz to the cups linking libs to fix a problem like this one:

../cups/libcups.a(file.o): In function `cupsFileSeek':
/home/test/test/1/output/build/cups-1.3.11/cups/file.c:1444: undefined
reference to `inflateEnd'
collect2: error: ld returned 1 exit status
make[2]: *** [ipp] Error 1
make[2]: *** Waiting for unfinished jobs....

This solution is the same used upstream in newer versions.

Fixes:
   http://autobuild.buildroot.net/results/f3d/f3d4f67ce7ee1d54f5bd4c87dfddb7417db614e5/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/cups/cups-0001-fix-static.patch |   28 ++++++++++++++++++++++++++++
 1 files changed, 28 insertions(+), 0 deletions(-)
 create mode 100644 package/cups/cups-0001-fix-static.patch

diff --git a/package/cups/cups-0001-fix-static.patch b/package/cups/cups-0001-fix-static.patch
new file mode 100644
index 0000000..4c9d0d4
--- /dev/null
+++ b/package/cups/cups-0001-fix-static.patch
@@ -0,0 +1,28 @@
+cups: fix static linking
+
+Append -lz to the cups linking libs to fix a problem like this one:
+
+../cups/libcups.a(file.o): In function `cupsFileSeek':
+/home/test/test/1/output/build/cups-1.3.11/cups/file.c:1444: undefined 
+reference to `inflateEnd'
+collect2: error: ld returned 1 exit status
+make[2]: *** [ipp] Error 1
+make[2]: *** Waiting for unfinished jobs....
+
+This solution is the same used upstream in newer versions.
+
+Fixes:
+   http://autobuild.buildroot.net/results/f3d/f3d4f67ce7ee1d54f5bd4c87dfddb7417db614e5/
+
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+--- cups-1.3.11/Makedefs.in.orig	2014-03-05 13:28:10.175437880 +0000
++++ cups-1.3.11/Makedefs.in	2014-03-05 13:28:35.398845162 +0000
+@@ -132,7 +132,7 @@ LDFLAGS		=	-L../cups -L../filter @LDARCH
+ LEGACY_BACKENDS	=	@LEGACY_BACKENDS@
+ LIBCUPSORDER	=	@LIBCUPSORDER@
+ LIBCUPSIMAGEORDER =	@LIBCUPSIMAGEORDER@
+-LINKCUPS	=	@LINKCUPS@ $(SSLLIBS)
++LINKCUPS	=	@LINKCUPS@ $(SSLLIBS) $(LIBZ)
+ LINKCUPSIMAGE	=	@LINKCUPSIMAGE@
+ LIBS		=	$(LINKCUPS) $(COMMONLIBS)
+ OPTIM		=	@OPTIM@
-- 
1.7.1
