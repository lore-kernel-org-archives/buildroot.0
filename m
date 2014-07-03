From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 3 Jul 2014 22:26:23 +0200
Subject: [Buildroot] [PATCH] freetype: fix double installation
In-Reply-To: <1404418764-3455-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1404418764-3455-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20140703202623.GA23331@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-07-03 22:19 +0200, Thomas Petazzoni spake thusly:
[--SNIP--]
> The proposed solution to solve this problem is to remove the symbolic
> in a pre-install hook, run the installation, and restore the symbolic
> link.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/freetype/freetype.mk | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
> index a6ae0a0..b267806 100644
> --- a/package/freetype/freetype.mk
> +++ b/package/freetype/freetype.mk
> @@ -70,12 +70,26 @@ define FREETYPE_FIX_CONFIG_FILE_LIBS
>  endef
>  FREETYPE_POST_INSTALL_STAGING_HOOKS += FREETYPE_FIX_CONFIG_FILE_LIBS
>  
> -# Version 2.5.1 reorganized headers out of freetype2/freetype
> -# It's unexpected for some packages so symlink it until it spreads upstream
> +# Version 2.5.1 reorganized headers out of freetype2/freetype It's
> +# unexpected for some packages so symlink it until it spreads
> +# upstream. Note that we also have to remove the symlink prior to the
> +# installation process, because the installation process of freetype
> +# removes usr/include/Freetype2/freetype/config, before installing
> +# something in usr/include/Freetype2/config/ which no longer exists
> +# due to the symbolic link.
> +define FREETYPE_REMOVE_FREETYPE_INCLUDE_SYMLINK
> +	$(RM) -f $(STAGING_DIR)/usr/include/freetype2/freetype
> +endef
> +FREETYPE_PRE_INSTALL_STAGING_HOOKS += FREETYPE_REMOVE_FREETYPE_INCLUDE_SYMLINK
>  define FREETYPE_FIX_FREETYPE_INCLUDE
>  	ln -sf . $(STAGING_DIR)/usr/include/freetype2/freetype
>  endef
>  FREETYPE_POST_INSTALL_STAGING_HOOKS += FREETYPE_FIX_FREETYPE_INCLUDE
> +
> +define HOST_FREETYPE_REMOVE_FREETYPE_INCLUDE_SYMLINK
> +	$(RM) -f $(HOST_DIR)/usr/include/freetype2/freetype
> +endef
> +HOST_FREETYPE_PRE_INSTALL_HOOKS += FREETYPE_REMOVE_FREETYPE_INCLUDE_SYMLINK
>  define HOST_FREETYPE_FIX_FREETYPE_INCLUDE
>  	ln -sf . $(HOST_DIR)/usr/include/freetype2/freetype
>  endef
> -- 
> 2.0.0
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
