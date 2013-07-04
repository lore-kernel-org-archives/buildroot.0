From: Carsten Schoenert <c.schoenert@gmail.com>
Date: Thu, 04 Jul 2013 13:38:44 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2013-07-03
In-Reply-To: <20130704063005.AD97652C109@lolut.humanoidz.org>
References: <20130704063005.AD97652C109@lolut.humanoidz.org>
Message-ID: <51D55EC4.70209@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I looked at a build failure on libglib2.

Am 04.07.2013 08:30, schrieb Thomas Petazzoni:
>        arm |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/e9fc40239d13a2fcdc842eced2c39994ac2ca498/

I changed the Config.in file like that because libglib2 needs a thread
implementation.

> diff --git a/package/libglib2/Config.in b/package/libglib2/Config.in
> index 5282885..c36c76a 100644
> --- a/package/libglib2/Config.in
> +++ b/package/libglib2/Config.in
> @@ -5,10 +5,11 @@ config BR2_PACKAGE_LIBGLIB2
>  	select BR2_PACKAGE_LIBFFI
>  	select BR2_PACKAGE_ZLIB
>  	depends on BR2_USE_WCHAR # gettext
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	help
>  	  Low-level core library that forms the basis of GTK+ and GNOME.
>  
>  	  http://www.gtk.org/
>  
> -comment "libglib2 requires a toolchain with WCHAR support"
> -	depends on !BR2_USE_WCHAR
> +comment "libglib2 requires a toolchain with WCHAR and threads support"
> +	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
> --

With that change I can't select the libglib2 package anymore with the
toolchain that is used in this defconfig.

But the config is still trying to build the libglib2 package.
Am I wrong or did I missed somthing?

Regards
Carsten
