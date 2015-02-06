From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 6 Feb 2015 10:36:34 +0100
Subject: [Buildroot] [git commit] sdparm: remove include of host headers
Message-ID: <20150206094122.9407B7FC3B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6240f33bec63546d419019be52105c408b0557dd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/458/458b3da912b977335ac292fa7adddfb85961557a/
http://autobuild.buildroot.net/results/ead/ead9c1d354e9beebdcb892ded2d63b8d3bc3eb51/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...0000-makefile-remove-host-headers-include.patch |   19 +++++++++++++++++++
 package/sdparm/sdparm.mk                           |    3 +++
 2 files changed, 22 insertions(+), 0 deletions(-)

diff --git a/package/sdparm/0000-makefile-remove-host-headers-include.patch b/package/sdparm/0000-makefile-remove-host-headers-include.patch
new file mode 100644
index 0000000..765a81d
--- /dev/null
+++ b/package/sdparm/0000-makefile-remove-host-headers-include.patch
@@ -0,0 +1,19 @@
+src/Makefile.am: remove host headers incdlue
+
+Using host headers is bad for cross compilation. Instead, use the '=' prefix
+which expands to the current sysroot.
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+diff -Nuar sdparm-1.09-orig/src/Makefile.am sdparm-1.09/src/Makefile.am
+--- sdparm-1.09-orig/src/Makefile.am	2014-09-23 18:48:44.000000000 +0300
++++ sdparm-1.09/src/Makefile.am	2015-02-06 09:33:43.693477667 +0200
+@@ -41,7 +41,7 @@
+ 			../lib/sg_pt_common.c
+ 
+ if HAVE_SGUTILS
+-INCLUDES = -I/usr/include/scsi
++INCLUDES = -I=/scsi
+ sdparm_LDADD = @GETOPT_O_FILES@ @os_libs@ @SGUTILS_LIBS@
+ sdparm_DEPENDENCIES = @GETOPT_O_FILES@
+ else
diff --git a/package/sdparm/sdparm.mk b/package/sdparm/sdparm.mk
index 4aff25d..9fc2067 100644
--- a/package/sdparm/sdparm.mk
+++ b/package/sdparm/sdparm.mk
@@ -10,6 +10,9 @@ SDPARM_SITE = http://sg.danny.cz/sg/p
 SDPARM_LICENSE = BSD-3c
 SDPARM_LICENSE_FILES = COPYING
 
+# Patching src/Makefile.am
+SDPARM_AUTORECONF = YES
+
 ifeq ($(BR2_PACKAGE_SG3_UTILS),y)
 SDPARM_DEPENDENCIES += sg3_utils
 else
