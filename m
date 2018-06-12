From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 12 Jun 2018 20:40:50 +0300
Subject: [Buildroot] [PATCH 3/3] f2fs-tools: add selinux and libblk optional
 dependencies
In-Reply-To: <e2de174cc828db7318acd88ebc64f751411e8458.1528825250.git.baruch@tkos.co.il>
References: <e2de174cc828db7318acd88ebc64f751411e8458.1528825250.git.baruch@tkos.co.il>
Message-ID: <dd70bbd13bb871e17949a26fd09cdf720327a0e9.1528825250.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/f2fs-tools/f2fs-tools.mk | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/package/f2fs-tools/f2fs-tools.mk b/package/f2fs-tools/f2fs-tools.mk
index 333a2cf7d4ef..1736dc4ead00 100644
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
-- 
2.17.1
