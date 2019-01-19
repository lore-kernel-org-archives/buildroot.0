From: Baruch Siach <baruch@tkos.co.il>
Date: Sat, 19 Jan 2019 20:29:31 +0200
Subject: [Buildroot] [PATCH 1/6] intel-gmmlib: new package.
In-Reply-To: <20190118201045.13947-2-lpdev@cordier.org>
References: <20190118201045.13947-1-lpdev@cordier.org>
 <20190118201045.13947-2-lpdev@cordier.org>
Message-ID: <87h8e4o60k.fsf@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Louis-Paul,

On Fri, Jan 18 2019, Louis-Paul Cordier wrote:
> Signed-off-by: Louis-Paul Cordier <lpdev@cordier.org>
> ---
>  package/Config.in                      |  1 +
>  package/intel-gmmlib/Config.in         |  8 ++++++++
>  package/intel-gmmlib/intel-gmmlib.hash |  2 ++
>  package/intel-gmmlib/intel-gmmlib.mk   | 21 +++++++++++++++++++++
>  4 files changed, 32 insertions(+)
>  create mode 100644 package/intel-gmmlib/Config.in
>  create mode 100644 package/intel-gmmlib/intel-gmmlib.hash
>  create mode 100644 package/intel-gmmlib/intel-gmmlib.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 5036421a73..9082ed9956 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1265,6 +1265,7 @@ menu "Graphics"
>  	source "package/harfbuzz/Config.in"
>  	source "package/ijs/Config.in"
>  	source "package/imlib2/Config.in"
> +	source "package/intel-gmmlib/Config.in"
>  	source "package/irrlicht/Config.in"
>  	source "package/jasper/Config.in"
>  	source "package/jpeg/Config.in"
> diff --git a/package/intel-gmmlib/Config.in b/package/intel-gmmlib/Config.in
> new file mode 100644
> index 0000000000..8d9fab7ce3
> --- /dev/null
> +++ b/package/intel-gmmlib/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_INTEL_GMMLIB
> +	bool "intel-gmmlib"
> +	depends on BR2_x86_64
> +	help
> +	  The Intel(R) Graphics Memory Management Library provides
> +	  device specific and buffer management for the Intel(R)
> +	  Graphics Compute Runtime for OpenCL(TM) and the Intel(R)
> +	  Media Driver for VAAPI.
> diff --git a/package/intel-gmmlib/intel-gmmlib.hash b/package/intel-gmmlib/intel-gmmlib.hash
> new file mode 100644
> index 0000000000..7e3b3dfd3f
> --- /dev/null
> +++ b/package/intel-gmmlib/intel-gmmlib.hash
> @@ -0,0 +1,2 @@
> +# Locally computed
> +sha256 e3114d7ddd429f1b9aa43a1b1d0086d881fbf4d90e4a90ab8577c369d2e3a5e1  intel-gmmlib-18.3.0.tar.gz
> diff --git a/package/intel-gmmlib/intel-gmmlib.mk b/package/intel-gmmlib/intel-gmmlib.mk
> new file mode 100644
> index 0000000000..206ea6db86
> --- /dev/null
> +++ b/package/intel-gmmlib/intel-gmmlib.mk
> @@ -0,0 +1,21 @@
> +################################################################################
> +#
> +# intel-gmmlib
> +#
> +################################################################################
> +
> +INTEL_GMMLIB_VERSION = 18.3.0
> +INTEL_GMMLIB_SITE = https://github.com/intel/gmmlib/archive
> +INTEL_GMMLIB_LICENSE = MIT
> +INTEL_GMMLIB_LICENSE_FILES = COPYING
> +
> +INTEL_GMMLIB_INSTALL_STAGING = YES
> +INTEL_GMMLIB_SUPPORTS_IN_SOURCE_BUILD = NO
> +
> +INTEL_GMMLIB_CONF_OPTS += -DRUN_TEST_SUITE=OFF
> +
> +define INTEL_GMMLIB_INSTALL_TARGET_CMDS
> +	cp -a $(STAGING_DIR)/usr/lib/libigdgmm* $(TARGET_DIR)/lib

This is unusual. Can't you use the default install make target like the
staging install? Why do you install in /lib on target when upstream
installs in /usr/lib on staging?

If this is all intended please explain why in a comment.

baruch

> +endef
> +
> +$(eval $(cmake-package))


-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
