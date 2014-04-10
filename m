From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Thu, 10 Apr 2014 20:08:36 +0200
Subject: [Buildroot] [PATCH v11] xbmc: new package
References: <1395875160-14253-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <4a3j1bxkro.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

"Yann E. MORIN" <yann.morin.1998@free.fr> wrote in
news:1395875160-14253-1-git-send-email-yann.morin.1998 at free.fr: 

> +ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
> +XBMC_DEPENDENCIES += rpi-userland
> +XBMC_CONF_OPT += --with-platform=raspberry-pi --enable-player=omxplayer
> +XBMC_CONF_ENV +=
> INCLUDES="-I$(STAGING_DIR)/usr/include/interface/vcos/pthreads \ +    
> -I$(STAGING_DIR)/usr/include/interface/vmcs_host/linux" +endif

Hi,

while testing Gotham beta3 using configs/raspberrypi_defconfig I stumbled 
across this part of xbmc.mk. The defconfig does not enable the BR2
_PACKAGE_RPI_USERLAND package, so xbmc is configured without its special 
raspberry platform option. Changing the above if-clause to check for package 
BR2_PACKAGE_RPI_FIRMWARE, which is used in raspberrypi_defconfig, seems to 
work better, at least Gotham beta3 is compiled without errors.

I have to add that I do not own a Raspberry system, this was the first time 
ever I compiled code for it ;) What do you think about this patch?

diff --git a/package/xbmc/xbmc.mk b/package/xbmc/xbmc.mk
index 9169698..e1885fc 100644
--- a/package/xbmc/xbmc.mk
+++ b/package/xbmc/xbmc.mk
@@ -43,7 +43,7 @@ XBMC_CONF_OPT +=  \
        --disable-rsxs \
        --enable-optimizations

-ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
+ifeq ($(BR2_PACKAGE_RPI_FIRMWARE),y)
 XBMC_DEPENDENCIES += rpi-userland
 XBMC_CONF_OPT += --with-platform=raspberry-pi --enable-player=omxplayer
 XBMC_CONF_ENV += INCLUDES="-I
$(STAGING_DIR)/usr/include/interface/vcos/pthreads \

Regards, Bernd
