From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Jul 2013 12:50:37 +0200
Subject: [Buildroot] Buildroot compilation using uClibc and activating
 bluez
In-Reply-To: <747C1E83C744F44E9ACFB89FAEEC2C7B2423BF9923@EXDCVYMBSTM005.EQ1STM.local>
References: <747C1E83C744F44E9ACFB89FAEEC2C7B2423BF9923@EXDCVYMBSTM005.EQ1STM.local>
Message-ID: <20130709125037.0a4e0077@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Julien COUVRAND,

On Tue, 9 Jul 2013 10:57:13 +0200, Julien COUVRAND wrote:

> I would like to enable Bluez packages using uClibc but i meet some dependencies with MMU.
> We can't enable bluez-utils package while MMU is deactivated. 
> 
> As soon as i compile Buildroot deactivating MMU dependencies into Config.in from bluez-utils package such as:
> 
> --
> config BR2_PACKAGE_BLUEZ_UTILS
> 	bool "bluez-utils"
> 	depends on !BR2_avr32
> 	depends on BR2_USE_WCHAR # libglib2
> 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, alsa-lib
> 	# depends on BR2_USE_MMU # dbus
> 	select BR2_PACKAGE_DBUS
> 	select BR2_PACKAGE_LIBGLIB2
> 	help
> 	  bluez utils
> --
> 
> I have got following compilation errors:
> 
> --
> >../dbus/.libs/libdbus-internal.a(libdbus_internal_la-dbus-sysdeps-util-unix.o): In function `_dbus_become_daemon':
> > dbus-sysdeps-util-unix.c:(.text+0x530): undefined reference to `fork'
> > ../dbus/.libs/libdbus-internal.a(libdbus_internal_la-dbus-spawn.o): In function `_dbus_spawn_async_with_babysitter':
> > dbus-spawn.c:(.text+0xe38): undefined reference to `fork'
> > dbus-spawn.c:(.text+0xea0): undefined reference to `fork'
> > collect2: error: ld returned 1 exit status
> > make[3]: *** [dbus-daemon] Error 1
> > make[3]: *** Waiting for unfinished jobs....
> > ../dbus/.libs/libdbus-internal.a(libdbus_internal_la-dbus-sysdeps-util-unix.o): In function `_dbus_become_daemon':
> > dbus-sysdeps-util-unix.c:(.text+0x530): undefined reference to `fork'
> > collect2: error: ld returned 1 exit status
> > make[3]: *** [dbus-daemon-launch-helper] Error 1
> --
> 
> So, currently, using uclibc for bluez, without MMU activation, I can't compile Buildroot due dBus and the "fork".
> Does it exist a way to enable bluez using uClibc avoiding Dbus issues?

Well, as you've seen, bluez requires DBus (it's a mandatory
dependency), and DBus uses fork(). Maybe it's possible to build and
make DBus work on non-MMU platform by patching it to not use fork().
Maybe you want to check the Blackfin Buildroot repository at
http://blackfin.uclinux.org/git/?p=buildroot;a=shortlog to see if they
have dbus patches in package/dbus/ to make it work on non-MMU
platforms. If they do, don't hesitate to integrate it in Buildroot, and
send us a patch to make DBus work on non-MMU platforms.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
