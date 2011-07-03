From: Dwi Sasongko Supriyadi <ruckuus@gmail.com>
Date: Sun, 3 Jul 2011 23:59:16 +0700
Subject: [Buildroot] Issue with pthread_mutex_lock with external
	toolchain
In-Reply-To: <BANLkTimsi4tUYs+iNQy+o+Zo=sscs0JKtw@mail.gmail.com>
References: <BANLkTi=VZ=q7MTfyf453BAAfEqqAZ41Lpg@mail.gmail.com>
 <BANLkTi=3TYjz7BY6a-3cCZvLfm4Ynxm6xA@mail.gmail.com>
 <BANLkTik8Y4y2aSm9attWqM1gXWB6CMsDOQ@mail.gmail.com>
 <BANLkTimsi4tUYs+iNQy+o+Zo=sscs0JKtw@mail.gmail.com>
Message-ID: <CAG7bwALyCjje2yqYnd_iUKyETr+CkvarBrGdJ0Ohc9Oyxa5+_A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2011/6/23 Dwi Sasongko Supriyadi <ruckuus@gmail.com>:
>
>
> 2011/6/23 Daniel Nystr?m <daniel.nystrom@timeterminal.se>
>>
>> 2011/6/22 Dwi Sasongko Supriyadi <ruckuus@gmail.com>:
>> > 3. External toolchain from Code Sourcery 2010.09
>>
>> pthread_mutex_lock is part of libc which itself is part of the
>> external toolchain package. Maybe try getting in contact with
>> CodeSourcery?
>
> Agreed, libpthread.so and also libthread_db.so are part of the external
> toolchain, I also tried to test with buildroot toolchain and there is no
> difference.
>

I have tried to rebuild everything with debugging support and here is the log:

 gdb /usr/sbin/pcscd
GNU gdb 6.8
Copyright (C) 2008 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
and "show warranty" for details.
This GDB was configured as "arm-unknown-linux-gnueabi"...
(gdb) run --foreground --debug --apdu
Starting program: /usr/sbin/pcscd --foreground --debug --apdu
[Thread debugging using libthread_db enabled]
debuglog.c:277:DebugLogSetLevel() debug level=debug
debuglog.c:306:DebugLogSetCategory() Debug options: APDU
pcscdaemon.c:550:main() pcsc-lite 1.7.2 daemon ready.
[New Thread 0x4001a000 (LWP 147)]
[New Thread 0x40a8e470 (LWP 150)]

Program received signal SIGSEGV, Segmentation fault.
[Switching to Thread 0x40a8e470 (LWP 150)]
0x401304e8 in pthread_mutex_lock () from /lib/libpthread.so.0
(gdb) info threads
* 2 Thread 0x40a8e470 (LWP 150)  0x401304e8 in pthread_mutex_lock ()
  from /lib/libpthread.so.0
 1 Thread 0x4001a000 (LWP 147)  0x40136e64 in read ()
  from /lib/libpthread.so.0
(gdb) bt 20
#0  0x401304e8 in pthread_mutex_lock () from /lib/libpthread.so.0
#1  0x40103e60 in usbi_get_device_by_session_id (ctx=0x0, session_id=257)
   at core.c:560
#2  0x4010962c in enumerate_device (ctx=0x0, _discdevs=0x40a8dcd8,
   busnum=<value optimized out>, devaddr=<value optimized out>,
   sysfs_dir=0x351ed3 "usb1") at os/linux_usbfs.c:1393
#3  0x40109930 in sysfs_scan_device (ctx=0x0, _discdevs=0x40a8dcd8,
   devname=0x351ed3 "usb1", usbfs_fallback=<value optimized out>)
   at os/linux_usbfs.c:1393
#4  0x40109ba0 in op_get_device_list (ctx=0x0, _discdevs=0x40a8dd0c)
   at os/linux_usbfs.c:1393
#5  0x401040e4 in libusb_get_device_list (ctx=0x0, list=0x40a8dd9c)
   at core.c:644
#6  0x000149b4 in HPRescanUsbBus () at hotplug_libusb.c:166
#7  0x000157a8 in HPEstablishUSBNotifications (pipefd=0xbed94b44)
   at hotplug_libusb.c:166
#8  0x4012db60 in start_thread () from /lib/libpthread.so.0
#9  0x4021fc58 in clone () from /lib/libc.so.6
(gdb)

Frankly for the moment I have no clue where to start to find the cause
of this issue because I have lack of knowledge in debugging. I would
really appreciate any comment/help.

Thanks in advance
