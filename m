From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 24 Aug 2020 11:14:14 +0300
Subject: [Buildroot] [PATCH 2/2] package/gpsd: add GPSD_PYTHON config
 option
In-Reply-To: <20200824080449.10036-2-olivier.dautricourt@orolia.com>
References: <20200824080449.10036-1-olivier.dautricourt@orolia.com>
 <20200824080449.10036-2-olivier.dautricourt@orolia.com>
Message-ID: <875z98a2ax.fsf@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Olivier,

On Mon, Aug 24 2020, Olivier Dautricourt wrote:

> The scons script will install the gps library in the target python3
> directory, as well as useful tools like ubxtool.
>
> Signed-off-by: Olivier Dautricourt <olivier.dautricourt@orolia.com>
> ---
>  package/gpsd/Config.in | 5 +++++
>  package/gpsd/gpsd.mk   | 7 ++++++-
>  2 files changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/package/gpsd/Config.in b/package/gpsd/Config.in
> index 5dd57c34b8..39054098ba 100644
> --- a/package/gpsd/Config.in
> +++ b/package/gpsd/Config.in
> @@ -229,4 +229,9 @@ config BR2_PACKAGE_GPSD_UBX
>  	help
>  	  uBlox UBX binary support
>  
> +config BR2_PACKAGE_GPSD_PYTHON
> +	bool "Python library"

'depends on BR2_PACKAGE_PYTHON3' maybe?

What is the size impact of the python library? In the likely case it is
orders of magnitude smaller than gpsd itself, you should install it
unconditionally when BR2_PACKAGE_PYTHON3 is enabled.

baruch

> +	help
> +	  gps Python library
> +
>  endif
> diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
> index 62c4c611c3..d2e5d57ca8 100644
> --- a/package/gpsd/gpsd.mk
> +++ b/package/gpsd/gpsd.mk
> @@ -23,7 +23,6 @@ GPSD_SCONS_OPTS = \
>  	prefix=/usr \
>  	sysroot=$(STAGING_DIR) \
>  	strip=no \
> -	python=no \
>  	qt=no \
>  	systemd=$(if $(BR2_INIT_SYSTEMD),yes,no)
>  
> @@ -186,6 +185,12 @@ endif
>  ifeq ($(BR2_PACKAGE_GPSD_MAX_DEV),y)
>  GPSD_SCONS_OPTS += max_devices=$(BR2_PACKAGE_GPSD_MAX_DEV_VALUE)
>  endif
> +ifeq ($(BR2_PACKAGE_GPSD_PYTHON), y)

We don't add space before 'y'.

> +GPSD_SCONS_OPTS += python=yes
> +GPSD_SCONS_OPTS += python_libdir=/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/

Is there build time dependency on python3? If so, you should also add
python3 to GPSD_DEPENDENCIES.

baruch

> +else
> +GPSD_SCONS_OPTS += python=no
> +endif
>  
>  GPSD_SCONS_ENV += \
>  	LDFLAGS="$(GPSD_LDFLAGS)" \

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
