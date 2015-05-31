From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 31 May 2015 21:44:55 +0200
Subject: [Buildroot] [git commit] python: add patch to fix logic to get gcc
	paths
Message-ID: <20150531200253.B8C65801CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=238bf198cf4f31a3301b81a924d5e22044945955
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The Python setup.py has a function called add_gcc_paths(), which
executes gcc -E -v to get the list of header paths searched by
gcc. However, the logic of setup.py is only valid with the normal
english output of gcc: it doesn't work if a non-english locale is
set. This causes setup.py to not find certain headers (such as zlib.h)
and therefore disabling the build of such extensions.

Reported-by: Bruno Coudoin <bruno.coudoin@gcompris.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python/018-fix-add-gcc-paths-logic.patch |   27 ++++++++++++++++++++++
 1 files changed, 27 insertions(+), 0 deletions(-)

diff --git a/package/python/018-fix-add-gcc-paths-logic.patch b/package/python/018-fix-add-gcc-paths-logic.patch
new file mode 100644
index 0000000..af6efcc
--- /dev/null
+++ b/package/python/018-fix-add-gcc-paths-logic.patch
@@ -0,0 +1,27 @@
+Override system locale and set to default when adding gcc paths
+
+Forces the use of the default locale in the function
+add_gcc_paths, which is called when cross compiling to add the
+include and library paths. This is necessary because otherwise
+the gcc output is localized and the output parsing fails, which
+results in no paths added and detect_modules not able to find
+any system library (eg. libz, libssl, etc.)
+
+[Thomas: patch taken from https://bugs.python.org/issue23767.]
+
+Signed-off-by: Samuel Cabrero <samuelcabrero@gmail.com>
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/setup.py
+===================================================================
+--- a/setup.py
++++ b/setup.py
+@@ -414,7 +414,7 @@
+         tmpfile = os.path.join(self.build_temp, 'gccpaths')
+         if not os.path.exists(self.build_temp):
+             os.makedirs(self.build_temp)
+-        ret = os.system('%s -E -v - </dev/null 2>%s 1>/dev/null' % (gcc, tmpfile))
++        ret = os.system('LC_ALL=C %s -E -v - </dev/null 2>%s 1>/dev/null' % (gcc, tmpfile))
+         is_gcc = False
+         in_incdirs = False
+         inc_dirs = []
