From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 10 Sep 2012 13:43:37 +0200
Subject: [Buildroot] [PATCH RFC] patches-from-git.sh: new support script
Message-ID: <1347277417-5078-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The patches-from-git.sh script automates the creation of patches
from a git repository.  It adds some post-processing on top
of git-format-patch to make sure that only relevant modifications
are made to a patch file.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
The intention is to use this to simplify patching of packages,
in combination with the XXX_OVERRIDE_DIR facility.

 support/scripts/patches-from-git.sh |   61 +++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/support/scripts/patches-from-git.sh b/support/scripts/patches-from-git.sh
new file mode 100755
index 0000000..fd7afbc
--- /dev/null
+++ b/support/scripts/patches-from-git.sh
@@ -0,0 +1,61 @@
+#! /bin/sh
+# patches-from-git.sh - Create buildroot patches from a git repository
+#
+
+outdir="$1"
+gitdir="$2"
+basecommit="$3"
+basename="$4"
+
+if [ $# != 4 ]; then
+	cat >&2 <<EOF
+Usage: $0 <outdir> <gitdir> <base-commit> <basename>
+
+Patches are created from the repository in <gitdir>, starting from
+(and excluding) <base-commit>, up to HEAD.  The patches are stored
+in <outdir> and are named <basename>-00nn-commit-msg.patch.
+<gitdir> must not contain uncommitted changes.
+EOF
+	exit 1
+fi
+
+# Verify arguments
+if [ ! -d "$outdir" ]; then
+	printf 'Output directory "%s" doesn'\''t exist\n' "$outdir" >&2
+	exit 1
+fi
+
+if [ ! -d "$gitdir" ]; then
+	printf 'git repository "%s" doesn'\''t exist\n' "$outdir" >&2
+	exit 1
+fi
+cd "$gitdir"
+git rev-parse --verify HEAD >/dev/null || exit 1
+
+if ! git rev-parse --verify "$basecommit" > /dev/null; then
+	printf 'Invalid base commit "%s"\n' "$basecommit" >&2
+	exit 1
+fi
+
+
+# First delete the existing patches, so rebases are supported correctly
+/bin/rm -f "${outdir}/${basename}"-*.patch
+
+# Make patches unnumbered (-N) to avoid differences just because the
+# total has changed.
+# Don't track renames, because apply-patches.sh doesn't deal with them.
+patchfiles=$(git format-patch -o "$outdir" -N --no-renames "$basecommit") || exit 1
+
+# Give the patches the correct name
+# Also strip the last two lines, which contain the git version, to avoid
+# differences just because git has changed.  Note that this is not very
+# robust, because future git versions may add other cruft there.
+for patch in $patchfiles; do
+	lastdashline=$(awk '
+			BEGIN {lastdash=0}
+			/^--[[:space:]]$/ {lastdash=NR}
+			END {print lastdash}' \
+		"$patch")
+	head -$lastdashline "$patch" > "${outdir}/${basename}-${patch##*/}"
+	/bin/rm -f "$patch"
+done
-- 
tg: (666eb02..) t/patches-from-git (depends on: master)
