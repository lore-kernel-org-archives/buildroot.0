From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 28 Apr 2018 21:34:49 +0200
Subject: [Buildroot] [PATCH 7/7 v4] download/git: always do full-clone
In-Reply-To: <cover.1524944063.git.yann.morin.1998@free.fr>
References: <cover.1524944063.git.yann.morin.1998@free.fr>
Message-ID: <b047fa7d0f366bfe767231112121e22cfc88f0de.1524944063.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We currently attempt a shallow clone, as tentative to save bandwidth and
download time.

However, now that we keep the git tree as a cache, it may happen that we
need to checkout an earlier commit, and that would not be present with a
shallow clone.

Furthermore, the shallow fetch is already really broken, and just
happens to work by chance. Consider the following actions, which are
basically what happens today:

    mkdir git
    git init git
    cd git
    git remote add origin https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
    git fetch origin --depth 1 v4.17-rc1
    if ! git fetch origin v4.17-rc1:v4.17-rc1 ; then
        echo "warning"
    fi
    git checkout v4.17-rc1

The checkout succeeds just because of the git-fetch in the if-condition,
which is initially there to fetch the special refs from github PRs, or
gerrit reviews. That fails, but we just print a warning. If we were to
ever remove support for special refs, then the checkout would fail.

The whole purpose of the git cache is to actually save bandwidth and
download time, but in the long run. For one-offs, people would
preferably use a wget download (e.g. with the github macro) instead of
a git clone.

We switch to always doing a full clone. It is more correct, and pays off
in the long run...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 support/download/git | 24 +++---------------------
 1 file changed, 3 insertions(+), 21 deletions(-)

diff --git a/support/download/git b/support/download/git
index b98a5d6143..a41dad339b 100755
--- a/support/download/git
+++ b/support/download/git
@@ -111,27 +111,9 @@ fi
 
 _git remote set-url origin "'${uri}'"
 
-# Try to fetch with limited depth, since it is faster than a full clone - but
-# that only works if the version is a ref (tag or branch). Before trying to do
-# a shallow clone we check if ${cset} is in the list provided by git ls-remote.
-# If not we fallback to a full fetch.
-#
-# Messages for the type of clone used are provided to ease debugging in
-# case of problems
-git_done=0
-if [ -n "$(_git ls-remote origin "'${cset}'" 2>&1)" ]; then
-    printf "Doing a shallow fetch\n"
-    if _git fetch "${@}" --depth 1 origin "'${cset}'"; then
-        git_done=1
-    else
-        printf "Shallow fetch failed, falling back to fetching all refs\n"
-    fi
-fi
-if [ ${git_done} -eq 0 ]; then
-    printf "Fetching all references\n"
-    _git fetch origin
-    _git fetch origin -t
-fi
+printf "Fetching all references\n"
+_git fetch origin
+_git fetch origin -t
 
 # Try to get the special refs exposed by some forges (pull-requests for
 # github, changes for gerrit...). There is no easy way to know whether
-- 
2.14.1
