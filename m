From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 14 Dec 2020 18:29:35 +0100
Subject: [Buildroot] [PATCH 7/9 v2] support/download: change format of
 archives generated from svn
In-Reply-To: <cover.1607966969.git.yann.morin.1998@free.fr>
References: <cover.1607966969.git.yann.morin.1998@free.fr>
Message-ID: <420776bc1f2478d240ee7e2164939b01ecfbf4e5.1607966969.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Like we recently did for git, switch the archives generated from
subversion to be reproducible whatever the tar version. Likewise
for the compression, switch to xz.

We have no in-tree users of the svn backend, that also has hashes.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Vincent Fazio <vfazio@xes-inc.com>
---
 package/pkg-download.mk |  3 +++
 support/download/svn    | 12 ++++++++----
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index e85f844b45..8e546634ae 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -20,6 +20,9 @@ export LOCALFILES := $(call qstrip,$(BR2_LOCALFILES))
 BR_SUB_VERSION_git = _br1
 BR_SITE_METHOD_Z_git = .xz
 
+BR_SUB_VERSION_svn = _br1
+BR_SITE_METHOD_Z_svn = .xz
+
 DL_WRAPPER = support/download/dl-wrapper
 
 # DL_DIR may have been set already from the environment
diff --git a/support/download/svn b/support/download/svn
index 012f286dd9..42307eb236 100755
--- a/support/download/svn
+++ b/support/download/svn
@@ -52,12 +52,16 @@ find "${basename}" -not -type d \
        -and -not -path "./.svn/*" >"${output}.list"
 LC_ALL=C sort <"${output}.list" >"${output}.list.sorted"
 
-# Create GNU-format tarballs, since that's the format of the tarballs on
-# sources.buildroot.org and used in the *.hash files
+pax_options="delete=atime,delete=ctime,delete=mtime"
+pax_options+=",exthdr.name=%d/PaxHeaders/%f,exthdr.mtime={${date}}"
+
+# Create POSIX tarballs, since that's the format the most reproducible
 tar cf - --transform="s#^\./#${basename}/#" \
-         --numeric-owner --owner=0 --group=0 --mtime="${date}" --format=gnu \
+         --numeric-owner --owner=0 --group=0 --mtime="${date}" \
+         --format=posix \
+         --pax-option="${pax_options}" \
          -T "${output}.list.sorted" >"${output}.tar"
-gzip -6 -n <"${output}.tar" >"${output}"
+xz -9 <"${output}.tar" >"${output}"
 
 rm -f "${output}.list"
 rm -f "${output}.list.sorted"
-- 
2.25.1
