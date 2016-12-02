From: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
Date: Fri,  2 Dec 2016 13:21:23 -0200
Subject: [Buildroot] [RFC v2 4/4] support/download/git: shallow fetch of all
	branches
In-Reply-To: <20161202152123.20399-1-ricardo.martincoski@datacom.ind.br>
References: <20161202152123.20399-1-ricardo.martincoski@datacom.ind.br>
Message-ID: <20161202152123.20399-5-ricardo.martincoski@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When a branch of a package is tracked using sha1 and the remote branch
moves (usually gets another commit), this script stops using a shallow
fetch since the sha1 is not anymore the head of the branch, falling back
to a full clone.

As a middle ground between a --depth 1 fetch and a full clone, fetch all
branches with depth of 100. We have a good change to catch the desired
version reducing the data transfer from the remote when fetching from
large repos, especially hardware-specific linux trees.

In the case the desired version is not in this shallow fetch, fall back
to a full fetch that reuses the objects already downloaded.

This method causes an extra burden in the server side ('Compressing
objects'), usually a few seconds, but the potential reduction of data
transferred should be beneficial for both the user and the server.

https://github.com/raspberrypi/linux.git
100 commits from all branches 567.47 MiB
git clone 1.49 GiB

https://github.com/Freescale/linux-fslc.git
100 commits from all branches 944.72 MiB + 73.89 KiB
git clone 1.68 GiB

https://github.com/linux-sunxi/sunxi-mali-proprietary
100 commits from all branches 7.55 MiB
git clone 7.55 MiB

Reported-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
---
Changes v1 -> v2:
  - new RFC patch with the feature suggested by Arnout in [1].
    - I implemented only for branches, instead of branches and tags;
    - the code only runs for full sha1 because this shallow fetch has a
      subset of the sha1 from the repo and we could end up successfully
      checking out the wrong sha1 based on a partial sha1 when we really
      should fail the checkout (as if a git clone took place);
    - the check for full sha1 as change set is performed is a very
      simplistic way: cset has 40 char. Of course we could create a more
      complex check (e.g. 40 char in [0-9a-fA-F]) but I thought it does
      not worth the effort, since we cannot know for sure it is a sha1
      or not; and also in the worst case it falls back to a full clone;
    - the only case --depth is not supported for any git command is when
      the server supports only dumb http transport, in this case the
      script falls back to a full clone.

[1] http://patchwork.ozlabs.org/patch/690098/

Here some measurements, notice most of them are not used by Buildroot
and are here just for comparison:

https://github.com/raspberrypi/linux.git
100 commits from all branches 567.47 MiB
git clone 1.49 GiB
git clone --mirror 1.50 GiB

https://github.com/Freescale/linux-fslc.git
100 commits from all branches 944.72 MiB + 73.89 KiB
git clone 1.68 GiB
git clone --mirror 1.69 GiB

http://arago-project.org/git/projects/am33x-cm3.git
100 commits from all branches fails, server supports only dumb http
git clone 5,6M
git clone --mirror 5,6M
(measured using du -s -h .git/objects/)

https://github.com/torvalds/linux.git
100 commits from all branches 469.40 MiB + 66.09 KiB
git clone 1.62 GiB
git clone --mirror 1.82 GiB

https://github.com/linux-sunxi/sunxi-mali-proprietary
100 commits from all branches 7.55 MiB
git clone 7.55 MiB
git clone --mirror 7.55 MiB

https://github.com/tmux/tmux.git
100 commits from all branches 1.13 MiB
git clone 6.62 MiB
git clone --mirror 6.91 MiB

https://github.com/hishamhm/htop.git
100 commits from all branches 1.62 MiB
git clone 1.92 MiB
git clone --mirror 2.20 MiB

git://git.buildroot.net/buildroot
100 commits from all branches 9.61 MiB
git clone 47.51 MiB
git clone --mirror 47.51 MiB

https://github.com/buildroot/buildroot.git
100 commits from all branches 7.82 MiB
git clone 61.94 MiB
git clone --mirror 64.72 MiB

https://github.com/laravel/framework.git
100 commits from all branches 9.12 MiB
git clone 24.09 MiB
git clone --mirror 41.05 MiB
---
 support/download/git | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/support/download/git b/support/download/git
index 42048ad48..59687a323 100755
--- a/support/download/git
+++ b/support/download/git
@@ -104,6 +104,26 @@ if [ "${ref}" ]; then
         printf "Shallow fetch failed, falling back to doing a full fetch\n"
     fi
 fi
+if [ ${git_done} -eq 0 -a ${#cset} -eq 40 ]; then
+    printf "Doing shallow fetch of all branches\n"
+    # When the version of a package is following a branch it is usual to use
+    # the sha1 instead of the branch name in order to assure reproducible
+    # builds. When a new commit is added to the branch in the upstream, the
+    # selected version is not anymore in the branch head, leading to a full
+    # fetch.
+    # As a middle ground between a --depth 1 fetch and a full fetch, fetch all
+    # branches with depth of 100. We have a good change to catch the desired
+    # version and it makes difference when fetching from large repos.
+    # Check the fetch is successful for the case the remote does not support
+    # smart http transport.
+    if _git fetch -u ${verbose} "${@}" --depth 100 "'${repo}'" \
+                  "'+refs/heads/*:refs/heads/*'" 2>&1; then
+        unshallow=--unshallow
+        if _git checkout -q "'${cset}'" 2>&1; then
+            git_done=1
+        fi
+    fi
+fi
 if [ ${git_done} -eq 0 ]; then
     printf "Doing full fetch\n"
     # Fetch all branch and tag refs. The same as git clone.
-- 
2.11.0
