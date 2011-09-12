From: Quotient Remainder <quotientvremainder@gmail.com>
Date: Mon, 12 Sep 2011 19:10:21 +0100
Subject: [Buildroot] [PATCH 3/6] gdb: make it a proper package
In-Reply-To: <87aajidiw4.fsf@macbook.be.48ers.dk>
References: <1293795546-19674-1-git-send-email-gustavo@zacarias.com.ar>
 <1293795546-19674-6-git-send-email-gustavo@zacarias.com.ar>
 <87hbdrc6ar.fsf@macbook.be.48ers.dk> <87aajidiw4.fsf@macbook.be.48ers.dk>
Message-ID: <1315851029.32089.5.camel@dublxciaranr1.verifone.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

(Top-posting for clarity)
Five of the six patches from Gustavo's patch-set containing the one
below from way back in January was applied; this one wasn't applied.
Has there been any progress on making GDB and friends a generic target
since?

Ar Domh, 2011-01-02 ag 23:45 +0100, scr?obh Peter Korsgaard:
> >>>>> "Peter" == Peter Korsgaard <jacmet@uclibc.org> writes:
> 
>  Gustavo> TODO: copy gdbserver from external toolchains
> 
>  Peter> Hmm, I don't quite like this Config.in.{internal,external} stuff, I'll
>  Peter> take a look and see if I can combine them.
> 
> We can do something like this below, but I also now noticed that you can
> no longer build both gdbserver and full gdb, like we used to be able to
> do. The gdb build system seems a bit odd, so I don't see any nice way of
> building both in the same make step.
> 
> Any ideas?
> 
> >From 70cf4a88935ef184134b6e60302e02fec78fb0d1 Mon Sep 17 00:00:00 2001
> From: Peter Korsgaard <jacmet@sunsite.dk>
> Date: Sun, 2 Jan 2011 23:28:02 +0100
> Subject: [PATCH] gdb: cleanup
> 
> Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
> ---
>  package/Config.in                             |    7 +--
>  package/gdb/{Config.in.external => Config.in} |    7 ++-
>  package/gdb/Config.in.internal                |   70 -------------------------
>  3 files changed, 7 insertions(+), 77 deletions(-)
>  rename package/gdb/{Config.in.external => Config.in} (90%)
>  delete mode 100644 package/gdb/Config.in.internal
> 
> diff --git a/package/Config.in b/package/Config.in
> index e5ff8d9..cee3993 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -55,12 +55,7 @@ source "package/flex/Config.in"
>  if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
>  source "package/gawk/Config.in"
>  endif
> -if BR2_TOOLCHAIN_BUILDROOT
> -source "package/gdb/Config.in.internal"
> -endif
> -if !BR2_TOOLCHAIN_BUILDROOT
> -source "package/gdb/Config.in.external"
> -endif
> +source "package/gdb/Config.in"
>  source "toolchain/gcc/Config.in.2"
>  source "package/gettext/Config.in"
>  source "package/gmp/Config.in"
> diff --git a/package/gdb/Config.in.external b/package/gdb/Config.in
> similarity index 90%
> rename from package/gdb/Config.in.external
> rename to package/gdb/Config.in
> index 9f7b0bf..2cdfde4 100644
> --- a/package/gdb/Config.in.external
> +++ b/package/gdb/Config.in
> @@ -1,3 +1,5 @@
> +if BR2_PACKAGE_HOST_GDB || !BR2_TOOLCHAIN_BUILDROOT
> +
>  config BR2_PACKAGE_GDB
>  	bool
>  	default y if BR2_PACKAGE_GDB_TARGET || BR2_PACKAGE_GDB_SERVER
> @@ -22,7 +24,7 @@ config BR2_PACKAGE_GDB_SERVER
>  
>  choice
>  	prompt "GDB debugger Version"
> -	depends on BR2_PACKAGE_GDB
> +	depends on BR2_PACKAGE_GDB && !BR2_TOOLCHAIN_BUILDROOT
>  	default BR2_GDB_VERSION_6_8_e if !BR2_avr32
>  	default BR2_GDB_VERSION_6_7_1_AVR32_2_1_5_e if BR2_avr32
>  	help
> @@ -64,3 +66,6 @@ config BR2_GDB_VERSION
>  	default "7.0.1"			if BR2_GDB_VERSION_7_0_1_e
>  	default "7.1"			if BR2_GDB_VERSION_7_1_e
>  	default "7.2"			if BR2_GDB_VERSION_7_2_e
> +	default "$(BR2_GDB_VERSION)"	if BR2_TOOLCHAIN_BUILDROOT
> +
> +endif
> diff --git a/package/gdb/Config.in.internal b/package/gdb/Config.in.internal
> deleted file mode 100644
> index d3d8de5..0000000
> --- a/package/gdb/Config.in.internal
> +++ /dev/null
> @@ -1,70 +0,0 @@
> -config BR2_PACKAGE_GDB
> -	bool
> -	default y if BR2_PACKAGE_GDB_TARGET || BR2_PACKAGE_GDB_SERVER
> -
> -config BR2_PACKAGE_GDB_TARGET
> -	bool "gdb"
> -	select BR2_PACKAGE_NCURSES
> -	select BR2_PACKAGE_GDB
> -	depends on BR2_USE_WCHAR
> -	help
> -	    Build the full gdb debugger to run on the target.
> -
> -comment "GDB debugger for the target needs WCHAR support in toolchain"
> -	depends on !BR2_USE_WCHAR
> -
> -config BR2_PACKAGE_GDB_SERVER
> -	bool "gdbserver"
> -	depends on BR2_PACKAGE_HOST_GDB
> -	select BR2_PACKAGE_GDB
> -	help
> -	    Build the gdbserver stub to run on the target.
> -	    A full gdb is needed to debug the progam.
> -
> -comment "GDB server needs you to build a host GDB in toolchain"
> -	depends on !BR2_PACKAGE_HOST_GDB
> -
> -choice
> -	prompt "GDB debugger Version"
> -	depends on !BR2_PACKAGE_HOST_GDB && BR2_PACKAGE_GDB
> -	default BR2_GDB_VERSION_6_8_i if !BR2_avr32
> -	default BR2_GDB_VERSION_6_7_1_AVR32_2_1_5_i if BR2_avr32
> -	help
> -	  Select the version of gdb you wish to use.
> -
> -	config BR2_GDB_VERSION_6_7_1_i
> -		depends on !BR2_avr32
> -		bool "gdb 6.7.1"
> -		depends on BR2_DEPRECATED
> -
> -	config BR2_GDB_VERSION_6_7_1_AVR32_2_1_5_i
> -		depends on BR2_avr32
> -		bool "gdb 6.7.1-avr32-2.1.5"
> -
> -	config BR2_GDB_VERSION_6_8_i
> -		bool "gdb 6.8"
> -		depends on !BR2_avr32
> -
> -	config BR2_GDB_VERSION_7_0_1_i
> -		bool "gdb 7.0.1"
> -		select BR2_PTHREAD_DEBUG if !BR2_PTHREADS_NONE
> -
> -	config BR2_GDB_VERSION_7_1_i
> -		bool "gdb 7.1"
> -		select BR2_PTHREAD_DEBUG if !BR2_PTHREADS_NONE
> -
> -	config BR2_GDB_VERSION_7_2_i
> -		bool "gdb 7.2"
> -		select BR2_PTHREAD_DEBUG if !BR2_PTHREADS_NONE
> -
> -endchoice
> -
> -config BR2_GDB_VERSION
> -	depends on !BR2_PACKAGE_HOST_GDB && BR2_PACKAGE_GDB
> -	string
> -	default "6.7.1"			if BR2_GDB_VERSION_6_7_1_i
> -	default "6.7.1-avr32-2.1.5"	if BR2_GDB_VERSION_6_7_1_AVR32_2_1_5_i
> -	default "6.8"			if BR2_GDB_VERSION_6_8_i
> -	default "7.0.1"			if BR2_GDB_VERSION_7_0_1_i
> -	default "7.1"			if BR2_GDB_VERSION_7_1_i
> -	default "7.2"			if BR2_GDB_VERSION_7_2_i
> -- 
> 1.7.1
> 
> 
> 
>  Peter> -- 
>  Peter> Bye, Peter Korsgaard
> 
