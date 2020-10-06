From: Antoine Tenart <antoine.tenart@bootlin.com>
Date: Tue,  6 Oct 2020 17:37:26 +0200
Subject: [Buildroot] [PATCH v2 2/2] fs/jffs2: copy xattrs
In-Reply-To: <20201006153726.790986-1-antoine.tenart@bootlin.com>
References: <20201006153726.790986-1-antoine.tenart@bootlin.com>
Message-ID: <20201006153726.790986-2-antoine.tenart@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch sets the --with-xattr option when generating an image with
mkfs.jffs2 if BR2_PACKAGE_LIBSELINUX is selected, so that SELinux
security contexts will be kept and available in jffs2 images.

Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
---

Since v1:
  - s/BR2_PACKAGE_REFPOLICY/BR2_PACKAGE_LIBSELINUX/

 fs/jffs2/jffs2.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/jffs2/jffs2.mk b/fs/jffs2/jffs2.mk
index 2adbc2320e38..d93ba58ded6e 100644
--- a/fs/jffs2/jffs2.mk
+++ b/fs/jffs2/jffs2.mk
@@ -35,6 +35,10 @@ JFFS2_OPTS += -n
 SUMTOOL_OPTS += -n
 endif
 
+ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
+JFFS2_OPTS += --with-xattr
+endif
+
 ROOTFS_JFFS2_DEPENDENCIES = host-mtd
 
 ifneq ($(BR2_TARGET_ROOTFS_JFFS2_SUMMARY),)
-- 
2.26.2
