From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 5 Oct 2017 22:07:38 +0300
Subject: [Buildroot] [PATCH 2/2] dnsmasq: Disable CHAOS by default
In-Reply-To: <20171005072532.21720-1-jer@airfi.aero>
References: <20171005072532.21720-1-jer@airfi.aero>
Message-ID: <20171005190738.kb5qgdlmnfxdd7nu@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jeroen,

On Thu, Oct 05, 2017 at 09:25:32AM +0200, Jeroen Roovers wrote:
> dnsmasq exposes its version and some statistics through DNS, a features
> that is configurable only at build time and is enabled by default.

Your sign-off is missing.

> ---
>  package/dnsmasq/Config.in  | 6 ++++++
>  package/dnsmasq/dnsmasq.mk | 4 ++++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/package/dnsmasq/Config.in b/package/dnsmasq/Config.in
> index 8921fc629d..ea733d964e 100644
> --- a/package/dnsmasq/Config.in
> +++ b/package/dnsmasq/Config.in
> @@ -27,6 +27,12 @@ config BR2_PACKAGE_DNSMASQ_DNSSEC
>  	help
>  	  Enable DNSSEC validation and caching support.
>  
> +config BR2_PACKAGE_DNSMASQ_CHAOS
> +	bool "Enable identification support"
> +	default n

This is the default for kconfig symbols.

> +	help
> +	  Report *.bind CHAOS info to clients.
> +
>  config BR2_PACKAGE_DNSMASQ_IDN
>  	bool "IDN support"
>  	depends on BR2_USE_WCHAR
> diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
> index 9f96030eb6..dd2b5eb615 100644
> --- a/package/dnsmasq/dnsmasq.mk
> +++ b/package/dnsmasq/dnsmasq.mk
> @@ -30,6 +30,10 @@ ifneq ($(BR2_PACKAGE_DNSMASQ_TFTP),y)
>  DNSMASQ_COPTS += -DNO_TFTP
>  endif
>  
> +ifneq ($(BR2_PACKAGE_DNSMASQ_CHAOS),y)
> +DNSMASQ_COPTS += -DNO_ID
> +endif
> +
>  # NLS requires IDN so only enable it (i18n) when IDN is true
>  ifeq ($(BR2_PACKAGE_DNSMASQ_IDN),y)
>  DNSMASQ_DEPENDENCIES += libidn $(TARGET_NLS_DEPENDENCIES)

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
