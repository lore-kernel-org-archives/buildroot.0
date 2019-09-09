From: unixmania at gmail.com <unixmania@gmail.com>
Date: Mon,  9 Sep 2019 20:56:07 -0300
Subject: [Buildroot] [PATCH v2] package/nfs-utils: enable IPv6 if libtirpc
 is selected
In-Reply-To: <6a13e0d0-9beb-99f0-436d-5a9d6fd7feb5@mind.be>
References: <6a13e0d0-9beb-99f0-436d-5a9d6fd7feb5@mind.be>
Message-ID: <20190909235607.31990-1-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

IPv6 requires libtirpc but we don't want to select BR2_PACKAGE_LIBTIRPC
inconditionally because it increases the size of system so enable IPv6
only if libtirpc is already selected.

Fixes: https://bugs.busybox.net/show_bug.cgi?id=10806

Signed-off-by: Carlos Santos <unixmania@gmail.com>
---
CC: nathan.renniewaldock at gmail.com
CC: Peter Seiderer <ps.report@gmx.net>
CC: Arnout Vandecappelle <arnout@mind.be>
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
--
Changes v1->v2
- Do not select libtirpc inconditionally
---
 package/nfs-utils/nfs-utils.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
index dc20942f71..3d5f5412cf 100644
--- a/package/nfs-utils/nfs-utils.mk
+++ b/package/nfs-utils/nfs-utils.mk
@@ -19,7 +19,6 @@ NFS_UTILS_CONF_OPTS = \
 	--disable-nfsv41 \
 	--disable-gss \
 	--disable-uuid \
-	--disable-ipv6 \
 	--without-tcp-wrappers \
 	--with-statedir=/run/nfs \
 	--with-rpcgen=internal
@@ -51,11 +50,12 @@ else
 NFS_UTILS_CONF_OPTS += --disable-caps
 endif
 
+# IPv6 requires libtirpc
 ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
-NFS_UTILS_CONF_OPTS += --enable-tirpc
+NFS_UTILS_CONF_OPTS += --enable-tirpc --enable-ipv6
 NFS_UTILS_DEPENDENCIES += libtirpc
 else
-NFS_UTILS_CONF_OPTS += --disable-tirpc
+NFS_UTILS_CONF_OPTS += --disable-tirpc --disable-ipv6
 endif
 
 define NFS_UTILS_INSTALL_FIXUP
-- 
2.18.1
