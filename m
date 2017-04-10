From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 10 Apr 2017 13:56:25 +0200
Subject: [Buildroot] [PATCH v2] xenomai: Add config for
	enabling/disabling SMP
In-Reply-To: <20170410001700.31490-1-sikor6@gmail.com>
References: <20170406234657.31813-1-sikor6@gmail.com>
 <20170410001700.31490-1-sikor6@gmail.com>
Message-ID: <5d7c18eb-bfb5-c3f3-2268-5edf0f6c08ae@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10-04-17 02:17, Pawel Sikora wrote:
> Add a config option for enabling/disabling SMP
> in Xenomai userspace in version 3.x
> 
> Enabled by default.
> 
> Signed-off-by: Pawel Sikora <sikor6@gmail.com>
> ---
> Changes v1 -> v2:
>  - default y, moving comment to help, changed help, adding explicitly
>    --disable-smp opt in the else statement (suggested by Arnout V.)
>  
>  package/xenomai/Config.in  | 24 ++++++++++++++++++++++++
>  package/xenomai/xenomai.mk |  6 ++++++
>  2 files changed, 30 insertions(+)
> 
> diff --git a/package/xenomai/Config.in b/package/xenomai/Config.in
> index b548ee810..b2697e5af 100644
> --- a/package/xenomai/Config.in
> +++ b/package/xenomai/Config.in
> @@ -51,6 +51,30 @@ config BR2_PACKAGE_XENOMAI_VERSION
>  	  BR2_LINUX_KERNEL_EXT_XENOMAI_ADEOS_PATCH, in the Linux
>  	  Kernel -> Linux Kernel Extensions menu.
>  
> +config BR2_PACKAGE_XENOMAI_ENABLE_SMP
> +	bool "Enable SMP"
> +	default y
> +	help
> +	  This option allows to enable SMP in Xenomai userspace.
> +
> +	  Please note:
> +	  If you use Xenomai 2.x you have SMP enabled by default.
> +
> +	  Xenomai 3.x is being built by default with SMP disabled,
> +	  but to have a behaviour similar to previous versions,
> +	  option is enabled by default and you need to uncheck it
> +	  if you don't need it.
> +
> +	  Second reason of setting it by default is that Xenomai
> +	  userspace with SMP enabled and with Linux Kernel without
> +	  SMP config are working fine together.
> +	  But NOT the other way around.
> +
> +	  Please refer to this troubleshooting guide for more
> +	  information in section "feature mismatch: missing=?smp/nosmp?:
> +
> +	  https://xenomai.org/troubleshooting-a-dual-kernel-configuration/

 The https address doesn't work for me, the http equivalent does...

 As said in my previous mail, I think we don't need to spend too much effort on
supporting Xenomai 2.x (which anyway doesn't work ATM). Also in general this
explanation is a bit too extensive. Here's a shorter alternative.

	  This option enables SMP support in Xenomai userspace.

	  If this option is turned on while no SMP support is enabled
	  in the kernel, things will still work. However, if SMP is
	  enabled in the kernel but this option is not turned on,
	  Xenomai applications will complain with 'feature mismatch:
	  missing="smp/nosmp'.

	  Please refer to this troubleshooting guide for more
	  information:
	
http://xenomai.org/troubleshooting-a-dual-kernel-configuration/#feature_mismatch_missing8221smpnosmp8221



 Regards,
 Arnout


> +
>  config BR2_PACKAGE_XENOMAI_TESTSUITE
>  	bool "Install testsuite"
>  	help
> diff --git a/package/xenomai/xenomai.mk b/package/xenomai/xenomai.mk
> index c9e810e05..04880e69a 100644
> --- a/package/xenomai/xenomai.mk
> +++ b/package/xenomai/xenomai.mk
> @@ -23,6 +23,12 @@ XENOMAI_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) install-user
>  
>  XENOMAI_CONF_OPTS += --includedir=/usr/include/xenomai/ --disable-doc-install
>  
> +ifeq ($(BR2_PACKAGE_XENOMAI_ENABLE_SMP),y)
> +XENOMAI_CONF_OPTS += --enable-smp
> +else
> +XENOMAI_CONF_OPTS += --disable-smp
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
