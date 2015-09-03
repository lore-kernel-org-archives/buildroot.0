From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 3 Sep 2015 18:13:42 +0200
Subject: [Buildroot] [PATCH v3 2/4] package/berkeleydb: add host variant
In-Reply-To: <1441293831-3524-2-git-send-email-james.knight@rockwellcollins.com>
References: <1441293831-3524-1-git-send-email-james.knight@rockwellcollins.com>
 <1441293831-3524-2-git-send-email-james.knight@rockwellcollins.com>
Message-ID: <20150903161342.GC3607@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

James, All,

On 2015-09-03 11:23 -0400, James Knight spake thusly:
> Required by an upcoming host variant of the `rpm` package.
> 
> Signed-off-by: James Knight <james.knight@rockwellcollins.com>
> ---
> Changes v2 -> v3:
>   - None.
> 
> Changes v1 -> v2:
>   - Package change introduced in change set 2.
> ---
>  package/berkeleydb/berkeleydb.mk | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/package/berkeleydb/berkeleydb.mk b/package/berkeleydb/berkeleydb.mk
> index e5c11bd..e9ab760 100644
> --- a/package/berkeleydb/berkeleydb.mk
> +++ b/package/berkeleydb/berkeleydb.mk
> @@ -44,6 +44,26 @@ define BERKELEYDB_CONFIGURE_CMDS
>  	)
>  endef
>  
> +define HOST_BERKELEYDB_CONFIGURE_CMDS
> +	(cd $(@D)/build_unix; rm -rf config.cache; \
> +		$(HOST_CONFIGURE_OPTS) \
> +		$(HOST_CONFIGURE_ARGS) \
> +		../dist/configure $(QUIET) \
> +		--prefix=/usr \

This should be:  --prefix=$(HOST_DIR)/usr

> +		--exec-prefix=/usr \

No execprefix.

> +		--sysconfdir=/etc \

This should be:  --sysconfdir=$(HOST_DIR)/etc

> +		--with-gnu-ld \
> +		--disable-java \
> +		--disable-tcl \
> +		--enable-compat185 \
> +		--enable-cxx \
> +		--enable-o_direct \
> +		--with-pic \
> +	)
> +endef
> +
> +HOST_BERKELEYDB_INSTALL_OPTS += DESTDIR="$(HOST_DIR)" install

And then you do not need DESTDIR.

>  ifneq ($(BR2_PACKAGE_BERKELEYDB_TOOLS),y)
>  
>  define BERKELEYDB_REMOVE_TOOLS
> @@ -61,3 +81,4 @@ endef
>  BERKELEYDB_POST_INSTALL_TARGET_HOOKS += BERKELEYDB_REMOVE_DOCS
>  
>  $(eval $(autotools-package))
> +$(eval $(host-autotools-package))
> -- 
> 1.9.5.msysgit.1
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
