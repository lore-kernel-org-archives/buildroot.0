From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 13 Mar 2021 09:04:17 +0100
Subject: [Buildroot] [PATCH 1/8] package/opkg-utils: remove build step
In-Reply-To: <20210312200534.923-2-ryan.barnett@rockwellcollins.com>
References: <20210312200534.923-1-ryan.barnett@rockwellcollins.com>
 <20210312200534.923-2-ryan.barnett@rockwellcollins.com>
Message-ID: <20210313080417.GM2737665@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2021-03-12 14:05 -0600, Ryan Barnett spake thusly:
> opkg-utils is a package that only provides bash and python scripts.
> Upon further inspection of the Makefile for the package, invoking
> `make` is equivalent to `make install`.

That is not really true: 'make' does not install, which 'make isntall'
does; to they are not equivalent.

In fact, 'make' only buiold the manpage, and as you explained in the
following patch, we don't want to build+install it.

So by inverting the order f patches 2 and 1, building the manpage is no
longer ncessary as it is no longer installed.

(if we'd keep your initial order, the build of the manpage would happen
durign installation, which is not nice)

I've added a small comment to explain why we only have an install step.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> The makes the build step
> unnecessary so remove it.
> 
> Signed-off-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>
> ---
>  package/opkg-utils/opkg-utils.mk | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/package/opkg-utils/opkg-utils.mk b/package/opkg-utils/opkg-utils.mk
> index a94a4cd5cd..47fc4c63b4 100644
> --- a/package/opkg-utils/opkg-utils.mk
> +++ b/package/opkg-utils/opkg-utils.mk
> @@ -12,10 +12,6 @@ OPKG_UTILS_LICENSE_FILES = COPYING
>  
>  HOST_OPKG_UTILS_DEPENDENCIES += $(BR2_PYTHON3_HOST_DEPENDENCY)
>  
> -define HOST_OPKG_UTILS_BUILD_CMDS
> -	$(MAKE) -C $(@D) $(HOST_CONFIGURE_OPTS)
> -endef
> -
>  define HOST_OPKG_UTILS_INSTALL_CMDS
>  	$(MAKE) -C $(@D) PREFIX=$(HOST_DIR) install
>  endef
> -- 
> 2.17.1
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
