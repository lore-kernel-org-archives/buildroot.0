From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 4 Dec 2018 07:54:39 +0200
Subject: [Buildroot] [PATCH v2,
 2/2] lxc: fix build without stack protector
In-Reply-To: <20181203223855.10152-2-fontaine.fabrice@gmail.com>
References: <20181203223855.10152-1-fontaine.fabrice@gmail.com>
 <20181203223855.10152-2-fontaine.fabrice@gmail.com>
Message-ID: <20181204055439.rhfgmyb6w7ijykx6@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabrice,

On Mon, Dec 03, 2018 at 11:38:55PM +0100, Fabrice Fontaine wrote:
> Stack protector has been added in version 3.0.3 by
> https://github.com/lxc/lxc/commit/2268c27754152aa538db2c9e3753d72d19bcd17a
> 
> Disable it through
> ax_cv_check_cflags__Werror__fstack_protector_strong=no
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/0b90e7dca2984652842832a41abad93ac49a9b86
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Thomas Petazzoni):
>  - Drop patch to add a new option, instead use 
>    ax_cv_check_cflags__Werror__fstack_protector_strong=no
> 
>  package/lxc/lxc.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/lxc/lxc.mk b/package/lxc/lxc.mk
> index 48d5b20329..0b7b03bcac 100644
> --- a/package/lxc/lxc.mk
> +++ b/package/lxc/lxc.mk
> @@ -11,6 +11,8 @@ LXC_LICENSE_FILES = COPYING
>  LXC_DEPENDENCIES = host-pkgconf
>  LXC_INSTALL_STAGING = YES
>  
> +LXC_CONF_ENV = ax_cv_check_cflags__Werror__fstack_protector_strong=no

Can't we make this depend on BR2_TOOLCHAIN_HAS_SSP? See the packages ntp or 
sox, for example.

An explicit ssp link compiler test in configure might be even better.

> +
>  LXC_CONF_OPTS = --disable-apparmor --with-distro=buildroot \
>  	--disable-werror \
>  	$(if $(BR2_PACKAGE_BASH),,--disable-bash)

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
