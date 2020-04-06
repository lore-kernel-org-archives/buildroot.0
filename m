From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 6 Apr 2020 22:13:59 +0200
Subject: [Buildroot] [PATCH 1/1] package/libclc: disable ccache
In-Reply-To: <20200406165045.2607140-1-aduskett@gmail.com>
References: <20200406165045.2607140-1-aduskett@gmail.com>
Message-ID: <20200406201359.GS22325@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adam, Romain, All,

On 2020-04-06 09:50 -0700, aduskett at gmail.com spake thusly:
> From: Adam Duskett <Aduskett@gmail.com>
> 
> Configure.py extracts arch, vendor, and os from the passed
> toolchain string on line 180. When using ccache, the passed path string is
> "/usr/lib64/ccache/g++" which breaks the logic, causing the following error:
> 
> Traceback (most recent call last):
>   File "./configure.py", line 180, in <module>
>     (t_arch, t_vendor, t_os) = target.split('-')
> ValueError: not enough values to unpack (expected 3, got 1)
> 
> Use --with-cxx-compiler=$(HOSTCXX_NOCCACHE) instead of $(HOSTCXX) to fix the
> above error.

This is very unfortunate. :-(

But I can see that libclc does have a CMakeList.txt. Can't we make it a
cmake paclage? Presumably, that is supposed to work better than this
hand-crafted atrocity of configure.py... Care to have a look?

In the meantime, I've applied to master, thanks.

Regards,
Yann E. MORIN.

> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
>  package/libclc/libclc.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/libclc/libclc.mk b/package/libclc/libclc.mk
> index 52249a7087..630616905c 100644
> --- a/package/libclc/libclc.mk
> +++ b/package/libclc/libclc.mk
> @@ -25,7 +25,7 @@ LIBCLC_CONF_OPTS = \
>  	--prefix=/usr \
>  	--includedir=/usr/share \
>  	--pkgconfigdir=/usr/lib/pkgconfig \
> -	--with-cxx-compiler=$(HOSTCXX)
> +	--with-cxx-compiler=$(HOSTCXX_NOCCACHE)
>  
>  define LIBCLC_CONFIGURE_CMDS
>  	(cd $(@D); $(TARGET_CONFIGURE_OPTS) ./configure.py $(LIBCLC_CONF_OPTS))
> -- 
> 2.25.1
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
