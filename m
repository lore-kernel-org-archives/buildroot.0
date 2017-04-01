From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Apr 2017 23:15:23 +0200
Subject: [Buildroot] [PATCH 2/4] cracklib: New package
In-Reply-To: <20170209134558.3723-2-stefan.sorensen@spectralink.com>
References: <20170209134558.3723-1-stefan.sorensen@spectralink.com>
 <20170209134558.3723-2-stefan.sorensen@spectralink.com>
Message-ID: <20170401231523.70524b90@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for your patch. It is almost ready for merging, but there are
a few issues, most notably an issue when the full dict is used. See
below for all comments.

On Thu,  9 Feb 2017 14:45:56 +0100, Stefan S?rensen wrote:
> Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>
> ---
>  package/Config.in              |  1 +
>  package/cracklib/Config.in     | 28 ++++++++++++++++++++++++++++
>  package/cracklib/cracklib.hash |  3 +++
>  package/cracklib/cracklib.mk   | 39 +++++++++++++++++++++++++++++++++++++++

Our policy has changed: the update to the DEVELOPERS file should now be
in the same patch as the one adding the package. Could you fix that in
your next version?

> diff --git a/package/cracklib/cracklib.mk b/package/cracklib/cracklib.mk
> new file mode 100644
> index 0000000..c8e7fd5
> --- /dev/null
> +++ b/package/cracklib/cracklib.mk
> @@ -0,0 +1,39 @@
> +################################################################################
> +#
> +# cracklib
> +#
> +################################################################################
> +
> +CRACKLIB_VERSION = 2.9.6
> +CRACKLIB_SITE = https://github.com/cracklib/cracklib/releases/download/cracklib-$(CRACKLIB_VERSION)
> +CRACKLIB_LICENSE = LGPLv2+

This doesn't seem correct to me:

 - We've switched to SPDX license codes since today, so it should be
   LGPL-2.0 or LGPL-2.1

 - The license is not LGPLv2, but LGPLv2.1, so the license code to use
   is LGPL-2.1.

 - I don't see any indication of the "or later" that justifies the "+",
   so I guess CRACKLIB_LICENSE = LGPL-2.1 is the correct thing here.

> +CRACKLIB_LICENSE_FILES = COPYING.LIB README-LICENSE

I believe README-LICENSE is very historical and just give details on
how the migration to LGPL licensing was done. Now that this relicensing
is done (since 2008), I don't think adding this file to the licensing
information adds much value.

> +CRACKLIB_INSTALL_STAGING = YES
> +CRACKLIB_DEPENDENCIES = host-cracklib
> +ifeq ($(BR2_PACKAGE_CRACKLIB_FULL_DICT),y)
> +CRACKLIB_EXTRA_DOWNLOADS = cracklib-words-$(CRACKLIB_VERSION).gz
> +endif

Unfortunately, this full dict thing doesn't work, at install time, I see:

cracklib-format /home/thomas/dl/cracklib-words-2.9.6.gz | cracklib-packer /home/thomas/projets/buildroot/output/target/usr/share/cracklib/pw_dict
skipping line: 1
4 3

and the generated files on the target are really, really small:

-rw-r--r-- 1 thomas thomas 1024 avril  1 23:04 output/target/usr/share/cracklib/pw_dict.hwm
-rw-r--r-- 1 thomas thomas   50 avril  1 23:04 output/target/usr/share/cracklib/pw_dict.pwd
-rw-r--r-- 1 thomas thomas   16 avril  1 23:04 output/target/usr/share/cracklib/pw_dict.pwi

Could you have a look into this, and submit an updated version that
fixes this issue?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
