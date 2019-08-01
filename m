From: Atharva Lele <itsatharva@gmail.com>
Date: Thu,  1 Aug 2019 08:16:39 +0530
Subject: [Buildroot] [PATCH v4 26/30] scripts/autobuild-run: support
 changing repo
In-Reply-To: <20190801024643.11024-1-itsatharva@gmail.com>
References: <20190801024643.11024-1-itsatharva@gmail.com>
Message-ID: <20190801024643.11024-27-itsatharva@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

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
[Atharva: Adapted Thomas' patches to work with Builder class]
Signed-off-by: Atharva Lele <itsatharva@gmail.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
Changes v1 -> v2:
  - Incorporate Thomas' patch into Builder class series
---
 scripts/autobuild-run | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 8f60e89..09dd520 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -361,12 +361,12 @@ class Builder:
 
         # Update the Buildroot sources.
         abssrcdir = os.path.abspath(self.srcdir)
-        ret = subprocess.call(["git", "fetch", "origin"], cwd=abssrcdir, stdout=self.log, stderr=self.log)
+        ret = subprocess.call(["git", "fetch", self.repo, branch], cwd=abssrcdir, stdout=self.log, stderr=self.log)
         if ret != 0:
             log_write(self.log, "ERROR: could not fetch Buildroot sources")
             return -1
 
-        ret = subprocess.call(["git", "checkout", "--detach", "origin/%s" % branch], cwd=abssrcdir, stdout=self.log, stderr=self.log)
+        ret = subprocess.call(["git", "checkout", "FETCH_HEAD"], cwd=abssrcdir, stdout=self.log, stderr=self.log)
         if ret != 0:
             log_write(self.log, "ERROR: could not check out Buildroot sources")
             return -1
-- 
2.22.0
