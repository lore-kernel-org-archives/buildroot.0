From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Jan 2016 20:46:04 +0100
Subject: [Buildroot] [git commit] support/download: support older bazaar
	versions
Message-ID: <20160118194633.D5A737FF2A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b9be0f65acce48e10a37bb93bff4a01b75302bd8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In efe7f68 (support/download: generate reproducible Bazaar archives),
bzr was instructed to store files with the timestamp set to the date
they were last modified in the repository, instead of the current date,
using the --per-file-timestamp option.

However, this option has been added only in bzr-2.2 (August 2010) which
is not available on older distros.

We fix that by not using --per-file-timestamp when the bzr version is
older than 2.2, in which case we just generate the archive with the
current date set on files.

This means the archive is thus non-reproducible, and if a hash is
available for that archive, the hash will not match, and Buildroot will
try to download from the mirror (if any) or fail (if no mirror).

Fixes:
    http://autobuild.buildroot.org/results/51f/51f4ff5462c15a85937d411f457096224d00fdcd
    http://autobuild.buildroot.org/results/b88/b8828b5fbc16128408c2f44169ac23de7e34d770
    http://autobuild.buildroot.org/results/fb4/fb4b0fb2131b40c18273dbe5e51b393cb6df18ec
    ...

[Peter: simplify sed invocation]
Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/download/bzr | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/support/download/bzr b/support/download/bzr
index a8a8887..e18b01f 100755
--- a/support/download/bzr
+++ b/support/download/bzr
@@ -32,6 +32,22 @@ _bzr() {
     eval ${BZR} "${@}"
 }
 
+# --per-file-timestamps comes with bzr-2.2 (released August 2010),
+# so only pass it if bzr is recent enough. We compute versions as:
+# major*1000 + minor
+bzr_min_version=2002
+bzr_version=$(($(bzr --version |
+                 sed -r -n 's/^Bazaar \(bzr\) ([[:digit:]]+)\.([[:digit:]]+)\..*$/\1*1000+\2/p')
+             ))
+
+# If the version is recent enough, we can generate reproducible
+# archives; otherwise, we just hope for the best (as it would
+# be downloaded from the BR mirror if what we generate here does
+# not match the hash we have for it).
+if [ ${bzr_version} -ge ${bzr_min_version} ]; then
+    timestamp_opt="--per-file-timestamps"
+fi
+
 _bzr export ${verbose} --root="'${basename}/'" --format=tgz \
-    --per-file-timestamps - "'${repo}'" -r "'${rev}'" \
+    ${timestamp_opt} - "'${repo}'" -r "'${rev}'" \
     >"${output}"
