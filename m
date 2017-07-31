From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 31 Jul 2017 21:37:27 +0200
Subject: [Buildroot] [PATCH] package: libglib2: explicitly specify
 host's PYTHON to be used
In-Reply-To: <20170717221308.16711-1-andrew.smirnov@gmail.com>
References: <20170717221308.16711-1-andrew.smirnov@gmail.com>
Message-ID: <20170731213727.01c210fb@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 17 Jul 2017 15:13:08 -0700, Andrey Smirnov wrote:

> +#
> +# We explicitly specify --with-python to point to host's python here
> +# and in LIBGLIB2_CONF_OPTS to make sure that ./configure does not
> +# pick up python from ${HOST_DIR} thus creating a dependency that
> +# would have to be specified in _DEPENDENCIES
> +#
>  HOST_LIBGLIB2_CONF_OPTS = \
>  	--disable-coverage \
>  	--disable-dtrace \
> @@ -98,7 +104,8 @@ HOST_LIBGLIB2_CONF_OPTS = \
>  	--disable-selinux \
>  	--disable-systemtap \
>  	--disable-xattr \
> -	--with-pcre=system
> +	--with-pcre=system \
> +	--with-python=$$(which python)
>  
>  LIBGLIB2_DEPENDENCIES = \
>  	host-pkgconf host-libglib2 host-gettext \
> @@ -114,6 +121,7 @@ HOST_LIBGLIB2_DEPENDENCIES = \
>  
>  LIBGLIB2_CONF_OPTS = \
>  	--with-pcre=system
> +	--with-python=$$(which python)

What is Python being used for in the build process of glib2 ? I'm
concerned by the fact that we're simply passing the path to the host
Python interpreter, even though we're cross-compiling.

It might be correct, if Python is just used to generate some code on
the build machine, but it'd be good to understand.

Also, using `which python` is preferred over $$(which python).

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
