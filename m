From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 4 Sep 2020 15:43:21 +0200
Subject: [Buildroot] [git commit] package/libselinux: set the config_lsm
 kernel config option to selinux
Message-ID: <20200904133608.F1624878A9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b5bb766ff2585fca652e3fd112e9a5d7905c8981
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, the libselinux package sets the CONFIG_DEFAULT_SECURITY_SELINUX
kernel option. However, as of kernels >= 5.1, this option is superseded in
favor of the CONFIG_LSM option, a comma-separated list of LSMs the kernel
should initialize in order.

As the previous behavior of this package sets the kernel's default and only
LSM to initialize to SELinux, it is safe to set this string to just selinux.
If the user wants additional LSM's, they may do so with a custom kernel config.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libselinux/libselinux.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libselinux/libselinux.mk b/package/libselinux/libselinux.mk
index f7397141d5..521dbaaba8 100644
--- a/package/libselinux/libselinux.mk
+++ b/package/libselinux/libselinux.mk
@@ -111,6 +111,7 @@ define LIBSELINUX_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_SECURITY)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_SECURITY_NETWORK)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_SECURITY_SELINUX)
+	$(call KCONFIG_SET_OPT,CONFIG_LSM,"selinux")
 endef
 
 $(eval $(generic-package))
