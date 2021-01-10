From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 10 Jan 2021 22:06:58 +0100
Subject: [Buildroot] [git commit] support/dependencies: drop check for
 maximal tar version
Message-ID: <20210110205119.1F7AE8120A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ec50e407befe50ef605873dd6d113790e7e6126b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

So far, we checked that the tar present on the host was at most tar
1.29, because tar 1.30 changed the way it generates archives.

Having a maximum tar version requirement meant that we would eventually
always have to build our own host-tar, as distributions are updating
the version they use.

But now, we have found a way to generate reproducible archives starting
with tar 1.27 onward, so we no longer need the check for a maximum tar
version, so we can drop that requirement.

Note: this is semantically a revert of b8fa273d500b (check-host-tar.sh:
blacklist tar 1.30+), but keeping the new, mostly-linear code-path.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Vincent Fazio <vfazio@xes-inc.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reviewed-by: Vincent Fazio <vfazio@xes-inc.com>
---
 support/dependencies/check-host-tar.sh | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/support/dependencies/check-host-tar.sh b/support/dependencies/check-host-tar.sh
index 934cb61299..b7d607a47a 100755
--- a/support/dependencies/check-host-tar.sh
+++ b/support/dependencies/check-host-tar.sh
@@ -33,14 +33,7 @@ fi
 major_min=1
 minor_min=27
 
-# Maximal version = 1.29 (1.30 changed --numeric-owner output for
-# filenames > 100 characters). This is really a fix for a bug in
-# earlier tar versions regarding deterministic output so it is
-# unlikely to be reverted in later versions.
-major_max=1
-minor_max=29
-
-if [ $major -lt $major_min -o $major -gt $major_max ]; then
+if [ $major -lt $major_min ]; then
 	# echo nothing: no suitable tar found
 	exit 1
 fi
@@ -50,10 +43,5 @@ if [ $major -eq $major_min -a $minor -lt $minor_min ]; then
 	exit 1
 fi
 
-if [ $major -eq $major_max -a $minor -gt $minor_max ]; then
-	# echo nothing: no suitable tar found
-	exit 1
-fi
-
 # valid
 echo $tar
