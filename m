From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 14 May 2012 22:33:39 +0200
Subject: [Buildroot] [PATCH 1/2] binutils: not available on avr32
In-Reply-To: <1336981857-4221-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 14 May 2012 09:50:56 +0200")
References: <1336981857-4221-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87sjf2y02k.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Fixes
 Thomas> http://autobuild.buildroot.org/results/0be38d4a16a7b6322367116a6d0bc285f73b7436/build-end.log.

This is actually only for avr32 using external toolchain, right?

Another way to fix it would be simply to default to 2.18-avr32-1.0.1 for
avr32 in binutils.mk:

ifeq ($(BINUTILS_VERSION),)
BINUTILS_VERSION = 2.21
endif

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas>  package/binutils/Config.in |    1 +
 Thomas>  package/oprofile/Config.in |    2 ++
 Thomas>  2 files changed, 3 insertions(+)

 Thomas> diff --git a/package/binutils/Config.in b/package/binutils/Config.in
 Thomas> index e068b20..59e9529 100644
 Thomas> --- a/package/binutils/Config.in
 Thomas> +++ b/package/binutils/Config.in
 Thomas> @@ -1,5 +1,6 @@
 Thomas>  config BR2_PACKAGE_BINUTILS
 Thomas>  	bool "binutils"
 Thomas> +	depends on !BR2_avr32
 Thomas>  	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 Thomas>  	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT_IF_LOCALE
 Thomas>  	help
 Thomas> diff --git a/package/oprofile/Config.in b/package/oprofile/Config.in
 Thomas> index 562c910..d7e2065 100644
 Thomas> --- a/package/oprofile/Config.in
 Thomas> +++ b/package/oprofile/Config.in
 Thomas> @@ -2,6 +2,8 @@ config BR2_PACKAGE_OPROFILE
 Thomas>  	bool "oprofile"
 Thomas>  	select BR2_PACKAGE_POPT
 Thomas>  	select BR2_PACKAGE_BINUTILS
 Thomas> +	# binutils for target not available on avr32
 Thomas> +	depends on !BR2_avr32
 Thomas>  	depends on BR2_INSTALL_LIBSTDCPP
 Thomas>  	help
 Thomas>  	  OProfile is a system-wide profiler for Linux systems,
 Thomas> -- 
 Thomas> 1.7.9.5

 Thomas> _______________________________________________
 Thomas> buildroot mailing list
 Thomas> buildroot at busybox.net
 Thomas> http://lists.busybox.net/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard
