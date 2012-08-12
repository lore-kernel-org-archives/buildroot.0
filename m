From: Jonathan Liu <net147@gmail.com>
Date: Sun, 12 Aug 2012 22:06:05 +1000
Subject: [Buildroot] [PATCH] python: Use fixed path for sys.executable
Message-ID: <1344773165-5165-1-git-send-email-net147@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The path to the Python interpreter is returned by sys.executable.
However, setuptools uses sys.executable to generate the shebang
interpreter directive used for entry point scripts that will run
on the target system. In this case, it will return the path of the
host Python interpreter when it should be the path of the Python
interpreter on the target.

To fix this, just return a fixed path of /usr/bin/python for
sys.executable.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 package/python/python-2.7-114-sys-executable.patch | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 package/python/python-2.7-114-sys-executable.patch

diff --git a/package/python/python-2.7-114-sys-executable.patch b/package/python/python-2.7-114-sys-executable.patch
new file mode 100644
index 0000000..1a6b73c
--- /dev/null
+++ b/package/python/python-2.7-114-sys-executable.patch
@@ -0,0 +1,32 @@
+Use fixed path for sys.executable
+
+The path to the Python interpreter is returned by sys.executable.
+However, setuptools uses sys.executable to generate the shebang
+interpreter directive used for entry point scripts that will run
+on the target system. In this case, it will return the path of the
+host Python interpreter when it should be the path of the Python
+interpreter on the target.
+
+To fix this, just return a fixed path of /usr/bin/python for
+sys.executable.
+
+Signed-off-by: Jonathan Liu <net147@gmail.com>
+---
+ Modules/getpath.c | 4 +---
+ 1 file changed, 1 insertion(+), 3 deletions(-)
+
+Index: Python-2.7.2/Modules/getpath.c
+===================================================================
+--- Python-2.7.2.orig/Modules/getpath.c
++++ Python-2.7.2/Modules/getpath.c
+@@ -686,9 +686,7 @@ Py_GetExecPrefix(void)
+ char *
+ Py_GetProgramFullPath(void)
+ {
+-    if (!module_search_path)
+-        calculate_path();
+-    return progpath;
++    return "/usr/bin/python";
+ }
+ 
+ 
-- 
1.7.11.3
