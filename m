From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 2 Jan 2014 17:26:49 +0100
Subject: [Buildroot] [PATCH] apitrace: new package
In-Reply-To: <1388678588-57207-1-git-send-email-jezz@sysmic.org>
References: <1388678588-57207-1-git-send-email-jezz@sysmic.org>
Message-ID: <CAHXCMMK9mC7S3iGsXPKdbEbKeDYvsB3+NHB3VLBWMQk6fZbFCw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jerome,

2014/1/2 J?r?me Pouiller <jezz@sysmic.org>

> Trace and replay OpenGL and OpenGL ES APIs calls to/from a file.
>
> http://apitrace.github.io/
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
> ---
>  package/Config.in            |  1 +
>  package/apitrace/Config.in   | 13 +++++++++++++
>  package/apitrace/apitrace.mk | 17 +++++++++++++++++
>  3 files changed, 31 insertions(+)
>  create mode 100644 package/apitrace/Config.in
>  create mode 100644 package/apitrace/apitrace.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 857aa84..d164f3f 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -216,6 +216,7 @@ source "package/weston/Config.in"
>
>  comment "X applications"
>  source "package/alsamixergui/Config.in"
> +source "package/apitrace/Config.in"
>  source "package/docker/Config.in"
>  source "package/feh/Config.in"
>  source "package/freerdp/Config.in"
> diff --git a/package/apitrace/Config.in b/package/apitrace/Config.in
> new file mode 100644
> index 0000000..6f23062
> --- /dev/null
> +++ b/package/apitrace/Config.in
> @@ -0,0 +1,13 @@
> +comment "apitrace needs a toolchain w/ C++"
> +        depends on !BR2_INSTALL_LIBSTDCPP
> +
> +config BR2_PACKAGE_APITRACE
> +       bool "apitrace"
> +        select BR2_INSTALL_LIBSTDCPP
>
You mean 'depends on' here?


> +        select BR2_PACKAGE_XLIB_LIBX11
>
It should depend on xorg.


> +       help
> +         Trace and replay OpenGL and OpenGL ES APIs calls to/from a file.
> You
> +          may install apitrace GUI from your distribution to inspect
> generated
> +          traces.
> +
> +         http://apitrace.github.io/
> diff --git a/package/apitrace/apitrace.mk b/package/apitrace/apitrace.mk
> new file mode 100644
> index 0000000..c31a5b3
> --- /dev/null
> +++ b/package/apitrace/apitrace.mk
> @@ -0,0 +1,17 @@
>
> +################################################################################
> +#
> +# apitrace
> +#
>
> +################################################################################
> +
> +APITRACE_VERSION = c181b7fbf4b1c3912424761fec8ac7124640543a
> +APITRACE_SITE =
> http://github.com/apitrace/apitrace/tarball/$(APITRACE_VERSION)
> +APITRACE_LICENSE = MIT
> +APITRACE_LICENSE_FILES = LICENSE
> +
> +APITRACE_DEPENDENCIES = xlib_libX11 host-python
> +
> +# Gui was never tested, so we prefer to explicitly disable it
> +APITRACE_CONF_OPT += -DENABLE_GUI=false
> +
> +$(eval $(cmake-package))
> --
> 1.8.3.2
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot


Regards,

-- 
Samuel
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140102/6051ca21/attachment.html>
