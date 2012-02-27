From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 27 Feb 2012 10:16:19 +0100
Subject: [Buildroot] [PATCH 1/2] vlc: new package
In-Reply-To: <1330256732-26483-1-git-send-email-ismael.luceno@gmail.com>
References: <1330256732-26483-1-git-send-email-ismael.luceno@gmail.com>
Message-ID: <4F4B49E3.8000606@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ismael,
thanks for you patch submission.

Ismael Luceno wrote:
> Signed-off-by: Ismael Luceno<ismael.luceno@gmail.com>
> ---
>   package/multimedia/Config.in                  |    1 +
>   package/multimedia/vlc/Config.in              |   14 ++
>   package/multimedia/vlc/vlc-uclibc-fixes.patch |   20 +++
>   package/multimedia/vlc/vlc.mk                 |  204 +++++++++++++++++++++++++
>   4 files changed, 239 insertions(+), 0 deletions(-)
>   create mode 100644 package/multimedia/vlc/Config.in
>   create mode 100644 package/multimedia/vlc/vlc-uclibc-fixes.patch
>   create mode 100644 package/multimedia/vlc/vlc.mk
>
> diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
> index a05d1d9..fc20d74 100644
> --- a/package/multimedia/Config.in
> +++ b/package/multimedia/Config.in
> @@ -44,6 +44,7 @@ source "package/multimedia/speex/Config.in"
>   source "package/multimedia/tidsp-binaries/Config.in"
>   source "package/multimedia/taglib/Config.in"
>   source "package/multimedia/tremor/Config.in"
> +source "package/multimedia/vlc/Config.in"
>   source "package/multimedia/vorbis-tools/Config.in"
>   source "package/multimedia/wavpack/Config.in"
>   endmenu
> diff --git a/package/multimedia/vlc/Config.in b/package/multimedia/vlc/Config.in
> new file mode 100644
> index 0000000..ee8d942
> --- /dev/null
> +++ b/package/multimedia/vlc/Config.in
> @@ -0,0 +1,14 @@
> +config BR2_PACKAGE_VLC
> +	bool "vlc"
> +	help
> +	  VLC

A help text that's equal to the menu text is useless. You should provide 
a short description
(this is usually taken from the project website).

A link to the project homepage is useful as well, see other packages for 
an example.

> +
> +if BR2_PACKAGE_VLC
> +
> +config BR2_PACKAGE_VLC_VLC
> +	bool "Build and install vlc"
> +	default y
> +	help
> +	  This will install the video player.
> +
> +endif
> diff --git a/package/multimedia/vlc/vlc-uclibc-fixes.patch b/package/multimedia/vlc/vlc-uclibc-fixes.patch
> new file mode 100644
> index 0000000..3ce60b3
> --- /dev/null
> +++ b/package/multimedia/vlc/vlc-uclibc-fixes.patch
> @@ -0,0 +1,20 @@
> +diff -u a/src/posix/linux_specific.c b/src/posix/linux_specific.c
> +--- a/src/posix/linux_specific.c	2012-02-08 16:43:30.000000000 -0200
> ++++ b/src/posix/linux_specific.c	2012-02-09 03:51:20.925504594 -0200

It's better to add a few lines at the beginning of patches to clarify 
why it's needed and
the source (e.g. the URL of a website or mailng list where it came from).

> +@@ -74,14 +74,14 @@
> +     return (path != NULL) ? path : strdup (PKGLIBDIR);
> + }
> +
> +-#ifdef __GLIBC__
> ++#if defined(__GLIBC__)&&  !defined(__UCLIBC__)
> + # include<gnu/libc-version.h>
> + # include<stdlib.h>
> + #endif
> +
> + void system_Init (void)
> + {
> +-#ifdef __GLIBC__
> ++#if defined(__GLIBC__)&&  !defined(__UCLIBC__)
> +     const char *glcv = gnu_get_libc_version ();
> +
> +     /* gettext in glibc 2.5-2.7 is not thread-safe. LibVLC keeps crashing,
> diff --git a/package/multimedia/vlc/vlc.mk b/package/multimedia/vlc/vlc.mk
> new file mode 100644
> index 0000000..413dfd4
> --- /dev/null
> +++ b/package/multimedia/vlc/vlc.mk
> @@ -0,0 +1,204 @@
> +#############################################################
> +#
> +# vlc
> +#
> +#############################################################
> +VLC_VERSION = 500c190
> +# VLC_SOURCE = vlc-$(VLC_VERSION).tar.bz2
> +# VLC_SITE = http://download.videolan.org/pub/videolan/vlc/$(VLC_VERSION)
> +VLC_SITE = git://git.videolan.org/vlc.git

Why using a git checkout when there are officially released tarballs? If 
there's
a reason please add a comment explanining it, otherwise use the tarball.

Also, don't submit files with commented lines: if they are not needed, 
remove them.

Luca
