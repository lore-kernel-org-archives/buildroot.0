From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue,  2 Dec 2014 00:24:09 +0100
Subject: [Buildroot] [PATCH 4/4] pkg-download: check hasahes for locally
	cached files
In-Reply-To: <cover.1417475935.git.yann.morin.1998@free.fr>
References: <cover.1417475935.git.yann.morin.1998@free.fr>
Message-ID: <e1cc728a60b6a250ea395ee429dba7f470b1f8a8.1417475935.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In some cases, upstream just update their releases in-place, without
renaming them. When that package is updated in Buildroot, a new hash to
match the new upstream release is included in the corresponding .hash
file.

As a consequence, users who previously downloaded that package's tarball
with an older version of Buildroot, will get stuck with an old archive
for that package, and after updating their Buildroot copy, will be greeted
with a failed download, due to the local file not matching the new
hashes.

So, to avoid this situation, check the hashes prior to doing the
download. If the hashes match, consider the locally cached file genuine,
and do not download it. However, if the locally cached file does not
match the known hashes we have for it, it is promptly removed, and a
download is re-attempted.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 support/download/wrapper | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/support/download/wrapper b/support/download/wrapper
index 2f0f016..161df03 100755
--- a/support/download/wrapper
+++ b/support/download/wrapper
@@ -30,9 +30,15 @@ output="${2}"
 hfile="${3}"
 shift 3
 
-# If the output file already exists, do not download it again
+# If the output file already exists, and its hashes are correct, do
+# not download it again. If it exists, but it does not match the
+# known hashes for it, remove the file and do the download.
 if [ -e "${output}" ]; then
-    exit 0
+    if support/download/check-hash "${hfile}" "${output}" "${output##*/}"; then
+        exit 0
+    fi
+    rm -f "${output}"
+    printf "Re-downloading '%s'...\n" "${output##*/}"
 fi
 
 # tmpd is a temporary directory in which helpers may store intermediate
-- 
1.9.1
