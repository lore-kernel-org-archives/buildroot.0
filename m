From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 02 Aug 2012 19:52:34 -0000
Subject: [Buildroot] [git commit branch/next] vala: do not append a -dirty
	suffix to the valac version number
Message-ID: <20120802195232.B2B0296FF0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f87cbf0ed9e0efa12ee5e2ea5e81bdc217430c80
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

When vala is built inside a Git repository with uncommitted changes, the
valac version number has -dirty appended. This creates problems for
packages (e.g. Midori) which require a valac version number without
the -dirty suffix.

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ...la-0.15.2-dont-add-dirty-to-valac-version.patch |   25 ++++++++++++++++++++
 1 files changed, 25 insertions(+), 0 deletions(-)

diff --git a/package/vala/vala-0.15.2-dont-add-dirty-to-valac-version.patch b/package/vala/vala-0.15.2-dont-add-dirty-to-valac-version.patch
new file mode 100644
index 0000000..a2a0623
--- /dev/null
+++ b/package/vala/vala-0.15.2-dont-add-dirty-to-valac-version.patch
@@ -0,0 +1,25 @@
+valac: don't append -dirty to version
+
+Don't append -dirty to the valac version number if the Buildroot Git
+tree has uncommited changes.
+
+The patched script is meant for the valac developers, but it also
+activates if you build valac in a subdirectory of a Git tree (e.g.
+as is commonly done in Buildroot).
+
+The effect is that valac gets built as being version x.y.z-dirty, which
+breaks programs (such as Midori) that explicitly check for valac-x.y.z.
+
+Signed-off-by: Simon Dawson <spdawson@gmail.com>
+diff -Nur a/build-aux/git-version-gen b/build-aux/git-version-gen
+--- a/build-aux/git-version-gen	2010-08-15 12:49:03.000000000 +0100
++++ b/build-aux/git-version-gen	2012-05-14 10:17:19.977204570 +0100
+@@ -135,7 +135,7 @@
+     *) # Append the suffix only if there isn't one already.
+ 	case $v in
+ 	  *-dirty) ;;
+-	  *) v="$v-dirty" ;;
++	  #*) v="$v-dirty" ;;
+ 	esac ;;
+ esac
+ 
