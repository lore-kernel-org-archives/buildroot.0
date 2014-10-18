From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sat, 18 Oct 2014 14:48:42 +0200
Subject: [Buildroot] [PATCH] freetype: Add config option for bzip2
 compressed font support
In-Reply-To: <1413599958-24524-1-git-send-email-maarten@treewalker.org>
References: <1413599958-24524-1-git-send-email-maarten@treewalker.org>
Message-ID: <CAGduivwf9taPGbLdp31oBrmhB+pRtFvZQPzCXA76qBexPP=S=w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Maarten, all

On Sat, Oct 18, 2014 at 4:39 AM, Maarten ter Huurne
<maarten@treewalker.org> wrote:
> If bzip2 is available, it might still be preferable to not include
> support for bzip2 compressed fonts, for example to reduce the number
> of libraries loaded when running a GUI application.
>
> Signed-off-by: Maarten ter Huurne <maarten@treewalker.org>
> ---
>  package/freetype/Config.in   | 9 +++++++++
>  package/freetype/freetype.mk | 2 +-
>  2 files changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/package/freetype/Config.in b/package/freetype/Config.in
> index ded8738..f245b14 100644
> --- a/package/freetype/Config.in
> +++ b/package/freetype/Config.in
> @@ -4,3 +4,12 @@ config BR2_PACKAGE_FREETYPE
>           a free, high-quality and portable font engine.
>
>           http://www.freetype.org/
> +
> +if BR2_PACKAGE_FREETYPE
> +
> +config BR2_PACKAGE_FREETYPE_BZIP2
> +       bool "support bzip2 compressed fonts"
I would have had something like:
bool "Enable compressed fonts"
help
  Enable supports for bzip2 compressed fonts

> +       depends on BR2_PACKAGE_BZIP2
> +       default y
Why would we want this to 'default y' ? It kind of goes against what
you state in the commit log, you don't want to have compressed fonts
by default even if bzip2 is selected, right ?
Also, if the users selects this options, it should select the package bzip2
> +
> +endif
> diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
> index b85d0ec..b2d999f 100644
> --- a/package/freetype/freetype.mk
> +++ b/package/freetype/freetype.mk
> @@ -37,7 +37,7 @@ else
>  FREETYPE_CONF_OPTS += --without-zlib
>  endif
>
> -ifeq ($(BR2_PACKAGE_BZIP2),y)
> +ifeq ($(BR2_PACKAGE_FREETYPE_BZIP2),y)
>  FREETYPE_DEPENDENCIES += bzip2
>  FREETYPE_CONF_OPTS += --with-bzip2
>  else
> --
> 1.8.4.5
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
