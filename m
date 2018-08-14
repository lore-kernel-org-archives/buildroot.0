From: Andrew Jeffery <andrew@aj.id.au>
Date: Tue, 14 Aug 2018 21:35:32 +0930
Subject: [Buildroot] [PATCH 1/1] support: git: Use git-archive to generate
 download tarball
Message-ID: <20180814120532.20077-1-andrew@aj.id.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Using tar's --transform option with the previously specified regex
breaks relative symlinks, as the target path starts with the sequence
'./'. Avoid the need for --transform and indirectly generate a tar via
`git archive` to preserve accuracy of archive content.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 support/download/git | 20 +-------------------
 1 file changed, 1 insertion(+), 19 deletions(-)

diff --git a/support/download/git b/support/download/git
index 11bb52c1e13b..3b671d8adcef 100755
--- a/support/download/git
+++ b/support/download/git
@@ -178,24 +178,6 @@ if [ ${recurse} -eq 1 ]; then
     _git submodule update --init --recursive
 fi
 
-# Generate the archive, sort with the C locale so that it is reproducible.
-# We do not want the .git dir; we keep other .git files, in case they are the
-# only files in their directory.
-# The .git dir would generate non reproducible tarballs as it depends on
-# the state of the remote server. It also would generate large tarballs
-# (gigabytes for some linux trees) when a full clone took place.
-find . -not -type d \
-	-and -not -path "./.git/*" >"${output}.list"
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
+_git archive --format=tar --prefix="${basename}"/ HEAD | gzip -6 > "${output}"
 
 popd >/dev/null
-- 
2.17.1
