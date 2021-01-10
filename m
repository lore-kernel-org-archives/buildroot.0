From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 10 Jan 2021 22:06:58 +0100
Subject: [Buildroot] [git commit] support/download: change format of
 archives generated from svn
Message-ID: <20210110205119.12E668120A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c043ecb20ce6ac316fe31da6d2db5b13a34dc414
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Like we recently did for git, switch the archives generated from
subversion to be reproducible whatever the tar version.

We have no in-tree users of the svn backend which also has hashes,
so no hash to update.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Heiko Thiery <heiko.thiery@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Vincent Fazio <vfazio@xes-inc.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reviewed-by: Vincent Fazio <vfazio@xes-inc.com>
---
 package/pkg-download.mk |  1 +
 support/download/svn    | 22 +++++++++-------------
 2 files changed, 10 insertions(+), 13 deletions(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 979ccfdd87..c0fb810205 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -20,6 +20,7 @@ export LOCALFILES := $(call qstrip,$(BR2_LOCALFILES))
 # Version of the format of the archives we generate in the corresponding
 # download backend:
 BR_FMT_VERSION_git = -br1
+BR_FMT_VERSION_svn = -br1
 
 DL_WRAPPER = support/download/dl-wrapper
 
diff --git a/support/download/svn b/support/download/svn
index b7a6ac7443..839dccaf62 100755
--- a/support/download/svn
+++ b/support/download/svn
@@ -1,5 +1,10 @@
 #!/usr/bin/env bash
 
+# NOTE: if the output of this backend has to change (e.g. we change what gets
+# included in the archive, or we change the format of the archive (e.g. tar
+# options, compression ratio or method)), we MUST update the format version
+# in the variable BR_FTM_VERSION_svn, in package/pkg-download.mk.
+
 # We want to catch any unexpected failure, and exit immediately
 set -e
 
@@ -15,6 +20,8 @@ set -e
 # Environment:
 #   SVN      : the svn command to call
 
+. "${0%/*}/helpers"
+
 verbose=
 while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
     case "${OPT}" in
@@ -45,18 +52,7 @@ _svn export ${verbose} "${@}" "'${uri}@${rev}'" "'${basename}'"
 # last line (svn outputs everything on stdout)
 date="$( _svn info --show-item last-changed-date "'${uri}@${rev}'" |tail -n 1 )"
 
-# Generate the archive, sort with the C locale so that it is reproducible.
+# Generate the archive.
 # We did a 'svn export' above, so it's not a working copy (there is no .svn
 # directory or file to ignore).
-find "${basename}" -not -type d >"${output}.list"
-LC_ALL=C sort <"${output}.list" >"${output}.list.sorted"
-
-# Create GNU-format tarballs, since that's the format of the tarballs on
-# sources.buildroot.org and used in the *.hash files
-tar cf - --transform="s#^\./#${basename}/#" \
-         --numeric-owner --owner=0 --group=0 --mtime="${date}" --format=gnu \
-         -T "${output}.list.sorted" >"${output}.tar"
-gzip -6 -n <"${output}.tar" >"${output}"
-
-rm -f "${output}.list"
-rm -f "${output}.list.sorted"
+mk_tar_gz "${basename}" "${basename}" "${date}" "${output}"
