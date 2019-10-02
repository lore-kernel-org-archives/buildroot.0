From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 2 Oct 2019 09:25:15 +0200
Subject: [Buildroot] [PATCH 4/9] package/libyang: add package
In-Reply-To: <20191001143023.698-4-heiko.thiery@gmail.com>
References: <20191001143023.698-1-heiko.thiery@gmail.com>
 <20191001143023.698-4-heiko.thiery@gmail.com>
Message-ID: <20191002092515.346cc314@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Heiko,

On Tue,  1 Oct 2019 16:30:17 +0200
heiko.thiery at gmail.com wrote:

> diff --git a/package/Config.in b/package/Config.in
> index abea9e2428..04cd466eba 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1640,6 +1640,7 @@ menu "Networking"
>  	source "package/libvncserver/Config.in"
>  	source "package/libwebsock/Config.in"
>  	source "package/libwebsockets/Config.in"
> +	source "package/libyang/Config.in"
>  	source "package/lksctp-tools/Config.in"
>  	source "package/mongoose/Config.in"
>  	source "package/nanomsg/Config.in"
> diff --git a/package/libyang/Config.in b/package/libyang/Config.in
> new file mode 100644
> index 0000000000..cfd2862c15
> --- /dev/null
> +++ b/package/libyang/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_LIBYANG
> +	bool "libyang - YANG data modeling language parser and toolkit"

Should be just:

	bool "libyang"

> +	depends on !BR2_STATIC_LIBS
> +	select BR2_PACKAGE_PCRE

The home page at https://github.com/CESNET/libyang says:

   note, that PCRE is supposed to be compiled with unicode support
   (configure's options --enable-utf and --enable-unicode-properties)

So I think you need:

	select BR2_PACKAGE_PCRE_UTF

Could you make sure it is indeed needed?

> +	help
> +	  Libyang is YANG data modeling language parser and toolkit
> +	  written (and providing API) in C.

Upstream URL of the project.

Also, you need a Config.in comment like this:

comment "libyang needs a toolchain w/ dynamic library"
	depends on BR2_STATIC_LIBS

> diff --git a/package/libyang/libyang.mk b/package/libyang/libyang.mk
> new file mode 100644
> index 0000000000..9005683053
> --- /dev/null
> +++ b/package/libyang/libyang.mk
> @@ -0,0 +1,21 @@
> +################################################################################
> +#
> +# libyang
> +#
> +################################################################################
> +
> +LIBYANG_VERSION = v1.0-r3
> +LIBYANG_SITE = $(call github,CESNET,libyang,$(LIBYANG_VERSION))
> +LIBYANG_LICENSE = BSD-3-Clause
> +LIBYANG_LICENSE_FILES = LICENSE
> +LIBYANG_INSTALL_STAGING = YES
> +LIBYANG_SUPPORTS_IN_SOURCE_BUILD = NO
> +LIBYANG_DEPENDENCIES += pcre

Just =

> +HOST_LIBYANG_DEPENDENCIES += host-pcre

Just =

> +
> +LIBYANG_CONF_OPTS += \

Just =

> +	-DENABLE_VALGRIND_TESTS=OFF \
> +	-DGEN_PYTHON_BINDINGS=OFF

What about passing the same options to the host variant ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
