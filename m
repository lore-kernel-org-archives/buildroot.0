From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 11 Dec 2010 23:14:36 +0100
Subject: [Buildroot] [PATCH 01/15] toolchain: Improve C library option
	selection
In-Reply-To: <ca79dc87ecbeff3cfc20427c3ec3a54ca3a98c94.1291541115.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Sun, 5 Dec 2010 10:25:28 +0100")
References: <cover.1291541115.git.thomas.petazzoni@free-electrons.com>
	<cover.1291541115.git.thomas.petazzoni@free-electrons.com>
	<ca79dc87ecbeff3cfc20427c3ec3a54ca3a98c94.1291541115.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87oc8slzxv.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Turn BR2_LARGEFILE, BR2_INET_IPV6, BR2_INET_RPC, BR2_USE_WCHAR,
 Thomas> BR2_ENABLE_LOCALE and BR2_PROGRAM_INVOCATION into hidden options.

 Thomas> Then, for Buildroot toolchains, external toolchains and Crosstool-NG
 Thomas> toolchains, provide visible options that selects the hidden options.

 Thomas> This allows :

 Thomas>  * To show a different label and help text in the case of Buildroot
 Thomas>    toolchain (do you want to enable feature X ?) and in the case of
 Thomas>    external toolchain (is feature X available in your toolchain ?)

 Thomas>  * To not show any option when a glibc external toolchain is selected
 Thomas>    (since glibc is assumed to support all of largefile, IPv6, RPC,
 Thomas>    WCHAR, locale and program invocation) and have them all selected in
 Thomas>    that case.

 Thomas> There is some amount of duplication between Buildroot toolchain config
 Thomas> options and Crosstool-NG toolchain config options, because kconfig
 Thomas> doesn't allow to source the same Config.in file twice (even if under
 Thomas> mutually exclusive conditions). This duplication is more readable that
 Thomas> the hack that consists in splitting files in multiple pieces.

This breaks the toolchain setup of people's existing .config's, but OK -
Perhaps add a note about it in the commit message though.


 Thomas> +++ b/toolchain/toolchain-buildroot/Config.in.2
 Thomas> +config BR2_TOOLCHAIN_BUILDROOT_LOCALE
 Thomas> +	bool "Enable toolchain locale/i18n support"
 Thomas> +	select BR2_TOOLCHAIN_BUILDROOT_WCHAR
 Thomas> +	select BR2_ENABLE_LOCALE
 Thomas> +	help
 Thomas> +	  Enable this option if you want your toolchain to support
 Thomas> +	  localization and internationalization.
 Thomas> +
 Thomas> +config BR2_TOOLCHAIN_BUILDROOT_PROGRAM_INVOCATION
 Thomas> +	bool "Enable 'program invocation name'"

The other places we have 'Enable ... SUPPORT'


 Thomas> +++ b/toolchain/toolchain-external/Config.in
 Thomas> @@ -10,9 +10,68 @@ config BR2_TOOLCHAIN_EXTERNAL_UCLIBC
 
 Thomas>  config BR2_TOOLCHAIN_EXTERNAL_GLIBC
 Thomas>  	bool "glibc"
 Thomas> +	select BR2_LARGEFILE
 Thomas> +	select BR2_INET_IPV6
 Thomas> +	select BR2_INET_RPC
 Thomas> +	select BR2_USE_WCHAR
 Thomas> +	select BR2_ENABLE_LOCALE
 Thomas> +	select BR2_PROGRAM_INVOCATION
 
 Thomas>  endchoice
 
 Thomas> +if BR2_TOOLCHAIN_EXTERNAL_UCLIBC
 Thomas> +
 Thomas> +config BR2_TOOLCHAIN_EXTERNAL_LARGEFILE
 Thomas> +	bool "Toolchain has large file support ?"

We normally don't do spaces before question mark (several places in this
file).

-- 
Bye, Peter Korsgaard
