From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 21 Feb 2013 21:17:57 +0100
Subject: [Buildroot] [PATCH 10/13] librtmp: new package
In-Reply-To: <b7845a27b24e15e0657906431ba388d10d725f73.1361458625.git.maxime.hadjinlian@gmail.com>
References: <cover.1361458625.git.maxime.hadjinlian@gmail.com>
 <b7845a27b24e15e0657906431ba388d10d725f73.1361458625.git.maxime.hadjinlian@gmail.com>
Message-ID: <201302212117.57668.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maxime, All,

On Thursday 21 February 2013 Maxime Hadjinlian wrote:
> librtmp - RTMPDump Real-Time Messaging Protocol API
> This package was originally found at : https://github.com/huceke/buildroot-rbp
> By gimli <ebsi4711@gmail.com>

> diff --git a/package/librtmp/Config.in b/package/librtmp/Config.in
> new file mode 100644
> index 0000000..8152f87
> --- /dev/null
> +++ b/package/librtmp/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_LIBRTMP
> +	bool "librtmp"

The package is 'rtmpdump' so I'd just call it 'rtmpdump' in Buildroot as
well (you can add in the help text that only the librtmp is installed).

> +	select BR2_PACKAGE_OPENSSL

rtmpdump can also use gnutls, so I'd rather do:

    select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_POLARSSL && !BR2_PACKAGE_GNUTLS

And adapt the .mk accordingly, of course.

There is no point in forcing openssl if the user already chose to use
another SSL library.

> diff --git a/package/librtmp/librtmp.mk b/package/librtmp/librtmp.mk
> new file mode 100644
> index 0000000..5e60428
> --- /dev/null
> +++ b/package/librtmp/librtmp.mk
> @@ -0,0 +1,27 @@
> +#############################################################
> +#
> +#librtmp
> +#
> +#############################################################
> +
> +LIBRTMP_VERSION = e0056c51cc1710c9a44d2a2c4e2f344fa9cabcf4
> +LIBRTMP_SITE = git://git.ffmpeg.org/rtmpdump
> +LIBRTMP_INSTALL_STAGING = YES
> +LIBRTMP_LICENSE = GPLv2

Since you only install the library, it's LGPLv2.1+.

librtmp/ has its own COPYING file, which is LGPLv2.1, and source files
in librtmp/ all refer to LGPLv2.1 or later. So, GPLv2.1+.

Add a comment in this file that the LICENSE should be updated, should
the program(s) be one day installed.

> +LIBRTMP_LICENSE_FILES = COPYING
> +LIBRTMP_DEPENDENCIES = openssl zlib

And here, I'd do something like:

    LIBRTMP_DEPENDENCIES = openssl zlib
    ifeq ($(BR2_PACKAGE_GNUTLS),y)
    LIBRTMP_DEPENDENCIES += gnutls
    else
    ifeq ($(BR2_PACKAGE_POLARSSL),y)
    LIBRTMP_DEPENDENCIES += polarssl
    else
    LIBRTMP_DEPENDENCIES += openssl
    endif
    endif

> +define LIBRTMP_BUILD_CMDS
> +	sed -ie "s|prefix=/usr/local|prefix=/usr|" $(@D)/librtmp/Makefile

I'd do that as a post-extract (or post-patch) hook instead.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
