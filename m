From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 12 Dec 2019 21:24:35 +0100
Subject: [Buildroot] [git commit] Revert "support/download/git: rename local
 refs to avoid confusing Git warning"
Message-ID: <20191212201628.A0F3F8122A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fbee5c8e91b5d54c5344f44bfc9927bc7e0e4fc1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 6f35d967564863ab150eabf32ca462889bf1e049.

Repeat after me: on the master branch you will not work. On the master
branch you will not work.

This definitely shouldn't have been pushed. Sorry about that.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/download/git | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/support/download/git b/support/download/git
index c243b8aa9f..075f665bbf 100755
--- a/support/download/git
+++ b/support/download/git
@@ -122,14 +122,14 @@ _git fetch origin -t
 # below, if there is an issue anyway. Since most of the cset we're gonna
 # have to clone are not such special refs, consign the output to oblivion
 # so as not to alarm unsuspecting users, but still trace it as a warning.
-if ! _git fetch origin "'${cset}:buildroot-${cset}'" >/dev/null 2>&1; then
+if ! _git fetch origin "'${cset}:${cset}'" >/dev/null 2>&1; then
     printf "Could not fetch special ref '%s'; assuming it is not special.\n" "${cset}"
 fi
 
 # Check that the changeset does exist. If it does not, re-cloning from
 # scratch won't help, so we don't want to trash the repository for a
 # missing commit. We just exit without going through the ERR trap.
-if ! _git rev-parse --quiet --verify "'buildroot-${cset}^{commit}'" >/dev/null 2>&1; then
+if ! _git rev-parse --quiet --verify "'${cset}^{commit}'" >/dev/null 2>&1; then
     printf "Commit '%s' does not exist in this repository.\n" "${cset}"
     exit 1
 fi
@@ -162,7 +162,7 @@ _git submodule --quiet foreach "'${cmd}'"
 
 # Checkout the required changeset, so that we can update the required
 # submodules.
-_git checkout -f -q "'buildroot-${cset}'"
+_git checkout -f -q "'${cset}'"
 
 # Get rid of now-untracked directories (in case a git operation was
 # interrupted in a previous run, or to get rid of empty directories
