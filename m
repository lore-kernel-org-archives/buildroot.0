From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 19 Apr 2018 22:32:28 +0200
Subject: [Buildroot] [git commit] download/git: ensure we have a sane
 repository
Message-ID: <20180419203539.52C58887D9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d48a1b0d5e43c1dee5343f2d5dcbdc5808d8fb2b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There are cases where a repository might be broken, e.g. when a previous
operation was killed or otherwise failed unexpectedly.

We fix that by always initialising the repository, as suggested by
Ricardo. git-init is safe on an otherwise-healthy repository:

    Running git init in an existing repository is safe. It will not
    overwrite things that are already there. [...]

Using git-init will just ensure that we have the strictly required files
to form a sane tree. Any blob that is still missing would get fetched
later on.

Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
 support/download/git | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/support/download/git b/support/download/git
index c166ae2813..1172310186 100755
--- a/support/download/git
+++ b/support/download/git
@@ -43,14 +43,16 @@ _git() {
     eval GIT_DIR="${git_cache}/.git" ${GIT} "${@}"
 }
 
-# If the cache directory doesn't exists, init a new repo, which will be
-# fetch'ed later.
-if [ ! -d "${git_cache}" ]; then
-    # We can still go through the wrapper, because 'init' does not use
-    # the path pointed to by GIT_DIR, but really uses the directory
-    # passed as argument.
-    _git init "'${git_cache}'"
-fi
+# Initialise a repository in the git cache. If the repository already
+# existed, this is a noop, unless the repository was broken, in which
+# case this magically restores it to working conditions. In the latter
+# case, we might be missing blobs, but that's not a problem: we'll
+# fetch what we need later anyway.
+#
+# We can still go through the wrapper, because 'init' does not use the
+# path pointed to by GIT_DIR, but really uses the directory passed as
+# argument.
+_git init "'${git_cache}'"
 
 pushd "${git_cache}" >/dev/null
 
