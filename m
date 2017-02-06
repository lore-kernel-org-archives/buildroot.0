From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Feb 2017 19:38:53 +0100
Subject: [Buildroot] [git commit] size-stats: don't count hard links
Message-ID: <20170206183859.D00348212E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2ec0a7d11ca6c5a6fa1fe142e291a8f308f9c91f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This change adds inode tracking to the size-stats script so that hard
links don't cause files to be double counted. This has a significant
effect on the size computation for some packages. For example, git has
around a dozen hard links to a large file. Before this change, git would
weigh in at about 170 MB with the total filesystem size reported as
175 MB. The actual rootfs.ext2 size was around 16 MB. With the change,
the git package registers at 10.5 MB with a total filesystem size of
15.8 MB.

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
Acked-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/scripts/size-stats | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/support/scripts/size-stats b/support/scripts/size-stats
index 0ddcc07..af45000 100755
--- a/support/scripts/size-stats
+++ b/support/scripts/size-stats
@@ -88,11 +88,20 @@ def build_package_dict(builddir):
 def build_package_size(filesdict, builddir):
     pkgsize = collections.defaultdict(int)
 
+    seeninodes = set()
     for root, _, files in os.walk(os.path.join(builddir, "target")):
         for f in files:
             fpath = os.path.join(root, f)
             if os.path.islink(fpath):
                 continue
+
+            st = os.stat(fpath)
+            if st.st_ino in seeninodes:
+                # hard link
+                continue
+            else:
+                seeninodes.add(st.st_ino)
+
             frelpath = os.path.relpath(fpath, os.path.join(builddir, "target"))
             if not frelpath in filesdict:
                 print("WARNING: %s is not part of any package" % frelpath)
@@ -100,7 +109,7 @@ def build_package_size(filesdict, builddir):
             else:
                 pkg = filesdict[frelpath][0]
 
-            pkgsize[pkg] += os.path.getsize(fpath)
+            pkgsize[pkg] += st.st_size
 
     return pkgsize
 
