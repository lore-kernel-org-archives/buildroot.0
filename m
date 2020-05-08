From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Fri, 8 May 2020 09:59:29 -0400
Subject: [Buildroot] [PATCH] release: don't include temp files
In-Reply-To: <20200508083220.18927-1-yann.morin.1998@free.fr>
References: <20200508083220.18927-1-yann.morin.1998@free.fr>
Message-ID: <CANxTyt633VUb9bREaU8mq6wPwxXtMA2CkZwtkNufzH75fCK5gA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Fri, May 8, 2020 at 4:32 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> When we prepare the release, we generate the manual in various formats,
> so that it can be consulted locally without needing the miriads of tools
> needed to generate it.
>
> However, this creates the temporary .br2-external.* files in the output
> directory, and those end up in the release tarball.
>
> This is not a problem in practice, but is not clean.
>
> Run 'distclean' in the output directory, to get rid of everything but
> the generated documentation.
>
> Reported-by: Danomi Manchego <danomimanchego123@gmail.com>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index 3aa4ba4532..2da34b5305 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1190,7 +1190,7 @@ release: OUT = buildroot-$(BR2_VERSION)
>  release:
>         git archive --format=tar --prefix=$(OUT)/ HEAD > $(OUT).tar
>         $(MAKE) O=$(OUT) manual-html manual-text manual-pdf
> -       $(MAKE) O=$(OUT) clean
> +       $(MAKE) O=$(OUT) distclean

I downloaded the latest rc1, just to do "make distclean", see the
files disappear, and add my Tested-by - but I found that the files
were not deleted.  The distclean target does this:

    rm -rf $(TOPDIR)/dl $(BR2_CONFIG) $(CONFIG_DIR)/.config.old
$(CONFIG_DIR)/..config.tmp \
        $(CONFIG_DIR)/.auto.deps $(BASE_DIR)/.br2-external.*

And BASE_DIR is set to $(CANONICAL_O) - but the .br2-external.* are
*not* in the output directory, they are the buildroot directory
itself.  Maybe it should delete $(CONFIG_DIR)/.br2-external.* instead
(or also)?

Danomi -



>         tar rf $(OUT).tar $(OUT)
>         gzip -9 -c < $(OUT).tar > $(OUT).tar.gz
>         bzip2 -9 -c < $(OUT).tar > $(OUT).tar.bz2
> --
> 2.20.1
>
