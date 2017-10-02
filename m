From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 2 Oct 2017 19:26:55 +0200
Subject: [Buildroot] [PATCH 2/2] package/matchbox-lib: correctly fix the
	.pc file
In-Reply-To: <73a014e628bcbf58c220a91a54d8637b792186f6.1506851870.git.yann.morin.1998@free.fr>
References: <cover.1506851870.git.yann.morin.1998@free.fr>
 <73a014e628bcbf58c220a91a54d8637b792186f6.1506851870.git.yann.morin.1998@free.fr>
Message-ID: <20171002172655.GF4753@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

Replying to myself here...

On 2017-10-01 11:58 +0200, Yann E. MORIN spake thusly:
> First, the .pc file was so far fixed as a post-configure hook of the
> matchbox-fakekey package, by directly tweaking the installed .pc file in
> staging. That's uterly wrong and bad.
> 
> Second, it was incorreclty tweaking the .pc file when xlib_libXft was
> not enabled, because then only a path to staging was present.
> 
> Third, even when xlib_libXft was enabled, the tweaking was still wrong,
> because unnecessary.
> 
> Fix all that.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/matchbox-fakekey/matchbox-fakekey.mk | 4 ++--
>  package/matchbox-lib/matchbox-lib.mk         | 7 +++++++
>  2 files changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/package/matchbox-fakekey/matchbox-fakekey.mk b/package/matchbox-fakekey/matchbox-fakekey.mk
> index 996206e266..e607c48c15 100644
> --- a/package/matchbox-fakekey/matchbox-fakekey.mk
> +++ b/package/matchbox-fakekey/matchbox-fakekey.mk
> @@ -14,8 +14,8 @@ MATCHBOX_FAKEKEY_DEPENDENCIES = matchbox-lib xlib_libXtst
>  MATCHBOX_FAKEKEY_CONF_OPTS = --enable-expat
>  
>  define MATCHBOX_FAKEKEY_POST_CONFIGURE_FIXES
> -	$(SED) 's:-I[^$$].*/usr/include/freetype2:-I/usr/include/freetype2:' $(STAGING_DIR)/usr/lib/pkgconfig/libmb.pc
> -	$(SED) 's:^SUBDIRS = fakekey src tests.*:SUBDIRS = fakekey src:g' $(MATCHBOX_FAKEKEY_DIR)/Makefile
> +	$(SED) 's:^SUBDIRS = fakekey src tests.*:SUBDIRS = fakekey src:g' \
> +		$(@D)/Makefile
>  endef
>  
>  MATCHBOX_FAKEKEY_POST_CONFIGURE_HOOKS += MATCHBOX_FAKEKEY_POST_CONFIGURE_FIXES
> diff --git a/package/matchbox-lib/matchbox-lib.mk b/package/matchbox-lib/matchbox-lib.mk
> index ee206b6d82..627e1c7417 100644
> --- a/package/matchbox-lib/matchbox-lib.mk
> +++ b/package/matchbox-lib/matchbox-lib.mk
> @@ -55,4 +55,11 @@ else
>  MATCHBOX_LIB_CONF_OPTS += --disable-xft
>  endif
>  
> +define MATCHBOX_LIB_FIX_PC
> +	$(SED) 's:-I$(STAGING_DIR)/:-I/:g' \
> +		-e 's:-I/usr/include\( \|$$\)::g' \
> +		$(STAGING_DIR)/usr/lib/pkgconfig/libmb.pc
> +endef
> +MATCHBOX_LIB_POST_INSTALL_STAGING_HOOKS += MATCHBOX_LIB_FIX_PC

Certainly not. There is already a similar hook at the top of the file.

But it is also incorrect anyway.

Damned.

I'll fix.

Regards,
Yann E. MORIN.

>  $(eval $(autotools-package))
> -- 
> 2.11.0
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
