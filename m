From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Thu, 20 Apr 2017 03:36:47 -0300
Subject: [Buildroot] [PATCH] download/git: clarify why .git is removed
Message-ID: <20170420063647.30741-1-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The removal of the .git dir before creating the tarball is not anymore
just an optimization. It is necessary to make the tarball reproducible.
Also, without the removal, large tarballs (gigabytes) would be created
for some linux trees.

Update the comment accordingly.

Reported-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
first removing .git, then not removing .git
     630730 fio-fio-2.13.tar.gz
    1369791 fio-fio-2.13.tar.gz

first removing .git, then not removing .git
  144855579 linux-5e4ee836560d4c0371e109bf469e1ad808ae7a44.tar.gz
 1731823628 linux-5e4ee836560d4c0371e109bf469e1ad808ae7a44.tar.gz
---
 support/download/git | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/support/download/git b/support/download/git
index 056057c70..2b1d26c04 100755
--- a/support/download/git
+++ b/support/download/git
@@ -85,8 +85,11 @@ if [ ${recurse} -eq 1 ]; then
     _git submodule update --init --recursive
 fi
 
-# We do not need the .git dir; we keep other .git files, in case they
+# We do not want the .git dir; we keep other .git files, in case they
 # are the only files in their directory.
+# The .git dir would generate not reproducible tarballs as it depends on
+# the state of the remote server. It also would generate large tarballs
+# (gigabytes for some linux trees) when a full clone took place.
 rm -rf .git
 
 popd >/dev/null
-- 
2.11.0
