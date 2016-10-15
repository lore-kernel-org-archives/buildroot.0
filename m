From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Fri, 14 Oct 2016 20:05:30 -0400
Subject: [Buildroot] [PATCH 1/1] size-stats: don't count hard links
Message-ID: <1476489930-10456-1-git-send-email-fhunleth@troodon-software.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This change adds inode tracking to the size-stats script so that hard
links don't cause files to be double counted. This has a significant
effect on the size computation for some packages. For example, git has
around a dozen hard links to a large file. Before this change, git would
weigh in at about 170 MB with the total filesystem size reported as
175 MB. The actual rootfs.ext2 size was around 16 MB. With the change,
the git package registers at 10.5 MB with a total filesystem size of
15.8 MB.

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
---
 support/scripts/size-stats | 27 ++++++++++++++++++++++-----
 1 file changed, 22 insertions(+), 5 deletions(-)

diff --git a/support/scripts/size-stats b/support/scripts/size-stats
index 0ddcc07..858b2e0 100755
--- a/support/scripts/size-stats
+++ b/support/scripts/size-stats
@@ -41,17 +41,32 @@ colors = ['#e60004', '#009836', '#2e1d86', '#ffed00',
 # key, and as the value a tuple containing the name of the package to
 # which the file belongs and the size of the file.
 #
+# Hard links are pruned by tracking inodes so that files are not
+# double counted.
+#
 # filesdict: the dict to which  the file is added
+# seeninodes: the set of inodes that have been seen before
 # relpath: relative path of the file
 # fullpath: absolute path to the file
 # pkg: package to which the file belongs
 #
-def add_file(filesdict, relpath, abspath, pkg):
+def add_file(filesdict, seeninodes, relpath, abspath, pkg):
     if not os.path.exists(abspath):
         return
     if os.path.islink(abspath):
         return
-    sz = os.stat(abspath).st_size
+    if relpath in filesdict:
+        return
+
+    st = os.stat(abspath)
+    sz = st.st_size
+    ino = st.st_ino
+    if ino in seeninodes:
+        # hard link
+        sz = 0
+    else:
+        seeninodes.add(ino)
+
     filesdict[relpath] = (pkg, sz)
 
 #
@@ -64,13 +79,14 @@ def add_file(filesdict, relpath, abspath, pkg):
 #
 def build_package_dict(builddir):
     filesdict = {}
+    seeninodes = set()
     with open(os.path.join(builddir, "build", "packages-file-list.txt")) as filelistf:
         for l in filelistf.readlines():
             pkg, fpath = l.split(",", 1)
             # remove the initial './' in each file path
             fpath = fpath.strip()[2:]
             fullpath = os.path.join(builddir, "target", fpath)
-            add_file(filesdict, fpath, fullpath, pkg)
+            add_file(filesdict, seeninodes, fpath, fullpath, pkg)
     return filesdict
 
 #
@@ -97,10 +113,11 @@ def build_package_size(filesdict, builddir):
             if not frelpath in filesdict:
                 print("WARNING: %s is not part of any package" % frelpath)
                 pkg = "unknown"
+                sz = os.path.getsize(fpath)
             else:
-                pkg = filesdict[frelpath][0]
+                pkg, sz = filesdict[frelpath]
 
-            pkgsize[pkg] += os.path.getsize(fpath)
+            pkgsize[pkg] += sz
 
     return pkgsize
 
-- 
2.7.4
