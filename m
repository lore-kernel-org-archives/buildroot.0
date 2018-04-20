From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 20 Apr 2018 09:36:32 +0200
Subject: [Buildroot] [PATCH] download/git: fix transform regexp for older
 tar versions
Message-ID: <20180420073632.5047-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Older versions of tar (e.g. 1.27.1) incorrectly interpret the escaping
of the regexp separator, and generate broken tarballs.

For example, given the following transform expression:
    --transform="s/^\.\//squashfs-e38956b92f738518c29734399629e7cdb33072d3\//"

the resulting paths in the generated tarball would be:
    squashfs-e38956b92f738518c29734399629e7cdb33072d3\/

i.e. a directory which last character is indeed a '\'.

We fix that by using a separator which is very unlikely to occur in a
filename.

Fixes:
    http://autobuild.buildroot.org/results/742/7427f34e5c9f6d043b0fe6ad2c66cc0f31d2b24f/

and probably a slew of others as well...

Take this opportunity to fix indetation on the following line (leading
spaces, not tABs).

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 support/download/git | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/download/git b/support/download/git
index 1172310186..99c4b523b8 100755
--- a/support/download/git
+++ b/support/download/git
@@ -120,8 +120,8 @@ LC_ALL=C sort <"${output}.list" >"${output}.list.sorted"
 
 # Create GNU-format tarballs, since that's the format of the tarballs on
 # sources.buildroot.org and used in the *.hash files
-tar cf - --transform="s/^\.\//${basename}\//" \
-	--numeric-owner --owner=0 --group=0 --mtime="${date}" --format=gnu \
+tar cf - --transform="s#^\./#${basename}/#" \
+         --numeric-owner --owner=0 --group=0 --mtime="${date}" --format=gnu \
          -T "${output}.list.sorted" >"${output}.tar"
 gzip -6 -n <"${output}.tar" >"${output}"
 
-- 
2.14.1
