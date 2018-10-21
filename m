From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 21 Oct 2018 19:27:24 +0100
Subject: [Buildroot] [PATCH v3 2/8] busybox: add logging configuration
 file
In-Reply-To: <20181007114605.18153-3-casantos@datacom.com.br>
References: <20181007114605.18153-1-casantos@datacom.com.br>
 <20181007114605.18153-3-casantos@datacom.com.br>
Message-ID: <14a8b23d-ce2f-2d42-5ed3-c65eb6df0bd8@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 07/10/2018 12:45, Carlos Santos wrote:
> Provide a template to help users to customize syslogd and klogd without
> editting the startup script.
> 
> syslogd options worth to configure are remote logging (-R), rotation
> (-s, -b) and minimal priority level (-l).
> 
> klogd minimal priority level (-c) can be configured too, preventing
> non-critical kernel messages from appearing on the console.
> 
> This file is also useful as an example for init script authors.

 We also discussed this, and we agreed in the end that it is not very useful to
have a default defaults file. It needlessly consumes space on the target, the
user anyway probably has to consult documentation to know which options to use,
and there is (usually) only one option that can be set in the file:
<DAEMON>_ARGS. In addition, we can't expect all package authors to submit
something that is of such a high quality as this example...

 Regards,
 Arnout

> 
> Signed-off-by: Carlos Santos <casantos@datacom.com.br>
> ---
> Changes v1->v2
> - Implement suggestions made by Nicolas Cavallari and Arnout Vandecappelle
> Changes v2->v3
> - Add reference to documentation, as suggested by Matt Weber.
> ---
>  package/busybox/busybox.mk          |  2 ++
>  package/busybox/etc.default.logging | 17 +++++++++++++++++
>  2 files changed, 19 insertions(+)
>  create mode 100644 package/busybox/etc.default.logging
> 
> diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
> index 757086592f..91131c0012 100644
> --- a/package/busybox/busybox.mk
> +++ b/package/busybox/busybox.mk
> @@ -252,6 +252,8 @@ define BUSYBOX_INSTALL_LOGGING_SCRIPT
>  	then \
>  		$(INSTALL) -m 0755 -D package/busybox/S01logging \
>  			$(TARGET_DIR)/etc/init.d/S01logging; \
> +		$(INSTALL) -m 0644 -D package/busybox/etc.default.logging \
> +			$(TARGET_DIR)/etc/default/logging; \
>  	fi
>  endef
>  
> diff --git a/package/busybox/etc.default.logging b/package/busybox/etc.default.logging
> new file mode 100644
> index 0000000000..5e52eff985
> --- /dev/null
> +++ b/package/busybox/etc.default.logging
> @@ -0,0 +1,17 @@
> +#
> +# /etc/default/logging (busybox version)
> +#
> +# Online documentation of syslogd and klogd is available at
> +#
> +#    https://busybox.net/downloads/BusyBox.html
> +#
> +
> +# Use SYSLOGD_ARGS to pass additional arguments to syslogd (e.g. for log
> +# rotation).
> +# SYSLOGD_ARGS="" # (default value)
> +
> +# Use KLOGD_ARGS to pass additional arguments to klogd.
> +# KLOGD_ARGS="" # (default value)
> +
> +# Uncomment the line below to disable this service
> +# ENABLED="no"
> 
