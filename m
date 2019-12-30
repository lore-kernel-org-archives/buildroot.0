From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 30 Dec 2019 10:50:21 +0100
Subject: [Buildroot] [git commit] support/download/svn: generate
 reproducible svn archives
Message-ID: <20191230094835.6662B8E712@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=89f5e989323ace815a32fced27eaefee2f4666de
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

To generate a reproducible archive from a svn repository mainly the same
aproach is done like for the archives from a git repository.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
[yann.morin.1998 at free.fr: get the date of the revision]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/download/svn | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/support/download/svn b/support/download/svn
index 542b25c0a2..012f286dd9 100755
--- a/support/download/svn
+++ b/support/download/svn
@@ -38,4 +38,26 @@ _svn() {
 
 _svn export ${verbose} "${@}" "'${uri}@${rev}'" "'${basename}'"
 
-tar czf "${output}" "${basename}"
+# Get the date of the revision, to generate reproducible archives.
+# The output format is YYYY-MM-DDTHH:MM:SS.mmmuuuZ (i.e. always in the
+# UTC timezone), which we can feed as-is to the --mtime option for tar.
+# In case there is a redirection (e.g. http -> https), just keep the
+# last line (svn outputs everything on stdout)
+date="$( _svn info --show-item last-changed-date "'${uri}@${rev}'" |tail -n 1 )"
+
+# Generate the archive, sort with the C locale so that it is reproducible.
+# We do not want the .svn dir; we keep other .svn files, in case they are the
+# only files in their directory.
+find "${basename}" -not -type d \
+       -and -not -path "./.svn/*" >"${output}.list"
+LC_ALL=C sort <"${output}.list" >"${output}.list.sorted"
+
+# Create GNU-format tarballs, since that's the format of the tarballs on
+# sources.buildroot.org and used in the *.hash files
+tar cf - --transform="s#^\./#${basename}/#" \
+         --numeric-owner --owner=0 --group=0 --mtime="${date}" --format=gnu \
+         -T "${output}.list.sorted" >"${output}.tar"
+gzip -6 -n <"${output}.tar" >"${output}"
+
+rm -f "${output}.list"
+rm -f "${output}.list.sorted"
