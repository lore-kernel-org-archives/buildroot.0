From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 24 May 2021 19:49:47 +0200
Subject: [Buildroot] [PATCH 1/1] package/libgit2: disable NTLM support
 inconditionally.
In-Reply-To: <20210524173310.4568-1-nicolas.cavallari@green-communications.fr>
References: <20210524173310.4568-1-nicolas.cavallari@green-communications.fr>
Message-ID: <20210524174947.GJ3208066@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Nicolas, All,

On 2021-05-24 19:33 +0200, Nicolas Cavallari spake thusly:
> NTLM is an old authentication protocol depending on DES and MD4 and
> its creator, Microsoft, discourage its use since 2010, because it is
> weak and vulnerable to many attacks.
> 
> libgit2 has support for NTLM and it is enabled by default if openssl
> is used, however, since commit a83d41867c8d ("package/libopenssl: add
> option to enable some features"), support for DES and MD4 can be
> disabled in openssl.
> 
> Since openssl is an optional dependency to libgit2 and getting rid of
> NTLM is a goal in itself for many windows administrators, disable NTLM
> by default.

I was not entirely sure that was a good idea, because some setups might
still need it (enterprisy environment can be incredibly resistant to
change)... But the, yes, NTLM is bad, so yes, this is a good idea; if
someone is stuck in the past, they can still send a patch to reenable
NTLM with the appropriate select against DES and MD4.

> Fixes: http://autobuild.buildroot.net/results/efb4ce2174cb6944558e895ce852182ba2738a70
> Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>

Applied to next (after fixing a minor typo in the commit title), thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libgit2/libgit2.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/libgit2/libgit2.mk b/package/libgit2/libgit2.mk
> index e5d17fa3dd..668fa758f8 100644
> --- a/package/libgit2/libgit2.mk
> +++ b/package/libgit2/libgit2.mk
> @@ -17,6 +17,7 @@ LIBGIT2_CONF_OPTS = \
>  	-DUSE_ICONV=ON \
>  	-DREGEX_BACKEND=regcomp \
>  	-DUSE_HTTP_PARSER=system \
> +	-DUSE_NTLMCLIENT=OFF \
>  	-DTHREADSAFE=$(if $(BR2_TOOLCHAIN_HAS_THREADS),ON,OFF)
>  
>  LIBGIT2_DEPENDENCIES = zlib libhttpparser
> -- 
> 2.32.0.rc0
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
