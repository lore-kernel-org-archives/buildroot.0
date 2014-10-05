From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 5 Oct 2014 16:48:05 +0200
Subject: [Buildroot] [PATCH 2/8] package/apr: Fix detection of rlimit
 and large file support
In-Reply-To: <1412516718-12597-2-git-send-email-bernd.kuhls@t-online.de>
References: <1412516718-12597-1-git-send-email-bernd.kuhls@t-online.de>
 <1412516718-12597-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20141005144805.GI4220@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2014-10-05 15:45 +0200, Bernd Kuhls spake thusly:
> Snippets from configure log:
> 
> before:
> checking whether to enable -D_LARGEFILE64_SOURCE... no
> ...
> checking struct rlimit... no
> 
> after
> checking whether to enable -D_LARGEFILE64_SOURCE... (cached) yes
> ...
> checking struct rlimit... (cached) yes

Is that a failure introduced with the bump to 1.5.1?

If so, this should be done in the same patch as the bump.
If not, and it was already present with 1.4.8, it should be done before
the bump.

Regards,
Yann E. MORIN.

> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/apr/apr.mk |    6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/package/apr/apr.mk b/package/apr/apr.mk
> index bdf4c78..82b1ad2 100644
> --- a/package/apr/apr.mk
> +++ b/package/apr/apr.mk
> @@ -19,6 +19,7 @@ APR_CONF_ENV = \
>  	apr_cv_mutex_robust_shared=no \
>  	apr_cv_tcp_nodelay_with_cork=yes \
>  	ac_cv_sizeof_struct_iovec=8 \
> +	ac_cv_struct_rlimit=yes \
>  	apr_cv_mutex_recursive=yes
>  APR_CONFIG_SCRIPTS = apr-1-config
>  
> @@ -27,6 +28,11 @@ ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
>  APR_CONF_ENV += apr_cv_pthreads_lib="-lpthread"
>  endif
>  
> +# Fix lfs detection when cross compiling
> +ifeq ($(BR2_LARGEFILE),y)
> +APR_CONF_ENV += apr_cv_use_lfs64=yes
> +endif
> +
>  define APR_CLEANUP_UNNEEDED_FILES
>  	$(RM) -rf $(TARGET_DIR)/usr/build-1/
>  endef
> -- 
> 1.7.10.4
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
