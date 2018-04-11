From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 11 Apr 2018 09:31:21 +0200
Subject: [Buildroot] [PATCH] support/download/dl-wrapper: fix passing
 remaining options to helper scripts
Message-ID: <20180411073121.4621-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When calling the backend-specific helper scripts, the remaining
options are in ${@}. However, in order to let the helper script know
that those remaining options should not be parsed, but instead passed
as-is to the download tool, they must be separated from the main
options by "--".

Without this, packages that use <pkg>_DL_OPTS, such as the
amd-catalyst package, cannot download their tarball anymore.

Fixes:

  http://autobuild.buildroot.net/results/de818f6e4c8e63d5e8a49c445d10c34eccc40410/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
Note: please review carefully. I am not sure this is the right
fix. Looking at the history of dl-wrapper, I don't see where this --
was passed before the recent rework, so I'm not sure my solution is
correct.
---
 support/download/dl-wrapper | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/download/dl-wrapper b/support/download/dl-wrapper
index 38430738eb..3d2118a4ef 100755
--- a/support/download/dl-wrapper
+++ b/support/download/dl-wrapper
@@ -129,7 +129,7 @@ main() {
                 -f "${filename}" \
                 -u "${uri}" \
                 -o "${tmpf}" \
-                ${quiet} ${recurse} "${@}"
+                ${quiet} ${recurse} -- "${@}"
         then
             # cd back to keep path coherence
             cd "${OLDPWD}"
-- 
2.14.3
