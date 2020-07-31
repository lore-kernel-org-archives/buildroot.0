From: aduskett at gmail.com <aduskett@gmail.com>
Date: Fri, 31 Jul 2020 13:40:52 -0700
Subject: [Buildroot] [PATCH 1/9] package/libselinux: set the config_lsm
 kernel config option to selinux
In-Reply-To: <20200731204100.1171427-1-aduskett@gmail.com>
References: <20200731204100.1171427-1-aduskett@gmail.com>
Message-ID: <20200731204100.1171427-2-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Currently, the libselinux package sets the CONFIG_DEFAULT_SECURITY_SELINUX
kernel option. However, as of kernels >= 5.1, this option is superseded in
favor of the CONFIG_LSM option, a comma-separated list of LSMs the kernel
should initialize in order.

As the previous behavior of this package sets the kernel's default and only
LSM to initialize to SELinux, it is safe to set this string to just selinux.
If the user wants additional LSM's, they may do so with a custom kernel config.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
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
-- 
2.26.2
