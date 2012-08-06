From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Aug 2012 13:14:59 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2012-08-05
In-Reply-To: <20120806063153.244F252CFD7@lolut.humanoidz.org>
References: <20120806063153.244F252CFD7@lolut.humanoidz.org>
Message-ID: <20120806131459.491d4eaa@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Below I'm doing a quick analysis of today's build results. I have Cc'ed
the relevant people, so if you are in Cc, please read below, there are
comments for you.

Le Mon,  6 Aug 2012 08:31:53 +0200 (CEST),
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> a ?crit :

> On 2012-08-05, 88 random build tests have been done and
> submitted on autobuild.buildroot.net.
>  73 builds have been successful
>  15 builds have failed

Not bad :-)

> Build 9230aa432210c89da4cf66623f3476548a7a0d1e
> ==============================================
> 
> Status         : NOK
> Failure reason : webkit-1.2.7
> Architecture   : arm
> Submitted by   : Peter Korsgaard (gcc10)
> Submitted at   : 2012-08-05 00:05:07
> Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=6495c25cb0e8174a8a83483aff98e38943c98479
> End of log     : http://autobuild.buildroot.net/results/9230aa432210c89da4cf66623f3476548a7a0d1e/build-end.log
> Complete log   : http://autobuild.buildroot.net/results/9230aa432210c89da4cf66623f3476548a7a0d1e/build.log.bz2
> Configuration  : http://autobuild.buildroot.net/results/9230aa432210c89da4cf66623f3476548a7a0d1e/config
> Defconfig      : http://autobuild.buildroot.net/results/9230aa432210c89da4cf66623f3476548a7a0d1e/defconfig

This one is because WebKit apparently tries to include X11/Xlib.h even
though the Gtk it relies on has been built with the DirectFB backend.
So someone should figure out whether WebKit can actually work on top of
Gtk/DirectFB, or whether the X11 dependency is mandatory.

Who wants to take this?

> Build e1f847031ac795765365f84dbfb4b61f1acd65bc
> ==============================================
> 
> Status         : NOK
> Failure reason : gpsd-3.7
> Architecture   : powerpc
> Submitted by   : Peter Korsgaard (gcc14)
> Submitted at   : 2012-08-05 00:39:12
> Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=0e8dafcb3e1ddb7935c1c8c305e7e5598be30315
> End of log     : http://autobuild.buildroot.net/results/e1f847031ac795765365f84dbfb4b61f1acd65bc/build-end.log
> Complete log   : http://autobuild.buildroot.net/results/e1f847031ac795765365f84dbfb4b61f1acd65bc/build.log.bz2
> Configuration  : http://autobuild.buildroot.net/results/e1f847031ac795765365f84dbfb4b61f1acd65bc/config
> Defconfig      : http://autobuild.buildroot.net/results/e1f847031ac795765365f84dbfb4b61f1acd65bc/defconfig

An issue due to this build server having Python 2.5. Simon, can you
have a look into this? Thanks!

> Build a924fcfaa8a8fc9ed4a132afcaa9915c1b328bfb
> ==============================================
> 
> Status         : NOK
> Failure reason : gpsd-3.7
> Architecture   : arm
> Submitted by   : Peter Korsgaard (gcc10)
> Submitted at   : 2012-08-05 00:53:46
> Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=0e8dafcb3e1ddb7935c1c8c305e7e5598be30315
> End of log     : http://autobuild.buildroot.net/results/a924fcfaa8a8fc9ed4a132afcaa9915c1b328bfb/build-end.log
> Complete log   : http://autobuild.buildroot.net/results/a924fcfaa8a8fc9ed4a132afcaa9915c1b328bfb/build.log.bz2
> Configuration  : http://autobuild.buildroot.net/results/a924fcfaa8a8fc9ed4a132afcaa9915c1b328bfb/config
> Defconfig      : http://autobuild.buildroot.net/results/a924fcfaa8a8fc9ed4a132afcaa9915c1b328bfb/defconfig

Same gpsd problem.

> Build 54411695b05167998b54e832446cdb87b87eed7a
> ==============================================
> 
> Status         : NOK
> Failure reason : libffi-3.0.11
> Architecture   : sh2a
> Submitted by   : Thomas Petazzoni (Free Electrons build server)
> Submitted at   : 2012-08-05 01:29:14
> Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=0e8dafcb3e1ddb7935c1c8c305e7e5598be30315
> End of log     : http://autobuild.buildroot.net/results/54411695b05167998b54e832446cdb87b87eed7a/build-end.log
> Complete log   : http://autobuild.buildroot.net/results/54411695b05167998b54e832446cdb87b87eed7a/build.log.bz2
> Configuration  : http://autobuild.buildroot.net/results/54411695b05167998b54e832446cdb87b87eed7a/config
> Defconfig      : http://autobuild.buildroot.net/results/54411695b05167998b54e832446cdb87b87eed7a/defconfig

libffi does not have sh2a support, and even though it's possible to add
a "depends on !BR2_sh2a" on this package, we would have to add it to
the enormous number of reverse dependencies that rely on libffi.

Seeing the number of failures we have on sh2a, and the fact that this
architecture is almost no longer used by anyone, I'm considering
dropping this toolchain configuration from the autobuilder.

Phil, what is your opinion about SH2A support in Buildroot. Are you
interested in us keeping this support? If so, are you willing to
dedicate a bit of time to help us solving the sh2a related build
problems?

> Build 76eda3ff6ea7b43ca2fc3349dc2317ff7d4b5f28
> ==============================================
> 
> Status         : NOK
> Failure reason : microperl-5.12.4
> Architecture   : sh2a
> Submitted by   : Thomas Petazzoni (Free Electrons build server)
> Submitted at   : 2012-08-05 01:31:18
> Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=0e8dafcb3e1ddb7935c1c8c305e7e5598be30315
> End of log     : http://autobuild.buildroot.net/results/76eda3ff6ea7b43ca2fc3349dc2317ff7d4b5f28/build-end.log
> Complete log   : http://autobuild.buildroot.net/results/76eda3ff6ea7b43ca2fc3349dc2317ff7d4b5f28/build.log.bz2
> Configuration  : http://autobuild.buildroot.net/results/76eda3ff6ea7b43ca2fc3349dc2317ff7d4b5f28/config
> Defconfig      : http://autobuild.buildroot.net/results/76eda3ff6ea7b43ca2fc3349dc2317ff7d4b5f28/defconfig

Another, unknown sh2a build problem. Probably a toolchain bug or
something.

> Build b8484bd534840dc8528abaaf2e8ac07692811a8a
> ==============================================
> 
> Status         : NOK
> Failure reason : gpsd-3.7
> Architecture   : powerpc
> Submitted by   : Peter Korsgaard (gcc14)
> Submitted at   : 2012-08-05 04:18:29
> Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=0e8dafcb3e1ddb7935c1c8c305e7e5598be30315
> End of log     : http://autobuild.buildroot.net/results/b8484bd534840dc8528abaaf2e8ac07692811a8a/build-end.log
> Complete log   : http://autobuild.buildroot.net/results/b8484bd534840dc8528abaaf2e8ac07692811a8a/build.log.bz2
> Configuration  : http://autobuild.buildroot.net/results/b8484bd534840dc8528abaaf2e8ac07692811a8a/config
> Defconfig      : http://autobuild.buildroot.net/results/b8484bd534840dc8528abaaf2e8ac07692811a8a/defconfig

Same gpsd Python 2.5 problem. Simon :-)

> Build 01235a0ed0c02933a7bd6da4ede9ebd1ec495a90
> ==============================================
> 
> Status         : NOK
> Failure reason : gnutls-2.12.19
> Architecture   : arm
> Submitted by   : Thomas Petazzoni (Free Electrons build server)
> Submitted at   : 2012-08-05 04:33:04
> Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=0e8dafcb3e1ddb7935c1c8c305e7e5598be30315
> End of log     : http://autobuild.buildroot.net/results/01235a0ed0c02933a7bd6da4ede9ebd1ec495a90/build-end.log
> Complete log   : http://autobuild.buildroot.net/results/01235a0ed0c02933a7bd6da4ede9ebd1ec495a90/build.log.bz2
> Configuration  : http://autobuild.buildroot.net/results/01235a0ed0c02933a7bd6da4ede9ebd1ec495a90/config
> Defconfig      : http://autobuild.buildroot.net/results/01235a0ed0c02933a7bd6da4ede9ebd1ec495a90/defconfig

Build problem of gnutls trying to link against the host libpthread. The
toolchain is built with the Crosstool-NG backend, so the defconfig is
completely standalone and the problem can be reproduced and
investigated by anyone.

A volunteer?

> Build 067e508109ce7b53b3c97dd19817a71b6fa561fb
> ==============================================
> 
> Status         : NOK
> Failure reason : lua-5.1.5
> Architecture   : mipsel
> Submitted by   : Thomas Petazzoni (Free Electrons build server)
> Submitted at   : 2012-08-05 07:54:38
> Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=0e8dafcb3e1ddb7935c1c8c305e7e5598be30315
> End of log     : http://autobuild.buildroot.net/results/067e508109ce7b53b3c97dd19817a71b6fa561fb/build-end.log
> Complete log   : http://autobuild.buildroot.net/results/067e508109ce7b53b3c97dd19817a71b6fa561fb/build.log.bz2
> Configuration  : http://autobuild.buildroot.net/results/067e508109ce7b53b3c97dd19817a71b6fa561fb/config
> Defconfig      : http://autobuild.buildroot.net/results/067e508109ce7b53b3c97dd19817a71b6fa561fb/defconfig

Fran?ois, can you submit a patch that simply fixes this problem. I know
you have sent other patches regarding Lua, but I want a patch for the
'master' branch that only fixes this bug (i.e, adds -fPIC to the build
flags when necessary). Thanks!

> Build 6a98c66538098948bf6b3c9cc6e31debd2301c43
> ==============================================
> 
> Status         : NOK
> Failure reason : xenomai-2.6.0
> Architecture   : arm
> Submitted by   : Thomas Petazzoni (Free Electrons build server)
> Submitted at   : 2012-08-05 11:19:12
> Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=0e8dafcb3e1ddb7935c1c8c305e7e5598be30315
> End of log     : http://autobuild.buildroot.net/results/6a98c66538098948bf6b3c9cc6e31debd2301c43/build-end.log
> Complete log   : http://autobuild.buildroot.net/results/6a98c66538098948bf6b3c9cc6e31debd2301c43/build.log.bz2
> Configuration  : http://autobuild.buildroot.net/results/6a98c66538098948bf6b3c9cc6e31debd2301c43/config
> Defconfig      : http://autobuild.buildroot.net/results/6a98c66538098948bf6b3c9cc6e31debd2301c43/defconfig

Xenomai build problem on Thumb2 toolchains apparently. I've asked the
Xenomai ARM maintainer about this.

> Build b1dc123268f513f40b386bac015945441cc6030c
> ==============================================
> 
> Status         : NOK
> Failure reason : quota-4.00
> Architecture   : mips
> Submitted by   : Thomas Petazzoni (Free Electrons build server)
> Submitted at   : 2012-08-05 16:01:31
> Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=58dbdce29eaacd8a7d5bbc2eb6eebcd29efa7052
> End of log     : http://autobuild.buildroot.net/results/b1dc123268f513f40b386bac015945441cc6030c/build-end.log
> Complete log   : http://autobuild.buildroot.net/results/b1dc123268f513f40b386bac015945441cc6030c/build.log.bz2
> Configuration  : http://autobuild.buildroot.net/results/b1dc123268f513f40b386bac015945441cc6030c/config
> Defconfig      : http://autobuild.buildroot.net/results/b1dc123268f513f40b386bac015945441cc6030c/defconfig

Compiler bug I guess. I don't see another choice than disabling the
build of this package for this specific toolchain in my autobuilders
scripts.

Maybe we should add a "Known problems" section in the documentation,
which lists things that we know don't compile and that we will not fix.
Thoughts?

> Build 8f8e3ac130d302828622c17609bdfe53acd60234
> ==============================================
> 
> Status         : NOK
> Failure reason : kexec-2.0.3
> Architecture   : mipsel
> Submitted by   : Thomas Petazzoni (Free Electrons build server)
> Submitted at   : 2012-08-05 17:15:50
> Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=58dbdce29eaacd8a7d5bbc2eb6eebcd29efa7052
> End of log     : http://autobuild.buildroot.net/results/8f8e3ac130d302828622c17609bdfe53acd60234/build-end.log
> Complete log   : http://autobuild.buildroot.net/results/8f8e3ac130d302828622c17609bdfe53acd60234/build.log.bz2
> Configuration  : http://autobuild.buildroot.net/results/8f8e3ac130d302828622c17609bdfe53acd60234/config
> Defconfig      : http://autobuild.buildroot.net/results/8f8e3ac130d302828622c17609bdfe53acd60234/defconfig

Smells like some mips64 issue related to the fact that we don't pass
the right architecture name in the machine tuple. Gustavo?

> Build 3209a7f8b156b4c515a5878480424acfa6187ed7
> ==============================================
> 
> Status         : NOK
> Failure reason : gnutls-2.12.19
> Architecture   : arm
> Submitted by   : Thomas Petazzoni (Free Electrons build server)
> Submitted at   : 2012-08-05 19:48:54
> Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=58dbdce29eaacd8a7d5bbc2eb6eebcd29efa7052
> End of log     : http://autobuild.buildroot.net/results/3209a7f8b156b4c515a5878480424acfa6187ed7/build-end.log
> Complete log   : http://autobuild.buildroot.net/results/3209a7f8b156b4c515a5878480424acfa6187ed7/build.log.bz2
> Configuration  : http://autobuild.buildroot.net/results/3209a7f8b156b4c515a5878480424acfa6187ed7/config
> Defconfig      : http://autobuild.buildroot.net/results/3209a7f8b156b4c515a5878480424acfa6187ed7/defconfig

Exact same problem as above: Crosstool-NG toolchain generated with the
Crosstool-NG backend, gnutls picks up the wrong libpthread.

> Build 3d7f8a8dbbf7acea9b3f3273a93c3fcf30be0404
> ==============================================
> 
> Status         : NOK
> Failure reason : xlib_libX11-1.3.2
> Architecture   : sh2a
> Submitted by   : Thomas Petazzoni (Free Electrons build server)
> Submitted at   : 2012-08-05 22:53:23
> Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=58dbdce29eaacd8a7d5bbc2eb6eebcd29efa7052
> End of log     : http://autobuild.buildroot.net/results/3d7f8a8dbbf7acea9b3f3273a93c3fcf30be0404/build-end.log
> Complete log   : http://autobuild.buildroot.net/results/3d7f8a8dbbf7acea9b3f3273a93c3fcf30be0404/build.log.bz2
> Configuration  : http://autobuild.buildroot.net/results/3d7f8a8dbbf7acea9b3f3273a93c3fcf30be0404/config
> Defconfig      : http://autobuild.buildroot.net/results/3d7f8a8dbbf7acea9b3f3273a93c3fcf30be0404/defconfig

sh2a problem again. Not sure what's happening here.

> Build 2412db1aa463c1024e7ff6cbc651f428db3ba0bf
> ==============================================
> 
> Status         : NOK
> Failure reason : lua-5.1.5
> Architecture   : x86_64
> Submitted by   : Thomas Petazzoni (Free Electrons build server)
> Submitted at   : 2012-08-05 23:48:35
> Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=58dbdce29eaacd8a7d5bbc2eb6eebcd29efa7052
> End of log     : http://autobuild.buildroot.net/results/2412db1aa463c1024e7ff6cbc651f428db3ba0bf/build-end.log
> Complete log   : http://autobuild.buildroot.net/results/2412db1aa463c1024e7ff6cbc651f428db3ba0bf/build.log.bz2
> Configuration  : http://autobuild.buildroot.net/results/2412db1aa463c1024e7ff6cbc651f428db3ba0bf/config
> Defconfig      : http://autobuild.buildroot.net/results/2412db1aa463c1024e7ff6cbc651f428db3ba0bf/defconfig

Same lua -fPIC problem. Fran?ois ? :-)

> Build ef517be1b69a6e340dad23da50723f2c11171099
> ==============================================
> 
> Status         : NOK
> Failure reason : icu-4.8.1.1
> Architecture   : bfin
> Submitted by   : Thomas Petazzoni (Free Electrons build server)
> Submitted at   : 2012-08-05 23:57:52
> Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=58dbdce29eaacd8a7d5bbc2eb6eebcd29efa7052
> End of log     : http://autobuild.buildroot.net/results/ef517be1b69a6e340dad23da50723f2c11171099/build-end.log
> Complete log   : http://autobuild.buildroot.net/results/ef517be1b69a6e340dad23da50723f2c11171099/build.log.bz2
> Configuration  : http://autobuild.buildroot.net/results/ef517be1b69a6e340dad23da50723f2c11171099/config
> Defconfig      : http://autobuild.buildroot.net/results/ef517be1b69a6e340dad23da50723f2c11171099/defconfig

Don't know what's happening here. It happens with the Blackfin default
external toolchain, so anyone can reproduce.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
