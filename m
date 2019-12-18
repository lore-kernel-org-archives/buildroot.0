From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 18 Dec 2019 18:27:41 +0100
Subject: [Buildroot] [git commit] package/sysrepo: fix install path for
 systemd units
Message-ID: <20191218172934.22F888B913@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=873e6573d3fec87ab497523fa361351fd82e7c8e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The relative paths currently used to install the systemd units causes an
incorrect installation, where units are installed in (notice the double
usr in the paths):

    target/usr/usr/lib/systemd/system/sysrepod.service
    staging/usr/usr/lib/systemd/system/sysrepod.service

Fix that by using an absolute path.

Signed-off-by: J??r??my Rosen <jeremy.rosen@smile.fr>
[yann.morin.1998 at free.fr:
  - split into its own commit
  - expand commit log
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/sysrepo/sysrepo.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sysrepo/sysrepo.mk b/package/sysrepo/sysrepo.mk
index 216e517526..cc4f8e406f 100644
--- a/package/sysrepo/sysrepo.mk
+++ b/package/sysrepo/sysrepo.mk
@@ -24,7 +24,7 @@ SYSREPO_CONF_OPTS = \
 	-DCALL_SYSREPOCFG_BIN=$(HOST_DIR)/bin/sysrepocfg \
 	-DBUILD_EXAMPLES=$(if $(BR2_PACKAGE_SYSREPO_EXAMPLES),ON,OFF) \
 	$(if $(BR2_INIT_SYSTEMD),-DWITH_SYSTEMD=ON) \
-	$(if $(BR2_INIT_SYSTEMD),-DSYSTEMD_UNIT_DIR=usr/lib/systemd/system)
+	$(if $(BR2_INIT_SYSTEMD),-DSYSTEMD_UNIT_DIR=/usr/lib/systemd/system)
 
 # On ARM, this is needed to prevent unaligned memory access with an optimized
 # build .. https://github.com/sysrepo/sysrepo/issues/947
