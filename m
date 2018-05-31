From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 31 May 2018 19:32:45 +0200
Subject: [Buildroot] [git commit] download/cvs: add a 10 minute timeout
Message-ID: <20180531173716.DA4E283688@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=66f40a7242cb98cae765648af568b4b77b318365
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Apparently, CVS servers can be deadlocked and in that case clients will
retry connecting to them indefinitely. Cfr.
http://autobuild.buildroot.net/results/23d/23d1034b33d0354de15de2ec4a8ccd0603e8db78/build-end.log
Apparently, the sf.net CVS server got in such a deadlock on 2018-05-18,
and almost 2 weeks later it is still not fixed.

Instead of just hanging, we should fall back on BR2_SECONDARY_SITE. To
achieve this, it's sufficient to add a timeout to the CVS command.

The timeout value is of course arbitrary. However, we can assume that
nobody will be putting large projects under CVS any more. So if the
download takes more than 5 minutes, it's probably broken. Let's put the
timeout at 10 minutes then.

Fixes:
http://autobuild.buildroot.net/results/db3/db33d4fa507fb3b4132423cd0a7e25a1fe6e4105
http://autobuild.buildroot.net/results/b6d/b6d927dcc73ac8d754422577dacefff4ff918a5c
http://autobuild.buildroot.net/results/23d/23d1034b33d0354de15de2ec4a8ccd0603e8db78
http://autobuild.buildroot.net/results/127/1272a3aa3077e434c9805ec3034f35e6fcc330d4

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/download/cvs | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/support/download/cvs b/support/download/cvs
index 3f77b849e4..9d0dc3cb3a 100755
--- a/support/download/cvs
+++ b/support/download/cvs
@@ -33,9 +33,13 @@ done
 shift $((OPTIND-1)) # Get rid of our options
 
 # Caller needs to single-quote its arguments to prevent them from
-# being expanded a second time (in case there are spaces in them)
+# being expanded a second time (in case there are spaces in them).
+# If the CVS server is deadlocked, the client will never return (cfr.
+# http://autobuild.buildroot.net/results/23d/23d1034b33d0354de15de2ec4a8ccd0603e8db78/build-end.log
+# ). Since nobody sane will put large code bases in CVS, a timeout of
+# 10 minutes should do the trick.
 _cvs() {
-    eval ${CVS} "${@}"
+    eval timeout 10m ${CVS} "${@}"
 }
 
 if [[ ${rev} =~ ^[0-9] ]]; then
