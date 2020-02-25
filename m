From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 25 Feb 2020 17:11:11 +0100
Subject: [Buildroot] [PATCH 01/36] package/qt5: drop 5.6 support
In-Reply-To: <20200224222054.2686-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 24 Feb 2020 23:20:18 +0100")
References: <20200224222054.2686-1-peter@korsgaard.com>
Message-ID: <87fteyfy00.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > As discussed during the FOSDEM2019 develop days, Qt 5.6 is very old (5.6.3
 > was released in September 2017, and 5.6.x became EOL in March 2019), so drop
 > it before the new Buildroot LTS release:

 > https://elinux.org/Buildroot:DeveloperDaysFOSDEM2019#Qt5_versions_to_support:_keep_5.6_or_a_newer_LTS.3F

 > And add legacy handling for it.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 > ---
 >  Config.in.legacy      |  7 +++++++
 >  package/qt5/Config.in | 39 +++++++++++----------------------------
 >  package/qt5/qt5.mk    |  6 ------
 >  3 files changed, 18 insertions(+), 34 deletions(-)

 > diff --git a/Config.in.legacy b/Config.in.legacy
 > index 87966facb4..6a33ce9e1c 100644
 > --- a/Config.in.legacy
 > +++ b/Config.in.legacy
 > @@ -146,6 +146,13 @@ endif
 
 >  comment "Legacy options removed in 2020.02"
 
 > +config BR2_PACKAGE_QT5_VERSION_5_6
 > +	bool "qt 5.6 support removed"
 > +	select BR2_LEGACY
 > +	help
 > +	  Support for Qt 5.6 is EOL and has been removed. The current
 > +	  version (5.12 or later) has been selected instead.
 > +
 >  config BR2_PACKAGE_CURL
 >  	bool "BR2_PACKAGE_CURL was renamed"
 >  	select BR2_PACKAGE_LIBCURL_CURL
 > diff --git a/package/qt5/Config.in b/package/qt5/Config.in
 > index def79fa680..5b40ddce92 100644
 > --- a/package/qt5/Config.in
 > +++ b/package/qt5/Config.in
 > @@ -11,14 +11,23 @@ config BR2_PACKAGE_QT5_JSCORE_AVAILABLE
 >  	# ARM needs BLX, so v5t+
 >  	depends on !BR2_ARM_CPU_ARMV4
 
 > -comment "Qt5 needs a toolchain w/ wchar, NPTL, C++, dynamic library"
 > -	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
 > +comment "Qt5 needs a toolchain w/ gcc >= 4.8, wchar, NPTL, C++, dynamic library"
 > +	depends on !BR2_ARM_CPU_ARMV4
 > +	depends on !BR2_arc && !BR2_nios2 && !BR2_xtensa
 > +
 > +	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 > +		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS || \
 > +		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 
 >  menuconfig BR2_PACKAGE_QT5
 >  	bool "Qt5"
 >  	depends on BR2_INSTALL_LIBSTDCPP
 >  	depends on BR2_USE_WCHAR
 >  	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 > +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 > +	depends on !BR2_ARM_CPU_ARMV4 # needs ARMv5+
 > +	# no built-in double-conversion support
 > +	depends on !BR2_arc && !BR2_nios2 && !BR2_xtensa
 >  	depends on !BR2_STATIC_LIBS
 >  	select BR2_PACKAGE_QT5BASE
 >  	help
 > @@ -29,32 +38,6 @@ menuconfig BR2_PACKAGE_QT5
 
 >  if BR2_PACKAGE_QT5
 
 > -choice
 > -	prompt "Qt5 version"
 > -
 > -config BR2_PACKAGE_QT5_VERSION_LATEST

Thinking more about it, it probably makes more sense to make this a
blind option in this commit for bisectability, so all the places that
were using a BR2_PACKAGE_QT5_VERSION_LATEST conditional will continue to
work and then drop it as the last patch in the series.

I'll rework that, but I will wait a bit and see if there is any other
feedback before resending.

-- 
Bye, Peter Korsgaard
