From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 29 Dec 2020 12:01:12 +0100
Subject: [Buildroot] [PATCH 04/10 v3] WIP: support/download: change format
 of archives generated from git
In-Reply-To: <cover.1609239666.git.yann.morin.1998@free.fr>
References: <cover.1609239666.git.yann.morin.1998@free.fr>
Message-ID: <40590de01b9e5f003d38c9728ad04439cb17a72c.1609239666.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

** WIP: needs an update to all the hashes.

Switch to using the tarball helper, that can generate reproducible
archives whatever the tar version >= 1.27.

However, those archives are not identical to the previous ones generated
in the (now-broken) gnu format.

To avoid any clashing between old and new archives, and new and old
Buildroot versions, we need to name the new generated archives
differently from the existing ones.

So, we bump the git-specific format-version to _br1.

The %ci date  has been supported by git back to 1.6.0, released August
2008); it is not strictly ISO8601, but is still accepted as a PAX date
header. The strict ISO8601 placeholder, %cI, was only intriduced with
2.2.0, release in November 2014, so too recent to be widely available.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Vincent Fazio <vfazio@xes-inc.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-download.mk |  4 ++++
 support/download/git    | 31 +++++++++++++------------------
 2 files changed, 17 insertions(+), 18 deletions(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 951d2fb554..272f56a826 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -17,6 +17,10 @@ export HG := $(call qstrip,$(BR2_HG))
 export SCP := $(call qstrip,$(BR2_SCP))
 export LOCALFILES := $(call qstrip,$(BR2_LOCALFILES))
 
+# Version of the format of the archives we generate in the corresponding
+# download backend:
+BR_FMT_VERSION_git = _br1
+
 DL_WRAPPER = support/download/dl-wrapper
 
 # DL_DIR may have been set already from the environment
diff --git a/support/download/git b/support/download/git
index 15d8c66e05..fa98198fe0 100755
--- a/support/download/git
+++ b/support/download/git
@@ -1,5 +1,10 @@
 #!/usr/bin/env bash
 
+# NOTE: if the output of this backend has to change (e.g. we change what gets
+# included in the archive (e.g. LFS), or we change the format of the archive
+# (e.g. tar options, compression ratio or method)), we MUST update the format
+# version in the variable BR_FMT_VERSION_git, in package/pkg-download.mk.
+
 # We want to catch any unexpected failure, and exit immediately
 set -E
 
@@ -16,6 +21,8 @@ set -E
 # Environment:
 #   GIT      : the git command to call
 
+. "${0%/*}/helpers"
+
 # Save our path and options in case we need to call ourselves again
 myname="${0}"
 declare -a OPTS=("${@}")
@@ -170,8 +177,8 @@ _git checkout -f -q "'${cset}'"
 _git clean -ffdx
 
 # Get date of commit to generate a reproducible archive.
-# %cD is RFC2822, so it's fully qualified, with TZ and all.
-date="$( _git log -1 --pretty=format:%cD )"
+# %ci is ISO 8601, so it's fully qualified, with TZ and all.
+date="$( _git log -1 --pretty=format:%ci )"
 
 # There might be submodules, so fetch them.
 if [ ${recurse} -eq 1 ]; then
@@ -191,24 +198,12 @@ if [ ${recurse} -eq 1 ]; then
     done
 fi
 
-# Generate the archive, sort with the C locale so that it is reproducible.
+popd >/dev/null
+
+# Generate the archive.
 # We do not want the .git dir; we keep other .git files, in case they are the
 # only files in their directory.
 # The .git dir would generate non reproducible tarballs as it depends on
 # the state of the remote server. It also would generate large tarballs
 # (gigabytes for some linux trees) when a full clone took place.
-find . -not -type d \
-       -and -not -path "./.git/*" >"${output}.list"
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
-
-popd >/dev/null
+mk_tar_gz "${git_cache}" "${basename}" "${date}" "${output}" ".git/*"
-- 
2.25.1
