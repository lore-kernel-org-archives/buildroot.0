From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 11 Mar 2016 19:32:06 +0100
Subject: [Buildroot] [PATCH 2/3] support/download/git: add support for
	submodules
In-Reply-To: <cover.1457721001.git.yann.morin.1998@free.fr>
References: <cover.1457721001.git.yann.morin.1998@free.fr>
Message-ID: <81ae608e751d1767c6c536e4b3b2b4cae75adbd0.1457721001.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some git repositories may be split into a master repository and
submodules. Up until now, we did not have support for submodules,
because we wer using bare clones, in which it is not possible to
update the list of submodules.

Now that we are using plain clones with a working copy, we can retrieve
the submdoules.

Add an option to the git downlaod helper to kick the update of
submodules, so that they are only fetched for those packages that
require them. Also document the existing -q option at the same time.

Submodules have a .git file at their root, which contains the path to
the real .git directory of the master repository. Since we remove it,
there is no point in keeping those .git files either.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 support/download/git | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/support/download/git b/support/download/git
index 5672217..8df3934 100755
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
@@ -61,18 +66,24 @@ pushd "${basename}" >/dev/null
 # below, if there is an issue anyway. Since most of the cset we're gonna
 # have to clone are not such special refs, consign the output to oblivion
 # so as not to alarm unsuspecting users, but still trace it as a warning.
-if ! _git fetch "'${cset}:${cset}'" >/dev/null 2>&1; then
+if ! _git fetch origin "'${cset}:${cset}'" >/dev/null 2>&1; then
     printf "Could not fetch special ref '%s'; assuming it is not special.\n" "${cset}"
 fi
 
-# Checkout the required changeset.
+# Checkout the required changeset, so that we can update the required
+# submodules.
 _git checkout -q "'${cset}'"
 
 # Get date of commit to generate a reproducible archive.
 date="$( _git show --no-patch --pretty=format:%cD )"
 
-# We do not need the .git dir to generate the tarball
-rm -rf .git
+# There might be submodules, so fetch them.
+if [ ${recurse} -eq 1 ]; then
+    _git submodule update --init --recursive
+fi
+
+# We do not need the .git dir and files to generate the tarball
+find . -name .git -exec rm -rf {} +
 
 popd >/dev/null
 
-- 
1.9.1
