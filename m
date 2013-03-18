From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Mar 2013 17:06:14 +0100
Subject: [Buildroot] [PATCH] zeromq: add C++ bindings
In-Reply-To: <1363618617-2969-1-git-send-email-spdawson@gmail.com>
References: <1363618617-2969-1-git-send-email-spdawson@gmail.com>
Message-ID: <20130318170614.2c9d21f3@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Simon,

On Mon, 18 Mar 2013 14:56:57 +0000, spdawson at gmail.com wrote:

> diff --git a/package/Config.in b/package/Config.in
> index 9853b06..9519852 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -495,6 +495,7 @@ source "package/mediastreamer/Config.in"
>  endmenu
>  
>  menu "Networking"
> +source "package/cppzmq/Config.in"
>  source "package/glib-networking/Config.in"
>  source "package/libcgi/Config.in"
>  source "package/libcgicc/Config.in"
> @@ -535,6 +536,7 @@ source "package/ortp/Config.in"
>  source "package/slirp/Config.in"
>  source "package/usbredir/Config.in"
>  source "package/zeromq/Config.in"
> +source "package/zmqpp/Config.in"
>  endmenu

You should probably submit two separate patches for the two separate
packages.

>  menu "Other"
> diff --git a/package/cppzmq/Config.in b/package/cppzmq/Config.in
> new file mode 100644
> index 0000000..6ec168e
> --- /dev/null
> +++ b/package/cppzmq/Config.in
> @@ -0,0 +1,2 @@
> +config BR2_PACKAGE_CPPZMQ
> +	bool

Why don't you make this a normal package?


> +CPPZMQ_INSTALL_TARGET = NO

Not needed.


> +config BR2_PACKAGE_ZEROMQ_CPP
> +	bool "C++ bindings"
> +	depends on BR2_PACKAGE_ZEROMQ
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	select BR2_PACKAGE_CPPZMQ
> +	select BR2_PACKAGE_ZMQPP
> +	help
> +	  C++ bindings.

I really believe cppzmq and zmqpp should be normal separate packages,
that select the zeromq package. I don't see why we would "invert" the
traditional logic we use for all packages.

> new file mode 100644
> index 0000000..954cf29
> --- /dev/null
> +++ b/package/zmqpp/Config.in
> @@ -0,0 +1,2 @@
> +config BR2_PACKAGE_ZMQPP
> +	bool

Same thing for zmqpp.

> +define ZMQPP_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(ZMQPP_MAKE_ENV) $(MAKE) $(ZMQPP_MAKE_OPT) -C $(@D)
> +endef

I'm surprised, you're not passing CC, CXX and al. ? Not needed?

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
