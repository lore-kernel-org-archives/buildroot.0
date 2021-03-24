From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Mar 2021 10:42:04 +0100
Subject: [Buildroot] [git commit branch/2021.02.x] support/download: fix
 tarball generation with symlinks pointing to ./something
Message-ID: <20210324124145.9A20C88F86@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4cee5fc3970575917f6eae83a5520963d07f3d52
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

When a --transform expression is provided, it is by default also applied
to the target of a symlink.

When we create tarballs (from git or svn checkouts), we use a --transform
expression to replace the leading ./ with the package name and version.

This causes issues when a package contains symlinks that points to
./something, as the leading './' is also replaced.

Fix that by using the 'S' transformation scope flag, as described in the
tar manual:
    https://www.gnu.org/software/tar/manual/html_node/transform.html#transform

    In addition, several transformation scope flags are supported, that
    control to what files transformations apply. These are:

    ???r??? Apply transformation to regular archive members.
    ???R??? Do not apply transformation to regular archive members.
    ???s??? Apply transformation to symbolic link targets.
    ???S??? Do not apply transformation to symbolic link targets.
    ???h??? Apply transformation to hard link targets.
    ???H??? Do not apply transformation to hard link targets.

    Default is ???rsh??? [...].

Fixes: #13616

This has been checked to not change any of the existing hash for any of
our git-downloaded package (some are host-only, hence the few fixups):

    ---8<---
    $ m="$( git grep -l -E -- -br[[:digit:]]+.tar.gz boot package/ \
            |awk -F/ '{print $(NF-1)}' \
            |sed -r -e 's/(imx-mkimage|netsurf-buildsystem|prelink-cross|qoriq-rcw|vboot-utils)/host-\1/g' \
                    -e 's/$/-source/'
          )"
    $ make defconfig; make clean; BR2_DL_DIR=$(pwd)/trash-me make ${m}
    ---8<---

Note: it is unclear what the 'H' flag does nor how it works, because the
concept of "target of a hardlink" is not obvious; probably it has to do
with how tar internally detects and stores hardlinks. Since we do not
yet have any issue with hardlinks, just ignore the problem for now, and
postpone until we have an actual issue with a real test-case.

Signed-off-by: Jean-pierre Cartal <jpcartal@free.fr>
Cc: Vincent Fazio <vfazio@xes-inc.com>
[yann.morin.1998 at free.fr:
  - re-indent commit log
  - add scriptlet to test existing hashes
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit c9f27fdc1bf36da745218cec6722a3d09c2bcd3b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/download/helpers | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/download/helpers b/support/download/helpers
index 57cc9fef44..40d5eea591 100755
--- a/support/download/helpers
+++ b/support/download/helpers
@@ -59,7 +59,7 @@ mk_tar_gz() {
     LC_ALL=C sort <"${tmp}.list" >"${tmp}.sorted"
 
     # Create POSIX tarballs, since that's the format the most reproducible
-    tar cf - --transform="s#^\./#${base_dir}/#" \
+    tar cf - --transform="s#^\./#${base_dir}/#S" \
              --numeric-owner --owner=0 --group=0 --mtime="${date}" \
              --format=posix --pax-option="${pax_options}" \
              -T "${tmp}.sorted" >"${tmp}.tar"
