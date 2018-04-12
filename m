From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Thu, 12 Apr 2018 06:28:55 -0300
Subject: [Buildroot] [RFC PATCH 3/3] download/git: unshallow when fetching
 all refs
In-Reply-To: <20180412092855.30621-1-ricardo.martincoski@gmail.com>
References: <20180412092855.30621-1-ricardo.martincoski@gmail.com>
Message-ID: <20180412092855.30621-4-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With any version of git, after the git cache was once populated using a
shallow fetch, a full fetch succeeds but doesn't download the commits
behind the reference that was fetched with --depth 1. In this case the
download fails like this:
 Fetching all references
 Could not fetch special ref 'sha1'; assuming it is not special.
 fatal: reference is not a tree: sha1

One scenario in buildroot development that would trigger this sequence
is for example when a package is bumped on master branch, some users
create the git cache at this time, then the bump is reverted.

Another scenario is when giving maintenance to a product version that
uses one version of buildroot using the same build farm that uses a
newer version of buildroot.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
WARNING: this patch is in early stage, really RFC. I tested it in a
short period of time.

I tested it by first creating the cache for dt-utils in its current
version, then I changed dt-utils version to the commit immediately
before it (ea1d08e26b73a4855165ed56043fa439ff9948cb). Without this patch
the fetch of all refs succeeds but does not bring the desired commit and
the checkout fails.
---
 support/download/git | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/support/download/git b/support/download/git
index 68b5d920a1..8216da0a71 100755
--- a/support/download/git
+++ b/support/download/git
@@ -76,7 +76,15 @@ if [ -n "$(_git ls-remote origin "'${cset}'" 2>&1)" ]; then
 fi
 if [ ${git_done} -eq 0 ]; then
     printf "Fetching all references\n"
-    _git fetch origin -u "'+refs/tags/*:refs/tags/*'" "'+refs/heads/*:refs/remotes/origin/*'"
+    # After a shallow fetch was once sucessful in this repo, the only way to
+    # ensure the commits behind its current depth are available is to unshallow.
+    # Git versions older than 2.15.0 do not have a command to know if a repo is
+    # shallow, so test for the actual file.
+    if [ -f "$(git rev-parse --git-dir)/shallow" ]; then
+        unshallow=--unshallow
+    fi
+    _git fetch origin -u ${unshallow} \
+               "'+refs/tags/*:refs/tags/*'" "'+refs/heads/*:refs/remotes/origin/*'"
 fi
 
 # Try to get the special refs exposed by some forges (pull-requests for
-- 
2.14.1
