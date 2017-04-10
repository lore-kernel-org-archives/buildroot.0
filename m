From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 10 Apr 2017 15:44:06 +0200
Subject: [Buildroot] [PATCH v3] xenomai: Add choice for
 enabling/disabling Cobalt/Mercury core
In-Reply-To: <20170410123226.3719-1-sikor6@gmail.com>
References: <20170409235434.31059-1-sikor6@gmail.com>
 <20170410123226.3719-1-sikor6@gmail.com>
Message-ID: <f2272603-b4ce-00ae-3407-70fe7fc772b0@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10-04-17 14:32, Pawel Sikora wrote:
> Add an option choice for Cobalt or Mercury core
> depending on option BR2_LINUX_KERNEL_EXT_XENOMAI.
> 
> Signed-off-by: Pawel Sikora <sikor6@gmail.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 As noticed, this will collide with the SMP patch.

 Pawel, if you would resend a v4 where both patches are kept together in a patch
series, make sure that you copy my Reviewed-by tag (put it below your
Signed-off-by).

 Regards,
 Arnout

> ---
> Changes v2 -> v3:
>  - Corrections in help (Arnout V.)
> 
>  package/xenomai/Config.in  | 27 +++++++++++++++++++++++++++
>  package/xenomai/xenomai.mk |  6 ++++++
>  2 files changed, 33 insertions(+)
> 
> diff --git a/package/xenomai/Config.in b/package/xenomai/Config.in
> index b548ee810..324f5025a 100644
> --- a/package/xenomai/Config.in
> +++ b/package/xenomai/Config.in
> @@ -51,6 +51,33 @@ config BR2_PACKAGE_XENOMAI_VERSION
>  	  BR2_LINUX_KERNEL_EXT_XENOMAI_ADEOS_PATCH, in the Linux
>  	  Kernel -> Linux Kernel Extensions menu.
>  
> +choice
> +	prompt "Xenomai core"
> +	default BR2_PACKAGE_XENOMAI_MERCURY
> +	help
> +	  Select the Xenomai core: dual kernel (Cobalt)
> +	  or native Linux Kernel (Mercury).
> +
> +config BR2_PACKAGE_XENOMAI_MERCURY
> +	bool "Mercury"
> +	depends on !BR2_LINUX_KERNEL_EXT_XENOMAI
> +	help
> +	  Select Mercury core for the Xenomai userspace.
> +	  You want to use it if you have the native Linux Kernel.
> +
> +config BR2_PACKAGE_XENOMAI_COBALT
> +	bool "Cobalt"
> +	help
> +	  Select Cobalt core (dual kernel) for the Xenomai
> +	  userspace. Use this if you use a Xenomai-patched
> +	  Linux kernel.
> +
> +	  If you want to use Cobalt core, your kernel must have
> +	  the Adeos and Xenomai patches applied to it. You can
> +	  add these through the BR2_LINUX_KERNEL_EXT_XENOMAI option
> +	  in the Linux Kernel Extensions menu.
> +endchoice
> +
>  config BR2_PACKAGE_XENOMAI_TESTSUITE
>  	bool "Install testsuite"
>  	help
> diff --git a/package/xenomai/xenomai.mk b/package/xenomai/xenomai.mk
> index c9e810e05..73d9617b1 100644
> --- a/package/xenomai/xenomai.mk
> +++ b/package/xenomai/xenomai.mk
> @@ -23,6 +23,12 @@ XENOMAI_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) install-user
>  
>  XENOMAI_CONF_OPTS += --includedir=/usr/include/xenomai/ --disable-doc-install
>  
> +ifeq ($(BR2_PACKAGE_XENOMAI_MERCURY),y)
> +XENOMAI_CONF_OPTS += --with-core=mercury
> +else
> +XENOMAI_CONF_OPTS += --with-core=cobalt
> +endif
> +
>  define XENOMAI_REMOVE_DEVFILES
>  	for i in xeno-config xeno-info wrap-link.sh ; do \
>  		rm -f $(TARGET_DIR)/usr/bin/$$i ; \
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
