From: Andrew <andrewtholt60@gmail.com>
Date: Fri, 25 Jan 2019 13:50:01 +0000
Subject: [Buildroot] Remote debug
Message-ID: <47d1e1e9-f58e-d775-e935-031d28cb3945@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I?m have a problem remotely debugging a device.

My setup is

Target: Boundary Devices Nitrogen 6 (i.MX6)

Host : Linux Mint 18.3 Sylvia

Buildroot 2017.08

I have built my image so that if I run file on a binary I get this:

file /usr/bin/lwsws
/usr/bin/lwsws: ELF 32-bit LSB executable, ARM, EABI5 version 1 (SYSV), 
dynamically linked, interpreter /lib/ld-linux-armhf.so.3, for GNU/Linux 
2.6.32, BuildID[sha1]=04bcb93a38c3a59d7ec2812a70c4e13fd5609024, with 
debug_info, not stripped

If I run gdbserver on the target I can connect from the host, set a 
breakpoint on a symbol (e.g. main) run the code, and the breakpoint is 
hit and the code stops.

If I try to list the code, I simply get the gdb prompt. If I try to list 
the code

So here is waht I see on the host

|$GDB -x ~/.gdbinit GNU gdb (Linaro_GDB-2017.02) 7.12.1.20170215-git 
Copyright (C) 2017 Free Software Foundation, Inc. License GPLv3+: GNU 
GPL version 3 or later <http://gnu.org/licenses/gpl.html> This is free 
software: you are free to change and redistribute it. There is NO 
WARRANTY, to the extent permitted by law. Type "show copying" and "show 
warranty" for details. This GDB was configured as 
"--host=x86_64-unknown-linux-gnu --target=arm-linux-gnueabihf". Type 
"show configuration" for configuration details. For bug reporting 
instructions, please see: <http://www.gnu.org/software/gdb/bugs/>. Find 
the GDB manual and other documentation resources online at: 
<http://www.gnu.org/software/gdb/documentation/>. For help, type "help". 
Type "apropos word" to search for commands related to "word". (gdb) set 
remote exec-file lwsws (gdb) target remote 10.31.1.113:2345 
^C10.31.1.113:2345: Interrupted system call. (gdb) Quit (gdb) target 
remote 10.31.1.99:2345 Remote debugging using 10.31.1.99:2345 Reading 
/usr/bin/lwsws from remote target... warning: File transfers from remote 
targets can be slow. Use "set sysroot" to access files locally instead. 
Reading /usr/bin/lwsws from remote target... Reading symbols from 
target:/usr/bin/lwsws...done. Reading /lib/ld-linux-armhf.so.3 from 
remote target... Reading /lib/ld-linux-armhf.so.3 from remote target... 
Reading symbols from target:/lib/ld-linux-armhf.so.3...(no debugging 
symbols found)...done. 0x76fd7a00 in _start () from 
target:/lib/ld-linux-armhf.so.3 (gdb) br main Breakpoint 1 at 0x10f3c 
(gdb) run The "remote" target does not support "run". Try "help target" 
or "continue". (gdb) c Continuing. Reading /usr/lib/libwebsockets.so.12 
from remote target... Reading /usr/lib/libz.so.1 from remote target... 
Reading /usr/lib/libssl.so.1.0.0 from remote target... Reading 
/usr/lib/libcrypto.so.1.0.0 from remote target... Reading 
/usr/lib/libuv.so.1 from remote target... Reading /lib/libm.so.6 from 
remote target... Reading /lib/libc.so.6 from remote target... Reading 
/lib/libdl.so.2 from remote target... Reading /lib/librt.so.1 from 
remote target... Reading /lib/libpthread.so.0 from remote target... 
Reading /lib/libnsl.so.1 from remote target... Breakpoint 1, 0x00010f3c 
in main () (gdb) |

So, if I now do:

l main

I get

(gdb)

Any hint tips, questions much appreciated.

Andrew

?
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190125/f71d5b83/attachment.html>
