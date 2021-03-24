From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Mar 2021 15:04:03 +0100
Subject: [Buildroot] [git commit branch/2020.11.x] support/download: Fix
 tarball generation with symlinks pointing to ./something
Message-ID: <20210324133943.AD07D88FC4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=60e31c823f6899087c8dd0e7bc3f14514d28a3d0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

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
Signed-off-by: Jean-pierre Cartal <jpcartal@free.fr>
Tested-by: Yann E. MORIN <yann.morin.1998@free.fr>
Acked-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/download/git | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/download/git b/support/download/git
index 15d8c66e05..1b0dc1b115 100755
--- a/support/download/git
+++ b/support/download/git
@@ -203,7 +203,7 @@ LC_ALL=C sort <"${output}.list" >"${output}.list.sorted"
 
 # Create GNU-format tarballs, since that's the format of the tarballs on
 # sources.buildroot.org and used in the *.hash files
-tar cf - --transform="s#^\./#${basename}/#" \
+tar cf - --transform="s#^\./#${basename}/#S" \
          --numeric-owner --owner=0 --group=0 --mtime="${date}" --format=gnu \
          -T "${output}.list.sorted" >"${output}.tar"
 gzip -6 -n <"${output}.tar" >"${output}"
