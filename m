From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Apr 2017 22:27:23 +0200
Subject: [Buildroot] [git commit] download/git: clarify why .git is removed
Message-ID: <20170420202835.9962E802E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5d6ec40b757e664a71f7e2f5012d1efa87b3f4f5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The removal of the .git dir before creating the tarball is not anymore
just an optimization. It is necessary to make the tarball reproducible.
Also, without the removal, large tarballs (gigabytes) would be created
for some linux trees.

Update the comment accordingly.

Reported-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/download/git | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/support/download/git b/support/download/git
index 056057c..fc2957d 100755
--- a/support/download/git
+++ b/support/download/git
@@ -85,8 +85,11 @@ if [ ${recurse} -eq 1 ]; then
     _git submodule update --init --recursive
 fi
 
-# We do not need the .git dir; we keep other .git files, in case they
+# We do not want the .git dir; we keep other .git files, in case they
 # are the only files in their directory.
+# The .git dir would generate non reproducible tarballs as it depends on
+# the state of the remote server. It also would generate large tarballs
+# (gigabytes for some linux trees) when a full clone took place.
 rm -rf .git
 
 popd >/dev/null
