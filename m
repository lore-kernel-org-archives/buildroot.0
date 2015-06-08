From: rdkehn at yahoo.com <rdkehn@yahoo.com>
Date: Mon, 8 Jun 2015 07:33:59 -0500
Subject: [Buildroot] [PATCH 06/11] package/cryptodev-linux: use the
 kernel-module helper
In-Reply-To: <0f3d2e118ecb2c6250751eb42bebe811652ca162.1433628825.git.yann.morin.1998@free.fr>
References: <cover.1433628825.git.yann.morin.1998@free.fr>
 <0f3d2e118ecb2c6250751eb42bebe811652ca162.1433628825.git.yann.morin.1998@free.fr>
Message-ID: <20150608123358.GA27673@dkarchlinux64.currentcomm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Sun, Jun 07, 2015 at 12:20:42AM +0200, Yann E. MORIN wrote:
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/cryptodev-linux/cryptodev-linux.mk | 13 ++++---------
>  1 file changed, 4 insertions(+), 9 deletions(-)
> 
> diff --git a/package/cryptodev-linux/cryptodev-linux.mk b/package/cryptodev-linux/cryptodev-linux.mk
> index 6f41930..02f59f8 100644
> --- a/package/cryptodev-linux/cryptodev-linux.mk
> +++ b/package/cryptodev-linux/cryptodev-linux.mk
> @@ -6,23 +6,18 @@
>  
>  CRYPTODEV_LINUX_VERSION = 1.7
>  CRYPTODEV_LINUX_SITE = http://download.gna.org/cryptodev-linux
> -CRYPTODEV_LINUX_DEPENDENCIES = linux
>  CRYPTODEV_LINUX_INSTALL_STAGING = YES
>  CRYPTODEV_LINUX_LICENSE = GPLv2+
>  CRYPTODEV_LINUX_LICENSE_FILES = COPYING
>  
> -define CRYPTODEV_LINUX_BUILD_CMDS
> -	$(MAKE) -C $(@D) $(LINUX_MAKE_FLAGS) KERNEL_DIR=$(LINUX_DIR)
> -endef
> -
> -define CRYPTODEV_LINUX_INSTALL_TARGET_CMDS
> -	$(MAKE) -C $(@D) $(LINUX_MAKE_FLAGS) KERNEL_DIR=$(LINUX_DIR) \
> -		PREFIX=$(TARGET_DIR) modules_install
> -endef
> +CRYPTODEV_LINUX_MODULE_MAKE_OPTS = \
> +	KERNEL_DIR=$(LINUX_DIR) \
> +	PREFIX=$(TARGET_DIR)
>  
>  define CRYPTODEV_LINUX_INSTALL_STAGING_CMDS
>  	$(INSTALL) -D -m 644 $(@D)/crypto/cryptodev.h \
>  		$(STAGING_DIR)/usr/include/crypto/cryptodev.h
>  endef
>  
> +$(eval $(kernel-module))
>  $(eval $(generic-package))
> -- 
> 1.9.1

cryptodev-linux fails to build because version.h does not get
generated before compiling the source.  Adding a PRE_BUILD_HOOK
resolves the problem.

Regards,
...doug

diff --git a/package/cryptodev-linux/cryptodev-linux.mk b/package/cryptodev-linux/cryptodev-linux.mk
index 6f41930..9e1d53d 100644
--- a/package/cryptodev-linux/cryptodev-linux.mk
+++ b/package/cryptodev-linux/cryptodev-linux.mk
@@ -6,23 +6,24 @@
 
 CRYPTODEV_LINUX_VERSION = 1.7
 CRYPTODEV_LINUX_SITE = http://download.gna.org/cryptodev-linux
-CRYPTODEV_LINUX_DEPENDENCIES = linux
 CRYPTODEV_LINUX_INSTALL_STAGING = YES
 CRYPTODEV_LINUX_LICENSE = GPLv2+
 CRYPTODEV_LINUX_LICENSE_FILES = COPYING
 
-define CRYPTODEV_LINUX_BUILD_CMDS
-       $(MAKE) -C $(@D) $(LINUX_MAKE_FLAGS) KERNEL_DIR=$(LINUX_DIR)
+define CRYPTODEV_LINUX_VERSION_H
+       $(MAKE) -C $(@D) version.h
 endef
 
-define CRYPTODEV_LINUX_INSTALL_TARGET_CMDS
-       $(MAKE) -C $(@D) $(LINUX_MAKE_FLAGS) KERNEL_DIR=$(LINUX_DIR) \
-               PREFIX=$(TARGET_DIR) modules_install
-endef
+CRYPTODEV_LINUX_PRE_BUILD_HOOKS += CRYPTODEV_LINUX_VERSION_H
+
+CRYPTODEV_LINUX_MODULE_MAKE_OPTS = \
+       KERNEL_DIR=$(LINUX_DIR) \
+       PREFIX=$(TARGET_DIR)
 
 define CRYPTODEV_LINUX_INSTALL_STAGING_CMDS
        $(INSTALL) -D -m 644 $(@D)/crypto/cryptodev.h \
                $(STAGING_DIR)/usr/include/crypto/cryptodev.h
 endef
 
+$(eval $(kernel-module))
 $(eval $(generic-package))
