From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 19 Apr 2018 22:30:50 +0200
Subject: [Buildroot] [git commit] download/git: ensure we always work in the
 expected repository
Message-ID: <20180419203539.3E2C98880B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a07da16e781d2be52a9a35490e1ab705d6f80cdf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

git always look directories up until it finds a repository. In case
the git cache is broken, it may no longer be identified as a repository,
and git will look higher in the directories until it finds one.

In the default conditions, this would be Buildroot's own git tree
(because DL_DIR is a subdir of Buildroot), but in some situations may
very well be any repository the user has Buildroot in, like a
br2-external tree...

So, we force git to use our git cache and never look elsewhere, as
Suggested by Ricardo.

Use GIT_DIR, as it has been there for ages now, while --git-dir was
only introduced later (even if most distros ship an later version),
as suggested by Arnout.

Also fix the one call to git that was not using the wrapper.

Reported-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Acked-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Tested-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/download/git | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/support/download/git b/support/download/git
index 381f3ceeb3..c166ae2813 100755
--- a/support/download/git
+++ b/support/download/git
@@ -34,25 +34,28 @@ done
 
 shift $((OPTIND-1)) # Get rid of our options
 
+# We want to check if a cache of the git clone of this repo already exists.
+git_cache="${dl_dir}/git"
+
 # Caller needs to single-quote its arguments to prevent them from
 # being expanded a second time (in case there are spaces in them)
 _git() {
-    eval ${GIT} "${@}"
+    eval GIT_DIR="${git_cache}/.git" ${GIT} "${@}"
 }
 
-# We want to check if a cache of the git clone of this repo already exists.
-git_cache="${dl_dir}/git"
-
 # If the cache directory doesn't exists, init a new repo, which will be
 # fetch'ed later.
 if [ ! -d "${git_cache}" ]; then
+    # We can still go through the wrapper, because 'init' does not use
+    # the path pointed to by GIT_DIR, but really uses the directory
+    # passed as argument.
     _git init "'${git_cache}'"
 fi
 
 pushd "${git_cache}" >/dev/null
 
 # Ensure the repo has an origin (in case a previous run was killed).
-if ! git remote |grep -q -E '^origin$'; then
+if ! _git remote |grep -q -E '^origin$'; then
     _git remote add origin "'${uri}'"
 fi
 
