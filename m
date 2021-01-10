From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 10 Jan 2021 22:06:58 +0100
Subject: [Buildroot] [git commit] package/tar: drop specific version for
 host variant
Message-ID: <20210110205119.2972E870BB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=37a909cacff94660ced3cc1cafbd2a1c6b0a337b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that we can generate reproducible archives, with all known tar
versions starting with 1.27, we don't need to clamp the host-tar
version to the old 1.29, and can now bump to any later version.

Drop the host-tar version, and use the same as the target variant.

Note that we still need the _SOURCE trick, to avoid depending on tar
to extract the tar tarball...

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Vincent Fazio <vfazio@xes-inc.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reviewed-by: Vincent Fazio <vfazio@xes-inc.com>
---
 package/tar/tar.mk | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/package/tar/tar.mk b/package/tar/tar.mk
index 643eff1cbc..2da731f80a 100644
--- a/package/tar/tar.mk
+++ b/package/tar/tar.mk
@@ -30,14 +30,10 @@ endif
 
 $(eval $(autotools-package))
 
-# host-tar is used to create the archives in the VCS download backends and tar
-# 1.30 and forward have changed the archive format. So archives generated with
-# earlier versions are not bit-for-bit reproducible and the hashes would not
-# match. Hence host-tar must be kept at version 1.29.
-HOST_TAR_VERSION = 1.29
 # host-tar: use cpio.gz instead of tar.gz to prevent chicken-egg problem
 # of needing tar to build tar.
-HOST_TAR_SOURCE = tar-$(HOST_TAR_VERSION).cpio.gz
+HOST_TAR_SOURCE = tar-$(TAR_VERSION).cpio.gz
+
 define HOST_TAR_EXTRACT_CMDS
 	mkdir -p $(@D)
 	cd $(@D) && \
