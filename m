From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 17 Jun 2019 20:22:36 +0200
Subject: [Buildroot] [PATCH buildroot-test 2/2] scripts/autobuild-run:
 support changing repo
In-Reply-To: <20190617182236.23918-1-thomas.petazzoni@bootlin.com>
References: <20190617182236.23918-1-thomas.petazzoni@bootlin.com>
Message-ID: <20190617182236.23918-2-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The current logic in prepare_build() assumes that the "origin" repo
never changes. However, if one regularly changes his autobuild-run
configuration, switching being repository, this is not
true. Currently, it requires manually wiping out the Buildroot clone
in every autobuild instance when changing the repository to pull from.

So instead, use:

 git fetch <repo> <branch>
 git checkout FETCH_HEAD

which will easily allow switching from one repo to the other.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 scripts/autobuild-run | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 6fea389..ce88ea4 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -330,12 +330,12 @@ def prepare_build(**kwargs):
 
     # Update the Buildroot sources.
     abssrcdir = os.path.abspath(srcdir)
-    ret = subprocess.call(["git", "fetch", "origin"], cwd=abssrcdir, stdout=log, stderr=log)
+    ret = subprocess.call(["git", "fetch", kwargs['repo'], branch], cwd=abssrcdir, stdout=log, stderr=log)
     if ret != 0:
         log_write(log, "ERROR: could not fetch Buildroot sources")
         return -1
 
-    ret = subprocess.call(["git", "checkout", "--detach", "origin/%s" % branch], cwd=abssrcdir, stdout=log, stderr=log)
+    ret = subprocess.call(["git", "checkout", "FETCH_HEAD"], cwd=abssrcdir, stdout=log, stderr=log)
     if ret != 0:
         log_write(log, "ERROR: could not check out Buildroot sources")
         return -1
-- 
2.21.0
