From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Dec 2016 15:27:03 +0100
Subject: [Buildroot] [git commit] package/aubio: disable unit tests with
	--notests
Message-ID: <20161211142730.3526E817D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3f16f40dfe8163e486dffc7a268f82bf0b8e09c8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For each build step, --notests needs to be passed to waf script
to avoid runing the unit tests.
This allow to remove the patch removing the unit tests from wscript.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/aubio/0001-remove-unit-test.patch | 63 -------------------------------
 package/aubio/aubio.mk                    |  4 ++
 2 files changed, 4 insertions(+), 63 deletions(-)

diff --git a/package/aubio/0001-remove-unit-test.patch b/package/aubio/0001-remove-unit-test.patch
deleted file mode 100644
index 947fc8e..0000000
--- a/package/aubio/0001-remove-unit-test.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From c71d72262568907ae8c3b988d42e575a8bd3a207 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Sat, 29 Oct 2016 20:14:02 +0200
-Subject: [PATCH] remove unit test
-
-Unit tests fail to build on some system.
-
-Waf: Entering directory `output/build/aubio-0.4.3/build'
-[170/217] Processing build/tests/test-sink
-[170/217] Processing build/tests/test-sink_apple_audio-multi
-[172/217] Processing build/tests/test-sink_sndfile-multi
-[172/217] Processing build/tests/test-source_apple_audio
-[174/217] Processing build/tests/test-source_avcodec
-[174/217] Processing build/tests/test-source_multi
-[174/217] Processing build/tests/test-source_seek
-[176/217] Processing build/tests/test-source_sndfile
-Waf: Leaving directory `output/build/aubio-0.4.3/build'
-Build failed
-Traceback (most recent call last):
-  File "output/build/aubio-0.4.3/waflib/Task.py", line 110, in process
-    ret=self.run()
-  File "output/build/aubio-0.4.3/waflib/Tools/waf_unit_test.py", line 66, in run
-    proc=Utils.subprocess.Popen(self.ut_exec,cwd=cwd,env=self.get_test_env(),stderr=Utils.subprocess.PIPE,stdout=Utils.subprocess.PIPE)
-  File "/usr/lib64/python2.7/subprocess.py", line 710, in __init__
-    errread, errwrite)
-  File "/usr/lib64/python2.7/subprocess.py", line 1335, in _execute_child
-    raise child_exception
-OSError: [Errno 2] No such file or directory
-
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- wscript | 3 ---
- 1 file changed, 3 deletions(-)
-
-diff --git a/wscript b/wscript
-index c665ff5..c8fae6c 100644
---- a/wscript
-+++ b/wscript
-@@ -95,13 +95,11 @@ def options(ctx):
-             help='set target platform for cross-compilation', dest='target_platform')
- 
-     ctx.load('compiler_c')
--    ctx.load('waf_unit_test')
-     ctx.load('gnu_dirs')
- 
- def configure(ctx):
-     from waflib import Options
-     ctx.load('compiler_c')
--    ctx.load('waf_unit_test')
-     ctx.load('gnu_dirs')
- 
-     # check for common headers
-@@ -334,7 +332,6 @@ def build(bld):
-     bld.recurse('src')
-     if bld.env['DEST_OS'] not in ['ios', 'iosimulator', 'android']:
-         bld.recurse('examples')
--        bld.recurse('tests')
- 
-     bld( source = 'aubio.pc.in' )
- 
--- 
-2.5.5
-
diff --git a/package/aubio/aubio.mk b/package/aubio/aubio.mk
index cfa233f..f3330c2 100644
--- a/package/aubio/aubio.mk
+++ b/package/aubio/aubio.mk
@@ -15,6 +15,10 @@ AUBIO_CONF_OPTS = \
 	--disable-docs \
 	--disable-atlas
 
+# Add --notests for each build step to avoid running unit tests on the
+# build machine.
+AUBIO_WAF_OPTS = --notests
+
 ifeq ($(BR2_PACKAGE_LIBSNDFILE),y)
 AUBIO_DEPENDENCIES += libsndfile
 AUBIO_CONF_OPTS += --enable-sndfile
