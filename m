From: Markos Chandras <markos.chandras@imgtec.com>
Date: Wed, 28 Aug 2013 14:09:51 +0100
Subject: [Buildroot] [PATCH] directfb: Add patch to use 'gcc' for linking
	objects
Message-ID: <1377695391-11965-1-git-send-email-markos.chandras@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/fab819eee4002a9c392c48c1ebaca5c5b6555567/

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 package/directfb/directfb-use-gcc-link.patch | 35 ++++++++++++++++++++++++++++
 package/directfb/directfb.mk                 |  2 ++
 2 files changed, 37 insertions(+)
 create mode 100644 package/directfb/directfb-use-gcc-link.patch

diff --git a/package/directfb/directfb-use-gcc-link.patch b/package/directfb/directfb-use-gcc-link.patch
new file mode 100644
index 0000000..ec6c0ea
--- /dev/null
+++ b/package/directfb/directfb-use-gcc-link.patch
@@ -0,0 +1,35 @@
+Add patch to use 'gcc' instead of 'ld' for linking
+
+The patch has been sent upstream but it has not been merged yet
+
+Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
+
+From 176ce06b40897a357fe76a558af517197325f188 Mon Sep 17 00:00:00 2001
+From: Markos Chandras <markos.chandras@imgtec.com>
+Date: Wed, 28 Aug 2013 10:56:32 +0100
+Subject: [PATCH] rules/libobject.make: Use gcc for linking
+
+Invoking 'ld' directly may miss some necessary linker flags which
+are usually passed by gcc. Therefore, use gcc for linking.
+
+Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
+---
+ rules/libobject.make | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/rules/libobject.make b/rules/libobject.make
+index bc670da..2cba658 100644
+--- a/rules/libobject.make
++++ b/rules/libobject.make
+@@ -3,7 +3,7 @@
+ 	if test -d $<.tmp; then rmdir $<.tmp; fi
+ 	mkdir $<.tmp
+ 	(cd $<.tmp && $(AR) x ../../$<)
+-	$(LD) -o $@ -r $<.tmp/*.o
++	$(CC) -nostdlib -o $@ -r $<.tmp/*.o
+ 	rm -f $<.tmp/*.o && rmdir $<.tmp
+ 
+ .PHONY: $(LTLIBRARIES:%.la=.libs/%.a)
+-- 
+1.8.3.2
+
diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
index c065eef..1d83a0b 100644
--- a/package/directfb/directfb.mk
+++ b/package/directfb/directfb.mk
@@ -11,6 +11,8 @@ DIRECTFB_SOURCE = DirectFB-$(DIRECTFB_VERSION).tar.gz
 DIRECTFB_LICENSE = LGPLv2.1+
 DIRECTFB_LICENSE_FILES = COPYING
 DIRECTFB_INSTALL_STAGING = YES
+DIRECTFB_AUTORECONF = YES
+
 DIRECTFB_CONF_OPT = \
 	--localstatedir=/var \
 	--disable-explicit-deps \
-- 
1.8.3.2
