From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 9 Mar 2018 22:23:35 +0100
Subject: [Buildroot] [git commit] utils/scanpypi: correctly handle license
 dirs in subdirs for .hash files
Message-ID: <20180309213409.3461782885@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7cfceeb91e2d14907cd48226ccc7bcb6df10ee1c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

create_hash_file() used basename(licensefile) when it writes the entry for
the license file in the .hash, which is obviously not correct when license
file is locate in a sub directory.

Instead copy the logic from __create_mk_license() to strip the directory
prefix from the absolute filename instead.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 utils/scanpypi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/scanpypi b/utils/scanpypi
index 2b3188dbf6..b9006ee4f7 100755
--- a/utils/scanpypi
+++ b/utils/scanpypi
@@ -554,7 +554,7 @@ class BuildrootPackage():
             hash_line = '{method}\t{digest}  {filename}\n'.format(
                 method='sha256',
                 digest=sha256.hexdigest(),
-                filename=os.path.basename(license_file))
+                filename=license_file.replace(self.tmp_extract, '')[1:])
             lines.append(hash_line)
 
         with open(path_to_hash, 'w') as hash_file:
