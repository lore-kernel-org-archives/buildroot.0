From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 10 Mar 2020 15:01:38 +0100
Subject: [Buildroot] [PATCH] package/pkg-meson.mk: fix multiple
 _MESON_EXTRA_BINARIES
In-Reply-To: <20200310121510.905791-1-john@metanate.com>
References: <20200310121510.905791-1-john@metanate.com>
Message-ID: <20200310150138.2e663d6d@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello John,

On Tue, 10 Mar 2020 12:15:10 +0000, John Keeping <john@metanate.com> wrote:

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

Tested with:

--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -20,6 +20,10 @@ ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
 LIBGLIB2_CFLAGS += -marm
 endif

+LIBGLIB2_MESON_EXTRA_BINARIES = aaa='/usr/bin/aaaaaaaaaaa' \
+       bbb='/usr/bin/bbbbbbbbbbbbbbb' \
+       ccc='/usr/bin/ccccccccccccccc'
+
 HOST_LIBGLIB2_CONF_OPTS = \
        -Ddtrace=false \
        -Dfam=false \


And checking build/libglib2-2.62.4/build/cross-compilation.conf
before and after patching, only with your patch all three binaries
entries are added...

Tested-by: Peter Seiderer <ps.report@gmx.net>

Regards,
Peter
