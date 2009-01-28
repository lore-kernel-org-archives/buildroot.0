From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 28 Jan 2009 08:58:09 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/webkit
In-Reply-To: <20090128081026.55f4a8f8@hcegtvedt> (Hans-Christian Egtvedt's
	message of "Wed\, 28 Jan 2009 08\:10\:26 +0100")
References: <20090127151010.080DA7709E@busybox.osuosl.org>
	<20090128081026.55f4a8f8@hcegtvedt>
Message-ID: <87fxj3x3ou.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Hans-Christian" == Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com> writes:

Hi,

 >> --- trunk/buildroot/package/webkit/Config.in	2009-01-27
 >> 15:02:40 UTC (rev 25080) +++
 >> trunk/buildroot/package/webkit/Config.in	2009-01-27 15:10:08
 >> UTC (rev 25081) @@ -1,5 +1,7 @@ config BR2_PACKAGE_WEBKIT
 >> bool "webkit"
 >> +	depends on BR2_INSTALL_LIBSTDCPP
 >> +	depends on BR2_USE_WCHAR

 Hans-Christian> Do you need C++/WCHAR for webkit as well, or only
 Hans-Christian> icu? If it is only icu then should not kconfig take
 Hans-Christian> care of this dependency since selecting icu package
 Hans-Christian> will not be possible?

Well, you could certainly argue that it should, but the fact is that
Kconfig doesn't take dependencies into consideration when it handles
selects, E.G. nothing stops you from select'ing a package with
unforfilled deps.

Webkit is furthermore C++ code, so that part is atleast correct.

 >> select BR2_PACKAGE_LIBGTK2
 >> select BR2_PACKAGE_ICU
 >> select BR2_PACKAGE_CURL
 >> @@ -11,3 +13,5 @@
 >> 
 >> http://webkit.org/
 >> 
 >> +comment "webkit requires a toolchain with C++ support and WCHAR
 >> enabled"
 >> +	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
 >> 

 Hans-Christian> And then make a depends on package icu instead?

No, I don't think hiding applications until you by accident manages to
enable all the required libraries is a good idea.

Applications should select their library dependencies and depend (with
a comment) on toolchain features.

-- 
Bye, Peter Korsgaard
