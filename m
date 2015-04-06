From: Baruch Siach <baruch@tkos.co.il>
Date: Mon,  6 Apr 2015 07:45:22 +0300
Subject: [Buildroot] [PATCH] lirc-tools: fix build with host python3
Message-ID: <7a4adf12aeaac9866b488af01bf8e3e8aaf58f5e.1428295522.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add an upstream patch making make_rel_symlink.py python3 compatible. Add
another patch that removes python3 dependency.

Fixes:
http://autobuild.buildroot.net/results/6c6/6c6e014a751650c16d25dfd3d673bd3199c72b2e/
http://autobuild.buildroot.net/results/857/85724dfd014cec5a80dd18a635826daa2edc1417/
http://autobuild.buildroot.net/results/a74/a74563f700a47065ffd1ba42c83c2d7722bacd89/

and many others.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
v2:
   Be compatible with both python versions
---
 ...ools-Make-make_rel_symlink.py-use-python3.patch | 46 ++++++++++++++++++++++
 ...-make_rel_symlink.py-can-also-use-python2.patch | 28 +++++++++++++
 2 files changed, 74 insertions(+)
 create mode 100644 package/lirc-tools/0001-tools-Make-make_rel_symlink.py-use-python3.patch
 create mode 100644 package/lirc-tools/0002-tools-make_rel_symlink.py-can-also-use-python2.patch

diff --git a/package/lirc-tools/0001-tools-Make-make_rel_symlink.py-use-python3.patch b/package/lirc-tools/0001-tools-Make-make_rel_symlink.py-use-python3.patch
new file mode 100644
index 000000000000..3b5db2d6a644
--- /dev/null
+++ b/package/lirc-tools/0001-tools-Make-make_rel_symlink.py-use-python3.patch
@@ -0,0 +1,46 @@
+From ae2e8cc85b6b4d2202e42d704dde8757ffd31da6 Mon Sep 17 00:00:00 2001
+From: Alec Leamas <leamas.alec@gmail.com>
+Date: Thu, 11 Dec 2014 04:44:49 +0100
+Subject: [PATCH] tools: Make make_rel_symlink.py use python3.
+
+Upstream patch:
+http://sourceforge.net/p/lirc/git/ci/ae2e8cc85b6b4d2202e42d704dde8757ffd31da6/
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+ tools/make_rel_symlink.py | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/tools/make_rel_symlink.py b/tools/make_rel_symlink.py
+index 5c893056f379..896637ff93e0 100755
+--- a/tools/make_rel_symlink.py
++++ b/tools/make_rel_symlink.py
+@@ -1,4 +1,4 @@
+-#!/usr/bin/env python
++#!/usr/bin/env python3
+ 
+ import os
+ import os.path
+@@ -32,16 +32,16 @@ if sys.argv[1] == "-p":
+     sys.argv = sys.argv[ 1:]
+ 
+ if len( sys.argv ) != 3:
+-    print USAGE
++    print(USAGE)
+     sys.exit( 1 )
+ 
+ if  os.path.isdir(  sys.argv[2] ):
+-    print "Removing link target dir:" +  sys.argv[2]
++    print("Removing link target dir:" +  sys.argv[2])
+     shutil.rmtree( sys.argv[2])
+ 
+ link_path = relative_ln_s( sys.argv[1], sys.argv[2] )
+ if just_print:
+-    print link_path
++    print(link_path)
+ else:
+     os.chdir( os.path.dirname( sys.argv[2]))
+     target = os.path.basename( sys.argv[2])
+-- 
+2.1.4
+
diff --git a/package/lirc-tools/0002-tools-make_rel_symlink.py-can-also-use-python2.patch b/package/lirc-tools/0002-tools-make_rel_symlink.py-can-also-use-python2.patch
new file mode 100644
index 000000000000..070aab941cdf
--- /dev/null
+++ b/package/lirc-tools/0002-tools-make_rel_symlink.py-can-also-use-python2.patch
@@ -0,0 +1,28 @@
+From c861eae83bae3116d330efb3c6061e2de4fdcbce Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Sun, 5 Apr 2015 22:26:12 +0300
+Subject: [PATCH] tools: make_rel_symlink.py can also use python2
+
+The make_rel_symlink.py script is compatible with both python2 and python3.
+Don't hard code a requirement for python3.
+
+Patch status: sent upstream
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+ tools/make_rel_symlink.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tools/make_rel_symlink.py b/tools/make_rel_symlink.py
+index 896637ff93e0..ff0403a0397a 100755
+--- a/tools/make_rel_symlink.py
++++ b/tools/make_rel_symlink.py
+@@ -1,4 +1,4 @@
+-#!/usr/bin/env python3
++#!/usr/bin/env python
+ 
+ import os
+ import os.path
+-- 
+2.1.4
+
-- 
2.1.4
