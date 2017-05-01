From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  1 May 2017 17:58:38 +0200
Subject: [Buildroot] [PATCH 3/9] package/mke2img: specifying zero inodes
	means auto
In-Reply-To: <cover.1493654310.git.yann.morin.1998@free.fr>
References: <cover.1493654310.git.yann.morin.1998@free.fr>
Message-ID: <3d1ce603baccb709910fa2dd0021db9af4daa2b9.1493654310.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, leaving the number of inodes to be autocalculated requires
the user to not specify the -i option at all.

Also accept zero as meaning auto; this will help simplify the ext2.mk
code a little bit.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/mke2img/mke2img | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mke2img/mke2img b/package/mke2img/mke2img
index 758b6dee68..266df483aa 100755
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
-- 
2.11.0
