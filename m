From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 May 2013 12:20:06 +0200
Subject: [Buildroot] [PATCH] Add package gpu-viv-bin-mx6q to the
 freescale-imx directory
In-Reply-To: <1368129212-4892-2-git-send-email-h.fijnvandraat@inter.nl.net>
References: <1368129212-4892-1-git-send-email-h.fijnvandraat@inter.nl.net>
 <1368129212-4892-2-git-send-email-h.fijnvandraat@inter.nl.net>
Message-ID: <20130511122006.694f3942@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Henk Fijnvandraat,

Arnout made some good comments, I have a few others below.

On Thu,  9 May 2013 21:53:32 +0200, Henk Fijnvandraat wrote:

> diff --git a/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk b/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
> new file mode 100644
> index 0000000..d003443
> --- /dev/null
> +++ b/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
> @@ -0,0 +1,77 @@
> +#############################################################
> +#
> +# gpu-viv-bin-mx6q
> +#
> +#############################################################
> +
> +GPU_VIV_BIN_MX6Q_VERSION = $(IMX_VERSION_LEVEL)
> +GPU_VIV_BIN_MX6Q_SITE    = $(IMX_MIRROR_SITE)
> +GPU_VIV_BIN_MX6Q_SOURCE  = gpu-viv-bin-mx6q-$(GPU_VIV_BIN_MX6Q_VERSION).bin
> +
> +GPU_VIV_BIN_MX6Q_INSTALL_STAGING = YES
> +
> +# GPU_VIV_BIN_MX6Q_LICENSE = Freescale Semiconductor Software License Agreement

Why is this in a comment?

> +# No license file is included in the archive; we could extract it from
> +# the self-extractor, but that's just too much effort.
> +# This is a legal minefield: the EULA specifies that
> +# the Board Support Package includes software and hardware (sic!)
> +# for which a separate license is needed...
> +GPU_VIV_BIN_MX6Q_REDISTRIBUTE = NO
> +
> +# The archive is a shell-self-extractor of a bzipped tar. It happens
> +# to extract in the correct directory (gpu-viv-bin-mx6q-x.y.z)
> +# The --force makes sure it doesn't fail if the source dir already exists.
> +# The --auto-accept skips the license check - not needed for us
> +# because we have legal-info.
> +define GPU_VIV_BIN_MX6Q_EXTRACT_CMDS
> +	cd $(BUILD_DIR); \
> +	sh $(DL_DIR)/$(GPU_VIV_BIN_MX6Q_SOURCE) --force --auto-accept
> +endef

I think we generally prefer to have the entire command executed in a
sub-shell, i.e:

	(cd $(BUILD_DIR); \
	 sh $(DL_DIR)/$(GPU_VIV_BIN_MX6Q_SOURCE) --force --auto-accept)

Also, what guarantees us that it will actually be extracted to the
right subfilter in $(BUILD_DIR) ?

> +define GPU_VIV_BIN_MX6Q_INSTALL_STAGING_CMDS
> +	cp -r $(@D)/usr/* $(STAGING_DIR)/usr
> +endef
> +
> +ifdef $(BR2_PACKAGE_GPU_VIV_BIN_IMX6Q_EXAMPLES)
> +define GPU_VIV_BIN_MX6Q_INSTALL_EXAMPLES
> +	cp -r $(@D)/opt/* $(TARGET_DIR)/opt
> +endef
> +endif

Maybe usr/share/gpu-viv-imx6q/examples/ is a better location than opt/ ?

Also, the installation steps should be after the build steps. It
doesn't change anything from a functional point of view, but it's the
way we write all packages, just because it is more logical.

> +ifeq ($(BR2_PACKAGE_XORG7),y)
> +GPU_VIV_BIN_MX6Q_LIB_TARGET = x11
> +else
> +# DirectFB is not supported (wrong version)
> +GPU_VIV_BIN_MX6Q_LIB_TARGET = fb
> +endif

Hum, so if X.org is not selected, this package installs something that
doesn't work? Seems strange.

Also, I see that this installs EGL libraries, I thought EGL was here to
allow the creation of OpenGL contexts when there is no windowing system
such as X.org. For example, with the Rasberry Pi libraries, you can
have EGL+OpenGL and Qt running on top of it, without DirectFB or X.org.
Isn't that also possible here?

Are you sure that the "fb" target actually requires DirectFB ?

> +# Instead of building, we fix up the inconsistencies that exist
> +# in the upstream archive here.
> +# Make sure these commands are idempotent.
> +define GPU_VIV_BIN_MX6Q_BUILD_CMDS
> +	$(SED) 's/defined(LINUX)/defined(__linux__)/g' $(@D)/usr/include/*/*.h
> +	for lib in EGL GAL VIVANTE; do \
> +		ln -sf lib$${lib}-$(GPU_VIV_BIN_MX6Q_LIB_TARGET).so \
> +			$(@D)/usr/lib/lib$${lib}.so; \
> +	done
> +	ln -sf libGL.so.1.2 $(@D)/usr/lib/libGL.so.1
> +	ln -sf libGL.so.1.2 $(@D)/usr/lib/libGL.so
> +endef
> +
> +# On the target, remove the unused libraries.
> +# Note that this is _required_, else ldconfig may create symlinks
> +# to the wrong library
> +define GPU_VIV_BIN_MX6Q_INSTALL_TARGET_CMDS
> +	$(GPU_VIV_BIN_MX6Q_INSTALL_EXAMPLES)
> +	cp -a $(@D)/usr/lib $(TARGET_DIR)/usr
> +	for lib in EGL GAL VIVANTE; do \
> +		for f in $(TARGET_DIR)/usr/lib/lib$${lib}-*.so; do \
> +			case $$f in \
> +				*-$(GPU_VIV_BIN_MX6Q_LIB_TARGET).so) : ;; \
> +				*) $(RM) $$f ;; \
> +			esac; \
> +		done; \
> +	done

Isn't it either to only copy the relevant libraries instead of copying
everything, and then remove everything that's not useful?

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
