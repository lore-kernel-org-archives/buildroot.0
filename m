From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 4 Mar 2014 00:09:09 +0100
Subject: [Buildroot] [PATCH v2 1/1] Add new package: biosdevname
In-Reply-To: <0F64ADC7-47A8-4E72-90E7-2F5A9E0F32B8@deadfrog.net>
References: <0F64ADC7-47A8-4E72-90E7-2F5A9E0F32B8@deadfrog.net>
Message-ID: <20140303230909.GB14940@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ryan, All,

Thank you for your submission. Here are a few other comments.

On 2014-02-03 16:37 -0500, Ryan Wilkins spake thusly:
[--SNIP--]
> diff --git a/package/biosdevname/Config.in b/package/biosdevname/Config.in
> new file mode 100644
> index 0000000..17a9aa4
> --- /dev/null
> +++ b/package/biosdevname/Config.in
> @@ -0,0 +1,13 @@
> +config BR2_PACKAGE_BIOSDEVNAME
> +	bool "biosdevname"
> +	depends on (BR2_i386 || BR2_x86_64) && BR2_PACKAGE_UDEV

Two things:
  - we usually separate the dependencies on architectures from the
    dependencies on packages
  - udev is now provided by a virtual package

So, you should do:
    depends on BR2_i386 || BR2_x86_64
    dependson BR2_PACKAGE_HAS_UDEV

> +	select BR2_PACKAGE_PCIUTILS
> +	help
> +	  Biosdevname is a udev helper that looks at various BIOS tables to
> +	  figure out what the actual hardware names are for Ethernet ports
> +	  and renames the ports accordingly.  This has the advantage of
> +	  always referring to the same port regardless of system or
> +	  hardware changes that might otherwise alter the typical ethX
> +	  naming.
> +
> +	  http://linux.dell.com/biosdevname/
> diff --git a/package/biosdevname/biosdevname.mk b/package/biosdevname/biosdevname.mk
> new file mode 100644
> index 0000000..be1c6af
> --- /dev/null
> +++ b/package/biosdevname/biosdevname.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# biosdevname
> +#
> +################################################################################
> +
> +BIOSDEVNAME_VERSION = 0.4.1
> +BIOSDEVNAME_SITE = http://linux.dell.com/biosdevname/biosdevname-$(BIOSDEVNAME_VERSION)

The git repository has version v0.5.0, out 2013-01-18.
THere are also a few fixes in the repository, that were made a few hours
ago, so it might be a better bet to use a git snapshot:

    BIOSDEVNAME_VERSION = c140ce659a204d67e4cc61d2191443123f7dd970
    BIOSDEVNAME_SITE = git://linux.dell.com/biosdevname.git

> +BIOSDEVNAME_LICENSE = GPL
> +BIOSDEVNAME_LICENSE_FILES = COPYING
> +BIOSDEVNAME_INSTALL_TARGET = YES

Not needed, that's the default.

> +BIOSDEVNAME_CONF_OPT = --exec-prefix=/
> +BIOSDEVNAME_DEPENDENCIES = pciutils

Missing dependency on udev:

    BIOSDEVNAME_DEPENDENCIES = pciutils udev

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
