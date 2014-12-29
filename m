From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Dec 2014 19:04:06 +0100
Subject: [Buildroot] [git commit] package/mke2img: always create sparse files
Message-ID: <20141229180416.1741B807A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fbd244c277bfeca4f0dc58286be4f55780cdbbc2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
Tested-by: Karoly Kasza <kaszak@gmail.com>
Reviewed-by: Karoly Kasza <kaszak@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mke2img/mke2img |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/mke2img/mke2img b/package/mke2img/mke2img
index e93d869..68da6ed 100755
--- a/package/mke2img/mke2img
+++ b/package/mke2img/mke2img
@@ -100,7 +100,7 @@ main() {
     fi
 
     # Generate the filesystem
-    genext2fs_opts=( -b ${nb_blocks} -N ${nb_inodes} -d "${root_dir}" )
+    genext2fs_opts=( -z -b ${nb_blocks} -N ${nb_inodes} -d "${root_dir}" )
     if [ -n "${nb_res_blocks}" ]; then
         genext2fs_opts+=( -m ${nb_res_blocks} )
     fi
