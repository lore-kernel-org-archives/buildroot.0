From: daggs <daggs@gmx.com>
Date: Sat, 30 Dec 2017 07:44:43 +0100
Subject: [Buildroot] [PATCH] libtirpc: fix compilation error
In-Reply-To: <20171229222345.7ecb9545@windsurf.lan>
References: <20171229130333.13661-1-daggs@gmx.com>
 <20171229143805.7f083140@windsurf.lan>
 <trinity-145e0c2a-2583-47ec-b583-2128a636e7e6-1514557451788@3c-app-mailcom-bs06>
 <20171229222345.7ecb9545@windsurf.lan>
Message-ID: <trinity-bca13856-de1a-42f4-a4d4-41193f6eaf92-1514616283921@3c-app-mailcom-bs04>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings Thomas,

> 
> > config to reproduce:
> > BR2_x86_i686=y
> > BR2_PACKAGE_LIBTIRPC=y
> > 
> > no idea why the autobuilds didn't caught it.
> 
> I initially couldn't reproduce it, but after thinking more about the
> problem, I understood what happened: you don't have RPC support
> installed in your host system. The build of the rpcgen host program
> fails to build because it can't find those headers, which on my system
> (or the autobuilder instances) are provided system-wide.
weird, I have it too on my system:
dagg at NCC-5001-D ~ $ ll /usr/include/tirpc/rpc/types.h
-rw-r--r-- 1 root root 3270 Dec  1 15:44 /usr/include/tirpc/rpc/types.h
dagg at NCC-5001-D ~ $ eix net-libs/libtirpc
[I] net-libs/libtirpc
     Available versions:  1.0.1-r1(0/3) 1.0.2-r1(0/3) [m]1.0.2-r1(0/3)[1] {ipv6 kerberos static-libs ABI_MIPS="n32 n64 o32" ABI_PPC="32 64" ABI_S390="32 64" ABI_X86="32 64 x32"}
     Installed versions:  1.0.2-r1(0/3)(15:44:39 01/12/17)(-ipv6 -kerberos -static-libs ABI_MIPS="-n32 -n64 -o32" ABI_PPC="-32 -64" ABI_S390="-32 -64" ABI_X86="64 -32 -x32")
     Homepage:            http://libtirpc.sourceforge.net/
     Description:         Transport Independent RPC library (SunRPC replacement)

[1] "musl" /var/lib/layman/musl
dagg at NCC-5001-D ~ $ qfile /usr/include/tirpc/rpc/types.h
net-libs/libtirpc (/usr/include/tirpc/rpc/types.h)

I wonder why it didn't reproduced when you tried it.
maybe it is a global include config or something, does buildroot appends to existing includes or uses a blanked one?

> 
> So indeed, your patch is correct. Just the explanation was not
> sufficient, so I've reworded the commit log accordingly.
I was never good with words, thanks!


Dagg.
