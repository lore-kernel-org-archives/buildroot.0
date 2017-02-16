From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 16 Feb 2017 23:14:56 +0100
Subject: [Buildroot] [PATCH v2 2/2] qt5base: make harfbuzz support
 selectable
In-Reply-To: <20170213223455.9915-2-ps.report@gmx.net>
References: <20170213223455.9915-1-ps.report@gmx.net>
 <20170213223455.9915-2-ps.report@gmx.net>
Message-ID: <ec4e538c-bd56-a509-7550-fe8d20c401e2@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 13-02-17 23:34, Peter Seiderer wrote:
> If selected use:
> 
>  - system/buildroot harfbuzz in case __sync for 4 bytes is supported
>  - qt harfbuzz otherwise (using QAtomic instead)
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Changes v1 -> v2:
>  - make harfbuzz support selectable, preferre the system provided
>    one, but fall back to qt provided one
> ---
>  package/qt5/qt5base/Config.in  |  9 +++++++++
>  package/qt5/qt5base/qt5base.mk | 14 ++++++++++++++
>  2 files changed, 23 insertions(+)
> 
> diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
> index 337dcf245..27f225026 100644
> --- a/package/qt5/qt5base/Config.in
> +++ b/package/qt5/qt5base/Config.in
> @@ -239,6 +239,15 @@ config BR2_PACKAGE_QT5BASE_FONTCONFIG
>  	  This option enables Fontconfig and Freetype support using
>  	  the system fontconfig and freetype2 libraries.
>  
> +config BR2_PACKAGE_QT5BASE_HARFBUZZ
> +	bool "harfbuzz support"
> +	select BR2_PACKAGE_HARFBUZZ if BR2_TOOLCHAIN_HAS_SYNC_4

 I think we should automatically use system harfbuzz if it is selected, and only
offer this option if system harfbuzz is not available. So here 'depends on
!SYNC_4'...

> +	help
> +	  This option enables HarfBuzz support (either system
> +	  harfbuzz if the toolchain supports __sync for 4 bytes
> +	  or qt provided one which avoids this dependenc by using
> +	  QAtomic).
> +
>  config BR2_PACKAGE_QT5BASE_GIF
>  	bool "GIF support"
>  	help
> diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
> index 3825f5bcc..187388e19 100644
> --- a/package/qt5/qt5base/qt5base.mk
> +++ b/package/qt5/qt5base/qt5base.mk
> @@ -105,6 +105,20 @@ ifeq ($(BR2_PACKAGE_QT5_VERSION_5_6),y)
>  QT5BASE_CONFIGURE_OPTS += -I$(STAGING_DIR)/usr/include/freetype2
>  endif
>  QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_QT5BASE_GUI),freetype)
> +ifeq ($(BR2_PACKAGE_QT5BASE_GUI)$(BR2_PACKAGE_QT5BASE_HARFBUZZ),yy)
> +ifeq ($(BR2_TOOLCHAIN_HAS_SYNC_4),y)
> +# system harfbuzz in case __sync for 4 bytes is supported

 ... and here 'ifeq ($(BR2_PACKAGE_HARFBUZZ),y) ...

> +QT5BASE_CONFIGURE_OPTS += -system-harfbuzz
> +QT5BASE_DEPENDENCIES   += harfbuzz
> +else

 ... and here 'else ifeq ($(BR2_PACKAGE_QT5BASE_HARFBUZZ),y) ...

> +# qt harfbuzz otherwise (using QAtomic instead)
> +QT5BASE_CONFIGURE_OPTS += -qt-harfbuzz
> +QT5BASE_LICENSE := $(QT5BASE_LICENSE), MIT (harfbuzz)
> +QT5BASE_LICENSE_FILES += src/3rdparty/harfbuzz-ng/COPYING
> +endif
> +else
> +QT5BASE_CONFIGURE_OPTS   += -no-harfbuzz
> +endif

 Leave an empty line below and above this conditional block.

 Also, it would be more logical IMHO to put it close to openssl.

 Regards,
 Arnout

>  QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_WIDGETS),-widgets,-no-widgets)
>  QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_LINUXFB),--enable-linuxfb,-no-linuxfb)
>  QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_DIRECTFB),-directfb,-no-directfb)
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
