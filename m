From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 06 Feb 2017 19:50:05 +0100
Subject: [Buildroot] [PATCH] libiio: Bump to version 0.9
In-Reply-To: <20170206145542.32623-1-paul.cercueil@analog.com> (Paul
 Cercueil's message of "Mon, 6 Feb 2017 15:55:42 +0100")
References: <20170206145542.32623-1-paul.cercueil@analog.com>
Message-ID: <87zihzw3vm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Paul" == Paul Cercueil <paul.cercueil@analog.com> writes:

 > This new version introduces a lot of bug fixes and some new API
 > functions.

 > Additionally, the IIO Daemon is now able to share the local IIO devices
 > through USB (using FunctionFS).

 > Signed-off-by: Paul Cercueil <paul.cercueil@analog.com>

> +++ b/package/libiio/Config.in
 > @@ -24,7 +24,7 @@ config BR2_PACKAGE_LIBIIO_XML_BACKEND
 
 >  config BR2_PACKAGE_LIBIIO_NETWORK_BACKEND
 >  	bool "Network backend"
 > -	depends on BR2_PACKAGE_LIBIIO_XML_BACKEND
 > +	select BR2_PACKAGE_LIBIIO_XML_BACKEND

You didn't mention this in the description, but yeah - Using select
probably makes more sense here.

 > @@ -65,6 +65,18 @@ comment "IIO Daemon needs a toolchain w/ threads"
 >  comment "IIO Daemon is not yet available on Blackfin"
 >  	depends on BR2_bfin
 
 > +config BR2_PACKAGE_LIBIIO_IIOD_USBD
 > +	bool "USB support in the IIO Daemon (FunctionFS)"
 > +	depends on BR2_PACKAGE_LIBIIO_IIOD
 > +	depends on BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS
 > +	select BR2_PACKAGE_LIBAIO
 > +	help
 > +	  Add support for USB through FunctionFS with IIOD.

This should go before the iiod comments to ensure it gets indented under
the iiod option in menuconfig.

I did a quick test build and I see it fails to link with older
toolchains as usbd.c doesn't get built.

Looking at the kernel history the usb_functionfs_descs_head_v2 structure
seems to have been added in 1df22b4ea9d91, so I added a
BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18 dependency and updated the comment
below.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
