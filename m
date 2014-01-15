From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 15 Jan 2014 15:24:27 -0300
Subject: [Buildroot] [PATCH] Add SMS Tools Server 3 package
In-Reply-To: <1389194289-10657-1-git-send-email-julien.boibessot@free.fr>
References: <1389194289-10657-1-git-send-email-julien.boibessot@free.fr>
Message-ID: <52D6D25B.3040603@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/08/2014 12:18 PM, julien.boibessot at free.fr wrote:

Hi. Let's see...

> +config BR2_PACKAGE_SMSTOOLS3_NB_MODEMS
> +	string "Number of modems to support"
> +	default 1

What does this knob do in/to the code?

> +
> +config BR2_PACKAGE_SMSTOOLS3_START_AT_BOOT
> +	bool "Start SMS Server Tools at system boot"
> +	default y

Ehhmm no, we don't make initscripts conditional that way, there are
various hooks to get rid of it if someone doesn't want it that way or
they run services their own way.

> +
> +endif
> +
> +comment "smstools3 needs a toolchain w/ wchar, threads"
> +	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
> diff --git a/package/smstools3/S50smsd b/package/smstools3/S50smsd
> new file mode 100644
> index 0000000..ded4189
> --- /dev/null
> +++ b/package/smstools3/S50smsd
> @@ -0,0 +1,43 @@
> +#!/bin/sh
> +#
> +# Starts the SMS Server Tools 3
> +#
> +
> +NAME=smsd
> +DAEMON=/usr/local/bin/$NAME

/usr/local? Why?

> +ifeq ($(BR2_PACKAGE_SMSTOOLS3_START_AT_BOOT),y)
> +SMSTOOLS3_INIT_SCRIPT_NAME = S50smsd
> +else
> +SMSTOOLS3_INIT_SCRIPT_NAME = 50smsd
> +endif

Please use SMSTOOLS3_INSTALL_INIT_SYSV for the script.
See docs/manual/adding-packages-generic.txt for the reason.

Otherwise looking good in general without testing it though.
Regards.
