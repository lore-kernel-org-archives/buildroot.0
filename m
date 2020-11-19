From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 19 Nov 2020 22:23:49 +0100
Subject: [Buildroot] [PATCH 5/7] support/download: change format of archives
 generated from svn
In-Reply-To: <cover.1605821010.git.yann.morin.1998@free.fr>
References: <cover.1605821010.git.yann.morin.1998@free.fr>
Message-ID: <999da6d23d25a51db60924c9fbfc5324f38c129e.1605821010.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Like we recently did for git, switch the archives generated from
subversion to be reproducible whatever the tar version. This implies
changing the compression to xz (and the extension accordingly).

We have no in-tree users of the svn backend, that also has hashes.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Vincent Fazio <vfazio@xes-inc.com>
---
 package/pkg-generic.mk |  2 +-
 support/download/svn   | 12 ++++++++----
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 115115a345..af259766ab 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -564,7 +564,7 @@ ifndef $(2)_DL_OPTS
  endif
 endif
 
-ifneq ($$(filter git,$$($(2)_SITE_METHOD)),)
+ifneq ($$(filter git svn,$$($(2)_SITE_METHOD)),)
 $(2)_SOURCE_EXT = .tar.xz
 else
 $(2)_SOURCE_EXT = .tar.gz
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
