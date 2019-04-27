From: Timothy Pearson <tpearson@raptorengineering.com>
Date: Sat, 27 Apr 2019 03:43:22 -0500 (CDT)
Subject: [Buildroot] [PATCH v2] Restrict tar transform to regular files
 Without this
Message-ID: <1249281217.2131518.1556354602146.JavaMail.zimbra@raptorengineeringinc.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

restriction, symlinks are rewritten and corrupted.

Example without the restriction:

Input tree (valid):
package-githash/file1
package-githash/link -> ./file1

Output tree (broken):
package-githash/file1
package-githash/link -> package-githash/file1

Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
---
 support/download/git | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/download/git b/support/download/git
index 17ca04eb98..1acb795c81 100755
--- a/support/download/git
+++ b/support/download/git
@@ -190,7 +190,7 @@ LC_ALL=C sort <"${output}.list" >"${output}.list.sorted"
 
 # Create GNU-format tarballs, since that's the format of the tarballs on
 # sources.buildroot.org and used in the *.hash files
-tar cf - --transform="s#^\./#${basename}/#" \
+tar cf - --transform="flags=r;s#^\./#${basename}/#" \
          --numeric-owner --owner=0 --group=0 --mtime="${date}" --format=gnu \
          -T "${output}.list.sorted" >"${output}.tar"
 gzip -6 -n <"${output}.tar" >"${output}"
