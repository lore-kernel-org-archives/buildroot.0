From: Baruch Siach <baruch@tkos.co.il>
Date: Fri,  6 Feb 2015 09:45:14 +0200
Subject: [Buildroot] [PATCH] sdparm: remove include of host headers
Message-ID: <4fdbba5cd058d2c0618e5982f44e5aca9ee6b308.1423208714.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/458/458b3da912b977335ac292fa7adddfb85961557a/
http://autobuild.buildroot.net/results/ead/ead9c1d354e9beebdcb892ded2d63b8d3bc3eb51/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 .../0000-makefile-remove-host-headers-include.patch   | 19 +++++++++++++++++++
 package/sdparm/sdparm.mk                              |  3 +++
 2 files changed, 22 insertions(+)
 create mode 100644 package/sdparm/0000-makefile-remove-host-headers-include.patch

diff --git a/package/sdparm/0000-makefile-remove-host-headers-include.patch b/package/sdparm/0000-makefile-remove-host-headers-include.patch
new file mode 100644
index 000000000000..765a81d16bc1
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
index 4aff25db264c..9fc20674d09f 100644
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
-- 
2.1.4
