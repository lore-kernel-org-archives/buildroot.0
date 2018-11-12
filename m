From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 12 Nov 2018 18:33:12 +0100
Subject: [Buildroot] [PATCH 2/6 v2] fs/tar: add support for xattrs (thus
 capabilties)
In-Reply-To: <cover.1542043922.git.yann.morin.1998@free.fr>
References: <cover.1542043922.git.yann.morin.1998@free.fr>
Message-ID: <0b788d4ef7c7f0d02c1a15b31a69d08de3401abe.1542043922.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

By default, tar will not include any extended attribute (xattr) when
creating archives, and thus will not store capabilties either (as they
are stored in the xattr 'security.capability').

Using option --xattrs is enough to create a tarball with all the xattrs
attached to a file. However, extracting all xattrs from a tarball
requires that --xattrs-include='*' be used. This is not symetric (but on
purpose, as per the documentation), and so is confusing to some.

So, we use --xattrs-include='*' to create the archive, so as to be
explicit that we want all xattrs to be stored.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 fs/tar/tar.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/tar/tar.mk b/fs/tar/tar.mk
index 68149e9eb7..4c6327ace8 100644
--- a/fs/tar/tar.mk
+++ b/fs/tar/tar.mk
@@ -10,7 +10,7 @@ ROOTFS_TAR_DEPENDENCIES = $(BR2_TAR_HOST_DEPENDENCY)
 
 define ROOTFS_TAR_CMD
 	(cd $(TARGET_DIR); find -print0 | LC_ALL=C sort -z | \
-		tar $(TAR_OPTS) -cf $@ --null --no-recursion -T - --numeric-owner)
+		tar $(TAR_OPTS) -cf $@ --null --xattrs-include='*' --no-recursion -T - --numeric-owner)
 endef
 
 $(eval $(rootfs))
-- 
2.14.1
