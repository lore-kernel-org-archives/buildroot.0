From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 30 Dec 2010 21:22:18 -0300
Subject: [Buildroot] [Bug 3007] kexec doesn't build: Missing regdef.h
 file
In-Reply-To: <9AC3F0E75060224C8BBC5BA2DDC8853A1EAEBEF6@EXV1.corp.adtran.com>
References: <bug-3007-163@https.bugs.busybox.net/>
	<20101228225917.F10AC8EE38@busybox.osuosl.org>
	<9AC3F0E75060224C8BBC5BA2DDC8853A1EAEBDFA@EXV1.corp.adtran.com>
	<4D1CB01E.4020002@zacarias.com.ar>
	<9AC3F0E75060224C8BBC5BA2DDC8853A1EAEBEF6@EXV1.corp.adtran.com>
Message-ID: <4D1D223A.40900@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/30/2010 03:15 PM, ANDY KENNEDY wrote:

> Okay, why then do we not have:
> 
> diff -Naur a/package/kexec/Config.in b/package/kexec/Config.in
> --- a/package/kexec/Config.in   2010-12-30 09:57:01.000000000 -0600
> +++ b/package/kexec/Config.in   2010-12-30 11:44:52.000000000 -0600
> @@ -6,6 +6,11 @@
>  
>  
> http://www.kernel.org/pub/linux/kernel/people/horms/kexec-tools/
>  
> +config BR2_PACKAGE_KEXEC_VERSION
> +       string "kexec version to build"
> +       depends on BR2_PACKAGE_KEXEC
> +       default "2.0.1"
> +
>  config BR2_PACKAGE_KEXEC_ZLIB
>         bool "Kexec with zlib support"
>         depends on BR2_PACKAGE_KEXEC
> diff -Naur a/package/kexec/kexec.mk b/package/kexec/kexec.mk
> --- a/package/kexec/kexec.mk    2010-12-30 09:57:01.000000000 -0600
> +++ b/package/kexec/kexec.mk    2010-12-30 12:04:31.000000000 -0600
> @@ -3,9 +3,9 @@
>  # kexec
>  #
>  #############################################################
> -KEXEC_VERSION = 2.0.1
> +KEXEC_VERSION = $(BR2_PACKAGE_KEXEC_VERSION)
>  KEXEC_SOURCE = kexec-tools-$(KEXEC_VERSION).tar.bz2
> -KEXEC_SITE =
> $(BR2_KERNEL_MIRROR)/linux/kernel/people/horms/kexec-tools/
> +KEXEC_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kexec
>  
>  ifeq ($(BR2_PACKAGE_KEXEC_ZLIB),y)
>  KEXEC_CONF_OPT += --with-zlib

Easier to just use the latest if there are no drawbacks, otherwise we
get a moving target and avoid the "option overload" situation too.
