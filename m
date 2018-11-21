From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 21 Nov 2018 18:35:14 +0100
Subject: [Buildroot] [PATCH v2] alsa-utils: install systemd sevice files
In-Reply-To: <20181030224139.5140-1-ps.report@gmx.net>
References: <20181030224139.5140-1-ps.report@gmx.net>
Message-ID: <20181121173514.GM2601@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2018-10-30 23:41 +0100, Peter Seiderer spake thusly:
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Changes v1 -> v2:
>   - fix symlinks (reported by ????? ??????????)
> ---
>  package/alsa-utils/alsa-utils.mk | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/package/alsa-utils/alsa-utils.mk b/package/alsa-utils/alsa-utils.mk
> index e9a45c675f..0c65082a14 100644
> --- a/package/alsa-utils/alsa-utils.mk
> +++ b/package/alsa-utils/alsa-utils.mk
> @@ -82,4 +82,18 @@ define ALSA_UTILS_INSTALL_TARGET_CMDS
>  	fi
>  endef
>  
> +ifeq ($(BR2_PACKAGE_ALSA_UTILS_ALSACTL),y)
> +define ALSA_UTILS_INSTALL_INIT_SYSTEMD
> +	$(INSTALL) -D -m 0644 $(@D)/alsactl/alsa-restore.service \
> +		$(TARGET_DIR)/usr/lib/systemd/system/alsa-restore.service
> +	$(INSTALL) -D -m 0644 $(@D)/alsactl/alsa-state.service \
> +		$(TARGET_DIR)/usr/lib/systemd/system/alsa-state.service
> +	mkdir -p $(TARGET_DIR)/etc/systemd/system/sound.target.wants
> +	ln -sf ../../../../lib/systemd/system/alsa-restore.service \
> +		$(TARGET_DIR)/etc/systemd/system/sound.target.wants/alsa-restore.service
> +	ln -sf ../../../../lib/systemd/system/alsa-state.service \
> +		$(TARGET_DIR)/etc/systemd/system/sound.target.wants/alsa-state.service
> +endef
> +endif

This does not works with that defconfig:

BR2_arm=y
BR2_cortex_a53=y
BR2_ARM_FPU_NEON_VFPV4=y
BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
BR2_TOOLCHAIN_BUILDROOT_USE_SSP=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_INIT_SYSTEMD=y
BR2_PACKAGE_ALSA_UTILS=y
BR2_PACKAGE_ALSA_UTILS_ALSACONF=y
BR2_PACKAGE_ALSA_UTILS_AMIXER=y
BR2_PACKAGE_ALSA_UTILS_APLAY=y
BR2_PACKAGE_ALSA_UTILS_SPEAKER_TEST=y
# BR2_TARGET_ROOTFS_TAR is not set

And fails with this error:

/usr/bin/install -D -m 0644 /home/ymorin/dev/buildroot/O2/build/alsa-utils-1.1.6/alsactl/alsa-restore.service /home/ymorin/dev/buildroot/O2/target/usr/lib/systemd/system/alsa-restore.service
/usr/bin/install: cannot stat '/home/ymorin/dev/buildroot/O2/build/alsa-utils-1.1.6/alsactl/alsa-restore.service': No such file or directory

Care to have a look, please?

Regards,
Yann E. MORIN.

>  $(eval $(autotools-package))
> -- 
> 2.19.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
