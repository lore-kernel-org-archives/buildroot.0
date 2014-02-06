From: Johannes Morgenroth <morgenroth@ibr.cs.tu-bs.de>
Date: Thu, 06 Feb 2014 17:05:16 +0100
Subject: [Buildroot] SIGSEGV in __pthread_initialize_minimal_internal ()
Message-ID: <52F3B2BC.3000904@ibr.cs.tu-bs.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello.

I try to compile a DTN stack (IBR-DTN) as static binary using buildroot.
Formerly with the release 2012.02 this wasn't an issue, but since my
recent system no longer compile the old release, I tried the new one but
without any luck. Any static binary I compile exists with a SIGSEGV. To
reproduce my set-up, I pushed my repository (based on the recent master)
to github.
https://github.com/ibrdtn/buildroot.git

I used the configuration stored in the added default configuration
'ibrdtn_x86_defconfig'. So my steps are...

$ make ibrdtn_x86_defconfig
$ make
(get a coffee)
$ ./output/target/usr/sbin/dtnd --version
Segmentation fault (core dumped)

To investigate that fault, I compiled the toolchain with debug symbols
and the GDB points me to __pthread_initialize_minimal_internal ().

$ gdb --args ./output/build/ibrdtnd-0.10.2/src/dtnd
GNU gdb (GDB) 7.6.1-ubuntu
Copyright (C) 2013 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later
<http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
and "show warranty" for details.
This GDB was configured as "x86_64-linux-gnu".
For bug reporting instructions, please see:
<http://www.gnu.org/software/gdb/bugs/>...
Reading symbols from ./output/build/ibrdtnd-0.10.2/src/dtnd...done.
(gdb) r
Starting program: ./output/build/ibrdtnd-0.10.2/src/dtnd

Program received signal SIGSEGV, Segmentation fault.
0x082b81f1 in __pthread_initialize_minimal_internal ()
(gdb) bt
#0  0x082b81f1 in __pthread_initialize_minimal_internal ()
#1  0x08408797 in __uClibc_init ()
#2  0x08408939 in __uClibc_main ()
#3  0x08049111 in _start ()
(gdb)

I assume this may has to do with some sort of order issues while linking
the libraries, but I am not sure and have no idea where to start with
the debugging. Any help or advice is appreciated.

Thanks!
Johannes

-- 
Johannes Morgenroth     Institut fuer Betriebssysteme und Rechnerverbund
Tel.: +49-531-391-3249                           Muehlenpfordtstrasse 23
Fax.: +49-531-391-5936      TU Braunschweig         D-38106 Braunschweig
