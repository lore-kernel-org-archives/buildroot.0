From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 23 Dec 2014 13:54:21 +0100
Subject: [Buildroot] [PATCH] package/pcre: install headers in legacy
	location
In-Reply-To: <1418490513-10957-1-git-send-email-yann.morin.1998@free.fr>
References: <1418490513-10957-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20141223125421.GB4152@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On 2014-12-13 18:08 +0100, Yann E. MORIN spake thusly:
> nmap is looking for pcre headers in pcre/pcre.h which our current
> version of pcre does not populates.
> 
> So, just create those as symlinks to the actual headers.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Romain Naour <romain.naour@openwide.fr>

I've marked this patch as "Rejected" in Patchwork, because it is in fact
not needed.

nmap's configure.ac has:

    AC_CHECK_HEADERS(pcre/pcre.h)

which seems to imply it is only checking for pcre/pcre.h but that is not
the case. A little bit above, we can see:

    AC_CHECK_HEADER(pcre.h,
        AC_CHECK_LIB(pcre, pcre_version, [have_pcre=yes ]),
        [AC_CHECK_HEADER(pcre/pcre.h,
          [AC_CHECK_LIB(pcre, pcre_version, [have_pcre=yes])]
        )]
    )

which means it also checks for just pcre.h which we have. But that is
misleading, as only pcre/pcre.h appears in the configure log, as Romain
quoted in his reply.

But then, the code that includes pcre/pcre.h (present in two files) has
this construct:

    #ifdef HAVE_PCRE_PCRE_H
    # include <pcre/pcre.h>
    #else
    # include <pcre.h>
    #endif

HAVE_PCRE_PCRE_H is defined by AC_CHECK_HEADERS(pcre/pcre.h), so if it
does not find pcre/pcre.h, it falls back to including pcre.h.

So, this patch is in fact not needed.

Regards,
Yann E. MORIN.

> ---
>  package/pcre/pcre.mk | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/package/pcre/pcre.mk b/package/pcre/pcre.mk
> index 4ff7abd..f2cf02d 100644
> --- a/package/pcre/pcre.mk
> +++ b/package/pcre/pcre.mk
> @@ -22,5 +22,13 @@ PCRE_CONF_OPTS += $(if $(BR2_PACKAGE_PCRE_32),--enable-pcre32,--disable-pcre32)
>  PCRE_CONF_OPTS += $(if $(BR2_PACKAGE_PCRE_UTF),--enable-utf,--disable-utf)
>  PCRE_CONF_OPTS += $(if $(BR2_PACKAGE_PCRE_UCP),--enable-unicode-properties,--disable-unicode-properties)
>  
> +define PCRE_LEGACY_PATHS
> +	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/include/pcre
> +	for h in $(STAGING_DIR)/usr/include/pcre*.h; do \
> +		ln -sf ../$${h##*/} $(STAGING_DIR)/usr/include/pcre/ || exit 1; \
> +	done
> +endef
> +PCRE_POST_INSTALL_STAGING_HOOKS += PCRE_LEGACY_PATHS
> +
>  $(eval $(autotools-package))
>  $(eval $(host-autotools-package))
> -- 
> 1.9.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
