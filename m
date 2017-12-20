From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 20 Dec 2017 21:52:17 +0100
Subject: [Buildroot] [git commit branch/2017.02.x]
 support/scripts/size-stats: avoid divide-by-zero
Message-ID: <20171220210024.A7CF1835D9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f85b97136b3737cb7385abbbd4b19712cf6b8c35
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Some packages (ex: skeleton-init-systemd) have a zero size so we cannot
divide by the package size. In that case make their percent zero
explicitly and avoid a ZeroDivisionError exception.

Signed-off-by: Andrey Yurovsky <yurovsky@gmail.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 88af7d330dec7b6386a9994d8e53900033d85903)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/scripts/size-stats | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/support/scripts/size-stats b/support/scripts/size-stats
index af45000..3ff2a1c 100755
--- a/support/scripts/size-stats
+++ b/support/scripts/size-stats
@@ -178,9 +178,17 @@ def gen_files_csv(filesdict, pkgsizes, outputf):
                      "File size in system (%)"])
         for f, (pkgname, filesize) in filesdict.items():
             pkgsize = pkgsizes[pkgname]
+
+            if pkgsize == 0:
+                percent_pkg = 0
+            else:
+                percent_pkg = float(filesize) / pkgsize * 100
+
+            percent_total = float(filesize) / total * 100
+
             wr.writerow([f, pkgname, filesize, pkgsize,
-                         "%.1f" % (float(filesize) / pkgsize * 100),
-                         "%.1f" % (float(filesize) / total * 100)])
+                         "%.1f" % percent_pkg,
+                         "%.1f" % percent_total])
 
 
 #
