From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 30 Nov 2020 21:50:45 +0100
Subject: [Buildroot] [PATCH v2, 1/1] package/libcap: new fix to libcap.pc
In-Reply-To: <20201130064833.12007-1-fontaine.fabrice@gmail.com>
References: <20201130064833.12007-1-fontaine.fabrice@gmail.com>
Message-ID: <20201130215045.02af16ea@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Mon, 30 Nov 2020 07:48:33 +0100, Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> As spotted by Peter Seiderer, prefix must be passed to
> {HOST_LIBCAP,LIBCAP}_BUILD_CMDS so libdir in libcap.pc is set to
> /usr/lib instead of /lib
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2:
>  - Also fi host libcap
>
>  package/libcap/libcap.mk | 21 +++++++++++++--------
>  1 file changed, 13 insertions(+), 8 deletions(-)
>
> diff --git a/package/libcap/libcap.mk b/package/libcap/libcap.mk
> index a4a9170193..7bb8f57671 100644
> --- a/package/libcap/libcap.mk
> +++ b/package/libcap/libcap.mk
> @@ -20,6 +20,7 @@ LIBCAP_MAKE_FLAGS = \
>  	BUILD_CC="$(HOSTCC)" \
>  	BUILD_CFLAGS="$(HOST_CFLAGS)" \
>  	lib=lib \
> +	prefix=/usr \
>  	SHARED=$(if $(BR2_STATIC_LIBS),,yes) \
>  	PTHREADS=$(if $(BR2_TOOLCHAIN_HAS_THREADS),yes,)
>
> @@ -39,27 +40,31 @@ endef
>  define LIBCAP_INSTALL_STAGING_CMDS
>  	$(foreach d,$(LIBCAP_MAKE_DIRS), \
>  		$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/$(d) $(LIBCAP_MAKE_FLAGS) \
> -			DESTDIR=$(STAGING_DIR) prefix=/usr install
> +			DESTDIR=$(STAGING_DIR) install
>  	)
>  endef
>
>  define LIBCAP_INSTALL_TARGET_CMDS
>  	$(foreach d,$(LIBCAP_MAKE_DIRS), \
>  		$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/$(d) $(LIBCAP_MAKE_FLAGS) \
> -			DESTDIR=$(TARGET_DIR) prefix=/usr install
> +			DESTDIR=$(TARGET_DIR) install
>  	)
>  endef
>
> +HOST_LIBCAP_MAKE_FLAGS = \
> +	DYNAMIC=yes \
> +	GOLANG=no \
> +	lib=lib \
> +	prefix=$(HOST_DIR) \
> +	RAISE_SETFCAP=no
> +
>  define HOST_LIBCAP_BUILD_CMDS
> -	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D)\
> -		DYNAMIC=yes \
> -		RAISE_SETFCAP=no GOLANG=no lib=lib
> +	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
> +		$(HOST_LIBCAP_MAKE_FLAGS)
>  endef
>
>  define HOST_LIBCAP_INSTALL_CMDS
> -	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) prefix=$(HOST_DIR) \
> -		DYNAMIC=yes \
> -		RAISE_SETFCAP=no GOLANG=no lib=lib install
> +	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) $(HOST_LIBCAP_MAKE_FLAGS) install
>  endef
>
>  $(eval $(generic-package))

Seems to produce correct results, could you squash this one with your first
commit (which did not hit the buildroot git besides the commit email from
Peter Korsgaard)?

With this you can add my:

Reviewed-by: Peter Seiderer <ps.report@gmx.net>

Regards,
Peter
