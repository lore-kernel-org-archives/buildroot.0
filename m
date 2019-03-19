From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 19 Mar 2019 23:03:15 +0100
Subject: [Buildroot] [PATCH v2 2/2] pkg-generic: Cleanup some redundant
 checks
In-Reply-To: <20190317212014.3831-2-nolange79@gmail.com>
References: <20190317212014.3831-1-nolange79@gmail.com>
 <20190317212014.3831-2-nolange79@gmail.com>
Message-ID: <20190319220315.GG2702@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Norbert, All,

On 2019-03-17 22:20 +0100, Norbert Lange spake thusly:
> With the last change, packages will depend
> only on host-{xz,lzip} if the source archives
> have filenames requesting the corresponding compressor.
> 
> This allows using a single guard.

This commit log is an improvement agaisnt the previous one, yet I still
had to think a bit too hard to understand the reason that works.

And I think there is an issue with that. Not today, but that opens up a
case where we can introduce a subtil bug in the future.

If, say, xz changes its distribution archive from .bz2 to .lz, iand lzip
changes theirs from .gz to .xz, then we'd introduce a circular
dependency at the make level, and make silently and arbitrarily drops
one of the dependencies.

However, now that I think about it, that is of not big consequence: in
either case, the build woulld break on the first one we try to extract,
and we would notice quite early and quite easily.

Still, I'd like we think a bit harder about those special cases.

Regards,
Yann E. MORIN.

> Signed-off-by: Norbert Lange <nolange79@gmail.com>
> ---
>  package/pkg-generic.mk | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 89da43d5e5..11f16cab18 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -604,18 +604,15 @@ endif
>  
>  ifeq ($$(filter host-tar host-skeleton host-fakedate,$(1)),)
>  $(2)_EXTRACT_DEPENDENCIES += $$(BR2_TAR_HOST_DEPENDENCY)
> -endif
>  
> -ifeq ($$(filter host-tar host-skeleton host-xz host-lzip host-fakedate,$(1)),)
>  ifneq ($$(filter .xz .lzma,$$(suffix $$($(2)_SOURCE))),)
>  $(2)_EXTRACT_DEPENDENCIES += $$(BR2_XZCAT_HOST_DEPENDENCY)
>  endif
> -endif
>  
> -ifeq ($$(filter host-tar host-skeleton host-xz host-lzip host-fakedate,$(1)),)
>  ifeq ($$(suffix $$($(2)_SOURCE)),.lz)
>  $(2)_EXTRACT_DEPENDENCIES += $$(BR2_LZIP_HOST_DEPENDENCY)
>  endif
> +
>  endif
>  
>  ifeq ($$(BR2_CCACHE),y)
> -- 
> 2.20.1
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
