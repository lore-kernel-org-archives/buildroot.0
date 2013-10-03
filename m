From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 3 Oct 2013 09:42:14 +0200
Subject: [Buildroot] [PATCH] make clean: improve when no .config present
In-Reply-To: <87fvsjpfsx.fsf@dell.be.48ers.dk>
References: <dc1ad257f9e5b8d5b999.1380744400@argentina>
 <87fvsjpfsx.fsf@dell.be.48ers.dk>
Message-ID: <CAAXf6LVAgr0SoAFr9BSr3esGcJFHZfeqpmtfm-Z-jaXYdc3XUg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Wed, Oct 2, 2013 at 10:40 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:
>
>  Thomas> The 'make clean' recipe is using variables that are not defined
>  Thomas> without .config file, causing only a partial cleanup when the
>  Thomas> .config file is accidentally deleted.
>
>  Thomas> This patch moves those variables that do not depend on values
>  Thomas> from .config outside the BR2_HAVE_DOT_CONFIG check, so that
>  Thomas> 'make clean' is much more similar with and without .config.
>
>  Thomas> Since HOST_DIR is determined from BR2_HOST_DIR in .config, the
>  Thomas> host directory cannot be cleaned correctly without making
>  Thomas> assumptions, if no .config is present. However, to cover most
>  Thomas> people's use cases, we assume the default value of
>  Thomas> $(BASE_DIR)/host in this specific case.
>
> Nit: please wrap the commit text so it fits within 80 chars when
> displayed through git log (which indents by 4 spaces).

Thanks for mentioning, I will take this into account next time.

>
>  Thomas> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>
>  Thomas> ---
>  Thomas> v2: implement initial HOST_DIR value (and move everything to before .config is
>  Thomas>     included.
>
>  Thomas>  Makefile |  48 ++++++++++++++++++++++++------------------------
>  Thomas>  1 files changed, 24 insertions(+), 24 deletions(-)
>
>  Thomas> diff --git a/Makefile b/Makefile
>  Thomas> --- a/Makefile
>  Thomas> +++ b/Makefile
>  Thomas> @@ -91,6 +91,30 @@ EXTRAMAKEARGS = O=$(O)
>  Thomas>  NEED_WRAPPER=y
>  Thomas>  endif
>
>  Thomas> +# bash prints the name of the directory on 'cd <dir>' if CDPATH is
>  Thomas> +# set, so unset it here to not cause problems. Notice that the export
>  Thomas> +# line doesn't affect the environment of $(shell ..) calls, so
>  Thomas> +# explictly throw away any output from 'cd' here.
>  Thomas> +export CDPATH:=
>  Thomas> +BASE_DIR := $(shell mkdir -p $(O) && cd $(O) >/dev/null && pwd)
>  Thomas> +$(if $(BASE_DIR),, $(error output directory "$(O)" does not exist))
>
> Hmm, this means that we always create ./output, even when you run
> E.G. 'make help, make print-version or make <blah>'.
>
> I guess it isn't a big problem, and I don't see a solution for it right
> away, but it doesn't seem "nice".

It's probably possible to determine BASE_DIR initially without
creating the directory:
- if O starts with a slash, it's an absolute path, and we can do
'BASE_DIR := $(O)'
- otherwise, BASE_DIR := $(TOPDIR)/$(O) . If needed we can strip ../
to make it cleaner, but that's not really mandatory.

>
> Committed, thanks.

Thanks,
Thomas
