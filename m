From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 29 May 2015 22:52:24 +0200
Subject: [Buildroot] [PATCH 2/2] python3: add patch to fix logic to get gcc
	paths
In-Reply-To: <1432932744-27818-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1432932744-27818-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1432932744-27818-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Python setup.py has a function called add_gcc_paths(), which
executes gcc -E -v to get the list of header paths searched by
gcc. However, the logic of setup.py is only valid with the normal
english output of gcc: it doesn't work if a non-english locale is
set. This causes setup.py to not find certain headers (such as zlib.h)
and therefore disabling the build of such extensions.

Reported-by: Bruno Coudoin <bruno.coudoin@gcompris.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python3/019-fix-add-gcc-paths-logic.patch | 27 +++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 package/python3/019-fix-add-gcc-paths-logic.patch

diff --git a/package/python3/019-fix-add-gcc-paths-logic.patch b/package/python3/019-fix-add-gcc-paths-logic.patch
new file mode 100644
index 0000000..179a29a
--- /dev/null
+++ b/package/python3/019-fix-add-gcc-paths-logic.patch
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
+@@ -423,7 +423,7 @@
+         tmpfile = os.path.join(self.build_temp, 'gccpaths')
+         if not os.path.exists(self.build_temp):
+             os.makedirs(self.build_temp)
+-        ret = os.system('%s -E -v - </dev/null 2>%s 1>/dev/null' % (gcc, tmpfile))
++        ret = os.system('LC_ALL=C %s -E -v - </dev/null 2>%s 1>/dev/null' % (gcc, tmpfile))
+         is_gcc = False
+         in_incdirs = False
+         inc_dirs = []
-- 
2.1.0
