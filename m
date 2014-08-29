From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 29 Aug 2014 09:30:14 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20140829063011.8FB21101DC4@stock.ovh.net>
References: <20140829063011.8FB21101DC4@stock.ovh.net>
Message-ID: <20140829093014.49f54ba7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Yuvaraj, Romain, Samuel, Bernd, see below.

On Fri, 29 Aug 2014 08:30:10 +0200 (CEST), Thomas Petazzoni wrote:

>    powerpc |                   cppcms-1.0.4 | NOK | http://autobuild.buildroot.net/results/b38b30d5a6436c07723ce136a626cab5154cf39a/

error: 'wstring' is not a member of 'std'

To me, this looks like cppcms needs WCHAR support in toolchain, no?

>       bfin |        directfb-examples-1.6.0 | NOK | http://autobuild.buildroot.net/results/b515eb00f981c494fdbe379cbc8a11c60b247da5/

undefined reference to `vtable for __cxxabiv1::__si_class_type_info'

And many more crazy errors. Don't know what's going on here. Is it
because we're building with gcc a C program linked against a C++
library, and that Blackfin has some specificities here?

Yuvaraj, could you have a look?

>        arm |                      exim-4.83 | NOK | http://autobuild.buildroot.net/results/98a1acb58665e6cd2df354fc63afef1d4606c6e0/

Needs thread.

> microblazeel |             gst-ffmpeg-0.10.13 | TIM | http://autobuild.buildroot.net/results/f885e55787e9b966ec67f539f41edb115a2c9e77/

Ignore.

>     mipsel |               libarchive-3.1.2 | NOK | http://autobuild.buildroot.net/results/b8f7a29787ea1cc5c98e4cbd5f47f257f9b306f2/

/home/buildroot/instance-0/output/host/usr/mipsel-buildroot-linux-uclibc/sysroot/usr/lib/libdl.a(libdl.os): In function `_dl_parse_relocation_information':
libdl.c:(.text+0x146c): undefined reference to `TLS_DTPREL_VALUE'
libdl.c:(.text+0x14ac): undefined reference to `TLS_TPREL_VALUE'
libdl.c:(.text+0x14c8): undefined reference to `TLS_TPREL_VALUE'
libdl.c:(.text+0x1494): undefined reference to `TLS_DTPREL_VALUE'
libdl.c:(.text+0x14d4): undefined reference to `TLS_TPREL_VALUE'
collect2: error: ld returned 1 exit status

Weird. There is already some work being done by Romain Naour on this
package. Maybe you could have a look Romain?

>       bfin |                 libcurl-7.37.1 | NOK | http://autobuild.buildroot.net/results/c37022e334d763bad2a59f7311b93504a569b2dd/

checking for recv... no
configure: error: Unable to link function recv
make: *** [/home/buildroot/instance-1/output/build/libcurl-7.37.1/.stamp_configured] Error 1
make: Leaving directory `/home/buildroot/instance-1/buildroot'

Don't know.

>       bfin |                 libiqrf-v0.1.2 | NOK | http://autobuild.buildroot.net/results/2108f37e4a41af0b527c78e646e82f1cafa0353d/

Samuel: this one is for you. Yet another CMake based package trying to create
a shared library even when told not to do so.

>     mipsel | libwebsockets-v1.23-chrome3... | NOK | http://autobuild.buildroot.net/results/0a9f0c3c101550e73f7100f2b88a88c1f2bbad95/

Same problem: purely static build, and the CMake based package tries to
build a shared library. Samuel?

>       bfin |                ruby-1.9.3-p545 | NOK | http://autobuild.buildroot.net/results/09199826df86b1bebd3c4e5dca03b9d86c0ea495/
>       bfin |                ruby-1.9.3-p545 | NOK | http://autobuild.buildroot.net/results/1b0e2f5f95889eb26846927da45d128247d0ed89/
>       bfin |                ruby-1.9.3-p545 | NOK | http://autobuild.buildroot.net/results/ea4b34837e04beb5408871c207b5f9482eafda9b/

Fixed by:

 http://git.buildroot.net/buildroot/commit/?id=2b773698820996352274962899790788fc2b3eb5
 http://git.buildroot.net/buildroot/commit/?id=53bf889cdca77979814bc6b74170e2f104fc3b70

>       bfin |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/695cf7c68ba978052d3b04db129af15c0d68eca6/

bfin-linux-uclibc-g++: /home/test/autobuild/instance-0/output/host/usr/bfin-buildroot-linux-uclibc/sysroot/opt/uClinux/bfin-linux-uclibc/lib/gcc/bfin-linux-uclibc/4.3.5/libstdc++.so: No such file or directory

Don't know. Yuvaraj?

>       sh4a |              xscreensaver-5.22 | NOK | http://autobuild.buildroot.net/results/e19cbe44035e1620febc194960373c67e3b60ed2/
>   mips64el |              xscreensaver-5.22 | NOK | http://autobuild.buildroot.net/results/aceb83ff92957accab4e2f64e450b2d2837cb2ba/

Both would be fixed by http://patchwork.ozlabs.org/patch/383576/.

>    powerpc |     xserver_xorg-server-1.16.0 | NOK | http://autobuild.buildroot.net/results/40c6cce919c9ca08bfc256740f52707dbd67a843/

log.c: In function 'LogInit':
log.c:199:9: error: #pragma GCC diagnostic not allowed inside functions
log.c:201:9: warning: format not a string literal, argument types not checked
log.c:212:9: error: #pragma GCC diagnostic not allowed inside functions
log.c:214:17: warning: format not a string literal, argument types not checked

Bernd, maybe?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
