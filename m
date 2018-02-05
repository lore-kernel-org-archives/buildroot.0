From: Cam Hutchison <camh@xdna.net>
Date: Tue, 6 Feb 2018 07:10:08 +1100
Subject: [Buildroot] [PATCH 1/1] package/ncurses: Add option to install
 extra terminfo files.
In-Reply-To: <20171016011351.15816-1-camh@xdna.net>
References: <20171016011351.15816-1-camh@xdna.net>
Message-ID: <CABa6e=rWY7wEvwVa97v_pe8pZCJAdP5wJzmCySjFfbWkqvNWVQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16 October 2017 at 12:13, Cam Hutchison <camh@xdna.net> wrote:
> Add an option to ncurses to install extra user-configured terminfo
> files. By default, only a small number of vital terminfo files are
> installed on the target. This allows a build to specify the terminfo
> files it needs.

I really only needed this patch for the "tmux" terminfo file. Would it be
more palatable to just add t/tmux to the list of terminfo files to install?
I felt that would be a bit selfish (add a solution that works for me, but
not any other terminfo files), but it would be nice to get this in for
the next release.

Let me know if there's a chance to get this in the next release - if not,
I'll just keep carrying a local patch.

One comment below...


>
> Signed-off-by: Cam Hutchison <camh@xdna.net>
> ---
>  package/ncurses/Config.in  | 10 ++++++++++
>  package/ncurses/ncurses.mk |  3 ++-
>  2 files changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/package/ncurses/Config.in b/package/ncurses/Config.in
> index 92be16435a..cabec4793e 100644
> --- a/package/ncurses/Config.in
> +++ b/package/ncurses/Config.in
> @@ -23,4 +23,14 @@ config BR2_PACKAGE_NCURSES_TARGET_PROGS
>         help
>           Include ncurses programs in target (clear, reset, tput, ...)
>
> +config BR2_PACKAGE_NCURSES_ADDITIONAL_TERMINFO
> +       string "additional terminfo files to install"
> +       help
> +         Whitespace separated list of terminfo files to install on the
> +         target. A small number of vital terminfo files are always
> +         installed. This list is in addition to the vital ones.
> +
> +         The terminfo filenames should have the single letter path
> +         prefix. e.g. t/tmux.
> +
>  endif
> diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
> index 94c8c9ade3..9ab81f2421 100644
> --- a/package/ncurses/ncurses.mk
> +++ b/package/ncurses/ncurses.mk
> @@ -60,7 +60,8 @@ NCURSES_TERMINFO_FILES = \
>         v/vt220 \
>         x/xterm \
>         x/xterm-color \
> -       x/xterm-xfree86
> +       x/xterm-xfree86 \
> +       $(BR2_PACKAGE_NCURSES_ADDITIONAL_TERMINFO)

Does this need a $(call qstrip,...) around it? All kconfig strings do, right?

>
>  ifeq ($(BR2_PACKAGE_NCURSES_WCHAR),y)
>  NCURSES_CONF_OPTS += --enable-widec
> --
> 2.11.0
>
