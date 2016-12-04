From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Dec 2016 16:15:26 +0100
Subject: [Buildroot] [git commit] package/aubio: new package
Message-ID: <20161204152034.37E80817E1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=280bb6807619e2e858836435f44aad0cccd27a40
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Aubio attempt to build aubio.so shared library so disable it for static
build only.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                         |  1 +
 package/aubio/0001-remove-unit-test.patch | 63 +++++++++++++++++++++++++++++++
 package/aubio/Config.in                   | 21 +++++++++++
 package/aubio/aubio.hash                  |  2 +
 package/aubio/aubio.mk                    | 24 ++++++++++++
 5 files changed, 111 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index b076dfd..f16e56d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -828,6 +828,7 @@ menu "Libraries"
 
 menu "Audio/Sound"
 	source "package/alsa-lib/Config.in"
+	source "package/aubio/Config.in"
 	source "package/audiofile/Config.in"
 	source "package/celt051/Config.in"
 	source "package/fdk-aac/Config.in"
diff --git a/package/aubio/0001-remove-unit-test.patch b/package/aubio/0001-remove-unit-test.patch
new file mode 100644
index 0000000..947fc8e
--- /dev/null
+++ b/package/aubio/0001-remove-unit-test.patch
@@ -0,0 +1,63 @@
+From c71d72262568907ae8c3b988d42e575a8bd3a207 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Sat, 29 Oct 2016 20:14:02 +0200
+Subject: [PATCH] remove unit test
+
+Unit tests fail to build on some system.
+
+Waf: Entering directory `output/build/aubio-0.4.3/build'
+[170/217] Processing build/tests/test-sink
+[170/217] Processing build/tests/test-sink_apple_audio-multi
+[172/217] Processing build/tests/test-sink_sndfile-multi
+[172/217] Processing build/tests/test-source_apple_audio
+[174/217] Processing build/tests/test-source_avcodec
+[174/217] Processing build/tests/test-source_multi
+[174/217] Processing build/tests/test-source_seek
+[176/217] Processing build/tests/test-source_sndfile
+Waf: Leaving directory `output/build/aubio-0.4.3/build'
+Build failed
+Traceback (most recent call last):
+  File "output/build/aubio-0.4.3/waflib/Task.py", line 110, in process
+    ret=self.run()
+  File "output/build/aubio-0.4.3/waflib/Tools/waf_unit_test.py", line 66, in run
+    proc=Utils.subprocess.Popen(self.ut_exec,cwd=cwd,env=self.get_test_env(),stderr=Utils.subprocess.PIPE,stdout=Utils.subprocess.PIPE)
+  File "/usr/lib64/python2.7/subprocess.py", line 710, in __init__
+    errread, errwrite)
+  File "/usr/lib64/python2.7/subprocess.py", line 1335, in _execute_child
+    raise child_exception
+OSError: [Errno 2] No such file or directory
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ wscript | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/wscript b/wscript
+index c665ff5..c8fae6c 100644
+--- a/wscript
++++ b/wscript
+@@ -95,13 +95,11 @@ def options(ctx):
+             help='set target platform for cross-compilation', dest='target_platform')
+ 
+     ctx.load('compiler_c')
+-    ctx.load('waf_unit_test')
+     ctx.load('gnu_dirs')
+ 
+ def configure(ctx):
+     from waflib import Options
+     ctx.load('compiler_c')
+-    ctx.load('waf_unit_test')
+     ctx.load('gnu_dirs')
+ 
+     # check for common headers
+@@ -334,7 +332,6 @@ def build(bld):
+     bld.recurse('src')
+     if bld.env['DEST_OS'] not in ['ios', 'iosimulator', 'android']:
+         bld.recurse('examples')
+-        bld.recurse('tests')
+ 
+     bld( source = 'aubio.pc.in' )
+ 
+-- 
+2.5.5
+
diff --git a/package/aubio/Config.in b/package/aubio/Config.in
new file mode 100644
index 0000000..c4c60db
--- /dev/null
+++ b/package/aubio/Config.in
@@ -0,0 +1,21 @@
+config BR2_PACKAGE_AUBIO
+	bool "aubio"
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  aubio is a tool designed for the extraction of annotations from
+	  audio signals. Its features include segmenting a sound file
+	  before each of its attacks, performing pitch detection, tapping
+	  the beat and producing midi streams from live audio.
+
+	  Because these tasks are difficult, we thought it was important
+	  to gather them in a dedicated library. To increase the fun, we
+	  have made these algorithms work in a causal way, so as to be
+	  used in real time applications with as low delay as possible.
+	  Functions can be used offline in sound editors and software
+	  samplers, or online in audio effects and virtual instruments.
+
+	  https://aubio.org
+
+comment "aubio needs a toolchain w/ threads, dynamic library"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/aubio/aubio.hash b/package/aubio/aubio.hash
new file mode 100644
index 0000000..f4de92a
--- /dev/null
+++ b/package/aubio/aubio.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 b62cdb073c0c64ae301917fa162969d42cba45e478bdf1e74490bd87e9cceaab  aubio-0.4.3.tar.bz2
diff --git a/package/aubio/aubio.mk b/package/aubio/aubio.mk
new file mode 100644
index 0000000..aa4ddd0
--- /dev/null
+++ b/package/aubio/aubio.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# aubio
+#
+################################################################################
+
+AUBIO_VERSION = 0.4.3
+AUBIO_SITE = https://aubio.org/pub
+AUBIO_SOURCE = aubio-$(AUBIO_VERSION).tar.bz2
+AUBIO_LICENSE = GPLv3+
+AUBIO_LICENSE_FILES = COPYING
+AUBIO_INSTALL_STAGING = YES
+
+AUBIO_CONF_OPTS = \
+	--disable-docs \
+	--disable-atlas \
+	--disable-samplerate \
+	--disable-avcodec \
+	--disable-sndfile \
+	--disable-jack \
+	--disable-fftw3 \
+	--disable-fftw3f
+
+$(eval $(waf-package))
