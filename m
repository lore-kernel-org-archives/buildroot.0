From: Kyle Hayes <kyle@greenmonitor.com>
Date: Wed, 19 Jan 2011 09:50:11 -0800
Subject: [Buildroot] ssh-keygen seg fault
In-Reply-To: <87sjwpfaot.fsf@macbook.be.48ers.dk>
References: <AANLkTi=OafFhejBCDjz-rffd3_gFR99kzxcGP3o+EmEM@mail.gmail.com>
	<20110114090752.5f01ade5@surf>
	<469243A17FE74439A7BBB6F327046F20@beraninstruments.com.local>
	<20110114104016.252e7f90@surf>
	<AANLkTi=kVHeatBJ1G2wZsX1ww-FOV0qb5Vtf5rxXNneL@mail.gmail.com>
	<20110114181920.59ba8b8b@surf>
	<AANLkTik4ZfnUpWeg91eWqMXGSxEX-H3c5L6+LDM_BqdU@mail.gmail.com>
	<87sjwpfaot.fsf@macbook.be.48ers.dk>
Message-ID: <AANLkTinJ1e9Q9V0YscnQ=s9ALVyvbJn_bZYPLeLeee+A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks for the tips.  See below:

On Wed, Jan 19, 2011 at 2:29 AM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Kyle" == Kyle Hayes <kyle@greenmonitor.com> writes:
>
> Hi,
>
> ?Kyle> I got a core file. ?I have a target GDB for use with host programs. ?I
> ?Kyle> turned off stripping. ?But...
>
> ?Kyle> sudo /home/kyle/buildroot/buildroot/output/toolchain/gdbhost-7.1/gdb/gdb
> ?Kyle> /home/kyle/buildroot/buildroot/output/target/usr/bin/ssh-keygen
> ?Kyle> /media/HC/core
>
> You don't need sudo.

I needed sudo because the core file was not readable by a normal user.

> You can do this even with stripping, if you point gdb at the unstripped
> version in output/build/...
>
> To get gdb to find the correct shared libs, you'll need to do
> set solib-absolute-prefix path/to/output/staging

Ah, OK.

> ?Kyle> Uh, so somewhere I managed to build everything without any debugging
> ?Kyle> symbols. ?I'll try again. ?Sigh. ?The compile/edit/retry cycle on this
> ?Kyle> is quite long. ?How "smart" is Builtroot when I change configuration?
> ?Kyle> Will it just rebuild the things I need to rebuild? ?I've been doing a
> ?Kyle> "make clean" before every attempt.
>
> Buildroot handles small changes like adding a package quite well, but
> for global changes like toolchain options or strip/no-strip you'll need
> to make clean; make

I think something I'm doing is still incorrect:

kyle at hp-workstation:~/buildroot/buildroot$
./output/toolchain/gdbhost-7.1/gdb/gdb
GNU gdb (GDB) 7.1
Copyright (C) 2010 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
and "show warranty" for details.
This GDB was configured as "--host=i686-pc-linux-gnu
--target=i486-unknown-linux-uclibc".
For bug reporting instructions, please see:
<http://www.gnu.org/software/gdb/bugs/>.
(gdb) set solib-absolute-prefix
/home/kyle/buildroot/buildroot/output/staging/lib/
(gdb) file output/target/usr/bin/ssh-keygen
Reading symbols from
/home/kyle/buildroot/buildroot/output/target/usr/bin/ssh-keygen...done.
(gdb) target remote 10.206.1.102:4567
Remote debugging using 10.206.1.102:4567
warning: Unable to find dynamic linker breakpoint function.
GDB will be unable to debug shared library initializers
and track explicitly loaded dynamic code.
0xb787d870 in ?? ()
(gdb) continue
Continuing.
Error while mapping shared library sections:
/usr/lib/libcrypto.so.1.0.0: No such file or directory.
Error while mapping shared library sections:
/lib/libdl.so.0: No such file or directory.
Error while mapping shared library sections:
/lib/libutil.so.0: No such file or directory.
Error while mapping shared library sections:
/usr/lib/libz.so.1: No such file or directory.
Error while mapping shared library sections:
/lib/libcrypt.so.0: No such file or directory.
Error while mapping shared library sections:
/lib/libgcc_s.so.1: No such file or directory.
Error while mapping shared library sections:
/lib/libc.so.0: No such file or directory.
Error while mapping shared library sections:
/lib/ld-uClibc.so.0: No such file or directory.

Program received signal SIGSEGV, Segmentation fault.
main (argc=-1078251855, argv=0x0) at ssh-keygen.c:1762
1762	{
(gdb)


If I run ssh-keygen on the command line on the target machine, I get a
seg fault and I get "ssh-keygen used greatest stack depth: 6460 bytes
left"  I have stack smashing protection turned on.  Is this an
infinite recursion problem or just a normal output from the system
about this? Other commands from busybox do not print out this error
about the stack.

I tried adding 'no-asm' to the list of options for openssl and
rebuilding that (just a make at the top level does not rebuild
openssl, is that correct behavior?).  I get the same behavior.
However, I am not sure that I'm getting the right version of openssl.
 If I just change the Makefile for openssl to add the option, then a
remake with just "make" at the top level does NOT rebuild openssl.
How do I force this?  If I do a make clean, all the output/target
stuff is gone and I have nothing to change.

I tried with dropbear and it works.  I will probably go with that for now.

Best,
Kyle
