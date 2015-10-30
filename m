From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 30 Oct 2015 15:46:42 +0100
Subject: [Buildroot] [PATCH] package/dvblast: fix build issues without
	glibc
In-Reply-To: <1446214116-8750-1-git-send-email-yann.morin.1998@free.fr>
References: <1446214116-8750-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20151030144642.GB3713@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On 2015-10-30 15:08 +0100, Yann E. MORIN spake thusly:
> dvblast wants iconv functions even without locales.
> 
> Fixes:
>     http://autobuild.buildroot.org/results/03f/03fe6dc17d7f36d9b8c7ced402850def95d8feb3/
>     http://autobuild.buildroot.org/results/064/0647b0180ac9a6bf6172742e388df9a9e584d91b/
>     ...
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Julian Scheel <julian@jusst.de>

Forget about that patch, it causes other build failures... :-(

Regards,
Yann E. MORIN.

> ---
>  package/dvblast/Config.in  |  1 +
>  package/dvblast/dvblast.mk | 11 +++++++++--
>  2 files changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/package/dvblast/Config.in b/package/dvblast/Config.in
> index ac8b4ae..f20d919 100644
> --- a/package/dvblast/Config.in
> +++ b/package/dvblast/Config.in
> @@ -2,6 +2,7 @@ config BR2_PACKAGE_DVBLAST
>  	bool "dvblast"
>  	select BR2_PACKAGE_BITSTREAM
>  	select BR2_PACKAGE_LIBEV
> +	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
>  	depends on !BR2_bfin  # libev
>  	help
>  	  DVBlast is a simple and powerful MPEG-2/TS demux and
> diff --git a/package/dvblast/dvblast.mk b/package/dvblast/dvblast.mk
> index 11a2dc8..56e114f 100644
> --- a/package/dvblast/dvblast.mk
> +++ b/package/dvblast/dvblast.mk
> @@ -11,12 +11,19 @@ DVBLAST_LICENSE = GPLv2+, WTFPL
>  DVBLAST_LICENSE_FILES = COPYING COPYING.WTFPL
>  DVBLAST_DEPENDENCIES = bitstream libev
>  
> +DVBLAST_MAKE_ENV = $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS)
> +
> +ifeq ($(BR2_NEEDS_GETTEXT),y)
> +DVBLAST_DEPENDENCIES += gettext
> +DVBLAST_MAKE_ENV += LDLIBS=-liconv
> +endif
> +
>  define DVBLAST_BUILD_CMDS
> -	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
> +	$(DVBLAST_MAKE_ENV) $(MAKE) -C $(@D)
>  endef
>  
>  define DVBLAST_INSTALL_TARGET_CMDS
> -	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) PREFIX=/usr install
> +	$(DVBLAST_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) PREFIX=/usr install
>  endef
>  
>  $(eval $(generic-package))
> -- 
> 1.9.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
