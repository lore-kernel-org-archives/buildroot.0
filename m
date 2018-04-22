From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Apr 2018 11:07:50 +0200
Subject: [Buildroot] [PATCH 1/6 v2] download/git: run all git commands in
 the current directory
In-Reply-To: <cover.1524388060.git.yann.morin.1998@free.fr>
References: <cover.1524388060.git.yann.morin.1998@free.fr>
Message-ID: <dbf0fb7bf945d54ce2f667c00977513181f74dfd.1524388060.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

That way, we can pushd earlier, which will help with last-ditch recovery
in a followup commit.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 support/download/git | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/support/download/git b/support/download/git
index bf05c595a5..19a3e8ebee 100755
--- a/support/download/git
+++ b/support/download/git
@@ -34,8 +34,10 @@ done
 
 shift $((OPTIND-1)) # Get rid of our options
 
-# We want to check if a cache of the git clone of this repo already exists.
+# Create and cd into the directory that will contain the local git cache
 git_cache="${dl_dir}/git"
+mkdir -p "${git_cache}"
+pushd "${git_cache}" >/dev/null
 
 # Caller needs to single-quote its arguments to prevent them from
 # being expanded a second time (in case there are spaces in them)
@@ -52,9 +54,7 @@ _git() {
 # We can still go through the wrapper, because 'init' does not use the
 # path pointed to by GIT_DIR, but really uses the directory passed as
 # argument.
-_git init "'${git_cache}'"
-
-pushd "${git_cache}" >/dev/null
+_git init .
 
 # Ensure the repo has an origin (in case a previous run was killed).
 if ! _git remote |grep -q -E '^origin$'; then
-- 
2.14.1
