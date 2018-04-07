From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  7 Apr 2018 23:26:14 +0200
Subject: [Buildroot] [PATCH] download/git: fix trasnform-name
Message-ID: <20180407212614.15639-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When a package contains a relative symlink which first component is '..'
(thus pointing one directory higher), for example package 'meh' contains
this symlink:

    foo/bar -> ../buz

then it would be stored as 'meh-version./buz' because of the
transform-name pattern replacement.

Fix it to only match the leading './'.

Reported-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 support/download/git | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/download/git b/support/download/git
index f07195b0d1..787b6bcca0 100755
--- a/support/download/git
+++ b/support/download/git
@@ -111,7 +111,7 @@ LC_ALL=C sort <"${output}.list" >"${output}.list.sorted"
 
 # Create GNU-format tarballs, since that's the format of the tarballs on
 # sources.buildroot.org and used in the *.hash files
-tar cf - --transform="s/^\./${basename}/" \
+tar cf - --transform="s/^\.\//${basename}\//" \
 	--numeric-owner --owner=0 --group=0 --mtime="${date}" --format=gnu \
          -T "${output}.list.sorted" >"${output}.tar"
 gzip -6 -n <"${output}.tar" >"${output}"
-- 
2.14.1
