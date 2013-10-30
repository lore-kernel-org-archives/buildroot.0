From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Oct 2013 19:10:06 +0100
Subject: [Buildroot] [git commit] toolchain-external: add missing symlink
	for Linaro toolchains
Message-ID: <20131104211054.5304D9BC97@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b3e3d5fc28b26291d48adad96e92e27c86183673
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In 11ec38b6950 ("toolchain-external: fix Linaro ARM toolchain
support"), we fixed the support for Linaro EABIhf toolchains by adding
a /lib/arm-linux-gnueabihf -> /lib symbolic link. This is needed
because the dynamic loader looks for libraries in
/lib/arm-linux-gnueabihf rather than the usual /lib, but Buildroot
installs all libraries in /lib.

However, we forgot that the dynamic loader also loads libraries from
/usr/lib/arm-linux-gnueabihf rather than /usr/lib, so this patch fixes
that by adding the necessary symbolic link.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reported-by: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 toolchain/toolchain-external/toolchain-external.mk |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index d658d4f..668e9c3 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -229,10 +229,11 @@ TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += -DBR_SOFTFLOAT=1
 endif
 
 # The Linaro ARMhf toolchain expects the libraries in
-# /lib/arm-linux-gnueabihf, but Buildroot copies them to /lib, so we
-# need to create a symbolic link.
+# {/usr,}/lib/arm-linux-gnueabihf, but Buildroot copies them to
+# {/usr,}/lib, so we need to create a symbolic link.
 define TOOLCHAIN_EXTERNAL_LINARO_ARMHF_SYMLINK
 	ln -sf . $(TARGET_DIR)/lib/arm-linux-gnueabihf
+	ln -sf . $(TARGET_DIR)/usr/lib/arm-linux-gnueabihf
 endef
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201109),y)
