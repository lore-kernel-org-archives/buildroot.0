From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 27 Mar 2020 23:13:12 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] fs/initramfs: fix
 show-info
Message-ID: <20200327220228.909F0886A3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=49dcc6eb09061ce729693a5b80bf615e0fd42455
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

The initramfs is not a reall filesystem, so it does not use the
$(rootfs) infrastructure.

As a consequence, the usual rootfs-related variables are not set,
especially the name, type, and dependencies of the (non-)filesystem.

Yet, it is present in the list of rootfs to build, and thus we end
up including it in the output of show-info. But the missing variables
yield an incorrect json:

    "": {
        "type": "",
        "virtual": false,
        "version": "",
        "licenses": "",
        "dl_dir": "",
        "install_target": ,
        "install_staging": ,
        "install_images": ,
        "downloads": [ ],
        "dependencies": [ ],
        "reverse_dependencies": [ ]
    },

First, the object key is empty; second, the install_target,
install_staging, and install_images values are empty, which is not
valid (if they were null, that be OK though). Third, this is clearly
the layout of a 'package' entry, not that of a 'rootfs' entry.

An option to fix that would be to actually make use of the rootfs
infra. However, that would mean doing a lot of work for nothing
(there is actually nothing to do, yet the infra would still do a lot
of preparatory and clean up work).

The alternative is pretty simple: declare and set the variables as if
it were a real filesystem, so that show-info can filter it to the
proper layout and can spit out appropriate content (even if fake).

The third option would be to teach show-info (and its internal
implementation, the macro json-info) to ignore specific cases, like
no-name items, or replace empty values with null, or whatnots. This
again would be quite a lot of work for a single occurence.

So we go for the simple faked variables.

We add linux as a dependency, so that the graph-depends also properly
represent the dependency chain, which ends up with something liKe:

              ALL
               |
               v
        rootfs-initramfs
         |            |
         v            v
       linux     rootfs-cpio

which is pretty fitting in the end.

Reported-by: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Tested-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b42db7db9f2be3f37217898022e097dfc7509756)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 fs/initramfs/initramfs.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/fs/initramfs/initramfs.mk b/fs/initramfs/initramfs.mk
index c751093214..3b3d4ed8b9 100644
--- a/fs/initramfs/initramfs.mk
+++ b/fs/initramfs/initramfs.mk
@@ -29,3 +29,8 @@ rootfs-initramfs-show-depends:
 ifeq ($(BR2_TARGET_ROOTFS_INITRAMFS),y)
 TARGETS_ROOTFS += rootfs-initramfs
 endif
+
+# Not using the rootfs infra, so fake the variables
+ROOTFS_INITRAMFS_NAME = rootfs-initramfs
+ROOTFS_INITRAMFS_TYPE = rootfs
+ROOTFS_INITRAMFS_DEPENDENCIES = rootfs-cpio linux
