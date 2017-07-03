From: Samuel Martin <s.martin49@gmail.com>
Date: Tue,  4 Jul 2017 00:50:56 +0200
Subject: [Buildroot] [PATCH v3 01/11] package/mke2img: specifying zero
	inodes means auto
In-Reply-To: <20170703225106.1492-1-s.martin49@gmail.com>
References: <20170703225106.1492-1-s.martin49@gmail.com>
Message-ID: <20170703225106.1492-2-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Currently, leaving the number of inodes to be autocalculated requires
the user to not specify the -i option at all.

Also accept zero as meaning auto; this will help simplify the ext2.mk
code a little bit.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v2->v3:
- reintroduce this change from Yann' series
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
2.13.2
