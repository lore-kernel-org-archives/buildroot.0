From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 22 Jun 2018 00:18:00 +0200
Subject: [Buildroot] [PATCH 1/1] apache: add init sysv script
In-Reply-To: <20180620210021.12253-1-fontaine.fabrice@gmail.com>
References: <20180620210021.12253-1-fontaine.fabrice@gmail.com>
Message-ID: <6e1b810f-90a1-39c6-7692-dadc34d71d89@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 20-06-18 23:00, Fabrice Fontaine wrote:
> sysv init script is just a wrapper to apachectl
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/apache/S50apache | 12 ++++++++++++
>  package/apache/apache.mk |  5 +++++
>  2 files changed, 17 insertions(+)
>  create mode 100644 package/apache/S50apache
> 
> diff --git a/package/apache/S50apache b/package/apache/S50apache
> new file mode 100644
> index 0000000000..623a7eef3b
> --- /dev/null
> +++ b/package/apache/S50apache
> @@ -0,0 +1,12 @@
> +#!/bin/sh
> +
> +case "$1" in
> +  start|restart|graceful|graceful-stop|stop)
> +	apachectl -k $1
> +	;;
> +  *)
> +	echo "Usage: $0 {start|restart|graceful|graceful-stop|stop}"

 In our "init script standardisation" effort, I think the idea was to always
support start, stop, restart and reload. Could you add a reload command that
maps onto restart?

 Regards,
 Arnout

> +	exit 1
> +esac
> +
> +exit $?
> diff --git a/package/apache/apache.mk b/package/apache/apache.mk
> index 23414fe44d..f4c522916e 100644
> --- a/package/apache/apache.mk
> +++ b/package/apache/apache.mk
> @@ -92,4 +92,9 @@ define APACHE_CLEANUP_TARGET
>  endef
>  APACHE_POST_INSTALL_TARGET_HOOKS += APACHE_CLEANUP_TARGET
>  
> +define APACHE_INSTALL_INIT_SYSV
> +	$(INSTALL) -D -m 0755 package/apache/S50apache \
> +		$(TARGET_DIR)/etc/init.d/S50apache
> +endef
> +
>  $(eval $(autotools-package))
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
