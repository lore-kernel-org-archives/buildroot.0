From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Dec 2019 16:05:26 +0100
Subject: [Buildroot] [PATCH 1/2] package/jimtcl: add host variant
In-Reply-To: <20191222140237.2389908-1-fontaine.fabrice@gmail.com>
References: <20191222140237.2389908-1-fontaine.fabrice@gmail.com>
Message-ID: <20191222150526.GF26395@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2019-12-22 15:02 +0100, Fabrice Fontaine spake thusly:
> host-jimtcl is needed for host-openocd
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, after:

  - reformatting the build commands: spawning a sub-shell is useless,
    and it's better to use '&&' to chain commands. I know you duplicated
    the existing code, but better not to propagate the kinks from days
    past;

  - adding the post-patch hook to update config.{guess,sub}

Thanks.

Regards,
Yann E. MORIN.

> ---
>  package/jimtcl/jimtcl.mk | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/package/jimtcl/jimtcl.mk b/package/jimtcl/jimtcl.mk
> index 643a87d5c4..795f20883c 100644
> --- a/package/jimtcl/jimtcl.mk
> +++ b/package/jimtcl/jimtcl.mk
> @@ -78,4 +78,27 @@ define JIMTCL_INSTALL_TARGET_CMDS
>  	$(JIMTCL_LINK_TCLSH)
>  endef
>  
> +define HOST_JIMTCL_CONFIGURE_CMDS
> +	(cd $(@D); \
> +		$(HOST_CONFIGURE_OPTS) \
> +		CCACHE=none \
> +		./configure --prefix=$(HOST_DIR) \
> +		--shared \
> +	)
> +endef
> +
> +define HOST_JIMTCL_BUILD_CMDS
> +	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)
> +endef
> +
> +define HOST_JIMTCL_INSTALL_CMDS
> +	for i in $(JIMTCL_HEADERS_TO_INSTALL); do \
> +		cp -a $(@D)/$$i $(HOST_DIR)/usr/include/ || exit 1 ; \
> +	done;
> +	$(INSTALL) -m 0755 -D $(@D)/libjim.so.$(JIMTCL_VERSION) \
> +		$(HOST_DIR)/usr/lib/libjim.so.$(JIMTCL_VERSION)
> +	ln -sf libjim.so.$(JIMTCL_VERSION) $(HOST_DIR)/usr/lib/libjim.so
> +endef
> +
>  $(eval $(generic-package))
> +$(eval $(host-generic-package))
> -- 
> 2.24.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
