From: Steve Kenton <skenton@ou.edu>
Date: Wed, 18 Mar 2015 00:37:13 -0500
Subject: [Buildroot] [PATCH v2 1/1] tovid: new package
Message-ID: <1426657033-5573-1-git-send-email-skenton@ou.edu>
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
Here's tovid, a package which has been waiting on dvdrw-tools
Let's see how well I learned the lesson from that patch.

select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS seems a bit odd, is that OK?
At first I was downloading the source for a google drive, but I
eventually discovered that there was an SVN repo available so I
switched to that. I still generated the hash file locally so if
there is a better way to handle that please let me know.

I feel sure that there's still more for me to learn, so have at :-)

Steve

 package/Config.in                |  1 +
 package/tovid/0001-manpage.patch | 26 ++++++++++++++++++++++++++
 package/tovid/Config.in          | 32 ++++++++++++++++++++++++++++++++
 package/tovid/tovid.hash         |  2 ++
 package/tovid/tovid.mk           | 19 +++++++++++++++++++
 5 files changed, 80 insertions(+)
 create mode 100644 package/tovid/0001-manpage.patch
 create mode 100644 package/tovid/Config.in
 create mode 100644 package/tovid/tovid.hash
 create mode 100644 package/tovid/tovid.mk

diff --git a/package/Config.in b/package/Config.in
index 96e373a..44ccfe4 100644
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
index 0000000..c742b64
--- /dev/null
+++ b/package/tovid/0001-manpage.patch
@@ -0,0 +1,26 @@
+setup.py: disable documentation build
+
+Signed-off-by: Steve Kenton <skenton@ou.edu>
+
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
index 0000000..8129123
--- /dev/null
+++ b/package/tovid/Config.in
@@ -0,0 +1,32 @@
+config BR2_PACKAGE_TOVID
+	bool "tovid"
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_INET_IPV6 # ffmpeg
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_WCHAR
+	depends on BR2_LARGEFILE
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
+comment "tovid needs a toolchain w/ threads, ipv6, C++, wchar, largefile"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS \
+		|| !BR2_INET_IPV6 || !BR2_INSTALL_LIBSTDCPP \
+		|| !BR2_USE_WCHAR || !BR2_LARGEFILE
+
diff --git a/package/tovid/tovid.hash b/package/tovid/tovid.hash
new file mode 100644
index 0000000..32b0831
--- /dev/null
+++ b/package/tovid/tovid.hash
@@ -0,0 +1,2 @@
+# Locally computed using sha256sum
+sha256	09db004edc4f467beb3f70c6dde02967073cae0cac028df90b2cd4878ac246ec  tovid-3534.tar.gz
diff --git a/package/tovid/tovid.mk b/package/tovid/tovid.mk
new file mode 100644
index 0000000..9e474fb
--- /dev/null
+++ b/package/tovid/tovid.mk
@@ -0,0 +1,19 @@
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
+	bash -c "cd $(@D); ./setup.py install --root=$(TARGET_DIR) --prefix=/usr"
+endef
+
+$(eval $(generic-package))
-- 
2.1.0
