From: Hiroshi Shinji <hiroshi.shinji@gmail.com>
Date: Mon, 23 Mar 2009 10:39:56 +0900
Subject: [Buildroot] svn commit: [25775] trunk/buildroot/target/generic:
	target_busybox_skeleton/etc target_skel etc...
In-Reply-To: <20090320215943.DCCB87656C@busybox.osuosl.org>
References: <20090320215943.DCCB87656C@busybox.osuosl.org>
Message-ID: <d6a0e5a20903221839o5275f3eakc9b506bfde9f9174@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

> +choice
> +       prompt "Serial port to run a getty on"
> +       default BR2_TARGET_GENERIC_GETTY_TTYSO
> +       help
> +         Select a port to run a getty (login prompt) on.
> +
> +config BR2_TARGET_GENERIC_GETTY_NONE
> +       bool "none"
> +config BR2_TARGET_GENERIC_GETTY_TTYSO

The last character of "BR2_TARGET_GENERIC_GETTY_TTYSO" is not "0"(zero).
Please fix it.


2009/3/21  <jacmet@uclibc.org>:
> Author: jacmet
> Date: 2009-03-20 21:59:43 +0000 (Fri, 20 Mar 2009)
> New Revision: 25775
>
> Log:
> target/generic: add kconfig for serial getty config (port + baudrate)
>
> These are the settings people most often want to tweak for embedded boards,
> so add kconfig variables to make it easy to do.
>
> Modified:
>   trunk/buildroot/target/generic/Config.in
>   trunk/buildroot/target/generic/Makefile.in
>   trunk/buildroot/target/generic/target_busybox_skeleton/etc/inittab
>   trunk/buildroot/target/generic/target_skeleton/etc/inittab
>
>
> Changeset:
> Modified: trunk/buildroot/target/generic/Config.in
> ===================================================================
> --- trunk/buildroot/target/generic/Config.in    2009-03-20 21:59:37 UTC (rev 25774)
> +++ trunk/buildroot/target/generic/Config.in    2009-03-20 21:59:43 UTC (rev 25775)
> @@ -59,3 +59,127 @@
>
>  comment "Generic development system requires a toolchain with WCHAR and PROGRAM_INVOCATION support"
>        depends on !(BR2_USE_WCHAR && BR2_UCLIBC_PROGRAM_INVOCATION)
> +
> +menuconfig BR2_TARGET_GENERIC_GETTY
> +       bool "Generic serial port config"
> +       depends on !(BR2_TARGET_ATMEL||BR2_TARGET_KWIKBYTE||BR2_TARGET_VALKA)
> +
> +if BR2_TARGET_GENERIC_GETTY
> +
> +choice
> +       prompt "Serial port to run a getty on"
> +       default BR2_TARGET_GENERIC_GETTY_TTYSO
> +       help
> +         Select a port to run a getty (login prompt) on.
> +
> +config BR2_TARGET_GENERIC_GETTY_NONE
> +       bool "none"
> +config BR2_TARGET_GENERIC_GETTY_TTYSO
> +       bool "ttyS0"
> +config BR2_TARGET_GENERIC_GETTY_TTYS1
> +       bool "ttyS1"
> +config BR2_TARGET_GENERIC_GETTY_TTYS2
> +       bool "ttyS2"
> +config BR2_TARGET_GENERIC_GETTY_TTYS3
> +       bool "ttyS3"
> +config BR2_TARGET_GENERIC_GETTY_TTYAMA0
> +       bool "ttyAMA0"
> +       depends on BR2_arm
> +config BR2_TARGET_GENERIC_GETTY_TTYAMA1
> +       bool "ttyAMA1"
> +       depends on BR2_arm
> +config BR2_TARGET_GENERIC_GETTY_TTYAMA2
> +       bool "ttyAMA2"
> +       depends on BR2_arm
> +config BR2_TARGET_GENERIC_GETTY_TTYAMA3
> +       bool "ttyAMA3"
> +       depends on BR2_arm
> +config BR2_TARGET_GENERIC_GETTY_TTYUL0
> +       bool "ttyUL0"
> +       depends on BR2_powerpc
> +config BR2_TARGET_GENERIC_GETTY_TTYUL1
> +       bool "ttyUL1"
> +       depends on BR2_powerpc
> +config BR2_TARGET_GENERIC_GETTY_TTYUL2
> +       bool "ttyUL2"
> +       depends on BR2_powerpc
> +config BR2_TARGET_GENERIC_GETTY_TTYUL3
> +       bool "ttyUL3"
> +       depends on BR2_powerpc
> +config BR2_TARGET_GENERIC_GETTY_TTYPSC0
> +       bool "ttyPSC0"
> +       depends on BR2_powerpc
> +config BR2_TARGET_GENERIC_GETTY_TTYPSC1
> +       bool "ttyPSC1"
> +       depends on BR2_powerpc
> +config BR2_TARGET_GENERIC_GETTY_TTYPSC2
> +       bool "ttyPSC2"
> +       depends on BR2_powerpc
> +config BR2_TARGET_GENERIC_GETTY_TTYPSC3
> +       bool "ttyPSC3"
> +       depends on BR2_powerpc
> +config BR2_TARGET_GENERIC_GETTY_TTYCPM0
> +       bool "ttyCPM0"
> +       depends on BR2_powerpc
> +config BR2_TARGET_GENERIC_GETTY_TTYCPM1
> +       bool "ttyCPM1"
> +       depends on BR2_powerpc
> +config BR2_TARGET_GENERIC_GETTY_TTYCPM2
> +       bool "ttyCPM2"
> +       depends on BR2_powerpc
> +config BR2_TARGET_GENERIC_GETTY_TTYCPM3
> +       bool "ttyCPM3"
> +       depends on BR2_powerpc
> +endchoice
> +
> +config BR2_TARGET_GENERIC_GETTY_PORT
> +       string
> +       default "#ttyS0"        if BR2_TARGET_GENERIC_GETTY_NONE
> +       default "ttyS0"         if BR2_TARGET_GENERIC_GETTY_TTYS0
> +       default "ttyS1"         if BR2_TARGET_GENERIC_GETTY_TTYS1
> +       default "ttyS2"         if BR2_TARGET_GENERIC_GETTY_TTYS2
> +       default "ttyS3"         if BR2_TARGET_GENERIC_GETTY_TTYS3
> +       default "ttyAMA0"       if BR2_TARGET_GENERIC_GETTY_TTYAMA0
> +       default "ttyAMA1"       if BR2_TARGET_GENERIC_GETTY_TTYAMA1
> +       default "ttyAMA2"       if BR2_TARGET_GENERIC_GETTY_TTYAMA2
> +       default "ttyAMA3"       if BR2_TARGET_GENERIC_GETTY_TTYAMA3
> +       default "ttyUL0"        if BR2_TARGET_GENERIC_GETTY_TTYUL0
> +       default "ttyUL1"        if BR2_TARGET_GENERIC_GETTY_TTYUL1
> +       default "ttyUL2"        if BR2_TARGET_GENERIC_GETTY_TTYUL2
> +       default "ttyUL3"        if BR2_TARGET_GENERIC_GETTY_TTYUL3
> +       default "ttyPSC0"       if BR2_TARGET_GENERIC_GETTY_TTYPSC0
> +       default "ttyPSC1"       if BR2_TARGET_GENERIC_GETTY_TTYPSC1
> +       default "ttyPSC2"       if BR2_TARGET_GENERIC_GETTY_TTYPSC2
> +       default "ttyPSC3"       if BR2_TARGET_GENERIC_GETTY_TTYPSC3
> +       default "ttyCPM0"       if BR2_TARGET_GENERIC_GETTY_TTYCPM0
> +       default "ttyCPM1"       if BR2_TARGET_GENERIC_GETTY_TTYCPM1
> +       default "ttyCPM2"       if BR2_TARGET_GENERIC_GETTY_TTYCPM2
> +       default "ttyCPM3"       if BR2_TARGET_GENERIC_GETTY_TTYCPM3
> +
> +choice
> +       prompt "Baudrate to use"
> +       default BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200
> +       help
> +         Select a baudrate to use.
> +
> +config BR2_TARGET_GENERIC_GETTY_BAUDRATE_9600
> +       bool "9600"
> +config BR2_TARGET_GENERIC_GETTY_BAUDRATE_19200
> +       bool "19200"
> +config BR2_TARGET_GENERIC_GETTY_BAUDRATE_38400
> +       bool "38400"
> +config BR2_TARGET_GENERIC_GETTY_BAUDRATE_57600
> +       bool "57600"
> +config BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200
> +       bool "115200"
> +endchoice
> +
> +config BR2_TARGET_GENERIC_GETTY_BAUDRATE
> +       string
> +       default "9600"          if BR2_TARGET_GENERIC_GETTY_BAUDRATE_9600
> +       default "19200"         if BR2_TARGET_GENERIC_GETTY_BAUDRATE_19200
> +       default "38400"         if BR2_TARGET_GENERIC_GETTY_BAUDRATE_38400
> +       default "57600"         if BR2_TARGET_GENERIC_GETTY_BAUDRATE_57600
> +       default "115200"        if BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200
> +
> +endif
>
> Modified: trunk/buildroot/target/generic/Makefile.in
> ===================================================================
> --- trunk/buildroot/target/generic/Makefile.in  2009-03-20 21:59:37 UTC (rev 25774)
> +++ trunk/buildroot/target/generic/Makefile.in  2009-03-20 21:59:43 UTC (rev 25775)
> @@ -7,3 +7,15 @@
>  TARGET_DEVICE_TABLE=target/generic/mini_device_table.txt
>  endif
>
> +TARGET_GENERIC_GETTY:=$(strip $(subst ",, $(BR2_TARGET_GENERIC_GETTY_PORT)))
> +#"))
> +TARGET_GENERIC_GETTY_BAUDRATE:=$(strip $(subst ",, $(BR2_TARGET_GENERIC_GETTY_BAUDRATE)))
> +#"))
> +
> +target-generic-getty:
> +       $(SED) '/# GENERIC_SERIAL$$/s~^.*#~$(TARGET_GENERIC_GETTY)::respawn:/sbin/getty -L $(TARGET_GENERIC_GETTY) $(TARGET_GENERIC_GETTY_BAUDRATE) vt100 #~' \
> +               $(TARGET_DIR)/etc/inittab
> +
> +ifeq ($(BR2_TARGET_GENERIC_GETTY),y)
> +TARGETS += target-generic-getty
> +endif
>
> Modified: trunk/buildroot/target/generic/target_busybox_skeleton/etc/inittab
> ===================================================================
> --- trunk/buildroot/target/generic/target_busybox_skeleton/etc/inittab  2009-03-20 21:59:37 UTC (rev 25774)
> +++ trunk/buildroot/target/generic/target_busybox_skeleton/etc/inittab  2009-03-20 21:59:43 UTC (rev 25775)
> @@ -32,10 +32,9 @@
>  # Set up a couple of getty's
>  tty1::respawn:/sbin/getty 38400 tty1
>  tty2::respawn:/sbin/getty 38400 tty2
> -#ttyAMA0::respawn:/sbin/getty -L ttyAMA0 115200 vt100
>
>  # Put a getty on the serial port
> -#ttyS0::respawn:/sbin/getty -L ttyS0 115200 vt100
> +#ttyS0::respawn:/sbin/getty -L ttyS0 115200 vt100 # GENERIC_SERIAL
>
>  # Logging junk
>  null::sysinit:/bin/touch /var/log/messages
>
> Modified: trunk/buildroot/target/generic/target_skeleton/etc/inittab
> ===================================================================
> --- trunk/buildroot/target/generic/target_skeleton/etc/inittab  2009-03-20 21:59:37 UTC (rev 25774)
> +++ trunk/buildroot/target/generic/target_skeleton/etc/inittab  2009-03-20 21:59:43 UTC (rev 25775)
> @@ -28,7 +28,7 @@
>  tty2::respawn:/sbin/getty 38400 tty2
>
>  # Put a getty on the serial port
> -#ttyS0::respawn:/sbin/getty -L ttyS0 115200 vt100
> +#ttyS0::respawn:/sbin/getty -L ttyS0 115200 vt100 # GENERIC_SERIAL
>
>  # Logging junk
>  null::sysinit:/bin/touch /var/log/messages
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>



-- 
?? ?
hiroshi.shinji at gmail.com
http://d.hatena.ne.jp/hshinji/
