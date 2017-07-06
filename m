From: Petr Kulhavy <brain@jikos.cz>
Date: Fri, 7 Jul 2017 00:03:40 +0200
Subject: [Buildroot] [PATCH v2 2/2] package/linuxptp: set KBUILD_OUTPUT
	to STAGING_DIR
In-Reply-To: <20170706174336.12294-2-romain.naour@smile.fr>
References: <20170706174336.12294-1-romain.naour@smile.fr>
 <20170706174336.12294-2-romain.naour@smile.fr>
Message-ID: <5f935067-e1fc-f3e5-77e5-805b985ee8cd@jikos.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks Romain, that looks very good.

Petr

On 06/07/17 19:43, Romain Naour wrote:
> incdefs.sh try to define some flags with user_flags() and kernel_flags()
> functions. The later is looking at the kernel headers installed on the host
> when KBUILD_OUTPUT is not set. If no kernel headers are installed on the host,
> the grep fail and HAVE_ONESTEP_SYNC is not set on the command line:
> see: grep: /usr/include/linux/net_tstamp.h: No such file or directory
> So the missing.h define HWTSTAMP_TX_ONESTEP_SYNC which is also present in the
> kernel headers installed in STAGING_DIR (toolchain w/ headers >= 3.2).
>
> Indeed KBUILD_OUTPUT is empty because it's reset in the makefile, so move
> KBUILD_OUTPUT in the enviroment while calling "make"/
>
> Also set KBUILD_OUTPUT to STAGING_DIR to find net_tstamp.h.
>
> While at it, use the same arguments for BUILD_CMD and INSTALL_TARGET_CMD.
>
> Thanks to Yann for the live review during the Buildroot summer camp.
>
> Fixes:
> http://autobuild.buildroot.net/results/364/36470db2c262d2e1fda5144a08cfe221831e093e
>
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> Cc: Petr Kulhavy <brain@jikos.cz>
> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
> v2: rework BUILD_CMD and INSTALL_TARGET_CMD to avoid patching makefile
> ---
>   package/linuxptp/linuxptp.mk | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/package/linuxptp/linuxptp.mk b/package/linuxptp/linuxptp.mk
> index 0fc85b0..d8bcc2b 100644
> --- a/package/linuxptp/linuxptp.mk
> +++ b/package/linuxptp/linuxptp.mk
> @@ -13,8 +13,9 @@ LINUXPTP_LICENSE_FILES = COPYING
>   define LINUXPTP_BUILD_CMDS
>   	$(TARGET_MAKE_ENV) \
>   	CROSS_COMPILE="$(TARGET_CROSS)" \
> +	KBUILD_OUTPUT=$(STAGING_DIR) \
>   	$(MAKE) \
> -		KBUILD_OUTPUT=$(TARGET_DIR) \
> +		prefix=/usr \
>   		EXTRA_CFLAGS="$(TARGET_CFLAGS)" \
>   		EXTRA_LDFLAGS="$(TARGET_LDFLAGS)" \
>   		-C $(@D) all
> @@ -22,10 +23,13 @@ endef
>   
>   define LINUXPTP_INSTALL_TARGET_CMDS
>   	$(TARGET_MAKE_ENV) \
> +	CROSS_COMPILE="$(TARGET_CROSS)" \
> +	KBUILD_OUTPUT=$(STAGING_DIR) \
>   	$(MAKE) \
>   		prefix=/usr \
>   		DESTDIR=$(TARGET_DIR) \
> -		$(TARGET_CONFIGURE_OPTS) \
> +		EXTRA_CFLAGS="$(TARGET_CFLAGS)" \
> +		EXTRA_LDFLAGS="$(TARGET_LDFLAGS)" \
>   		-C $(@D) install
>   
>   	$(INSTALL) -D -m 644 $(LINUXPTP_PKGDIR)/linuxptp.cfg \
