From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 11 Mar 2020 23:31:23 +0100
Subject: [Buildroot] [PATCH] package/pkg-meson.mk: fix multiple
 _MESON_EXTRA_BINARIES
In-Reply-To: <20200310121510.905791-1-john@metanate.com>
References: <20200310121510.905791-1-john@metanate.com>
Message-ID: <20200311223123.GF705@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

John, All,

On 2020-03-10 12:15 +0000, John Keeping spake thusly:
> If multiple entries are specified for _MESON_EXTRA_BINARIES, the current
> sed expression will only replace the first one.
> 
> Specifically, from GNU sed 4.8 the manual says:
> 
>     /regexp/
>         Match  lines matching the regular expression regexp.  Matching
>         is performed on the current pattern space, which can be modified
>         with commands such as ``s///''.
> 
> so after the first binary has been added, the next entry no longer
> matches since the pattern space has been modifed.
> 
> Instead of adding a script for each value, apply the match once and add
> a subsitution for each entry.
> 
> Signed-off-by: John Keeping <john@metanate.com>

Applied to master, but I've made that a single substituion instead.
Thanks!

Regards,
Yann E. MORIN.

> ---
>  package/pkg-meson.mk | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
> index 642b715938..6ac3f79fe9 100644
> --- a/package/pkg-meson.mk
> +++ b/package/pkg-meson.mk
> @@ -76,9 +76,10 @@ define $(2)_CONFIGURE_CMDS
>  	    -e 's%@TARGET_CXXFLAGS@%$$(call make-comma-list,$$($(2)_CXXFLAGS))%g' \
>  	    -e 's%@HOST_DIR@%$$(HOST_DIR)%g' \
>  	    -e 's%@STAGING_DIR@%$$(STAGING_DIR)%g' \
> -	    $$(foreach x,$$($(2)_MESON_EXTRA_BINARIES), \
> -	        -e "/^\[binaries\]$$$$/s:$$$$:\n$$(x):" \
> -	    ) \
> +	    -e "/^\[binaries\]$$$$/ { \
> +		$$(foreach x,$$($(2)_MESON_EXTRA_BINARIES), \
> +	            s:$$$$:\n$$(x): ; \
> +		) }" \
>  	    package/meson/cross-compilation.conf.in \
>  	    > $$($$(PKG)_SRCDIR)/build/cross-compilation.conf
>  	PATH=$$(BR_PATH) $$($$(PKG)_CONF_ENV) $$(MESON) \
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
