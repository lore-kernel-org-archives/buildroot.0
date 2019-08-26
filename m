From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 26 Aug 2019 22:07:50 +0200
Subject: [Buildroot] [git commit branch/next] support/graph-size: fix flake8
 warnings
Message-ID: <20190826204924.46E918660B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cecaf7001f0c9fa2089800dbd19541d70130fd18
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

There are three E501 warnings returned by flake8, when run locally,
because we enforce a local 80-char limit, but that are not reported by
the gitlab-ci jobs because only a 132-char limit is required there.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Reviewed-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 support/scripts/size-stats | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/support/scripts/size-stats b/support/scripts/size-stats
index deea92e278..8dfa391e24 100755
--- a/support/scripts/size-stats
+++ b/support/scripts/size-stats
@@ -66,8 +66,8 @@ def add_file(filesdict, relpath, abspath, pkg):
 #
 def build_package_dict(builddir):
     filesdict = {}
-    with open(os.path.join(builddir, "build", "packages-file-list.txt")) as filelistf:
-        for l in filelistf.readlines():
+    with open(os.path.join(builddir, "build", "packages-file-list.txt")) as f:
+        for l in f.readlines():
             pkg, fpath = l.split(",", 1)
             # remove the initial './' in each file path
             fpath = fpath.strip()[2:]
@@ -151,7 +151,8 @@ def draw_graph(pkgsize, outputf):
     plt.setp(texts, fontproperties=proptease)
 
     plt.suptitle("Filesystem size per package", fontsize=18, y=.97)
-    plt.title("Total filesystem size: %d kB" % (total / 1000.), fontsize=10, y=.96)
+    plt.title("Total filesystem size: %d kB" % (total / 1000.), fontsize=10,
+              y=.96)
     plt.savefig(outputf)
 
 
@@ -209,7 +210,8 @@ def gen_packages_csv(pkgsizes, outputf):
     total = sum(pkgsizes.values())
     with open(outputf, 'w') as csvfile:
         wr = csv.writer(csvfile, delimiter=',', quoting=csv.QUOTE_MINIMAL)
-        wr.writerow(["Package name", "Package size", "Package size in system (%)"])
+        wr.writerow(["Package name", "Package size",
+                     "Package size in system (%)"])
         for (pkg, size) in pkgsizes.items():
             wr.writerow([pkg, size, "%.1f" % (float(size) / total * 100)])
 
