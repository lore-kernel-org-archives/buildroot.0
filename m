From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 4 Nov 2010 17:15:18 +0100
Subject: [Buildroot] [git commit master 1/1] lsof: stop overriding CFLAGS in
	build
Message-ID: <20101104161748.EC2E68DAC1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=44b170e104a6acc527fbcaee19ce63e8e51ea279
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #2767

lsof compile breaks if CFLAGS overridden in 'make' command line
which is the case since buildroot-2010.08.

lsof has a partial fix for this already in the form of the
'LSOF_CFLAGS_OVERRIDE=1' configure option; however this only
fixes the problem in the generation of the Makefile for liblsof.

This patch does two things: it extends the 'LSOF_CFLAGS_OVERRIDE=1'
configure option to also cover the main Makefile; it also patches
lsof.mk to make use of the LSOF_CFLAGS_OVERRIDE option.

Signed-off-by: Andy Gibbs <andyg1001@hotmail.co.uk>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                 |    1 +
 package/lsof/lsof-override-cflags.patch |   13 +++++++++++++
 package/lsof/lsof.mk                    |    2 +-
 3 files changed, 15 insertions(+), 1 deletions(-)
 create mode 100644 package/lsof/lsof-override-cflags.patch

diff --git a/CHANGES b/CHANGES
index e436f87..6ca25bd 100644
--- a/CHANGES
+++ b/CHANGES
@@ -70,6 +70,7 @@
 	#2563: [PATCH] cairo: Expose the configure option to disable some...
 	#2581: libmms: Update to 0.6, and patch to work on architectures...
 	#2707: Can't compile linux kernel using buildroot + crosstool-ng
+	#2767: Build for lsof broken in buildroot-2010.08
 
 2010.08: Released August 31th, 2010:
 
diff --git a/package/lsof/lsof-override-cflags.patch b/package/lsof/lsof-override-cflags.patch
new file mode 100644
index 0000000..fcb9292
--- /dev/null
+++ b/package/lsof/lsof-override-cflags.patch
@@ -0,0 +1,13 @@
+--- lsof_4.81/lsof_4.81_src/Configure	2008-10-21 18:21:45.000000000 +0200
++++ lsof_4.81/lsof_4.81_src/Configure	2010-11-03 14:00:00.000000000 +0100
+@@ -5206,6 +5206,10 @@
+   cp $LSOF_MKFC ${LSOF_LIB}/$LSOF_LIBMKF
+ fi	# }
+ cat ./dialects/$LSOF_DIALECT_DIR/$LSOF_REST >> $LSOF_MKFC
++if test "X$LSOF_CFLAGS_OVERRIDE" != "X"	# {
++then
++  sed -i -e 's/^CFLAGS=/override CFLAGS=/' $LSOF_MKFC
++fi	# }
+ if test "X$LSOF_LIB_NO" = "X"	# {
+ then
+ 
diff --git a/package/lsof/lsof.mk b/package/lsof/lsof.mk
index 8deff15..837a88c 100644
--- a/package/lsof/lsof.mk
+++ b/package/lsof/lsof.mk
@@ -34,7 +34,7 @@ $(LSOF_DIR)/.unpacked: $(DL_DIR)/$(LSOF_SOURCE)
 	touch $(LSOF_DIR)/.unpacked
 
 $(LSOF_DIR)/.configured: $(LSOF_DIR)/.unpacked
-	(cd $(LSOF_DIR)/lsof_$(LSOF_VERSION)_src; echo n | $(TARGET_CONFIGURE_OPTS) DEBUG="$(TARGET_CFLAGS) $(BR2_LSOF_CFLAGS)" LSOF_INCLUDE="$(LSOF_INCLUDE)" ./Configure linux)
+	(cd $(LSOF_DIR)/lsof_$(LSOF_VERSION)_src; echo n | $(TARGET_CONFIGURE_OPTS) DEBUG="$(TARGET_CFLAGS) $(BR2_LSOF_CFLAGS)" LSOF_INCLUDE="$(LSOF_INCLUDE)" LSOF_CFLAGS_OVERRIDE=1 ./Configure linux)
 	touch $(LSOF_DIR)/.configured
 
 $(LSOF_DIR)/lsof_$(LSOF_VERSION)_src/$(LSOF_BINARY): $(LSOF_DIR)/.configured
-- 
1.7.1
