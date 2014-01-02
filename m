From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Thu, 02 Jan 2014 23:20:22 +0100
Subject: [Buildroot] [PATCH v2] apitrace: new package
In-Reply-To: <1388698061-32942-1-git-send-email-jezz@sysmic.org>
References: <1388698061-32942-1-git-send-email-jezz@sysmic.org>
Message-ID: <52C5E626.7050903@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi J?r?me,

> Trace and replay OpenGL and OpenGL ES APIs calls to/from a file.
>
> http://apitrace.github.io/
>
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
> ---
> v2:
>   Fix dependencies problems (identified by Samuel)
>
>   package/Config.in            |  1 +
>   package/apitrace/Config.in   | 14 ++++++++++++++
>   package/apitrace/apitrace.mk | 17 +++++++++++++++++
>   3 files changed, 32 insertions(+)
>   create mode 100644 package/apitrace/Config.in
>   create mode 100644 package/apitrace/apitrace.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 1ee60c1..097b487 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -216,6 +216,7 @@ source "package/weston/Config.in"
>   
>   comment "X applications"
>   source "package/alsamixergui/Config.in"
> +source "package/apitrace/Config.in"
>   source "package/docker/Config.in"
>   source "package/feh/Config.in"
>   source "package/freerdp/Config.in"
> diff --git a/package/apitrace/Config.in b/package/apitrace/Config.in
> new file mode 100644
> index 0000000..388b3e9
> --- /dev/null
> +++ b/package/apitrace/Config.in
> @@ -0,0 +1,14 @@
> +comment "apitrace needs a toolchain w/ C++"
> +	depends on !BR2_INSTALL_LIBSTDCPP
> +
> +config BR2_PACKAGE_APITRACE
> +	bool "apitrace"
> +	depends on BR2_PACKAGE_XORG7
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	select BR2_PACKAGE_XLIB_LIBX11
> +	help
> +	  Trace and replay OpenGL and OpenGL ES APIs calls to/from a file. You
> +	  may install apitrace GUI from your distribution to inspect generated
> +	  traces.
> +	
> +	  http://apitrace.github.io/
> diff --git a/package/apitrace/apitrace.mk b/package/apitrace/apitrace.mk
> new file mode 100644
> index 0000000..c31a5b3
> --- /dev/null
> +++ b/package/apitrace/apitrace.mk
> @@ -0,0 +1,17 @@
> +################################################################################
> +#
> +# apitrace
> +#
> +################################################################################
> +
> +APITRACE_VERSION = c181b7fbf4b1c3912424761fec8ac7124640543a
> +APITRACE_SITE = http://github.com/apitrace/apitrace/tarball/$(APITRACE_VERSION)

I think, we should use github download helper
APITRACE_SITE = $(call github,apitrace,apitrace,$(APITRACE_VERSION))

Regards,
Jerzy

> +APITRACE_LICENSE = MIT
> +APITRACE_LICENSE_FILES = LICENSE
> +
> +APITRACE_DEPENDENCIES = xlib_libX11 host-python
> +
> +# Gui was never tested, so we prefer to explicitly disable it
> +APITRACE_CONF_OPT += -DENABLE_GUI=false
> +
> +$(eval $(cmake-package))
