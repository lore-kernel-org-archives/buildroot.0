From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Jun 2018 22:24:29 +0200
Subject: [Buildroot] [git commit] f2fs-tools: add selinux and libblk
 optional dependencies
Message-ID: <20180612202315.8A7438844E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e2a92d114b12c7bd28f6061e9066e915b1a7bd56
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/f2fs-tools/f2fs-tools.mk | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/package/f2fs-tools/f2fs-tools.mk b/package/f2fs-tools/f2fs-tools.mk
index 333a2cf7d4..1736dc4ead 100644
--- a/package/f2fs-tools/f2fs-tools.mk
+++ b/package/f2fs-tools/f2fs-tools.mk
@@ -15,4 +15,18 @@ F2FS_TOOLS_INSTALL_STAGING = YES
 F2FS_TOOLS_LICENSE = GPL-2.0
 F2FS_TOOLS_LICENSE_FILES = COPYING
 
+ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
+F2FS_TOOLS_CONF_OPTS += --with-selinux
+F2FS_TOOLS_DEPENDENCIES += libselinux
+else
+F2FS_TOOLS_CONF_OPTS += --without-selinux
+endif
+
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBBLKID),y)
+# util-linux is a dependency already, no need to list it again
+F2FS_TOOLS_CONF_OPTS += --with-blkid
+else
+F2FS_TOOLS_CONF_OPTS += --without-blkid
+endif
+
 $(eval $(autotools-package))
