From: Andrey Yurovsky <yurovsky@gmail.com>
Date: Sat, 11 Nov 2017 18:17:36 -0800
Subject: [Buildroot] potential divide by zero in support/scripts/size-stats
Message-ID: <CAAkeqgUXF5eVOjQEUkM0OARw+cvMxGG-REv2rw-3BRu9y-yz0A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I see a divide by zero exception in support/scripts/size-stats when I
use the graph-size target, the package of size zero causing this is
skeleton-init-systemd which I worked out by catching the exception. Is
this package erroneously of size zero or should that be OK?

---
 support/scripts/size-stats | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/support/scripts/size-stats b/support/scripts/size-stats
index af45000..3cd6838 100755
--- a/support/scripts/size-stats
+++ b/support/scripts/size-stats
@@ -178,9 +178,12 @@ def gen_files_csv(filesdict, pkgsizes, outputf):
                      "File size in system (%)"])
         for f, (pkgname, filesize) in filesdict.items():
             pkgsize = pkgsizes[pkgname]
-            wr.writerow([f, pkgname, filesize, pkgsize,
-                         "%.1f" % (float(filesize) / pkgsize * 100),
-                         "%.1f" % (float(filesize) / total * 100)])
+            try:
+                wr.writerow([f, pkgname, filesize, pkgsize,
+                        "%.1f" % (float(filesize) / pkgsize * 100),
+                        "%.1f" % (float(filesize) / total * 100)])
+            except ZeroDivisionError:
+                print('WARNING: \"%s\" is size 0!' % pkgname)


 #
-- 
2.9.5
