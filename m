From: Steve Kenton <skenton@ou.edu>
Date: Mon, 23 Feb 2015 23:36:35 -0600
Subject: [Buildroot] [PATCH 1/1]  tovid: new package
Message-ID: <1424756195-4684-1-git-send-email-skenton@ou.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The tovid suite, also known simply as tovid, is a collection of shell
and Python scripts for creating DVDs and (S)VCDs. It is pronounced
"to vid" (because it converts to video disc formats).

Signed-off-by: Steve Kenton <skenton@ou.edu>
---
This will require dvd+rw-tools which has been submitted but
not yet accepted. Since I'm already using tovid I thought I'd
get it worked up for submission and start the review process
on the possibly optimistic assumption that dvd+rw-tools will
eventually get accepted.

 package/Config.in                |  1 +
 package/tovid/0001-manpage.patch | 22 ++++++++++++++++++++++
 package/tovid/Config.in          | 30 ++++++++++++++++++++++++++++++
 package/tovid/tovid.mk           | 21 +++++++++++++++++++++
 4 files changed, 74 insertions(+)
 create mode 100644 package/tovid/0001-manpage.patch
 create mode 100644 package/tovid/Config.in
 create mode 100644 package/tovid/tovid.mk

diff --git a/package/Config.in b/package/Config.in
index fe3d3d0..a558659 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -32,6 +32,7 @@ menu "Audio and video applications"
 	source "package/pulseaudio/Config.in"
 	source "package/sox/Config.in"
 	source "package/tidsp-binaries/Config.in"
+	source "package/tovid/Config.in"
 	source "package/tstools/Config.in"
 	source "package/twolame/Config.in"
 	source "package/upmpdcli/Config.in"
diff --git a/package/tovid/0001-manpage.patch b/package/tovid/0001-manpage.patch
new file mode 100644
index 0000000..26788b4
--- /dev/null
+++ b/package/tovid/0001-manpage.patch
@@ -0,0 +1,22 @@
+--- tovid-3534/setup.py.ori	2015-02-20 22:08:18.590122839 -0600
++++ tovid-3534/setup.py	2015-02-20 22:06:05.290120282 -0600
+@@ -186,7 +186,7 @@ class BuildTovidInit (Command):
+ 
+ # Build tovid-init with regular 'build' command
+ build.sub_commands.append(('build_tovid_init', None))
+-build.sub_commands.append(('build_docs', None))
++#build.sub_commands.append(('build_docs', None))
+ 
+ # The actual setup
+ setup(
+@@ -244,8 +244,8 @@ setup(
+             'src/tovid.ini',
+         ]),
+         # Manual page
+-        ('share/man/man1',
+-         ['docs/man/tovid.1']),
++#        ('share/man/man1',
++#         ['docs/man/tovid.1']),
+         # Desktop shortcut
+         ('share/applications',
+          ['tovidgui.desktop',
diff --git a/package/tovid/Config.in b/package/tovid/Config.in
new file mode 100644
index 0000000..3c3a187
--- /dev/null
+++ b/package/tovid/Config.in
@@ -0,0 +1,30 @@
+config BR2_PACKAGE_TOVID
+	bool "tovid"
+	depends on BR2_USE_WCHAR
+	depends on BR2_LARGEFILE
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU
+	depends on BR2_INET_IPV6 # ffmpeg
+	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # procps_ng
+	select BR2_PACKAGE_DVDAUTHOR
+	select BR2_PACKAGE_DVDRW_TOOLS
+	select BR2_PACKAGE_FFMPEG
+	select BR2_PACKAGE_IMAGEMAGICK
+	select BR2_PACKAGE_JPEG
+	select BR2_PACKAGE_MJPEGTOOLS
+	select BR2_PACKAGE_MPLAYER
+	select BR2_PACKAGE_PROCPS_NG
+	select BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_SOX
+	help
+	  The tovid suite, also known simply as tovid, is a collection of shell 
+	  and Python scripts for creating DVDs and (S)VCDs. It is pronounced 
+	  "to vid" (because it converts to video disc formats). 
+
+	  http://tovid.wikia.com/wiki/Installing_tovid
+
+comment "tovid needs a toolchain w/ wchar, largefile, threads, mmu, ipv6, C++"
+	depends on !BR2_USE_WCHAR || !BR2_LARGEFILE \
+		|| !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_MMU \
+		|| !BR2_INET_IPV6 || !BR2_INSTALL_LIBSTDCPP
diff --git a/package/tovid/tovid.mk b/package/tovid/tovid.mk
new file mode 100644
index 0000000..768449a
--- /dev/null
+++ b/package/tovid/tovid.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# tovid
+#
+################################################################################
+
+TOVID_SITE = http://tovid.googlecode.com/svn/trunk/tovid
+TOVID_SITE_METHOD = svn
+TOVID_VERSION = 3534
+TOVID_LICENSE = GPLv2.0
+TOVID_LICENSE_FILES = COPYING
+TOVID_DEPENDENCIES += python
+
+# Must be run in source directory to avoid "error: package directory 'libtovid' does not exist"
+define TOVID_INSTALL_TARGET_CMDS
+#	bash -c "cd $(@D); ./setup.py build_tovid_init"
+#	bash -c "cd $(@D); ./setup.py build"
+	bash -c "cd $(@D); ./setup.py install --root=$(TARGET_DIR) --prefix=/usr"
+endef
+
+$(eval $(generic-package))
-- 
2.1.0
