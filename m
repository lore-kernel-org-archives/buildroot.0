From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 12 Aug 2017 11:49:43 +0200
Subject: [Buildroot] [PATCH] autobuild-run: fix retrieving the gitid
Message-ID: <20170812094943.16460-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Before 66f91eb (autobuild-run: add --repo option), we used to 'git pull'
to update the local Buildroot clone. This had the side-effect of
updating the local refs because we were pulling from 'origin'.

So 'origin/master' and 'master' were correctly updated.

But since the offending commit, we no longer pull, and we instead fetch
from an explicit repository, which never updates 'origin/master' nor
'master'. Instead, they both are stuck at the time the repository was
cloned, or at the time the autobuild script was updated.

We fix that by just dropping the 'master' ref from the git log so that
the log applies to the commit for current working copy.

Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reported-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 scripts/autobuild-run | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index ef4f40e..406b8e5 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -409,7 +409,7 @@ def send_results(result, **kwargs):
         shutil.copyfile(os.path.join(outputdir, "legal-info", "manifest.csv"),
                         os.path.join(resultdir, "licenses-manifest.csv"))
 
-    subprocess.call(["git log master -n 1 --pretty=format:%%H > %s" % \
+    subprocess.call(["git log -n 1 --pretty=format:%%H > %s" % \
                      os.path.join(resultdir, "gitid")],
                     shell=True, cwd=srcdir)
 
-- 
2.11.0
