From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Fri, 12 Aug 2011 14:22:56 +0200
Subject: [Buildroot] [PATCH] Fix the Python build when running Linux 3.*
Message-ID: <1313151776-26401-1-git-send-email-maxime.ripard@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When compiling Python on a host running Linux 3.0, the sys.platform
constant is set at "linux3". A lot of code (inside the interpreter
itself, its build system and third party apps and libraries) relies on
it to be linux2 on a Linux system.

This leads to the build of the target python package to break.

This behaviour has been reported on the Python bugtracker but is not
fixed yet.

http://bugs.python.org/issue12326

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 .../python-2.7-013-fix-linux-3-compilation.patch   |   22 ++++++++++++++++++++
 1 files changed, 22 insertions(+), 0 deletions(-)
 create mode 100644 package/python/python-2.7-013-fix-linux-3-compilation.patch

diff --git a/package/python/python-2.7-013-fix-linux-3-compilation.patch b/package/python/python-2.7-013-fix-linux-3-compilation.patch
new file mode 100644
index 0000000..a43ec7e
--- /dev/null
+++ b/package/python/python-2.7-013-fix-linux-3-compilation.patch
@@ -0,0 +1,22 @@
+diff -r 683202530137 configure
+--- a/configure	Fri Aug 12 11:40:39 2011 +0300
++++ b/configure	Fri Aug 12 14:02:18 2011 +0200
+@@ -3055,6 +3055,7 @@ then
+ 	cygwin*) MACHDEP="cygwin";;
+ 	darwin*) MACHDEP="darwin";;
+         irix646) MACHDEP="irix6";;
++        linux*) MACHDEP="linux2";;
+ 	'')	MACHDEP="unknown";;
+ 	esac
+ fi
+diff -r 683202530137 configure.in
+--- a/configure.in	Fri Aug 12 11:40:39 2011 +0300
++++ b/configure.in	Fri Aug 12 14:02:18 2011 +0200
+@@ -307,6 +307,7 @@ then
+ 	cygwin*) MACHDEP="cygwin";;
+ 	darwin*) MACHDEP="darwin";;
+         irix646) MACHDEP="irix6";;
++        linux*) MACHDEP="linux2";;
+ 	'')	MACHDEP="unknown";;
+ 	esac
+ fi
-- 
1.7.4.1
