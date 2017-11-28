From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 28 Nov 2017 14:03:27 +0200
Subject: [Buildroot] [PATCH] mtools: do not link to libbsd
In-Reply-To: <20171128104817.15073-1-casantos@datacom.ind.br>
References: <20171128104817.15073-1-casantos@datacom.ind.br>
Message-ID: <20171128120327.6xkily3oshzluinc@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Carlos,

On Tue, Nov 28, 2017 at 08:48:17AM -0200, Carlos Santos wrote:
> mtools is unneccessarily linked to libbsd if this library is found by
> the configuration script. The same may happen to host-mtools if some
> libbsd-devel package is installed on the host machine. Prevent this by
> forcing configure to ignore the existence o libbsd.
> 
> I stumbled on this when I built host-mtools and removed libbsd-devel to
> upgrade to Fedora 27, due to Bug 1504831*. The previously built
> host/bin/mtools started to fail due to the missing libbsd.x.y.so
> 
> * https://bugzilla.redhat.com/show_bug.cgi?id=1504831

This is a valid reason to remove the host-mtools dependency on libbsd ...

> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
> ---
>  package/mtools/mtools.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/mtools/mtools.mk b/package/mtools/mtools.mk
> index 5db548fad9..1a6218831e 100644
> --- a/package/mtools/mtools.mk
> +++ b/package/mtools/mtools.mk
> @@ -13,9 +13,13 @@ MTOOLS_CONF_OPTS = --without-x
>  # info documentation not needed
>  MTOOLS_CONF_ENV = \
>  	ac_cv_func_setpgrp_void=yes \
> +	ac_cv_lib_bsd_gethostbyname=no \
> +	ac_cv_lib_bsd_main=no \

... but why no add an optional dependency on libbds for the target mtools 
package? In case we build target libbsd anyway, having mtools use libbsd would 
presumably reduce the binary size of mtools somewhat, isn't it?

>  	ac_cv_path_INSTALL_INFO=
>  
>  HOST_MTOOLS_CONF_ENV = \
> +	ac_cv_lib_bsd_gethostbyname=no \
> +	ac_cv_lib_bsd_main=no \
>  	ac_cv_path_INSTALL_INFO=
>  
>  # link with iconv if enabled

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
