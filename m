From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 19 Mar 2019 22:50:17 +0100
Subject: [Buildroot] [PATCH v2 1/2] pkg-generic: Depend on host-{xz,
 lzip} only for fitting archives
In-Reply-To: <20190317212014.3831-1-nolange79@gmail.com>
References: <20190317212014.3831-1-nolange79@gmail.com>
Message-ID: <20190319215017.GF2702@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Norbert, All,

On 2019-03-17 22:20 +0100, Norbert Lange spake thusly:
> results in cleaner dependency graphs, and usually omits host-lzip
> from being built.

As for dependency graphs, there will still be a lot of package that may
depend on host-xz, and that would still clutter it a bit more than
necessary (we have much less packages needing host-lzip, 4 exactly).

But that sure is still a nice improvement.

> Signed-off-by: Norbert Lange <nolange79@gmail.com>
> ---
>  package/pkg-generic.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 4353bd3868..89da43d5e5 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -607,12 +607,16 @@ $(2)_EXTRACT_DEPENDENCIES += $$(BR2_TAR_HOST_DEPENDENCY)
>  endif
>  
>  ifeq ($$(filter host-tar host-skeleton host-xz host-lzip host-fakedate,$(1)),)
> +ifneq ($$(filter .xz .lzma,$$(suffix $$($(2)_SOURCE))),)
>  $(2)_EXTRACT_DEPENDENCIES += $$(BR2_XZCAT_HOST_DEPENDENCY)
>  endif
> +endif
>  
>  ifeq ($$(filter host-tar host-skeleton host-xz host-lzip host-fakedate,$(1)),)
> +ifeq ($$(suffix $$($(2)_SOURCE)),.lz)

Please use the same pattern here as for the other one. It helps with
readability and maintainability.

Regards,
Yann E. MORIN.

>  $(2)_EXTRACT_DEPENDENCIES += $$(BR2_LZIP_HOST_DEPENDENCY)
>  endif
> +endif
>  
>  ifeq ($$(BR2_CCACHE),y)
>  ifeq ($$(filter host-tar host-skeleton host-xz host-lzip host-fakedate host-ccache,$(1)),)
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
