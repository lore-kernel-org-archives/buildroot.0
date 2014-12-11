From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 11 Dec 2014 23:52:08 +0100
Subject: [Buildroot] [PATCH 4/4 v5] pkg-download: check hashes for locally
	cached files
In-Reply-To: <cover.1418337531.git.yann.morin.1998@free.fr>
References: <cover.1418337531.git.yann.morin.1998@free.fr>
Message-ID: <06b4eb57a7671f63c52d7a71bfc141682fdb0e38.1418337531.git.yann.morin.1998@free.fr>
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

Also, an upstream would sometime serve us HTML garbage instead of the
actual tarball we requested, like SourceForge does from time for as-yet
unknown reasons.

So, to avoid this situation, check the hashes prior to doing the
download. If the hashes match, consider the locally cached file genuine,
and do not download it. However, if the locally cached file does not
match the known hashes we have for it, it is promptly removed, and a
download is re-attempted.

Note: this does not add any overhead compared to the previous situation,
because we were already checking hashes of locally cached files. It just
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
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/download/dl-wrapper | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/support/download/dl-wrapper b/support/download/dl-wrapper
index f0cdd73..cced8f6 100755
--- a/support/download/dl-wrapper
+++ b/support/download/dl-wrapper
@@ -49,7 +49,11 @@ main() {
 
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
