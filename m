From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 31 Jul 2016 12:08:02 +0200
Subject: [Buildroot] [PATCH] support/download: make the git wrapper more
	robust
Message-ID: <1469959682-5519-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, there are two failure paths in the wrapper:

  - if the tar fails, then the error is ignored because it is on the
    left-hand-side of a pipe;

  - if the find fails, then the error is ignored because it is a
    process substitution.

While the former could be fixed with "set -o pipefail", the latter can
not be fixed thusly and we must use an intemediate file for it.

So, fix both issues by using intermediate files, both to generate the
list of files to include in the archive, and generate the archive in a
temporary tarball.

Fixes the following build issue, where the find is failing for whatever
unknown reason:
    http://autobuild.buildroot.net/results/20f/20fd76d2256eee81837f7e9bbaefbe79d7645ae9/

And this one, where the process substitution failed, also for an unknown
reason:
    http://autobuild.buildroot.org/results/018/018971ea9227b386fe25d3c264c7e80b843a9f68/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 support/download/git | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/support/download/git b/support/download/git
index 416cd1b..8aa284a 100755
--- a/support/download/git
+++ b/support/download/git
@@ -90,6 +90,7 @@ rm -rf .git
 popd >/dev/null
 
 # Generate the archive, sort with the C locale so that it is reproducible
+find "${basename}" -not -type d |LC_ALL=C sort >"${basename}.list"
 tar cf - --numeric-owner --owner=0 --group=0 --mtime="${date}" \
-         -T <(find "${basename}" -not -type d |LC_ALL=C sort) \
-|gzip -n >"${output}"
+         -T "${basename}.list" >"${output}.tar"
+gzip -n <"${output}.tar" >"${output}"
-- 
2.7.4
