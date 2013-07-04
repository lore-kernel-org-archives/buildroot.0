From: Aleksandar Zivkovic <Aleksandar.Zivkovic@rt-rk.com>
Date: Thu, 04 Jul 2013 11:02:44 +0200
Subject: [Buildroot] AT91SAM9G20-EK and aplay
In-Reply-To: <519F6226.4060002@zacarias.com.ar>
References: <519F186B.3060606@scen.it> <20130524100520.01c518fd@skate>
 <519F2CDB.8080805@scen.it> <20130524112355.70d1cc53@skate>
 <519F452D.4070505@scen.it> <519F6226.4060002@zacarias.com.ar>
Message-ID: <kr3dnd$9hs$1@ger.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 5/24/2013 2:50 PM, Gustavo Zacarias wrote:
> On 05/24/2013 07:47 AM, Carlo Rajko wrote:
>>>> I think the problem is not in aply because I have the same problem with
>>>> mpg123.
>>>> Could be the library alsa?
>>>
>>> It could. But at least gdb will tell us if it's an undefined
>>> instruction, an invalid memory access, an unaligned access, or
>>> something else.
>
> Actually it's the toolchain, seems CS 2012.03 isn't emitting proper
> arm926ej-s code.
> I've managed to reproduce it with the qemu_arm_versatile sample
> configuration and adding a bunch of packages (mpg123, vorbis-tools, ...)
> It did strike me as odd that i've got the same failures as yours (aplay,
> mpg123) but ogg123 worked fine with alsa output.
> So switching to an internal toolchain or CS 2011.09 magically fixed the
> issues.
> Regards.
>
Hi,

I have segfault issue with aplay on Buildroot generated image x86 with 
Linux kernel 2.6.35.
I found some post where modification of Linux kernel source helps 
http://permalink.gmane.org/gmane.linux.alsa.devel/86868. Could it be 
related to my problem?

Here are my logs, please ask for more details you need:

*******************************************************************************
GDB backtrace:
*******************************************************************************
prs at none:~$ gdb aplay
GNU gdb (GDB) 7.5.1
Copyright (C) 2012 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later 
<http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
and "show warranty" for details.
This GDB was configured as "i686-buildroot-linux-gnu".
For bug reporting instructions, please see:
<http://www.gnu.org/software/gdb/bugs/>...
Reading symbols from /usr/bin/aplay...done.
(gdb) r
Starting program: /usr/bin/aplay
[Thread debugging using libthread_db enabled]
Using host libthread_db library "/lib/libthread_db.so.1".

Program received signal SIGSEGV, Segmentation fault.
0xb774f39d in ?? () from /lib/ld-linux.so.2
(gdb) bt
#0  0xb774f39d in ?? () from /lib/ld-linux.so.2
#1  0xb774fb09 in ?? () from /lib/ld-linux.so.2
#2  0xb758e5a0 in ?? () from /lib/libc.so.6
#3  0xb758ea27 in _dl_sym () from /lib/libc.so.6
#4  0xb761cd36 in ?? () from /lib/libdl.so.2
#5  0xb775479f in ?? () from /lib/ld-linux.so.2
#6  0xb761d30a in ?? () from /lib/libdl.so.2
#7  0xb761cdb4 in dlsym () from /lib/libdl.so.2
#8  0xb767595a in snd_dlsym_verify () from /usr/lib/libasound.so.2
#9  0xb7675a3f in snd_dlsym () from /usr/lib/libasound.so.2
#10 0xb7671ce2 in _snd_config_evaluate () from /usr/lib/libasound.so.2
#11 0xb767019d in snd_config_walk () from /usr/lib/libasound.so.2
#12 0xb76701ff in snd_config_walk () from /usr/lib/libasound.so.2
#13 0xb76710c7 in snd_config_expand () from /usr/lib/libasound.so.2
#14 0xb767129e in snd_config_hook_load () from /usr/lib/libasound.so.2
#15 0xb76718fd in snd_config_hook_load_for_all_cards () from 
/usr/lib/libasound.so.2
#16 0xb76722c5 in snd_config_hooks.constprop.24 () from 
/usr/lib/libasound.so.2
#17 0xb76724d6 in snd_config_searcha_hooks () from /usr/lib/libasound.so.2
#18 0xb7672652 in snd1_config_search_alias_hooks () from 
/usr/lib/libasound.so.2
#19 0xb76719cb in snd_config_search_definition () from 
/usr/lib/libasound.so.2
#20 0xb768946f in snd_pcm_open_noupdate () from /usr/lib/libasound.so.2
#21 0x08050a09 in main ()
(gdb)

*******************************************************************************
soundcard details:
*******************************************************************************
$cat /proc/asound/cards
  0 [Intel          ]: HDA-Intel - HDA Intel
                       HDA Intel at 0xfdff4000 irq 44
  1 [USB            ]: USB-Audio - Aureon 7.1 USB
                       Aureon 7.1 USB at usb-0000:00:1d.2-2, full speed



Regards,
Aleksandar
