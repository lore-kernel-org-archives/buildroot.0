From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 5 Oct 2019 22:16:19 +0200
Subject: [Buildroot] [git commit] package/mesa3d: add llvm-config to meson
 [binaries]
Message-ID: <20191005202607.0EF0080478@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9f84b296968f52e899c1b210437ec1a47cd473f0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The meson buildsystem does not honour environment variables; instead, it
insists that path to programs be passed in the [binaries] section of the
cross-compilation.conf.

So, that is what we must do to pass the path to llvm-config.

Note that, LLVM_CONFIG does exist in the mesa3d source code, but it is
limited to the Scons buildsystem, and is also a leftover from when
mesa3d was using the autotools. It has never worked with the meson
buildsystem.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Romain Naour <romain.naour@gmail.com>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
Tested-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mesa3d/mesa3d.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 35fe2bdbe5..03a9c49a69 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -33,7 +33,7 @@ MESA3D_CONF_OPTS = \
 
 ifeq ($(BR2_PACKAGE_MESA3D_LLVM),y)
 MESA3D_DEPENDENCIES += host-llvm llvm
-MESA3D_CONF_ENV += LLVM_CONFIG=$(STAGING_DIR)/usr/bin/llvm-config
+MESA3D_MESON_EXTRA_BINARIES += llvm-config='$(STAGING_DIR)/usr/bin/llvm-config'
 MESA3D_CONF_OPTS += -Dllvm=true
 else
 # Avoid automatic search of llvm-config
