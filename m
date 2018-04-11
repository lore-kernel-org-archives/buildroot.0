From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 11 Apr 2018 10:10:24 +0200
Subject: [Buildroot] [PATCH] support/download/dl-wrapper: pass the correct
 -N option
Message-ID: <20180411081024.15097-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

${raw_name} is never defined in dl-wrapper, and therefore the value
passed to the -N option is always empty. This causes a problem for the
'cvs' backend, which uses the value of this option as the CVS module
to be downloaded.

If the name of the CVS module is omitted, all the CVS modules from
that CVS repository are downloaded, which creates a tarball with a lot
more contents, and the actual useful contents in a sub-directory,
obviously breaking patches that should be applied, and the entire
build process that follows.

Fixes:

  http://autobuild.buildroot.net/results/fcee0e3d7eeeb373313b1794092c729b1b052348/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/download/dl-wrapper | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/download/dl-wrapper b/support/download/dl-wrapper
index 3d2118a4ef..8d6365e08d 100755
--- a/support/download/dl-wrapper
+++ b/support/download/dl-wrapper
@@ -125,7 +125,7 @@ main() {
                 -c "${cset}" \
                 -d "${dl_dir}" \
                 -n "${raw_base_name}" \
-                -N "${raw_name}" \
+                -N "${base_name}" \
                 -f "${filename}" \
                 -u "${uri}" \
                 -o "${tmpf}" \
-- 
2.14.3
