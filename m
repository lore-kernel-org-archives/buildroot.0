From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 13 Oct 2012 17:58:11 +0200
Subject: [Buildroot] [PATCH] gpsd: add patch to fix CPPFLAGS related build
	issue
Message-ID: <1350143891-5626-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In gpsd, some of the environment variables carrying flags are handled
specially when they can contain multiple flags enclosed inside
quotes. The gpsd SConstruct uses env.MergeFlags() do add those flags.

Unfortunately, env.MergeFlags() doesn't work properly when this quoted
string starts with a space. The build then fails with:

  arm-unknown-linux-uclibcgnueabi-gcc: error:  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64: No such file or directory

This is because Scons believes that " -flag1 -flag2" is a file and not
a set of flags.

We fix this by adding a patch that simply strip()s the string before
passing it to env.MergeFlags(), which has the effect of removing all
leading and trailing spaces.

Fixes

  http://autobuild.buildroot.org/results/acf4922e1538d50eb30e4750ee2ec0fba891e1ce/build-end.log

Thanks to Gustavo Zacarias for the initial investigation. He is the
one who found that the leading space was causing the problem.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...6-sconstruct-fix-multiword-flags-handling.patch |   35 ++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 package/gpsd/gpsd-06-sconstruct-fix-multiword-flags-handling.patch

diff --git a/package/gpsd/gpsd-06-sconstruct-fix-multiword-flags-handling.patch b/package/gpsd/gpsd-06-sconstruct-fix-multiword-flags-handling.patch
new file mode 100644
index 0000000..40b51ed
--- /dev/null
+++ b/package/gpsd/gpsd-06-sconstruct-fix-multiword-flags-handling.patch
@@ -0,0 +1,35 @@
+Some of the environment variables carrying flags are handled specially
+when they can contain multiple flags enclosed inside quotes. The gpsd
+SConstruct uses env.MergeFlags() do add those flags.
+
+Unfortunately, env.MergeFlags() doesn't work properly when this quoted
+string starts with a space. The build then fails with:
+
+  arm-unknown-linux-uclibcgnueabi-gcc: error:  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64: No such file or directory
+
+This is because Scons believes that " -flag1 -flag2" is a file and not
+a set of flags.
+
+We fix this by simply strip()ing the string before passing it to
+env.MergeFlags(), which has the effect of removing all leading and
+trailing spaces.
+
+See
+http://autobuild.buildroot.org/results/acf4922e1538d50eb30e4750ee2ec0fba891e1ce/build-end.log
+for a complete example of build failure.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/SConstruct
+===================================================================
+--- a/SConstruct
++++ b/SConstruct
+@@ -236,7 +236,7 @@
+             env.Replace(**{j: os.getenv(i)})
+ for flags in ["LDFLAGS", "LINKFLAGS", "SHLINKFLAGS", "CPPFLAGS"]:
+     if os.environ.has_key(flags):
+-        env.MergeFlags({flags : [os.getenv(flags)]})
++        env.MergeFlags({flags : [os.getenv(flags).strip()]})
+ 
+ 
+ # Keep scan-build options in the environment
-- 
1.7.9.5
