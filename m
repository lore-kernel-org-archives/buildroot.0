From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  7 Dec 2014 12:02:38 +0100
Subject: [Buildroot] [PATCH 5/5 v2] pkg-download: check hashes for locally
	cached files
In-Reply-To: <cover.1417949583.git.yann.morin.1998@free.fr>
References: <cover.1417949583.git.yann.morin.1998@free.fr>
Message-ID: <661d8a00260bcabd71bf7dad6ae4f1a7d3b919e9.1417949583.git.yann.morin.1998@free.fr>
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

Note: this does not add any overhead compared to the previous situation,
because we were already checking hashes of localy cached files. It just
changes the order in which we do the checks. For the records, here is the
overhead of hashing a 231MiB file (qt-everywhere-opensource-src-4.8.6.tar.gz)
on a core-i5 @2.5GHz:

            cache-cold  cache-hot
    sha1      1.914s      0.762s
    sha256    2.109s      1.270s

But again, this overhead already existed before this patch.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 support/download/dl-wrapper | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/support/download/dl-wrapper b/support/download/dl-wrapper
index 5552547..ad0ed46 100755
--- a/support/download/dl-wrapper
+++ b/support/download/dl-wrapper
@@ -56,7 +56,11 @@ main() {
 
     # If the output file already exists, do not download it again
     if [ -e "${output}" ]; then
-        exit 0
+        if support/download/check-hash "${hfile}" "${output}" "${output##*/}"; then
+            exit 0
+        fi
+        rm -f "${output}"
+        printf "Re-downloading '%s'...\n" "${output##*/}"
     fi
 
     # tmpd is a temporary directory in which backends may store intermediate
-- 
1.9.1
