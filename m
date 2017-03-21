From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 21 Mar 2017 01:06:57 +0100
Subject: [Buildroot] [PATCH 01/16] download/git: create GNU format tar files
In-Reply-To: <20170321000712.26500-1-arnout@mind.be>
References: <20170321000712.26500-1-arnout@mind.be>
Message-ID: <20170321000712.26500-2-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On most distros, the tar format defaults to GNU. However, at build time
the default format may be changed to posix. Also, future versions of
tar will default to posix.

Since we want the tarballs created by the git download method to be
reproducible (so their hash can be checked), we should explicitly
specify the format. Since existing tarballs on sources.buildroot.org
use the GNU format, and also the existing hashes in the *.hash files
are based on GNU format tarballs, we use the GNU format.

In addition, the Posix format encodes atime and ctime as well as mtime,
but tar offers no option like --mtime to override them. In the GNU
format, atime and ctime are only encoded if the --incremental option is
given.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Peter Seiderer <ps.report@gmx.net>
---
Peter, can you test if this solves the issue for you?
---
 support/download/git | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/support/download/git b/support/download/git
index 7921411835..056057c700 100755
--- a/support/download/git
+++ b/support/download/git
@@ -94,6 +94,8 @@ popd >/dev/null
 # Generate the archive, sort with the C locale so that it is reproducible
 find "${basename}" -not -type d >"${basename}.list"
 LC_ALL=C sort <"${basename}.list" >"${basename}.list.sorted"
-tar cf - --numeric-owner --owner=0 --group=0 --mtime="${date}" \
+# Create GNU-format tarballs, since that's the format of the tarballs on
+# sources.buildroot.org and used in the *.hash files
+tar cf - --numeric-owner --owner=0 --group=0 --mtime="${date}" --format=gnu \
          -T "${basename}.list.sorted" >"${output}.tar"
 gzip -n <"${output}.tar" >"${output}"
-- 
2.11.0
