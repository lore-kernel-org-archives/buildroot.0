From: Julien COUVRAND <julien.couvrand@stericsson.com>
Date: Tue, 9 Jul 2013 10:57:13 +0200
Subject: [Buildroot] Buildroot compilation using uClibc and activating bluez
Message-ID: <747C1E83C744F44E9ACFB89FAEEC2C7B2423BF9923@EXDCVYMBSTM005.EQ1STM.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I would like to enable Bluez packages using uClibc but i meet some dependencies with MMU.
We can't enable bluez-utils package while MMU is deactivated. 

As soon as i compile Buildroot deactivating MMU dependencies into Config.in from bluez-utils package such as:

--
config BR2_PACKAGE_BLUEZ_UTILS
	bool "bluez-utils"
	depends on !BR2_avr32
	depends on BR2_USE_WCHAR # libglib2
	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, alsa-lib
	# depends on BR2_USE_MMU # dbus
	select BR2_PACKAGE_DBUS
	select BR2_PACKAGE_LIBGLIB2
	help
	  bluez utils
--

I have got following compilation errors:

--
>../dbus/.libs/libdbus-internal.a(libdbus_internal_la-dbus-sysdeps-util-unix.o): In function `_dbus_become_daemon':
> dbus-sysdeps-util-unix.c:(.text+0x530): undefined reference to `fork'
> ../dbus/.libs/libdbus-internal.a(libdbus_internal_la-dbus-spawn.o): In function `_dbus_spawn_async_with_babysitter':
> dbus-spawn.c:(.text+0xe38): undefined reference to `fork'
> dbus-spawn.c:(.text+0xea0): undefined reference to `fork'
> collect2: error: ld returned 1 exit status
> make[3]: *** [dbus-daemon] Error 1
> make[3]: *** Waiting for unfinished jobs....
> ../dbus/.libs/libdbus-internal.a(libdbus_internal_la-dbus-sysdeps-util-unix.o): In function `_dbus_become_daemon':
> dbus-sysdeps-util-unix.c:(.text+0x530): undefined reference to `fork'
> collect2: error: ld returned 1 exit status
> make[3]: *** [dbus-daemon-launch-helper] Error 1
--

So, currently, using uclibc for bluez, without MMU activation, I can't compile Buildroot due dBus and the "fork".
Does it exist a way to enable bluez using uClibc avoiding Dbus issues?


Thanks in advance


Julien


Julien COUVRAND
------------------------------------------------------------------------------------

Mailto:???? 11 rue Pierre-Felix Delarue
??????????????????? 72100 Le Mans -? FRANCE
Office:????? +33 2 44 02 71 07
Mobile: ?? +33 6 03 49 09 04 
Emailto :?? julien.couvrand at stericsson.com
-------------------------------------------------------------------------------------
This communication is confidential and intended solely for the addressee(s). Any unauthorized review, use, disclosure or distribution is prohibited. If you believe this message has been sent to you in error, please notify the sender by replying to this transmission and delete the message without disclosing it. Thank you.

E-mail including attachments is susceptible to data corruption, interception, unauthorized amendment, tampering and viruses, and we only send and receive emails on the basis that we are not liable for any such corruption, interception, amendment, tampering or viruses or any consequences thereof.
