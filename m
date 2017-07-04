From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Jul 2017 08:46:18 +0200
Subject: [Buildroot] [git commit] package/mke2img: specifying zero inodes
	means auto
Message-ID: <20170704064312.9244A82112@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9b5df8f2c3c4e0aa4bca8af0cb05594063725d46
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, leaving the number of inodes to be autocalculated requires
the user to not specify the -i option at all.

Also accept zero as meaning auto; this will help simplify the ext2.mk
code a little bit.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mke2img/mke2img | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mke2img/mke2img b/package/mke2img/mke2img
index 758b6de..266df48 100755
--- a/package/mke2img/mke2img
+++ b/package/mke2img/mke2img
@@ -59,7 +59,7 @@ main() {
     esac
 
     # calculate needed inodes
-    if [ -z "${nb_inodes}" ]; then
+    if [ ${nb_inodes:-0} -eq 0 ]; then
         nb_inodes=$(find "${root_dir}" | wc -l)
         nb_inodes=$((nb_inodes+400))
     fi
