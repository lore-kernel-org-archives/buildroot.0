From: Robert Beckett <bbeckett@netvu.org.uk>
Date: Mon,  4 Jun 2018 14:32:29 +0100
Subject: [Buildroot] [PATCH 1/2] git: fix handling of git repos using master
 as version
Message-ID: <1528119150-28659-1-git-send-email-bbeckett@netvu.org.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since changing to git init followed by fetch to initialise
git cache, when using master branch as the target version
for a package, git refuses to fetch in to currently checkout
out branch or master.

git init always creates a master branch, so this will always
be an issue for any package targeting master.
Add -u option to git fetch command to allow it to ignore that
check. We know that it is okay to overwrite master as we know that
it either contains nothing after the initial git init command, or
is tracking the remote master after a successful fetch.
We always want it to overwrite it.

Signed-off-by: Robert Beckett <bbeckett@netvu.org.uk>
---
 support/download/git | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/download/git b/support/download/git
index 11bb52c..c33e692 100755
--- a/support/download/git
+++ b/support/download/git
@@ -122,7 +122,7 @@ _git fetch origin -t
 # below, if there is an issue anyway. Since most of the cset we're gonna
 # have to clone are not such special refs, consign the output to oblivion
 # so as not to alarm unsuspecting users, but still trace it as a warning.
-if ! _git fetch origin "'${cset}:${cset}'" >/dev/null 2>&1; then
+if ! _git fetch -u origin "'${cset}:${cset}'" >/dev/null 2>&1; then
     printf "Could not fetch special ref '%s'; assuming it is not special.\n" "${cset}"
 fi
 
-- 
2.7.4
