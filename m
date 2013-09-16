From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 16 Sep 2013 22:51:40 +0200
Subject: [Buildroot] [git commit] apply-patches.sh: Go back to only warn
	about unsupported file types
Message-ID: <20130916205158.89B1D9B7A1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8d22c1bab7a36f636171ba263deb80fed86298b1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/868/8687be8ec029486d9c5e2224cde542134f72884b/

The recent (d245fbb41dc: apply-patches.sh: detect missing patches)
change to apply-patches.sh causes a number of regressions with packages
using downloadable tarballs of patches (typically from Debian), as
those contain additional files besides just the patches (ChangeLog's,
debian/rules, ..).

This use case is arguably abusing the _PATCH handling, but it used to
work so people might rely on it so go back to only warn about this
instead of erroring out.

At the same time reword the warning message.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 support/scripts/apply-patches.sh |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
index 656aa71..1ebaea9 100755
--- a/support/scripts/apply-patches.sh
+++ b/support/scripts/apply-patches.sh
@@ -73,8 +73,8 @@ function apply_patch {
 	*.patch*)
 	type="patch"; uncomp="cat"; ;;
 	*)
-	echo "Unsupported format file for ${path}/${patch}";
-	exit 1;
+	echo "Unsupported file type for ${path}/${patch}, skipping";
+	return 0
 	;;
     esac
     echo ""
