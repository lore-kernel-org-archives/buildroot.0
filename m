From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 26 Aug 2013 16:32:09 +0200
Subject: [Buildroot] [RFC] uclibc: reinstate support for version 0.9.31
In-Reply-To: <1376997241-20991-1-git-send-email-spdawson@gmail.com>
References: <1376997241-20991-1-git-send-email-spdawson@gmail.com>
Message-ID: <20130826163209.71188312@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear spdawson at gmail.com,

On Tue, 20 Aug 2013 12:14:01 +0100, spdawson at gmail.com wrote:
> From: Simon Dawson <spdawson@gmail.com>
> 
> This patch reinstates support for uClibc version 0.9.31, which was removed
> from Buildroot in commit 8abb5b33c1aae035cf48b1c81104b433ff884c64
> 
> Signed-off-by: Simon Dawson <spdawson@gmail.com>

You said:

""unfortunately,
while uClibc 0.9.33.x does build for avr32, the result is a root
filesystem with unusably-slow runtime performance.
""

Then maybe we should make 0.9.31 the only possible uClibc version for
AVR32 ?

> diff --git a/package/connman/Config.in b/package/connman/Config.in
> index 0853941..22f3b9f 100644
> --- a/package/connman/Config.in
> +++ b/package/connman/Config.in
> @@ -4,7 +4,7 @@ config BR2_PACKAGE_CONNMAN
>  	select BR2_PACKAGE_LIBGLIB2
>  	select BR2_PACKAGE_IPTABLES
>  	select BR2_PACKAGE_GNUTLS
> -	depends on !BR2_UCLIBC_VERSION_0_9_32
> +	depends on !(BR2_UCLIBC_VERSION_0_9_31 || BR2_UCLIBC_VERSION_0_9_32)

Maybe it was inotify that was missing, but I see you've backported the
inotify support in 0.9.31. Or it was something else than inotify?

> diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
> index 92e04e9..6f62d39 100644
> --- a/package/uclibc/Config.in
> +++ b/package/uclibc/Config.in
> @@ -8,6 +8,10 @@ choice
>  	help
>  	  Select the version of uClibc you wish to use.
>  
> +	config BR2_UCLIBC_VERSION_0_9_31
> +		bool "uClibc 0.9.31.x"
> +		depends on !BR2_xtensa

		&& !BR2_arc

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
