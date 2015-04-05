From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Apr 2015 11:43:26 +0200
Subject: [Buildroot] [git commit] tovid: new package
Message-ID: <20150405094334.6493B8194B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7de0f6a6779c39676eea2885521305f9227a2f52
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The tovid suite, also known simply as tovid, is a collection of shell
and Python scripts for creating DVDs and (S)VCDs. It is pronounced
"to vid" (because it converts to video disc formats).

[Thomas:
  - remove largefile dependency
  - properly propagate mplayer and ffmpeg dependencies.
  - fix license: it's GPLv2+, not GPLv2.]

Signed-off-by: Steve Kenton <skenton@ou.edu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                |    1 +
 package/tovid/0001-manpage.patch |   25 +++++++++++++++++++++++
 package/tovid/Config.in          |   40 ++++++++++++++++++++++++++++++++++++++
 package/tovid/tovid.mk           |   14 +++++++++++++
 4 files changed, 80 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 9d81399..c49ee7b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -33,6 +33,7 @@ menu "Audio and video applications"
 	source "package/pulseaudio/Config.in"
 	source "package/sox/Config.in"
 	source "package/tidsp-binaries/Config.in"
+	source "package/tovid/Config.in"
 	source "package/tstools/Config.in"
 	source "package/twolame/Config.in"
 	source "package/upmpdcli/Config.in"
diff --git a/package/tovid/0001-manpage.patch b/package/tovid/0001-manpage.patch
new file mode 100644
index 0000000..21669c9
--- /dev/null
+++ b/package/tovid/0001-manpage.patch
@@ -0,0 +1,25 @@
+setup.py: disable man page to kill txt2tags SVN checkout dependency
+
+Signed-off-by: Steve Kenton <skenton@ou.edu>
+
++diff -pruN tovid-3534.ori/setup.py tovid-3534/setup.py
+--- tovid-3534.ori/setup.py	2013-04-14 09:52:08.000000000 -0500
++++ tovid-3534/setup.py	2015-03-21 09:39:14.880173176 -0500
+@@ -186,7 +186,7 @@ class BuildTovidInit (Command):
+ 
+ # Build tovid-init with regular 'build' command
+ build.sub_commands.append(('build_tovid_init', None))
+-build.sub_commands.append(('build_docs', None))
++#build.sub_commands.append(('build_docs', None))
+ 
+ # The actual setup
+ setup(
+@@ -244,8 +244,6 @@ setup(
+             'src/tovid.ini',
+         ]),
+         # Manual page
+-        ('share/man/man1',
+-         ['docs/man/tovid.1']),
+         # Desktop shortcut
+         ('share/applications',
+          ['tovidgui.desktop',
diff --git a/package/tovid/Config.in b/package/tovid/Config.in
new file mode 100644
index 0000000..11c8085
--- /dev/null
+++ b/package/tovid/Config.in
@@ -0,0 +1,40 @@
+config BR2_PACKAGE_TOVID
+	bool "tovid"
+	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_INET_IPV6 # ffmpeg
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_WCHAR
+	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305 # ffmpeg
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405 # ffmpeg
+	depends on BR2_PACKAGE_MPLAYER_ARCH_SUPPORTS
+	# The below dependencies are runtime dependencies only
+	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # procps_ng
+	select BR2_PACKAGE_DVDAUTHOR
+	select BR2_PACKAGE_DVDRW_TOOLS
+	select BR2_PACKAGE_FFMPEG
+	select BR2_PACKAGE_IMAGEMAGICK
+	select BR2_PACKAGE_JPEG
+	select BR2_PACKAGE_MJPEGTOOLS
+	select BR2_PACKAGE_MPLAYER
+	select BR2_PACKAGE_PROCPS_NG # pgrep and pkill
+	select BR2_PACKAGE_SOX
+	help
+	  The tovid suite, also known simply as tovid, is a collection
+	  of shell and Python scripts for creating DVDs and
+	  (S)VCDs. It is pronounced "to vid" (because it converts to
+	  video disc formats).
+
+	  http://tovid.wikia.com/wiki/Installing_tovid
+
+comment "tovid needs a toolchain w/ threads, IPv6, C++, wchar"
+	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_MPLAYER_ARCH_SUPPORTS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS \
+		|| !BR2_INET_IPV6 || !BR2_INSTALL_LIBSTDCPP \
+		|| !BR2_USE_WCHAR
+
+comment "tovid depends on python or python3"
+	depends on !BR2_PACKAGE_PYTHON && !BR2_PACKAGE_PYTHON3
+	depends on BR2_PACKAGE_MPLAYER_ARCH_SUPPORTS
diff --git a/package/tovid/tovid.mk b/package/tovid/tovid.mk
new file mode 100644
index 0000000..cc2edd9
--- /dev/null
+++ b/package/tovid/tovid.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# tovid
+#
+################################################################################
+
+TOVID_SITE = http://tovid.googlecode.com/svn/trunk/tovid
+TOVID_SITE_METHOD = svn
+TOVID_VERSION = 3534
+TOVID_LICENSE = GPLv2+
+TOVID_LICENSE_FILES = COPYING
+TOVID_SETUP_TYPE = distutils
+
+$(eval $(python-package))
