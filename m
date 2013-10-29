From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Oct 2013 21:54:00 +0100
Subject: [Buildroot] [PATCH 1/3] toolchain-external: add missing symlink for
	Linaro toolchains
In-Reply-To: <1383080042-5827-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1383080042-5827-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1383080042-5827-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
 toolchain/toolchain-external/toolchain-external.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index d41cc7c..771f69a 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -222,10 +222,11 @@ TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += -DBR_SOFTFLOAT=1
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
-- 
1.8.1.2
