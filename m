From: ing. Federico Fuga <fuga@studiofuga.com>
Date: Thu, 22 Nov 2007 16:43:35 +0100
Subject: [Buildroot] abi problem with arm [solves alsa-lib invalid ioctl]
Message-ID: <4745A3A7.2000301@studiofuga.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I have found and solved the problem that breaks the ioctl of alsa-lib in
arm.
Just a little preamble:

when compiling with arm xscale on an em-x270 board, all the installation
works correctly except that the alsactl cannot set the volume levels of
mixer:

# alsactl restore
unknown ioctl = 0xc2c45513 ioctl ELEM_WRITE=0xc2c85513 struct 712
alsactl: set_control:1159: Cannot write control '2:0:0:Speaker Playback
Volume:0' : Inappropriate ioctl for device

(note that the "unknown ioctl" message is a debug message i put on the
sound/core/control.c source to get rid of the problem).
If you compile a simple program that prints the ioctl and sizeof struct
snd_ctl_elem_value, you'll notice that the structure size is 708 in this
case.
As someone pointed out, there may be an alignment problem problem in the
structure when compiled with the toolchain.
The strange thing is that a kernel compiled with this toolchain
(arm-linux-uclibc) works perfectly with all programs except that alsa,
and that if you run that kernel with a file system and alsa compiled
with glibc (angstrom linux) alsactl works perfectly.
So after 5 days of digging, I found that the alsa drivers in the kernel
are compiled with the -mabi=aapcs-linux option in gcc.
If I add that option to CFLAGS in the alsa-lib configure script and
compile, alsactl works perfectly!
So I suggest to put the option

-mabi=aapcs-linux

to all the compilation of uclibc and buildroot.
I would propose the patch, but I do not know where to put the option in
the scripts/configuration.
Hope that helps,

Federico Fuga
