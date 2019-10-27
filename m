From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 27 Oct 2019 21:50:53 +0100
Subject: [Buildroot] [PATCH v2] package/chrony: add option for debug
 logging
In-Reply-To: <1559171886-14446-1-git-send-email-hancock@sedsystems.ca>
References: <b96bc92f-ec2a-acec-9667-228014c12e3f@sedsystems.ca>
 <1559171886-14446-1-git-send-email-hancock@sedsystems.ca>
Message-ID: <975f83dc-183a-22c6-1dce-82de86e49358@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 30/05/2019 01:18, Robert Hancock wrote:
> Add a BR2_PACKAGE_CHRONY_DEBUG_LOGGING config option to allow enabling
> compiled-in support for debug logging in Chrony. Enable by default as
> this makes it much easier to debug Chrony issues and should only be
> disabled by those very sensitive to binary size.
> 
> Signed-off-by: Robert Hancock <hancock@sedsystems.ca>

 Applied to master, thanks.


> ---
>  package/chrony/Config.in | 10 ++++++++++
>  package/chrony/chrony.mk |  3 ++-
>  2 files changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/package/chrony/Config.in b/package/chrony/Config.in
> index 05d6fc1..7d401627 100644
> --- a/package/chrony/Config.in
> +++ b/package/chrony/Config.in
> @@ -6,3 +6,13 @@ config BR2_PACKAGE_CHRONY
>  	  accuracy of the system clock.
>  
>  	  http://chrony.tuxfamily.org/
> +
> +config BR2_PACKAGE_CHRONY_DEBUG_LOGGING
> +	bool "enable debug logging support"
> +	default y

 We don't enable an option like this by default, so I removed this.

 Regards,
 Arnout

> +	depends on BR2_PACKAGE_CHRONY
> +	help
> +	  Enable support for debug logging output from Chrony when enabled at
> +	  runtime. If disabled, code for debug logging will not be compiled in.
> +	  Enabling this option increases the installed Chrony binary size by
> +	  approximately 15%.
> diff --git a/package/chrony/chrony.mk b/package/chrony/chrony.mk
> index b5821b2..2d03fce 100644
> --- a/package/chrony/chrony.mk
> +++ b/package/chrony/chrony.mk
> @@ -13,7 +13,8 @@ CHRONY_CONF_OPTS = \
>  	--host-system=Linux \
>  	--host-machine=$(BR2_ARCH) \
>  	--prefix=/usr \
> -	--without-tomcrypt
> +	--without-tomcrypt \
> +	$(if $(BR2_PACKAGE_CHRONY_DEBUG_LOGGING),--enable-debug,--disable-debug)
>  
>  ifeq ($(BR2_PACKAGE_LIBCAP),y)
>  CHRONY_DEPENDENCIES += libcap
> 
