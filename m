From: Vellemans, Noel <Noel.Vellemans@visionBMS.com>
Date: Tue, 27 Oct 2009 09:23:34 +0100
Subject: [Buildroot] Autoconf - confirmation  !/bin/sh tests. (M4 )
In-Reply-To: <87d44afhoy.fsf@macbook.be.48ers.dk>
References: <1531E53627F1F749B4FE809BF2A4EB67013CF4C7@WETMEX10.loepfe.com><87a5b0800910260335v1849578y2dadfde9b4a91b22@mail.gmail.com><1531E53627F1F749B4FE809BF2A4EB67013CF69D@WETMEX10.loepfe.com><87a5b0800910260448i2c2d815ep6d16409288fb63e2@mail.gmail.com><1531E53627F1F749B4FE809BF2A4EB67013CF6E1@WETMEX10.loepfe.com><87a5b0800910260511ta958c1ehaaae17914a5792a2@mail.gmail.com><1531E53627F1F749B4FE809BF2A4EB67013CF704@WETMEX10.loepfe.com>
	<87d44afhoy.fsf@macbook.be.48ers.dk>
Message-ID: <1531E53627F1F749B4FE809BF2A4EB67013F6051@WETMEX10.loepfe.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All..

<Peter > Ok, so the easiest fix is probably to to s^!/bin/sh^!/bin/bash^
on the
<Peter > first line of the configure script - And then report the issue
upstream.
<Peter > 
<Peter > What I don't get is that Johan wrote that the configure script
didn't
<Peter > break when run outside buildroot - How could that be?

Peter, Just to confirm : I checked once more it, and I have to confirm.
(for !/bin/sh)
Running from make (autoconf-host) configure fails, running manually with
the same parameters works.

NOTE in the folowing test I have edited the autoconf-host configure
script .. so that is does echo something on the problematic line .. 

[
echo'changequote(<,>)indir(<ifdef>,mac,bug)patsubst(a,\(b\)\|\(a\),\1)dn
l' | /buildhome/20091024/buildroot/output/host/usr/bin/m4 --trace=mac 
as fas as I understood this should not echo anything. ]


<< snip >>
noel at viper:/buildhome/20091024/buildroot$ make

Checking build system dependencies:
Overriding $(DL_DIR) in '.config'.		Ok
External download directory:			Ok (/buildhome/dl/)
CC clean:					Ok

.... removed some stuff ...here...
.... removed some stuff ...here...

checking for expr... /usr/bin/expr
checking for GNU M4 that supports accurate traces... 

[!!!! A FUNNY CHARACTER is printed here . NON ASCII !!!!!!!!!!]

configure: error: no acceptable m4 could be found in $PATH.
GNU M4 1.4.6 or later is required; 1.4.13 is recommended
make: ***
[/buildhome/20091024/buildroot/output/stamps/host_autoconf_configured]
Error 1

<< end snip >>




If I do run the same (modified) configure script manually.

<< snip 2>>
noel at viper:/buildhome/20091024/buildroot/output/build/autoconf-2.64-host
$ ./configure --prefix=/buildhome/20091024/buildroot/output/host/usr
--sysconfdir=/buildhome/20091024/buildroot/output/host/etc
--disable-static
configure: WARNING: unrecognized options: --disable-static
checking for a BSD-compatible install... /usr/bin/install -c
checking whether build environment is sane... yes
checking for a thread-safe mkdir -p... /bin/mkdir -p
checking for gawk... gawk
checking whether make sets $(MAKE)... yes
checking whether /bin/sh -n is known to work... no
checking for characters that cannot appear in file names... none
checking whether directories can have trailing spaces... yes
checking for expr... /usr/bin/expr
checking for GNU M4 that supports accurate traces... /usr/bin/m4
checking whether /usr/bin/m4 accepts --gnu... no
configure: WARNING: The version of M4 that was found does not support
-g.
configure: WARNING: Using it with POSIXLY_CORRECT set may cause
problems.

.... removed some stuff ...here...
.... removed some stuff ...here...

config.status: creating lib/autotest/Makefile
config.status: creating bin/Makefile
config.status: executing tests/atconfig commands
configure: WARNING: unrecognized options: --disable-static

<< end snip 2 >>

Nothing is echo-ed here for the same 'echo'. 


Conclusion: 
1) while running the SAME configure script called from make .. it fails
(because one because  test -z "`echo $ac_snippet | $ac_path_M4
--trace=mac 2>&1`" is failing) 
2) If the same (autoconf-host) configure is called manually it runs
fine.


Hope this helps, in reporting this issue upstream. 


Also .. a BIG thanks to everyone for helping/debugging.


Noel.
