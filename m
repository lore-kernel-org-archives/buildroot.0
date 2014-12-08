From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  8 Dec 2014 19:41:04 +0100
Subject: [Buildroot] [PATCH] package/mke2img: always create sparse files
Message-ID: <1418064064-30506-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When the user specifies a number of blocks (and we do not auto-compute
them), the generated filesystem can be quite large with large zones with
only zeroes in them.

Thus, always create the filesystem as a sparse file.

Sparse files behave the same as normal files, except those long runs of
zeroes do not actually use space on the (host) filesystem. Also, this
should not break current behaviour, as neither cp nor dd nor cat preserve
sparseness by default. So users relying on the zeroed parts to actually
be written won;t see a change. Users that were expressly using cp or dd
to copy files to a sparse destination will however see a little bit of
improvements, as the zeroed out parts won't even be read from disk.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mke2img/mke2img | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mke2img/mke2img b/package/mke2img/mke2img
index 9c56bc2..b186290 100755
--- a/package/mke2img/mke2img
+++ b/package/mke2img/mke2img
@@ -98,7 +98,7 @@ main() {
     fi
 
     # Generate the filesystem
-    genext2fs_opts=( -b ${nb_blocks} -N ${nb_inodes} -d "${root_dir}" )
+    genext2fs_opts=( -z -b ${nb_blocks} -N ${nb_inodes} -d "${root_dir}" )
     if [ -n "${nb_res_blocks}" ]; then
         genext2fs_opts+=( -m ${nb_res_blocks} )
     fi
-- 
1.9.1
