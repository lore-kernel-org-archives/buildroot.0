From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 27 Jun 2008 12:21:58 +0200
Subject: [Buildroot] [PATCH] add gdb-6.8 support
In-Reply-To: <6a2e33620806270011n5dfb63a7o279e26c5826b12e@mail.gmail.com>
	(Fathi Boudra's message of "Fri\, 27 Jun 2008 09\:11\:28 +0200")
References: <6a2e33620806270011n5dfb63a7o279e26c5826b12e@mail.gmail.com>
Message-ID: <87wskbgou1.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fathi" == Fathi Boudra <fboudra@gmail.com> writes:

 Fathi> Hi,
 Fathi> please find attached patches to add gdb-6.8 support.

 Fathi> <off-topic> gdb-6.7.1 support is broken. patches doesn't
 Fathi> apply.  I guess you could drop all patches except
 Fathi> 600-fix-compile-flag-mismatch.patch This patch need to be
 Fathi> refreshed.  gdb-6.5 is broken too. patches need to be
 Fathi> refreshed too.  Let me know if you want these gdb fixed as I
 Fathi> don't really care of these versions and use 6.8.

Yes please.

 Fathi> cheers,

 Fathi> Fathi

> --- a/toolchain/gdb/Config.in
> +++ b/toolchain/gdb/Config.in
> @@ -52,6 +52,10 @@ 		bool "gdb 6.7.1" 		depends on !BR2_avr32 
> +	config BR2_GDB_VERSION_6_8
> +		bool "gdb 6.8"
> +		depends on !BR2_avr32
> +
>  	config BR2_GDB_VERSION_SNAPSHOT
>  		bool "gdb snapshot"
>  		depends on !BR2_avr32 && !BR2_nios2
> @@ -66,4 +70,5 @@
>  	default "6.5"      if BR2_GDB_VERSION_6_5
>  	default "6.6"      if BR2_GDB_VERSION_6_6
>  	default "6.7.1"    if BR2_GDB_VERSION_6_7_1
> +	default "6.8"      if BR2_GDB_VERSION_6_8
>  	default "snapshot" if BR2_GDB_VERSION_SNAPSHOT
> --- a/toolchain/gdb/gdb.mk
> +++ b/toolchain/gdb/gdb.mk
> @@ -84,13 +84,14 @@
 
>  $(GDB_TARGET_DIR)/.configured: $(GDB_DIR)/.unpacked
>  	mkdir -p $(GDB_TARGET_DIR)
> -	(cd $(GDB_TARGET_DIR); rm -rf config.cache; \
> +	(cd $(GDB_TARGET_DIR); \
>  		gdb_cv_func_sigsetjmp=yes \
>  		$(TARGET_CONFIGURE_OPTS) \
>  		CFLAGS_FOR_TARGET="$(TARGET_CFLAGS) $(TARGET_LDFLAGS) -Wno-error" \
>  		CFLAGS="$(TARGET_CFLAGS) $(TARGET_LDFLAGS) -Wno-error" \
>  		$(GDB_TARGET_CONFIGURE_VARS) \
>  		$(GDB_DIR)/configure \
> +		--cache-file=/dev/null \

This seems unrelated to 6.8 support - Please do this as a seperate
patch.

Thanks!

-- 
Bye, Peter Korsgaard
