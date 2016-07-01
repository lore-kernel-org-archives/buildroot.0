From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri,  1 Jul 2016 11:01:18 +0200
Subject: [Buildroot] [PATCH 3/4 v3] support/download/git: add support for
	submodules
In-Reply-To: <cover.1467363623.git.yann.morin.1998@free.fr>
References: <cover.1467363623.git.yann.morin.1998@free.fr>
Message-ID: <4d8136108e0e7be40bad4fa68ebb3dd558f42f8d.1467363623.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some git repositories may be split into a master repository and
submodules. Up until now, we did not have support for submodules,
because we were using bare clones, in which it is not possible to
update the list of submodules.

Now that we are using plain clones with a working copy, we can retrieve
the submdoules.

Add an option to the git downlaod helper to kick the update of
submodules, so that they are only fetched for those packages that
require them. Also document the existing -q option at the same time.

Submodules have a .git file at their root, which contains the path to
the real .git directory of the master repository. Since we remove it,
there is no point in keeping those .git files either.

Note: this is currently unused, but will be enabled with the follow-up
patch , that adds the necessary parts in the pkg-generic and pkg-download
infrastructures.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Tested-by: Matt Weber <matt@thewebers.ws>
Reviewed-by: Matt Weber <matt@thewebers.ws>
---
 support/download/git | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/support/download/git b/support/download/git
index 54dd2c7..44a5682 100755
--- a/support/download/git
+++ b/support/download/git
@@ -6,15 +6,20 @@ set -e
 # Download helper for git, to be called from the download wrapper script
 #
 # Call it as:
-#   .../git [-q] OUT_FILE REPO_URL CSET BASENAME
+#   .../git [-q] [-r] OUT_FILE REPO_URL CSET BASENAME
+#
+#   -q  Be quiet.
+#   -r  Clone and archive sub-modules.
 #
 # Environment:
 #   GIT      : the git command to call
 
 verbose=
-while getopts :q OPT; do
+recurse=0
+while getopts :qr OPT; do
     case "${OPT}" in
     q)  verbose=-q; exec >/dev/null;;
+    r)  recurse=1;;
     \?) printf "unknown option '%s'\n" "${OPTARG}" >&2; exit 1;;
     esac
 done
@@ -65,13 +70,19 @@ if ! _git fetch origin "'${cset}:${cset}'" >/dev/null 2>&1; then
     printf "Could not fetch special ref '%s'; assuming it is not special.\n" "${cset}"
 fi
 
-# Checkout the required changeset.
+# Checkout the required changeset, so that we can update the required
+# submodules.
 _git checkout -q "'${cset}'"
 
 # Get date of commit to generate a reproducible archive.
 # %cD is RFC2822, so it's fully qualified, with TZ and all.
 date="$( _git show --no-patch --pretty=format:%cD )"
 
+# There might be submodules, so fetch them.
+if [ ${recurse} -eq 1 ]; then
+    _git submodule update --init --recursive
+fi
+
 # We do not need the .git dir and other gitfiles to generate the tarball
 find . \( -name .git -o -name .gitmodules -o -name .gitignore \) \
        -exec rm -rf {} +
-- 
2.7.4
