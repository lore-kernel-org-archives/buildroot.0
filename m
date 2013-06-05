From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jun 2013 18:29:24 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2013-06-04
In-Reply-To: <20130605063004.4425352C13E@lolut.humanoidz.org>
References: <20130605063004.4425352C13E@lolut.humanoidz.org>
Message-ID: <20130605182924.71a07679@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  5 Jun 2013 08:30:04 +0200 (CEST), Thomas Petazzoni wrote:

>              host-libftdi-0.19 | 20

Those issues are caused by the bump of libtool, from the testing I
could do. Reverting libtool to the previous version "solves" the
problem.

The thing that happens is that libftdi (for the target) has
AUTORECONF=YES, but not host-libftdi. So libftdi gets autoreconfigured,
and then when host-libftdi is being built, even though we don't have
AUTORECONF=YES, when starting the build, it does execute
'CDPATH="${ZSH_VERSION+.}:" && cd .
&& /bin/bash /home/test/outputs/libftdi/build/host-libftdi-0.19/missing
--run aclocal-1.11 ' and it ends up failing.

If you just build host-libftdi, without having built libftdi before, it
does not fail.

>                    bzip2-1.0.6 | 16

Shared vs. static thing, being handled by Markos.

>                   libbsd-0.4.2 | 12

PowerPC does not have a.out.h. But mipsel also doesn't
(http://autobuild.buildroot.org/results/019/019091312ec547520370ffad967b53e23f54a14b/build-end.log),
libbsd doesn't have support for AArch64
(http://autobuild.buildroot.org/results/87c/87c3a8bf2248606d80ddcfd96132de4c5fe869ed/build-end.log).
And SH4 doesn't have a.out.h
(http://autobuild.buildroot.org/results/589/5891f539ce3f3ff2e3411228472c8833fdd0d7c0/build-end.log).

>                 p11-kit-0.18.1 | 12

compat.c:85:14: error: conflicting types for
'program_invocation_short_name'

Conflict between the compat.c stuff of p11-kit and the uClibc code, it
seems.

> package/sunxi-boards/sunxi-... | 10

I've just sent a proposal to fix this.

>                sconeserver-211 | 5 

MySQL issue. Simon has sent a patch to fix this.

> dtc-e4b497f367a3b2ae99cc520... | 3 
>                      pcre-8.33 | 3 
>                     acl-2.2.52 | 3 
>                       qt-4.8.4 | 2 
>                 libtirpc-0.2.2 | 2 
>      xlib_libpthread-stubs-0.3 | 2 
>                qt5webkit-5.0.2 | 2 
> media-ctl-ac40b79f002a2315f... | 2 
>                  cairo-1.12.10 | 2 
>                      m4-1.4.16 | 2 
>                  binutils-2.21 | 2 
>                  openvpn-2.3.1 | 1 
>                 libiscsi-1.6.0 | 1 
>                   zeromq-3.2.3 | 1 
>               udpcast-20120424 | 1 
>       gst-plugins-good-0.10.31 | 1 
>                libglib2-2.30.3 | 1 
>                 cifs-utils-6.0 | 1 
>                   libedit-2.11 | 1 
>                  libpfm4-4.3.0 | 1 
>                aircrack-ng-1.1 | 1 
>                    libcap-2.22 | 1 
> am33x-cm3-AM335xPSP_04.06.0... | 1 
>                  libevas-1.7.4 | 1 
>                audiofile-0.3.6 | 1 
>           host-protobuf-c-0.15 | 1 
>              bluez_utils-4.101 | 1 
>                   connman-1.12 | 1 
>                libcap-ng-0.6.6 | 1 
>                      monit-5.4 | 1 

Pfff, and a lot of other issues...

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
