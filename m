From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Mar 2017 21:34:31 +0100
Subject: [Buildroot] [PATCH 1/3] leptonica: new package
In-Reply-To: <1489517067-3155-2-git-send-email-gilles.talis@gmail.com>
References: <1489517067-3155-1-git-send-email-gilles.talis@gmail.com>
 <1489517067-3155-2-git-send-email-gilles.talis@gmail.com>
Message-ID: <20170314213431.53ef9c38@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 14 Mar 2017 19:44:25 +0100, Gilles Talis wrote:
> Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
> ---
>  package/Config.in                |  1 +
>  package/leptonica/Config.in      |  9 +++++++
>  package/leptonica/leptonica.hash |  2 ++
>  package/leptonica/leptonica.mk   | 57 ++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 69 insertions(+)

The change to the DEVELOPERS file for that specific package should be
in this patch.

I know we asked to do things differently in the past (i.e have the
change to the DEVELOPERS in a separate commit), but we changed our
mind, and now want the DEVELOPERS change with the patch adding the
package.

> diff --git a/package/leptonica/Config.in b/package/leptonica/Config.in
> new file mode 100644
> index 0000000..d485344
> --- /dev/null
> +++ b/package/leptonica/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_LEPTONICA
> +	bool "leptonica"
> +

Unneeded empty line.

There is no toolchain dependency? It builds fine with
uClibc/musl/glibc, noMMU, static libraries only, etc. ?

Could you test this package with support/scripts/test-pkg ?

> diff --git a/package/leptonica/leptonica.mk b/package/leptonica/leptonica.mk
> new file mode 100644
> index 0000000..5f2da79
> --- /dev/null
> +++ b/package/leptonica/leptonica.mk
> @@ -0,0 +1,57 @@
> +################################################################################
> +#
> +# leptonica
> +#
> +################################################################################
> +
> +LEPTONICA_VERSION = 1.74.1
> +LEPTONICA_SITE = http://www.leptonica.org/source
> +LEPTONICA_LICENSE = BSD-2c
> +LEPTONICA_LICENSE_FILES = leptonica-license.txt

OK, license verified, looks good to me.

> +LEPTONICA_INSTALL_STAGING = YES
> +
> +LEPTONICA_CONF_OPTS += --disable-programs
> +
> +ifeq ($(BR2_PACKAGE_GIFLIB),y)
> +LEPTONICA_DEPENDENCIES += giflib

Please explicitly pass:

LEPTONICA_CONF_OPTS += --with-giflib

here, and same for all other options below.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
