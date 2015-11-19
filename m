From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Nov 2015 17:34:04 +0100
Subject: [Buildroot] [PATCH] xapp_sessreg: fix build issue with gcc 5
Message-ID: <1447950844-14511-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Backport an upstream commit that fixes the build of xapp_sessreg with
gcc 5.

Fixes:

  http://autobuild.buildroot.org/results/ec0/ec01564854f0738df05b8d995d9f0db396a0e5a8/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...he-preprocessor-when-generating-filenames.patch | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 package/x11r7/xapp_sessreg/0001-Pass-P-to-the-preprocessor-when-generating-filenames.patch

diff --git a/package/x11r7/xapp_sessreg/0001-Pass-P-to-the-preprocessor-when-generating-filenames.patch b/package/x11r7/xapp_sessreg/0001-Pass-P-to-the-preprocessor-when-generating-filenames.patch
new file mode 100644
index 0000000..5c3e91a
--- /dev/null
+++ b/package/x11r7/xapp_sessreg/0001-Pass-P-to-the-preprocessor-when-generating-filenames.patch
@@ -0,0 +1,32 @@
+From 93f5d5abf6b214a4b36e00cd09174d24b2ed0a6d Mon Sep 17 00:00:00 2001
+From: Stefan Dirsch <sndirsch@suse.de>
+Date: Wed, 9 Sep 2015 23:44:06 +0200
+Subject: [PATCH] Pass -P to the preprocessor when generating filenames for the
+ manpage.
+
+Fixes build with GCC 5. Patch by Richard Biener <rguenther@suse.com>
+
+Tested-by: Matt Turner <mattst88@gmail.com>
+Signed-off-by: Matt Turner <mattst88@gmail.com>
+[Thomas: backport from upstream commit 93f5d5abf6b214a4b36e00cd09174d24b2ed0a6d]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ man/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/man/Makefile.am b/man/Makefile.am
+index 665ace5..2e5f146 100644
+--- a/man/Makefile.am
++++ b/man/Makefile.am
+@@ -9,7 +9,7 @@ SUFFIXES = .$(APP_MAN_SUFFIX) .man
+ 
+ AM_CPPFLAGS = -I$(top_builddir) -I$(top_srcdir)
+ filenames.sed: filenames.sed.c
+-	$(AM_V_GEN)$(CPP) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) \
++	$(AM_V_GEN)$(CPP) -P $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) \
+ 	    $(AM_CPPFLAGS) $(CPPFLAGS) $(srcdir)/filenames.sed.c | \
+ 	    $(SED) -n -e '/s|__/ p' -e '/^\/__/ p' > $@
+ 
+-- 
+2.6.3
+
-- 
2.6.3
