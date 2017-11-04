From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Sat, 4 Nov 2017 22:23:16 +0100
Subject: [Buildroot] [PATCH 1/1] zlib-ng: new package
In-Reply-To: <1509690851-23677-1-git-send-email-stefan.froberg@petroprogram.com>
References: <1509690851-23677-1-git-send-email-stefan.froberg@petroprogram.com>
Message-ID: <20171104212316.GA4491@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Stefan,

On Fri, Nov 03, 2017 at 06:34:11AM +0000, Stefan Fr?berg wrote:
> zlib-ng, SIMD optimized zlib
> 
> Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
> ---
>  package/Config.in          |  1 +
>  package/zlib-ng/Config.in  |  8 ++++++++
>  package/zlib-ng/zlib-ng.mk | 15 +++++++++++++++
>  3 files changed, 24 insertions(+)
>  create mode 100644 package/zlib-ng/Config.in
>  create mode 100644 package/zlib-ng/zlib-ng.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index dbfb288..3e2b034 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1003,6 +1003,7 @@ menu "Compression and decompression"
>  	source "package/snappy/Config.in"
>  	source "package/szip/Config.in"
>  	source "package/zlib/Config.in"
> +	source "package/zlib-ng/Config.in"
>  endmenu
>  
>  menu "Crypto"
> diff --git a/package/zlib-ng/Config.in b/package/zlib-ng/Config.in
> new file mode 100644
> index 0000000..06de97c
> --- /dev/null
> +++ b/package/zlib-ng/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_ZLIB_NG
> +	bool "zlib-ng"
> +	help
> +	  zlib replacement with optimizations for
> +	  "next generation" systems.
> +
> +	  https://github.com/Dead2/zlib-ng
> +
> diff --git a/package/zlib-ng/zlib-ng.mk b/package/zlib-ng/zlib-ng.mk
> new file mode 100644
> index 0000000..eaa93cd
> --- /dev/null
> +++ b/package/zlib-ng/zlib-ng.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# zlib-ng
> +#
> +################################################################################
> +
> +ZLIB_NG_SITE = https://github.com/Dead2/zlib-ng.git
> +ZLIB_NG_SOURCE = develop.zip

I guess the intention is to point to
ZLIB_NG_SITE = https://github.com/Dead2/zlib-ng/archive

Otherwise it will try to download
http://github/Dead2/zlib-ng.git/develop.zip
which is incorrect.

However, this will result in a file ./dl/develop.zip, which says nothing
about package or version.

I think it is better to use git:
ZLIB_NG_SITE_METHOD = git

and specify version
ZLIB_NG_VERSION = xxxxx


> +ZLIB_NG_SUBDIR = zlib-ng-develop
> +ZLIB_NG_EXTRACT_CMDS = unzip $(DL_DIR)/$(ZLIB_NG_SOURCE) -d $(ZLIB_NG_DIR)

This is affected by the comment above

> +ZLIB_NG_LICENSE = Zlib
> +ZLIB_NG_LICENSE_FILES = README.md

The license file is LICENSE.md, not README.md.


Best regards
Marcus Folkesson
