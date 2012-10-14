From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Oct 2012 13:14:21 +0200
Subject: [Buildroot] [PATCH] pkg-avail: make it work without stgit
In-Reply-To: <1347234052-10527-3-git-send-email-yann.morin.1998@free.fr>
References: <1347234052-10527-3-git-send-email-yann.morin.1998@free.fr>
Message-ID: <1350213261-4929-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order to make this script usable by more developers, make it work
without stgit. It supports a --mode=stgit option or a --mode=git
option. When using --mode=stgit, it will preserve its existing
behavior, when using --mode=git, it will simply make git commits
without fuzzing needlessly with stgit.

I still don't understand why people keep using stgit. I guess it's a
remnant of quilt-style workflow or something like that, because the
plain git, with its "git rebase -i" feature, allows to do exactly the
same thing, without having to use a separate tool. So people using
stgit should /really/ consider having a serious look at "git rebase
-i", and when they will see the light, they will wonder why for so
many years they have suffered in keeping their old-style quilt-looking
workflows.

Note: the --mode=stgit hasn't been tested after the changes.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/scripts/pkg-avail |   44 +++++++++++++++++++++++++++++++-------------
 1 file changed, 31 insertions(+), 13 deletions(-)

diff --git a/support/scripts/pkg-avail b/support/scripts/pkg-avail
index 1f616fd..4d47a44 100755
--- a/support/scripts/pkg-avail
+++ b/support/scripts/pkg-avail
@@ -192,9 +192,23 @@ munge_files() {
     )
 }
 
+if [ $# -ne 1 ] ; then
+    echo "Usage: pkg-avail --mode=[stgit|git]"
+    exit 1
+fi
+
+if [ $1 = "--mode=stgit" ] ; then
+    mode=stgit
+elif [ $1 = "--mode=git" ] ; then
+    mode=git
+else
+    echo "Unknown argument"
+    exit 1
+fi
+
 # I have a local patch that updates the doc for the _AVAILABLE stuff,
 # and I want all munging patches to be pushed after that
-stg push -a >/dev/null 2>&1 || true
+[ $mode = "stgit" ] && stg push -a >/dev/null 2>&1 || true
 
 # Add the _AVAILABLE symbols...
 cat >/tmp/commit.msg <<-_EOF_
@@ -239,10 +253,11 @@ cat >/tmp/commit.msg <<-_EOF_
 	
 	With the construct above, using 'select' is now safe.
 _EOF_
-stg new --sign -f /tmp/commit.msg pkg-add-available
-rm /tmp/commit.msg
+[ $mode = "stgit" ] && stg new --sign -f /tmp/commit.msg pkg-add-available
 munge_files "${AWK_SCRIPT_ADD}"
-stg refresh
+[ $mode = "stgit" ] && stg refresh
+[ $mode = "git" ] && git commit -a -s -F /tmp/commit.msg
+rm /tmp/commit.msg
 
 # ... and use them, now! ;-)
 cat >/tmp/commit.msg <<-_EOF_
@@ -252,10 +267,11 @@ cat >/tmp/commit.msg <<-_EOF_
 	the corresponding _AVAILABLE symbol, and adds a 'select' against the
 	dependant package.
 _EOF_
-stg new --sign -f /tmp/commit.msg pkg-use-available
-rm /tmp/commit.msg
+[ $mode = "stgit" ] && stg new --sign -f /tmp/commit.msg pkg-use-available
 munge_files "${AWK_SCRIPT_USE}"
-stg refresh
+[ $mode = "stgit" ] && stg refresh
+[ $mode = "git" ] && git commit -a -s -F /tmp/commit.msg
+rm /tmp/commit.msg
 
 # Finally, check for missing 'depends on ..._AVAILABLE'
 cat >/tmp/commit.msg <<-_EOF_
@@ -264,10 +280,11 @@ cat >/tmp/commit.msg <<-_EOF_
 	This patch checks that all 'select' on a package have a 'depends on'
 	on the corresponding _AVAILABLE symbol.
 _EOF_
-stg new --sign -f /tmp/commit.msg pkg-check-available
-rm /tmp/commit.msg
+[ $mode = "stgit" ] && stg new --sign -f /tmp/commit.msg pkg-check-available
 munge_files "${AWK_SCRIPT_CHECK}"
-stg refresh
+[ $mode = "stgit" ] && stg refresh
+[ $mode = "git" ] && git commit -a -s -F /tmp/commit.msg
+rm /tmp/commit.msg
 
 # And eventually, get rid of ourselves (Seppuku!)
 cat >/tmp/commit.msg <<-_EOF_
@@ -276,11 +293,12 @@ cat >/tmp/commit.msg <<-_EOF_
 	This script has done its job, and is no-longer needed.
 	RIP, script!
 _EOF_
-stg new --sign -f /tmp/commit.msg pkg-delete-pkg_avail
-rm /tmp/commit.msg
+[ $mode = "stgit" ] && stg new --sign -f /tmp/commit.msg pkg-delete-pkg_avail
 rm -f support/scripts/pkg-avail
 git rm support/scripts/pkg-avail
-stg refresh
+[ $mode = "stgit" ] && stg refresh
+[ $mode = "git" ] && git commit -a -s -F /tmp/commit.msg
+rm /tmp/commit.msg
 
 # And eventually, get rid of ourselves (Seppuku!)
 
-- 
1.7.9.5
