From: Kyle Hayes <kyle@greenmonitor.com>
Date: Thu, 20 Jan 2011 08:49:44 -0800
Subject: [Buildroot] ssh-keygen seg fault
In-Reply-To: <AANLkTimYCqwq8GB9LgBeSiDt+mDUzSrcZZWwji8-kRwA@mail.gmail.com>
References: <AANLkTi=OafFhejBCDjz-rffd3_gFR99kzxcGP3o+EmEM@mail.gmail.com>
	<20110114090752.5f01ade5@surf>
	<469243A17FE74439A7BBB6F327046F20@beraninstruments.com.local>
	<20110114104016.252e7f90@surf>
	<AANLkTi=kVHeatBJ1G2wZsX1ww-FOV0qb5Vtf5rxXNneL@mail.gmail.com>
	<20110114181920.59ba8b8b@surf>
	<AANLkTik4ZfnUpWeg91eWqMXGSxEX-H3c5L6+LDM_BqdU@mail.gmail.com>
	<87sjwpfaot.fsf@macbook.be.48ers.dk>
	<AANLkTinJ1e9Q9V0YscnQ=s9ALVyvbJn_bZYPLeLeee+A@mail.gmail.com>
	<87d3nsg0yr.fsf@macbook.be.48ers.dk>
	<AANLkTimYCqwq8GB9LgBeSiDt+mDUzSrcZZWwji8-kRwA@mail.gmail.com>
Message-ID: <AANLkTimoyKO53PPatrYjuQ=CoWxxXvbxE01ZraFR8hvQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter, Thomas,

See below.

On Wed, Jan 19, 2011 at 11:14 AM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Kyle" == Kyle Hayes <kyle@greenmonitor.com> writes:
>
> Hi,
>
>  >> Buildroot handles small changes like adding a package quite well, but
>  >> for global changes like toolchain options or strip/no-strip you'll need
>  >> to make clean; make
>
>  Kyle> I think something I'm doing is still incorrect:
>
>  Kyle> kyle at hp-workstation:~/buildroot/buildroot$
>  Kyle> ./output/toolchain/gdbhost-7.1/gdb/gdb
>
> Normally you would use output/staging/usr/bin/$PREFIX-gdb, but OK.
>
>  Kyle> GNU gdb (GDB) 7.1
>  Kyle> Copyright (C) 2010 Free Software Foundation, Inc.
>  Kyle> License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
>  Kyle> This is free software: you are free to change and redistribute it.
>  Kyle> There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
>  Kyle> and "show warranty" for details.
>  Kyle> This GDB was configured as "--host=i686-pc-linux-gnu
>  Kyle> --target=i486-unknown-linux-uclibc".
>  Kyle> For bug reporting instructions, please see:
>  Kyle> <http://www.gnu.org/software/gdb/bugs/>.
>  Kyle> (gdb) set solib-absolute-prefix
>  Kyle> /home/kyle/buildroot/buildroot/output/staging/lib/
>
> Don't add lib at the end. solib-absolute-prefix is a PREFIX, not the
> location of the library files.
>
>  Kyle> (gdb) file output/target/usr/bin/ssh-keygen
>  Kyle> Reading symbols from
>  Kyle> /home/kyle/buildroot/buildroot/output/target/usr/bin/ssh-keygen...done.
>
> Again, please point gdb at the unstripped version in
> output/build/openssh*/ssh-keygen instead of the (potentially) stripped
> version in target.
>
>  Kyle> If I run ssh-keygen on the command line on the target machine, I get a
>  Kyle> seg fault and I get "ssh-keygen used greatest stack depth: 6460 bytes
>  Kyle> left"  I have stack smashing protection turned on.  Is this an
>  Kyle> infinite recursion problem or just a normal output from the system
>  Kyle> about this? Other commands from busybox do not print out this error
>  Kyle> about the stack.
>
> Sorry. don't know. I've never uses the SSP stuff.
>
>  Kyle> I tried adding 'no-asm' to the list of options for openssl and
>  Kyle> rebuilding that (just a make at the top level does not rebuild
>  Kyle> openssl, is that correct behavior?).  I get the same behavior.
>
> Rebuild is controlled by the .stamp_* files inside build/openssl*/, so
> it only gets rebuilt if you remove those (or remove the entire openssl
> dir). Notice that dependent packages don't get rebuilt automatically.
>

Something I'm doing is still incorrect I think:

(gdb) set solib-absolute-prefix /home/kyle/buildroot/buildroot/output/staging/
(gdb) file output/build/openssh-5.6p1/ssh-keygen
Reading symbols from
/home/kyle/buildroot/buildroot/output/build/openssh-5.6p1/ssh-keygen...done.
(gdb) target remote 10.206.1.102:4567
Remote debugging using 10.206.1.102:4567
Reading symbols from
/home/kyle/buildroot/buildroot/output/staging/lib/ld-uClibc.so.0...(no
debugging symbols found)...done.
Loaded symbols for
/home/kyle/buildroot/buildroot/output/staging/lib/ld-uClibc.so.0
0xb7792870 in _start () from
/home/kyle/buildroot/buildroot/output/staging/lib/ld-uClibc.so.0
(gdb) run
The "remote" target does not support "run".  Try "help target" or "continue".
(gdb) set args -t rsa
(gdb) continue
Continuing.

Program received signal SIGSEGV, Segmentation fault.
main (argc=-1081803087, argv=0x0) at ssh-keygen.c:1762
1762	{
(gdb)

I do not understand why ld-uClibc has no debugging symbols.  I have
enabled debug in the Buildroot config and done (several) make clean;
make.  This time has fewer errors.  I will try to make openssh
independently with no-asm specified.

The failure point is always the same: the first line of main().  Is
this perhaps a kernel problem?

Best,
Kyle
