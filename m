From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 12 Apr 2018 22:53:55 +0200
Subject: [Buildroot] [git commit] support/download/dl-wrapper: fix passing
 remaining options to helper scripts
Message-ID: <20180412205410.B2F7188568@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0cf077a209596f34a109b641c90d85a87876f605
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
