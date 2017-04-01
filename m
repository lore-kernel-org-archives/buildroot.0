From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Apr 2017 23:21:00 +0200
Subject: [Buildroot] [PATCH 3/4] libpwquality: New package
In-Reply-To: <20170209134558.3723-3-stefan.sorensen@spectralink.com>
References: <20170209134558.3723-1-stefan.sorensen@spectralink.com>
 <20170209134558.3723-3-stefan.sorensen@spectralink.com>
Message-ID: <20170401232100.29b43d79@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Stefan,

On Thu,  9 Feb 2017 14:45:57 +0100, Stefan S?rensen wrote:
> Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>

Thanks for this patch. A few comments below.

>  package/Config.in                                  |  1 +
>  ...ith-disable-nls-on-platforms-without-libi.patch | 42 ++++++++++++++++++++++
>  ...leak-in-settings-when-using-bad-word-list.patch | 23 ++++++++++++
>  package/libpwquality/Config.in                     | 18 ++++++++++
>  package/libpwquality/libpwquality.hash             |  2 ++
>  package/libpwquality/libpwquality.mk               | 24 +++++++++++++

As said on the cracklib review, we now want the update to the
DEVELOPERS file to be done as part of the patch adding the package. I
normally fix this up when applying, but I have other comments below.

> diff --git a/package/libpwquality/0001-Fix-build-with-disable-nls-on-platforms-without-libi.patch b/package/libpwquality/0001-Fix-build-with-disable-nls-on-platforms-without-libi.patch
> new file mode 100644
> index 0000000..2ce79b9
> --- /dev/null
> +++ b/package/libpwquality/0001-Fix-build-with-disable-nls-on-platforms-without-libi.patch
> @@ -0,0 +1,42 @@
> +Status: Upstream
> +
> +Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>

Such information should go at the end of the patch description, ...

> +
> +# HG changeset patch
> +# User Stefan S?rensen <stefan.sorensen@spectralink.com>
> +# Date 1486030609 -3600
> +#      Thu Feb 02 11:16:49 2017 +0100
> +# Node ID 3a716ca2bbf90cde4d86ef3c4597884d6a416525
> +# Parent  79ca3b91513faf3bd03464808d107b71ba5d6c3b
> +Fix build with --disable-nls on platforms without libintl included in libc.

... here.

Also, both of your patches have been submitted upstream. Has upstream
released a new version with your fixes?



> diff --git a/package/libpwquality/0002-Fix-memory-leak-in-settings-when-using-bad-word-list.patch b/package/libpwquality/0002-Fix-memory-leak-in-settings-when-using-bad-word-list.patch
> new file mode 100644
> index 0000000..fe7b9e8
> --- /dev/null
> +++ b/package/libpwquality/0002-Fix-memory-leak-in-settings-when-using-bad-word-list.patch
> @@ -0,0 +1,23 @@
> +Status: Upstream
> +
> +Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>

Ditto formatting of the patch.

> diff --git a/package/libpwquality/Config.in b/package/libpwquality/Config.in
> new file mode 100644
> index 0000000..da295f0
> --- /dev/null
> +++ b/package/libpwquality/Config.in
> @@ -0,0 +1,18 @@
> +config BR2_PACKAGE_LIBPWQUALITY
> +	bool "libpwquality"
> +	help
> +	  This is a library for password quality checks and generation
> +	  of random passwords that pass the checks.  This library uses
> +	  the cracklib and cracklib dictionaries to perform some of
> +	  the checks.
> +
> +	  https://fedorahosted.org/libpwquality/

fedorahosted.org is dead, so it is no longer possible to use this as an
upstream/download location. Has the project moved elsewhere?

> +if BR2_PACKAGE_LIBPWQUALITY
> +
> +config BR2_PACKAGE_LIBPWQUALITY_TOOLS
> +	bool "install tools"
> +	help
> +	  Install libpwquality command line tools generating/checking passwords.

Line too long.

> +LIBPWQUALITY_VERSION = 1.3.0
> +LIBPWQUALITY_SOURCE = libpwquality-$(LIBPWQUALITY_VERSION).tar.bz2
> +LIBPWQUALITY_SITE = https://fedorahosted.org/releases/l/i/libpwquality

As said above, this site is dead.

> +LIBPWQUALITY_LICENSE = BSD or LGPLv2+

BSD is not precise enough. Which BSD variant?

LGPLv2+ should now be LGPL-2.0+ or LGPL-2.1+, as we use SPDX license
codes.

No LIBPWQUALITY_LICENSE_FILES ?

> +LIBPWQUALITY_INSTALL_STAGING = YES
> +LIBPWQUALITY_DEPENDENCIES = cracklib
> +LIBPWQUALITY_AUTORECONF = YES

Why is an autoreconf needed?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
