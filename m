From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 31 Mar 2017 08:43:35 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] download/git: create GNU
	format tar files
Message-ID: <20170331071606.63E62826C6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e6b2152cd15bd8a9ed8a72c2ef2c07959839d46d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 0f369a9231b2c67748f4f0c2dbb33ebdc2890478)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/download/git | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/support/download/git b/support/download/git
index 7921411..056057c 100755
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
