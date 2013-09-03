From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 03 Sep 2013 08:13:33 +0200
Subject: [Buildroot] [PATCH] Fix build reproducibility in Make 3.82
In-Reply-To: <1377851505-23498-2-git-send-email-jezz@sysmic.org>
References: <1377851505-23498-1-git-send-email-jezz@sysmic.org>
 <1377851505-23498-2-git-send-email-jezz@sysmic.org>
Message-ID: <52257E0D.3000100@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/30/13 10:31, J?r?me Pouiller wrote:
> Make 3.82 do not sort anymore result of wildcards (see
> http://comments.gmane.org/gmane.comp.gnu.make.bugs/4260). This may break
> build reproducibility.
>
> This patch sort results of wildcards to ensure reproducibility.
>
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

  You missed one in support/dependencies/dependencies.mk, but that one 
doesn't make a difference for the build result.

  Also the one of the manual isn't really necessary; it is only used to 
check for rebuilding the manual and doesn't affect the way the manual is 
built.

  But both of these are not really important differences, hence my ack.


  Regards,
  Arnout

> ---
>   Makefile                               |    2 +-
>   boot/common.mk                         |    2 +-
>   docs/manual/manual.mk                  |    2 +-
>   fs/common.mk                           |    2 +-
>   linux/linux.mk                         |    2 +-
>   package/efl/efl.mk                     |    2 +-
>   package/freescale-imx/freescale-imx.mk |    2 +-
>   package/gcc/gcc.mk                     |    2 +-
>   package/gtk2-themes/gtk2-themes.mk     |    2 +-
>   package/matchbox/matchbox.mk           |    2 +-
>   package/opengl/opengl.mk               |    2 +-
>   package/qt5/qt5.mk                     |    2 +-
>   package/x11r7/x11r7.mk                 |    2 +-
>   13 files changed, 13 insertions(+), 13 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 84d160a..5d6315a 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -337,7 +337,7 @@ ifneq ($(PACKAGE_OVERRIDE_FILE),)
>   -include $(PACKAGE_OVERRIDE_FILE)
>   endif
>
> -include package/*/*.mk
> +include $(sort $(wildcard package/*/*.mk))
>
>   include boot/common.mk
>   include linux/linux.mk
> diff --git a/boot/common.mk b/boot/common.mk
> index b315fe8..3021e51 100644
> --- a/boot/common.mk
> +++ b/boot/common.mk
> @@ -1 +1 @@
> -include boot/*/*.mk
> +include $(sort $(wildcard boot/*/*.mk))
> diff --git a/docs/manual/manual.mk b/docs/manual/manual.mk
> index 4906bc8..bcbedad 100644
> --- a/docs/manual/manual.mk
> +++ b/docs/manual/manual.mk
> @@ -53,5 +53,5 @@ $(1)-clean:
>   .PHONY: $(1) $(1)-clean manual-update-lists
>   endef
>
> -MANUAL_SOURCES = $(wildcard docs/manual/*.txt) $(wildcard docs/images/*)
> +MANUAL_SOURCES = $(sort $(wildcard docs/manual/*.txt) $(wildcard docs/images/*))
>   $(eval $(call GENDOC,manual))
> diff --git a/fs/common.mk b/fs/common.mk
> index 36da2dd..4dab7ea 100644
> --- a/fs/common.mk
> +++ b/fs/common.mk
> @@ -94,4 +94,4 @@ define ROOTFS_TARGET
>   $(call ROOTFS_TARGET_INTERNAL,$(1),$(call UPPERCASE,$(1)))
>   endef
>
> -include fs/*/*.mk
> +include $(sort $(wildcard fs/*/*.mk))
> diff --git a/linux/linux.mk b/linux/linux.mk
> index 578d535..b9d7028 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -281,7 +281,7 @@ define LINUX_INSTALL_TARGET_CMDS
>   	$(LINUX_INSTALL_HOST_TOOLS)
>   endef
>
> -include linux/linux-ext-*.mk
> +include $(sort $(wildcard linux/linux-ext-*.mk))
>
>   $(eval $(generic-package))
>
> diff --git a/package/efl/efl.mk b/package/efl/efl.mk
> index f284c93..1de68cf 100644
> --- a/package/efl/efl.mk
> +++ b/package/efl/efl.mk
> @@ -1,3 +1,3 @@
>   EFL_VERSION = 1.7.7
>
> -include package/efl/*/*.mk
> +include $(sort $(wildcard package/efl/*/*.mk))
> diff --git a/package/freescale-imx/freescale-imx.mk b/package/freescale-imx/freescale-imx.mk
> index 9f63ce3..c8f99b6 100644
> --- a/package/freescale-imx/freescale-imx.mk
> +++ b/package/freescale-imx/freescale-imx.mk
> @@ -9,5 +9,5 @@ FREESCALE_IMX_VERSION = 1.1.0
>   # No official download site from freescale, just this mirror
>   FREESCALE_IMX_MIRROR_SITE   = http://download.ossystems.com.br/bsp/freescale/source
>
> -include package/freescale-imx/*/*.mk
> +include $(sort $(wildcard package/freescale-imx/*/*.mk))
>
> diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
> index cd6efed..66af425 100644
> --- a/package/gcc/gcc.mk
> +++ b/package/gcc/gcc.mk
> @@ -215,4 +215,4 @@ HOST_GCC_COMMON_CONF_OPT += \
>   	--with-long-double-128
>   endif
>
> -include package/gcc/*/*.mk
> +include $(sort $(wildcard package/gcc/*/*.mk))
> diff --git a/package/gtk2-themes/gtk2-themes.mk b/package/gtk2-themes/gtk2-themes.mk
> index 6f31c6d..fc66698 100644
> --- a/package/gtk2-themes/gtk2-themes.mk
> +++ b/package/gtk2-themes/gtk2-themes.mk
> @@ -1 +1 @@
> -include package/gtk2-themes/*/*.mk
> +include $(sort $(wildcard package/gtk2-themes/*/*.mk))
> diff --git a/package/matchbox/matchbox.mk b/package/matchbox/matchbox.mk
> index abda915..fff4add 100644
> --- a/package/matchbox/matchbox.mk
> +++ b/package/matchbox/matchbox.mk
> @@ -1,4 +1,4 @@
>   ifeq ($(BR2_PACKAGE_MATCHBOX),y)
> -include package/matchbox/*/*.mk
> +include $(sort $(wildcard package/matchbox/*/*.mk))
>   TARGETS+=matchbox-lib matchbox-wm
>   endif
> diff --git a/package/opengl/opengl.mk b/package/opengl/opengl.mk
> index 68df3b1..abf96d5 100644
> --- a/package/opengl/opengl.mk
> +++ b/package/opengl/opengl.mk
> @@ -1 +1 @@
> -include package/opengl/*/*.mk
> +include $(sort $(wildcard package/opengl/*/*.mk))
> diff --git a/package/qt5/qt5.mk b/package/qt5/qt5.mk
> index 9e71c83..fce0ca3 100644
> --- a/package/qt5/qt5.mk
> +++ b/package/qt5/qt5.mk
> @@ -1,6 +1,6 @@
>   QT5_VERSION = 5.0.2
>   QT5_SITE = http://download.qt-project.org/archive/qt/5.0/$(QT5_VERSION)/submodules/
> -include package/qt5/*/*.mk
> +include $(sort $(wildcard package/qt5/*/*.mk))
>
>   define QT5_LA_PRL_FILES_FIXUP
>   	for i in $$(find $(STAGING_DIR)/usr/lib* -name "libQt5*.la"); do \
> diff --git a/package/x11r7/x11r7.mk b/package/x11r7/x11r7.mk
> index ea0363f..85ecbc5 100644
> --- a/package/x11r7/x11r7.mk
> +++ b/package/x11r7/x11r7.mk
> @@ -1 +1 @@
> -include package/x11r7/*/*.mk
> +include $(sort $(wildcard package/x11r7/*/*.mk))
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
