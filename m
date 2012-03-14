From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 14 Mar 2012 23:28:57 +0100
Subject: [Buildroot] [git commit] apply-patches.sh: remove any rejects
	before applying patches
Message-ID: <20120314223214.C7CAF90D89@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=39bd61c6f30e3d9548b5928488fcd9ccfb3fda70
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: .rej files might be in subdirs, so just do find .. | xargs rm]
Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
Tested-by: Ludovic Desroches <ludovic.desroches@atmel.com>
with an armadeus_apf9328_defconfig build
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Tested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 support/scripts/apply-patches.sh |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
index 1aef47e..e418cb6 100755
--- a/support/scripts/apply-patches.sh
+++ b/support/scripts/apply-patches.sh
@@ -19,7 +19,13 @@ if [ ! -d "${patchdir}" ] ; then
     echo "Aborting.  '${patchdir}' is not a directory."
     exit 1
 fi
-    
+
+# Remove any rejects present BEFORE patching - Because if there are
+# any, even if patches are well applied, at the end it will complain
+# about rejects in targetdir.
+find ${targetdir}/ '(' -name '*.rej' -o -name '.*.rej' ')' -print0 | \
+    xargs -0 -r rm -f
+
 for i in `cd ${patchdir}; ls -d ${patchpattern} 2> /dev/null` ; do 
     apply="patch -g0 -p1 -E -d"
     uncomp_parm=""
