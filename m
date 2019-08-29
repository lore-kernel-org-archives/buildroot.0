From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 29 Aug 2019 09:22:33 +0200
Subject: [Buildroot] [PATCH] support/scripts/pkg-stats: extract current
 commit id, not master
Message-ID: <20190829072233.29988-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

pkg-stats extracts the Buildroot commit id from which the package
information was collected. However, when doing so, it always assumes
we're using the master branch, by running "git log master".

But in fact, pkg-stats can be run from any branch/tag, so it makes a
lot more sense to use "git log HEAD".

Cc: victor.huesca at bootlin.com
Cc: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
As was discussed with Baruch and others, the page at
http://autobuild.buildroot.net/stats/ now shows the results
corresponding to the next branch when such a branch exists. However,
the commit ID currently shown at the bottom of the page is incorrect,
as it shows the one of the master branch at the time the page was
generated.
---
 support/scripts/pkg-stats | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 992c2dd7c5..6cb3a6a038 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -727,7 +727,7 @@ def __main__():
     else:
         package_list = None
     date = datetime.datetime.utcnow()
-    commit = subprocess.check_output(['git', 'log', 'master', '-n', '1',
+    commit = subprocess.check_output(['git', 'log', 'HEAD', '-n', '1',
                                       '--pretty=format:%H']).splitlines()[0]
     print("Build package list ...")
     packages = get_pkglist(args.npackages, package_list)
-- 
2.21.0
