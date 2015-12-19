From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 19 Dec 2015 15:43:15 +0100
Subject: [Buildroot] [PATCH v2 3/3] package/vsxu: new package
In-Reply-To: <1446915053-13783-4-git-send-email-bernd.kuhls@t-online.de>
References: <1446915053-13783-1-git-send-email-bernd.kuhls@t-online.de>
 <1446915053-13783-4-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <56756D03.5020806@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07-11-15 17:50, Bernd Kuhls wrote:
> This package needs cal3d source code which is included upstream as a git
> submodule, something not supported by the git download helper.
> To include cal3d I used a method described by Arnout:
> http://lists.busybox.net/pipermail/buildroot/2013-March/069971.html
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[snip]
> diff --git a/package/vsxu/Config.in b/package/vsxu/Config.in
> new file mode 100644
> index 0000000..8639c0c
> --- /dev/null
> +++ b/package/vsxu/Config.in
> @@ -0,0 +1,20 @@
> +config BR2_PACKAGE_VSXU
> +	bool "vsxu"
> +	depends on BR2_PACKAGE_XORG7
> +	depends on BR2_PACKAGE_HAS_LIBGL

 Since you've added BR2_PACKAGE_CAL3D, you have to select it here. But as I
wrote, the symbol probably shouldn't even be defined.


 Regards,
 Arnout

> +	select BR2_PACKAGE_FREETYPE
> +	select BR2_PACKAGE_JPEG
> +	select BR2_PACKAGE_LIBGLEW
> +	select BR2_PACKAGE_LIBGLFW
> +	select BR2_PACKAGE_LIBGLU
> +	select BR2_PACKAGE_LIBPNG
> +	select BR2_PACKAGE_ZLIB
> +	help
> +	  VSXu (VSX Ultra) is an OpenGL-based (hardware-accelerated),
> +	  modular programming environment with its main purpose to
> +	  visualize music and create real time graphic effects.
> +
> +	  http://www.vsxu.com
> +
> +comment "vsxu depends on X.org and needs an OpenGL backend"
> +	depends on !BR2_PACKAGE_XORG7 || !BR2_PACKAGE_HAS_LIBGL
> diff --git a/package/vsxu/vsxu.mk b/package/vsxu/vsxu.mk
> new file mode 100644
> index 0000000..7dcbf74
> --- /dev/null
> +++ b/package/vsxu/vsxu.mk
> @@ -0,0 +1,31 @@
> +################################################################################
> +#
> +# vsxu
> +#
> +################################################################################
> +
> +# instead of using master branch we use branch glfw3
> +VSXU_VERSION = 4a34b08ec9e51605ca55d1a833f23e9601b2aa88
> +VSXU_SITE = $(call github,vovoid,vsxu,$(VSXU_VERSION))
> +VSXU_LICENSE = GPLv3
> +VSXU_LICENSE_FILES = COPYING
> +VSXU_INSTALL_STAGING = YES
> +VSXU_DEPENDENCIES = cal3d freetype jpeg libgl libglew libglfw libglu \
> +	libpng zlib
> +
> +# cal3d is a git submodule
> +define VSXU_LINK_CAL3D
> +	rm -rf $(@D)/plugins/src/mesh.importers/cal3d/
> +	ln -sf $(CAL3D_DIR) $(@D)/plugins/src/mesh.importers/cal3d
> +endef
> +VSXU_POST_EXTRACT_HOOKS += VSXU_LINK_CAL3D
> +
> +ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
> +VSXU_DEPENDENCIES += alsa-lib
> +endif
> +
> +ifeq ($(BR2_PACKAGE_OPENCV),y)
> +VSXU_DEPENDENCIES += opencv
> +endif
> +
> +$(eval $(cmake-package))
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
