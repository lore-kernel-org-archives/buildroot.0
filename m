From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 26 Sep 2017 21:53:40 +0200
Subject: [Buildroot] [PATCH] package/linux-tools: set PKG_CONFIG for
 tmon builds
In-Reply-To: <20170926190859.4015-1-code@mmayer.net>
References: <20170926190859.4015-1-code@mmayer.net>
Message-ID: <e78d0c4c-468d-a010-536f-975f47bd131a@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Markus,

On 26-09-17 21:08, Markus Mayer wrote:
> From: Markus Mayer <mmayer@broadcom.com>
> 
> We ensure that PKG_CONFIG is set to buildroot's host version of
> pkg-config. This is done by passing TARGET_CONFIGURE_OPTS instead of
> TARGET_MAKE_ENV to make. The former includes
>     PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)"
> while the latter doesn't.

 I was wrong when I asked you on IRC to submit this patch. Since the tmon
Makefile calls pkg-config directly (not PKG_CONFIG), this explanation is simply
not true. So there really is no reason to change anything here.

 Accordingly, I've marked the patch as Rejected in patchwork.

 Sorry for the trouble!

 Regards,
 Arnout

> 
> Signed-off-by: Markus Mayer <mmayer@broadcom.com>
> ---
>  package/linux-tools/linux-tool-tmon.mk.in | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/package/linux-tools/linux-tool-tmon.mk.in b/package/linux-tools/linux-tool-tmon.mk.in
> index 15931c3..b62f547 100644
> --- a/package/linux-tools/linux-tool-tmon.mk.in
> +++ b/package/linux-tools/linux-tool-tmon.mk.in
> @@ -8,8 +8,7 @@ LINUX_TOOLS += tmon
>  
>  TMON_DEPENDENCIES = host-pkgconf ncurses
>  TMON_MAKE_OPTS = $(LINUX_MAKE_FLAGS) \
> -	CC=$(TARGET_CC) \
> -	PKG_CONFIG_PATH=$(STAGING_DIR)/usr/lib/pkgconfig
> +	CC=$(TARGET_CC)
>  
>  ifeq ($(BR2_TOOLCHAIN_HAS_SSP),)
>  define TMON_DISABLE_STACK_PROTECTOR
> @@ -24,13 +23,13 @@ define TMON_BUILD_CMDS
>  		exit 1 ; \
>  	fi
>  	$(TMON_DISABLE_STACK_PROTECTOR)
> -	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools \
> +	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(LINUX_DIR)/tools \
>  		$(TMON_MAKE_OPTS) \
>  		tmon
>  endef
>  
>  define TMON_INSTALL_TARGET_CMDS
> -	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools \
> +	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(LINUX_DIR)/tools \
>  		$(TMON_MAKE_OPTS) \
>  		INSTALL_ROOT=$(TARGET_DIR) \
>  		tmon_install
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
