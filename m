From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 03 Jan 2009 21:01:35 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
In-Reply-To: <20090103010637.58207769FD@busybox.osuosl.org> (ulf@uclibc.org's
	message of "Sat\, 3 Jan 2009 01\:06\:37 +0000 \(UTC\)")
References: <20090103010637.58207769FD@busybox.osuosl.org>
Message-ID: <871vvk17mo.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "ulf" == ulf  <ulf@uclibc.org> writes:

 ulf> Author: ulf
 ulf> Date: 2009-01-03 01:06:36 +0000 (Sat, 03 Jan 2009)
 ulf> New Revision: 24663

 ulf> Log:
 ulf> Update linux versions

 ulf> Modified:
 ulf>    trunk/buildroot/target/linux/Config.in.advanced
 ulf>    trunk/buildroot/target/linux/Config.in.versions

What about my comments to r24465?

 ulf> Changeset:
 ulf> Modified: trunk/buildroot/target/linux/Config.in.advanced
 ulf> ===================================================================
 ulf> --- trunk/buildroot/target/linux/Config.in.advanced	2009-01-03 01:06:16 UTC (rev 24662)
 ulf> +++ trunk/buildroot/target/linux/Config.in.advanced	2009-01-03 01:06:36 UTC (rev 24663)
 ulf> @@ -123,17 +123,21 @@
 
 ulf>  choice
 ulf>  	prompt "Linux Kernel Version"
 ulf> -	default BR2_LINUX_2_6_22_10 if BR2_avr32
 ulf> -	default BR2_LINUX_2_6_22_1 if !BR2_avr32 && BR2_TARGET_ATMEL
 ulf> -	default BR2_LINUX_2_6_22 if !BR2_TARGET_ATMEL
 ulf> +	default BR2_LINUX_2_6_28

Wee.

Shouldn't it be default BR2_LINUX_2_6_STABLE instead so you don't need
to go and change this all the time?

 ulf>  	help
 ulf>  	  Select the specific Linux version you want to use
 
 ulf>  config BR2_LINUX_2_6_STABLE
 ulf> -	bool "The latest stable Linux kernel (2.6.27.10)"
 ulf> +	bool "The latest stable Linux kernel (2.6.28)"
 ulf>  	help
 ulf> -	  Linux 2.26.27.10
 ulf> +	  Linux 2.26.28

Get rid of the help text. You cannot see it in make menuconfig and
it's just more text that might get out of sync with the symbols.
 
 ulf> +config BR2_LINUX_2_6_28
 ulf> +	bool "Linux 2.6.28"
 ulf> +	select BR2_KERNEL_BASE
 ulf> +	help
 ulf> +	  Linux 2.6.28
 ulf> +

Here as well.

 ulf>  config BR2_LINUX_2_6_27
 ulf>  	bool "Linux 2.6.27"
 ulf>  	select BR2_KERNEL_BASE
 ulf> @@ -207,12 +211,6 @@
 ulf>  	help
 ulf>  	  Linux 2.6.20
 
 ulf> -config BR2_LINUX_2_6_28
 ulf> -	bool "Linux 2.6.28"
 ulf> -	select BR2_KERNEL_BASE
 ulf> -	help
 ulf> -	  Linux 2.6.28
 ulf> -

Why the move?

 ulf>  config BR2_LINUX_2_6_29
 ulf>  	bool "Linux 2.6.29"
 ulf>  	select BR2_KERNEL_BASE

Time machine? ;)

 ulf> Modified: trunk/buildroot/target/linux/Config.in.versions
 ulf> ===================================================================
 ulf> --- trunk/buildroot/target/linux/Config.in.versions	2009-01-03 01:06:16 UTC (rev 24662)
 ulf> +++ trunk/buildroot/target/linux/Config.in.versions	2009-01-03 01:06:36 UTC (rev 24663)
 ulf> @@ -5,11 +5,13 @@
 
 ulf>  config LINUX26_LATEST_RC_VERSION
 ulf>  	string
 ulf> -	default "2.6.28-rc9" if BR2_KERNEL_ADD_LATEST_RC_PATCH
 ulf> +	default "2.6.29-rc1" if BR2_KERNEL_ADD_LATEST_RC_PATCH
 ulf> +	help
 ulf> +	  Not really available as of 20090103

Why add it then? What happens if you select it?
 
 ulf>  config LINUX26_LATEST_GIT_VERSION
 ulf>  	string
 ulf> -	default "2.6.28-rc9-git1" if BR2_KERNEL_ADD_LATEST_SNAPSHOT
 ulf> +	default "2.6.28-git5" if BR2_KERNEL_ADD_LATEST_SNAPSHOT

Does it make sense to have an option for this? That one changes almost
every day.
 
 ulf>  config BR2_KERNEL_CURRENT_VERSION
 ulf>  	string
 ulf> -	default "2.6.27.10"
 ulf> +	default "2.6.28"
 
 ulf> +config BR2_KERNEL_LATEST_2_6_28
 ulf> +	string
 ulf> +	default "1"
 ulf> +	help
 ulf> +	  Not really available as of 20090103
 ulf> +

Huh?

 ulf>  config BR2_KERNEL_LATEST_2_6_27
 ulf> -       string
 ulf> -       default "10"
 ulf> +	string
 ulf> +	default "10"

Whitespace damage?


 ulf>  config BR2_KERNEL_LATEST_2_6_26
 ulf> -       string
 ulf> -       default "8"
 ulf> +	string
 ulf> +	default "8"

And here.

 ulf>  config BR2_KERNEL_LATEST_2_6_25
 ulf> -       string
 ulf> -       default "9"
 ulf> +	string
 ulf> +	default "9"

And so on ..

Please fix.

-- 
Bye, Peter Korsgaard
