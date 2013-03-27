From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 27 Mar 2013 20:31:41 +0100
Subject: [Buildroot] [git commit] jhead: new package
Message-ID: <20130327193219.5BD1D9B356@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=674cbf25f69dc5df70679d6d4b31b78091ccaaa5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                     |    1 +
 package/jhead/Config.in               |   11 +++++++++++
 package/jhead/jhead-use-ldflags.patch |   16 ++++++++++++++++
 package/jhead/jhead.mk                |   20 ++++++++++++++++++++
 4 files changed, 48 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 77dc0d3..d522804 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -107,6 +107,7 @@ menu "Graphic libraries and applications (graphic/text)"
 
 comment "Graphic applications"
 source "package/gnuplot/Config.in"
+source "package/jhead/Config.in"
 source "package/rrdtool/Config.in"
 
 comment "graphic libraries"
diff --git a/package/jhead/Config.in b/package/jhead/Config.in
new file mode 100644
index 0000000..247ac53
--- /dev/null
+++ b/package/jhead/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_JHEAD
+	bool "jhead"
+	depends on BR2_USE_WCHAR
+	help
+	  Jhead is a program for manipulating settings and thumbnails
+	  in Exif jpeg headers used by most Digital Cameras.
+
+	  http://www.sentex.net/~mwandel/jhead/
+
+comment "jhead requires a toolchain with WCHAR support"
+	depends on !BR2_USE_WCHAR
diff --git a/package/jhead/jhead-use-ldflags.patch b/package/jhead/jhead-use-ldflags.patch
new file mode 100644
index 0000000..a1d8185
--- /dev/null
+++ b/package/jhead/jhead-use-ldflags.patch
@@ -0,0 +1,16 @@
+Make jhead use LDFLAGS for the final link.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura jhead-2.97.orig/makefile jhead-2.97/makefile
+--- jhead-2.97.orig/makefile	2013-03-27 09:22:38.759966389 -0300
++++ jhead-2.97/makefile	2013-03-27 09:25:06.290691745 -0300
+@@ -14,7 +14,7 @@
+ 	${CC} $(CFLAGS) -c $< -o $@
+ 
+ jhead: $(objs) jhead.h
+-	${CC} -o jhead $(objs) -lm
++	${CC} $(LDFLAGS) -o jhead $(objs) -lm
+ 
+ clean:
+ 	rm -f $(objs) jhead
diff --git a/package/jhead/jhead.mk b/package/jhead/jhead.mk
new file mode 100644
index 0000000..e9843ae
--- /dev/null
+++ b/package/jhead/jhead.mk
@@ -0,0 +1,20 @@
+#############################################################
+#
+# jhead
+#
+#############################################################
+
+JHEAD_VERSION = 2.97
+JHEAD_SITE = http://www.sentex.net/~mwandel/jhead
+JHEAD_LICENSE = Public Domain
+JHEAD_LICENSE_FILES = readme.txt
+
+define JHEAD_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
+endef
+
+define JHEAD_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 -D $(@D)/jhead $(TARGET_DIR)/usr/bin/jhead
+endef
+
+$(eval $(generic-package))
