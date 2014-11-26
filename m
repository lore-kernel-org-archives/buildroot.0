From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 26 Nov 2014 17:45:28 +0000
Subject: [Buildroot] [PATCH] libnspr: fix static build
In-Reply-To: <4112e251a7a4b3513c66ff30ac2f502b0aa2541c.1417022842.git.baruch@tkos.co.il>
References: <4112e251a7a4b3513c66ff30ac2f502b0aa2541c.1417022842.git.baruch@tkos.co.il>
Message-ID: <547611B8.2020503@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On 11/26/2014 05:27 PM, Baruch Siach wrote:
> Disable shared library in a static build.
> 
> Fixes:
> http://autobuild.buildroot.net/results/6ff/6ffae151ec3eaca175923ab860cf42167871164c/
> http://autobuild.buildroot.net/results/cab/cab19721c43b3256dd51ae511016bc9ea440512a/
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/libnspr/libnspr.mk | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/package/libnspr/libnspr.mk b/package/libnspr/libnspr.mk
> index c071d8591fbd..1930870a5108 100644
> --- a/package/libnspr/libnspr.mk
> +++ b/package/libnspr/libnspr.mk
> @@ -21,6 +21,12 @@ LIBNSPR_CONF_OPTS = --host=$(GNU_HOST_NAME)
>  LIBNSPR_CONF_OPTS += --$(if $(BR2_ARCH_IS_64),en,dis)able-64bit
>  LIBNSPR_CONF_OPTS += --$(if $(BR2_INET_IPV6),en,dis)able-ipv6
>  
> +ifeq ($(BR2_PREFER_STATIC_LIB),y)
> +LIBNSPR_MAKE_OPTS = SHARED_LIBRARY=
> +LIBNSPR_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) SHARED_LIBRARY= install
> +LIBNSPR_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) SHARED_LIBRARY= install
> +endif
> +
>  ifeq ($(BR2_arm),y)
>  ifeq ($(BR2_ARM_CPU_HAS_THUMB2),y)
>  LIBNSPR_CONF_OPTS += --enable-thumb2
> 

Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

$ grep PREFER_STATIC .config
BR2_PREFER_STATIC_LIB=y
$ grep UCLIBC .config
BR2_TOOLCHAIN_USES_UCLIBC=y
BR2_TOOLCHAIN_EXTERNAL_UCLIBC=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_UCLIBC=y
# BR2_UCLIBC_VERSION_0_9_32 is not set
$ grep LIBNSPR .config
BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT=y
BR2_PACKAGE_LIBNSPR=y
$ file output/staging/usr/lib/libnspr*
output/staging/usr/lib/libnspr4.a

It also fixes this autobuild failure for MIPS:

http://autobuild.buildroot.net/results/691/6913f5af6519463fbed39ef37b6a40ecf6a67b54/

Best regards,
-- 
Vicente Olivert Riera
Graduate Software Engineer, MIPS Processor IP
Imagination Technologies Limited
t: +44 (0)113 2429814
www.imgtec.com
