From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Mon, 30 Jul 2007 11:21:18 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
In-Reply-To: <1185786881.9395.1.camel@localhost.localdomain>
References: <20070729174350.EF22BA4508@busybox.net>
	<20070730072137.GB21479@aon.at>
	<1185781988.15219.2.camel@localhost.localdomain>
	<20070730083914.GA22956@aon.at>
	<1185786881.9395.1.camel@localhost.localdomain>
Message-ID: <20070730092118.GC23273@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jul 30, 2007 at 11:14:41AM +0200, Hans-Christian Egtvedt wrote:
>
>On Mon, 2007-07-30 at 10:39 +0200, Bernhard Fischer wrote:
>> On Mon, Jul 30, 2007 at 09:53:08AM +0200, Hans-Christian Egtvedt wrote:
>> >
>> >On Mon, 2007-07-30 at 09:21 +0200, Bernhard Fischer wrote:
>> >> On Sun, Jul 29, 2007 at 10:43:50AM -0700, ulf at uclibc.org wrote:
>
><cut AVR32 configuration menu option>
>
>> >> I object to this change.
>> >> Please explain why you don't just add disable-mudflap if the target arch
>> >> is BR2_avr32
>> >
>> >So a little patch to alter the toolchain/gcc/Makefile.in to modify
>> >EXTRA_TARGET_GCC_CONFIG_OPTIONS when ARCH is avr32 is a clean and nice
>> >solution?
>> >
>> >And remove this stuff from Config.in.2?
>> 
>> exactly, yes.
>
>Please see the included patch.
>
>-- 
>Mvh
>Hans-Christian Egtvedt

>diff --git a/toolchain/gcc/Config.in b/toolchain/gcc/Config.in
>index 2c47f12..648ae7d 100644
>--- a/toolchain/gcc/Config.in
>+++ b/toolchain/gcc/Config.in
>@@ -140,16 +135,6 @@ config BR2_GCC_USE_SJLJ_EXCEPTIONS
> 	  proper stack unwinding during exception handling.  Most people
> 	  can leave this set to n.
> 
>-config BR2_GCC_AVR32_CONFIGURATION
>-	bool "Enable default AVR32 GCC configuration"
>-	default y
>-	depends BR2_avr32
>-	help
>-	  For the AVR32 platform there is some configuration which are not
>-	  supported.
>-
>-	  Currently this will add "--disable-libmudflap" to configure.
>-
> config BR2_EXTRA_GCC_CONFIG_OPTIONS
> 	string "Additional gcc options"
> 	default ""
>diff --git a/toolchain/gcc/Config.in.2 b/toolchain/gcc/Config.in.2
>index 0b209ec..e556392 100644
>--- a/toolchain/gcc/Config.in.2
>+++ b/toolchain/gcc/Config.in.2
>@@ -2,19 +2,9 @@ config BR2_PACKAGE_GCC_TARGET
> 	bool "native toolchain in the target filesystem"
> 	default n
> 	help
>-	  If you want the target system to be able to run 
>+	  If you want the target system to be able to run
> 	  binutils/gcc and compile native code, say Y here.
> 
>-config BR2_GCC_TARGET_AVR32_CONFIGURATION
>-	bool "Enable default AVR32 GCC configuration"
>-	default y
>-	depends BR2_avr32 && BR2_PACKAGE_GCC_TARGET
>-	help
>-	  For the AVR32 platform there is some configuration which are not
>-	  supported.
>-
>-	  Currently this will add "--disable-libmudflap" to configure.
>-
> config BR2_EXTRA_TARGET_GCC_CONFIG_OPTIONS
> 	string "Additional target gcc options"
> 	default ""
>diff --git a/toolchain/gcc/Makefile.in b/toolchain/gcc/Makefile.in
>index ec14b25..b087eb2 100644
>--- a/toolchain/gcc/Makefile.in
>+++ b/toolchain/gcc/Makefile.in
>@@ -12,7 +12,7 @@ EXTRA_GCC_CONFIG_OPTIONS:=$(strip $(subst ",, $(BR2_EXTRA_GCC_CONFIG_OPTIONS)))
> #"))
> 
> # AVR32 GCC configuration
>-ifeq ($(strip $(BR2_GCC_AVR32_CONFIGURATION)),y)
>+ifeq ($(strip $(BR2_avr32)),y)
> EXTRA_GCC_CONFIG_OPTIONS+=--disable-libmudflap
> endif

This is the cross-compiler, isn't it? Why do you need to disable mudflap
for the cross-compiler unconditionally?

Other than that it's ok to apply.

thanks,
> 
>@@ -86,7 +86,7 @@ endif
> endif # BR2_PREFER_IMA=y
> 
> # AVR32 target GCC configuration
>-ifeq ($(strip $(BR2_GCC_TARGET_AVR32_CONFIGURATION)),y)
>+ifeq ($(strip $(BR2_avr32)),y)
> EXTRA_TARGET_GCC_CONFIG_OPTIONS+=--disable-libmudflap
> endif
> 
