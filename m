From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 12 Dec 2019 15:42:50 +0100
Subject: [Buildroot] [git commit] support/download/git: rename local refs to
 avoid confusing Git warning
Message-ID: <20191212201447.B7C538A2BF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6f35d967564863ab150eabf32ca462889bf1e049
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Running "git fetch origin ${cset}:${cset}" to create a local ref
${cset} from the remote ref ${cset} causes Git to issue a warning like
the below, when the version is a full commit hash:

===

warning: refname '49eb4ecb1ef9879ebc6789a1bdb536ab2b1d9871' is ambiguous.
Git normally never creates a ref that ends with 40 hex characters
because it will be ignored when you just specify 40-hex. These refs
may be created by mistake. For example,

  git switch -c $br $(git rev-parse ...)

where "$br" is somehow empty and a 40-hex ref is created. Please
examine these refs and maybe delete them. Turn this message off by
running "git config advice.objectNameWarning false"

===

This warning is very confusing for users, and is caused by the fact
that Git doesn't like our local ref name to look like a commit hash.

So, this commit proposes to fix the issue by having the local ref
named buildroot-${cset}, i.e
buildroot-${version-specified-by-the-package}.

The generated tarballs are exactly identical, nothing changes, it is
really just internally the local ref we are using to checkout the
correct version that is different. And it avoids the confusing
warning.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/download/git | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/support/download/git b/support/download/git
index 075f665bbf..c243b8aa9f 100755
--- a/support/download/git
+++ b/support/download/git
@@ -122,14 +122,14 @@ _git fetch origin -t
 # below, if there is an issue anyway. Since most of the cset we're gonna
 # have to clone are not such special refs, consign the output to oblivion
 # so as not to alarm unsuspecting users, but still trace it as a warning.
-if ! _git fetch origin "'${cset}:${cset}'" >/dev/null 2>&1; then
+if ! _git fetch origin "'${cset}:buildroot-${cset}'" >/dev/null 2>&1; then
     printf "Could not fetch special ref '%s'; assuming it is not special.\n" "${cset}"
 fi
 
 # Check that the changeset does exist. If it does not, re-cloning from
 # scratch won't help, so we don't want to trash the repository for a
 # missing commit. We just exit without going through the ERR trap.
-if ! _git rev-parse --quiet --verify "'${cset}^{commit}'" >/dev/null 2>&1; then
+if ! _git rev-parse --quiet --verify "'buildroot-${cset}^{commit}'" >/dev/null 2>&1; then
     printf "Commit '%s' does not exist in this repository.\n" "${cset}"
     exit 1
 fi
@@ -162,7 +162,7 @@ _git submodule --quiet foreach "'${cmd}'"
 
 # Checkout the required changeset, so that we can update the required
 # submodules.
-_git checkout -f -q "'${cset}'"
+_git checkout -f -q "'buildroot-${cset}'"
 
 # Get rid of now-untracked directories (in case a git operation was
 # interrupted in a previous run, or to get rid of empty directories
