From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 10 Apr 2018 09:28:43 +0200
Subject: [Buildroot] [git commit] download/git: more resilient in case of
 kill
Message-ID: <20180410072857.9C54C88342@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6dfaa33d131ca9d8b056956f16f94e8370bd7289
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In case the git backend gets killed right in-between it finished
initialising the repository, but before it could add the remote,
we'd end up with a repository without the 'origin' remote, so we
would not be able to change its URL.

Another case that may happen (like in the build failure, below),
is that the repository was initialised with a previous version
of Buildroot, before the commit e17719264b (download/git: don't
require too-recent git) was applied, and that trepository was
still lying around...

Fixes:
    http://autobuild.buildroot.org/results/25a/25aae054634368fadb265b97ebe4dda809deff6f/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/download/git | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/support/download/git b/support/download/git
index 868dfad0dd..381f3ceeb3 100755
--- a/support/download/git
+++ b/support/download/git
@@ -47,13 +47,15 @@ git_cache="${dl_dir}/git"
 # fetch'ed later.
 if [ ! -d "${git_cache}" ]; then
     _git init "'${git_cache}'"
-    pushd "${git_cache}" >/dev/null
-    _git remote add origin "'${uri}'"
-    popd >/dev/null
 fi
 
 pushd "${git_cache}" >/dev/null
 
+# Ensure the repo has an origin (in case a previous run was killed).
+if ! git remote |grep -q -E '^origin$'; then
+    _git remote add origin "'${uri}'"
+fi
+
 _git remote set-url origin "'${uri}'"
 
 # Try to fetch with limited depth, since it is faster than a full clone - but
