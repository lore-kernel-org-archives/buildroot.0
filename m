From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 19 Jan 2011 20:14:36 +0100
Subject: [Buildroot] ssh-keygen seg fault
In-Reply-To: <AANLkTinJ1e9Q9V0YscnQ=s9ALVyvbJn_bZYPLeLeee+A@mail.gmail.com>
	(Kyle Hayes's message of "Wed, 19 Jan 2011 09:50:11 -0800")
References: <AANLkTi=OafFhejBCDjz-rffd3_gFR99kzxcGP3o+EmEM@mail.gmail.com>
	<20110114090752.5f01ade5@surf>
	<469243A17FE74439A7BBB6F327046F20@beraninstruments.com.local>
	<20110114104016.252e7f90@surf>
	<AANLkTi=kVHeatBJ1G2wZsX1ww-FOV0qb5Vtf5rxXNneL@mail.gmail.com>
	<20110114181920.59ba8b8b@surf>
	<AANLkTik4ZfnUpWeg91eWqMXGSxEX-H3c5L6+LDM_BqdU@mail.gmail.com>
	<87sjwpfaot.fsf@macbook.be.48ers.dk>
	<AANLkTinJ1e9Q9V0YscnQ=s9ALVyvbJn_bZYPLeLeee+A@mail.gmail.com>
Message-ID: <87d3nsg0yr.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Kyle" == Kyle Hayes <kyle@greenmonitor.com> writes:

Hi,

 >> Buildroot handles small changes like adding a package quite well, but
 >> for global changes like toolchain options or strip/no-strip you'll need
 >> to make clean; make

 Kyle> I think something I'm doing is still incorrect:

 Kyle> kyle at hp-workstation:~/buildroot/buildroot$
 Kyle> ./output/toolchain/gdbhost-7.1/gdb/gdb

Normally you would use output/staging/usr/bin/$PREFIX-gdb, but OK.

 Kyle> GNU gdb (GDB) 7.1
 Kyle> Copyright (C) 2010 Free Software Foundation, Inc.
 Kyle> License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
 Kyle> This is free software: you are free to change and redistribute it.
 Kyle> There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
 Kyle> and "show warranty" for details.
 Kyle> This GDB was configured as "--host=i686-pc-linux-gnu
 Kyle> --target=i486-unknown-linux-uclibc".
 Kyle> For bug reporting instructions, please see:
 Kyle> <http://www.gnu.org/software/gdb/bugs/>.
 Kyle> (gdb) set solib-absolute-prefix
 Kyle> /home/kyle/buildroot/buildroot/output/staging/lib/

Don't add lib at the end. solib-absolute-prefix is a PREFIX, not the
location of the library files.

 Kyle> (gdb) file output/target/usr/bin/ssh-keygen
 Kyle> Reading symbols from
 Kyle> /home/kyle/buildroot/buildroot/output/target/usr/bin/ssh-keygen...done.

Again, please point gdb at the unstripped version in
output/build/openssh*/ssh-keygen instead of the (potentially) stripped
version in target.

 Kyle> If I run ssh-keygen on the command line on the target machine, I get a
 Kyle> seg fault and I get "ssh-keygen used greatest stack depth: 6460 bytes
 Kyle> left"  I have stack smashing protection turned on.  Is this an
 Kyle> infinite recursion problem or just a normal output from the system
 Kyle> about this? Other commands from busybox do not print out this error
 Kyle> about the stack.

Sorry. don't know. I've never uses the SSP stuff.

 Kyle> I tried adding 'no-asm' to the list of options for openssl and
 Kyle> rebuilding that (just a make at the top level does not rebuild
 Kyle> openssl, is that correct behavior?).  I get the same behavior.

Rebuild is controlled by the .stamp_* files inside build/openssl*/, so
it only gets rebuilt if you remove those (or remove the entire openssl
dir). Notice that dependent packages don't get rebuilt automatically.

-- 
Bye, Peter Korsgaard
