From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 29 Dec 2020 12:01:15 +0100
Subject: [Buildroot] [PATCH 07/10 v3] support/download: cleanup svn backend
In-Reply-To: <cover.1609239666.git.yann.morin.1998@free.fr>
References: <cover.1609239666.git.yann.morin.1998@free.fr>
Message-ID: <7077b14d19b9d645fa45dcc39f8c62212216c4af.1609239666.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 89f5e9893 (support/download/svn: generate reproducible svn
archives) did what it said, but can be siplified a bit.

Indeed, we are doing an svn export, so we won't have any of the .svn
directories, neither at the root of the extract, nor in any of the
sub-directories.

As such, we do not need to filter them out  when we generate the list
of files to include in the archive.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Heiko Thiery <heiko.thiery@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Vincent Fazio <vfazio@xes-inc.com>
---
 support/download/svn | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/support/download/svn b/support/download/svn
index 012f286dd9..b7a6ac7443 100755
--- a/support/download/svn
+++ b/support/download/svn
@@ -46,10 +46,9 @@ _svn export ${verbose} "${@}" "'${uri}@${rev}'" "'${basename}'"
 date="$( _svn info --show-item last-changed-date "'${uri}@${rev}'" |tail -n 1 )"
 
 # Generate the archive, sort with the C locale so that it is reproducible.
-# We do not want the .svn dir; we keep other .svn files, in case they are the
-# only files in their directory.
-find "${basename}" -not -type d \
-       -and -not -path "./.svn/*" >"${output}.list"
+# We did a 'svn export' above, so it's not a working copy (there is no .svn
+# directory or file to ignore).
+find "${basename}" -not -type d >"${output}.list"
 LC_ALL=C sort <"${output}.list" >"${output}.list.sorted"
 
 # Create GNU-format tarballs, since that's the format of the tarballs on
-- 
2.25.1
