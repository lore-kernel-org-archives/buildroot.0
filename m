From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 21 Jan 2016 22:23:39 +0100
Subject: [Buildroot] [PATCH 4/4] [DO NOT COMMIT] busybox: user username and
	group name
In-Reply-To: <cover.1453411322.git.yann.morin.1998@free.fr>
References: <cover.1453411322.git.yann.morin.1998@free.fr>
Message-ID: <1091c86340c443e61aba2523f0eb9ef7a2881e6a.1453411322.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit is just a testbed from the newly-introduced possibility
to use usernames and group names from the _PREMISSIONS and _DEVICES
variables, instaed of only numerical values.

Using that defconfig:
    BR2_arm=y
    BR2_cortex_a7=y
    BR2_TOOLCHAIN_EXTERNAL=y

Extract the generated rootfs.tar (as root!) and check that busybox is
owned by 762:763.

Explicitly not Signed-off-by me, as this SHOULD NOT BE COMMITTED.
---
 package/busybox/busybox.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 7f6dbd6..eb670e8 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -50,8 +50,12 @@ BUSYBOX_KCONFIG_FRAGMENT_FILES = $(call qstrip,$(BR2_PACKAGE_BUSYBOX_CONFIG_FRAG
 BUSYBOX_KCONFIG_EDITORS = menuconfig xconfig gconfig
 BUSYBOX_KCONFIG_OPTS = $(BUSYBOX_MAKE_OPTS)
 
+define BUSYBOX_USERS
+bbuser 762 bbgroup 763 * - - -
+endef
+
 define BUSYBOX_PERMISSIONS
-	/bin/busybox                     f 4755 0  0 - - - - -
+	/bin/busybox f 4755 bbuser bbgroup - - - - -
 endef
 
 # If mdev will be used for device creation enable it and copy S10mdev to /etc/init.d
-- 
1.9.1
