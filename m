From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 21 Mar 2018 08:53:32 +0200
Subject: [Buildroot] [V2 2/2] dropbear: unbundle libtomath & libtomcrypt
In-Reply-To: <20180320195649.5309-2-francois.perrad@gadz.org>
References: <20180320195649.5309-1-francois.perrad@gadz.org>
 <20180320195649.5309-2-francois.perrad@gadz.org>
Message-ID: <20180321065332.en6xpk2bh5czeqhf@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Francois,

On Tue, Mar 20, 2018 at 08:56:49PM +0100, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/dropbear/Config.in   | 1 +
>  package/dropbear/dropbear.mk | 2 ++
>  2 files changed, 3 insertions(+)
> 
> diff --git a/package/dropbear/Config.in b/package/dropbear/Config.in
> index 670077816..3fa8473e4 100644
> --- a/package/dropbear/Config.in
> +++ b/package/dropbear/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_DROPBEAR
>  	bool "dropbear"
>  	select BR2_PACKAGE_ZLIB if !BR2_PACKAGE_DROPBEAR_SMALL
> +	select BR2_PACKAGE_LIBTOMCRYPT
>  	help
>  	  A small SSH 2 server designed for small memory environments.
>  
> diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
> index c6716f90d..b1818ea5e 100644
> --- a/package/dropbear/dropbear.mk
> +++ b/package/dropbear/dropbear.mk
> @@ -9,6 +9,8 @@ DROPBEAR_SITE = https://matt.ucc.asn.au/dropbear/releases
>  DROPBEAR_SOURCE = dropbear-$(DROPBEAR_VERSION).tar.bz2
>  DROPBEAR_LICENSE = MIT, BSD-2-Clause-like, BSD-2-Clause
>  DROPBEAR_LICENSE_FILES = LICENSE
> +DROPBEAR_DEPENDENCIES = libtomcrypt
> +DROPBEAR_CONF_OPTS = --disable-bundled-libtom

Since both libraries are static only, this does not reduce the binary size. On 
the other hand, bundled libraries are more likely to work correctly with any 
give version of dropbear. The only benefit of using external libraries is when 
there is a security update to the libraries. But unless there is a known issue 
now, I'm not sure it's worth it.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
