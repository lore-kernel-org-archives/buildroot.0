From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 13 Jun 2014 11:12:16 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20140613063010.B26041011DE@stock.ovh.net>
References: <20140613063010.B26041011DE@stock.ovh.net>
Message-ID: <20140613111216.1fdae121@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

On Fri, 13 Jun 2014 08:30:10 +0200 (CEST), Thomas Petazzoni wrote:

> Detail of failures
> ===================
> 
>     x86_64 |               cosmo-14.03.04-1 | NOK | http://autobuild.buildroot.net/results/b39d026219e6c9c9accc8d3afc2e34c98ef3ca8c/
>       i686 |               cosmo-14.03.04-1 | NOK | http://autobuild.buildroot.net/results/44ee587b89f94eb8ed327d608f0b793234d38107/
>        arm |               cosmo-14.03.04-1 | NOK | http://autobuild.buildroot.net/results/63a5f2e3bdffbe90aef85357d24bfafb6e5bb8ea/
>    powerpc |               cosmo-14.03.04-1 | NOK | http://autobuild.buildroot.net/results/3b62508f5870a5edf145c223f74f68b42dcd8410/
>        arm |               cosmo-14.03.04-1 | NOK | http://autobuild.buildroot.net/results/f99b752ab7a85600839cc3a30b92d5001cf14d6c/
>   mips64el |               cosmo-14.03.04-1 | NOK | http://autobuild.buildroot.net/results/122239aa41a34be7e92b21d1801322e7c5053f66/
>        sh4 |               cosmo-14.03.04-1 | NOK | http://autobuild.buildroot.net/results/1ca98e95b106a948f1c0d0153a290ae1d9adb76d/
>        arm |               cosmo-14.03.04-1 | NOK | http://autobuild.buildroot.net/results/330e633ef9b4d7da4789529d97b14fb6a0673604/

Temporarily fixed by
http://git.buildroot.net/buildroot/commit/?id=acaaed7d70b1d624859d04290beff66d680e3ab0.
The problem need to be resolved upstream.

>       bfin |                 gptfdisk-0.8.6 | NOK | http://autobuild.buildroot.net/results/9909d198ce14969d0e9d29a34fcc33f0ef79220d/

Will be fixed by http://patchwork.ozlabs.org/patch/359322/.

>       bfin |                 libcurl-7.37.0 | NOK | http://autobuild.buildroot.net/results/ef95ff4f8c992ee901c676f3ba6e85bb74bc43f8/

Don't know:

checking for SSL_connect in -lssl... no
checking for ssl with RSAglue/rsaref libs in use... checking for SSL_connect in -lssl... (cached) no
no
configure: error: OpenSSL libs and/or directories were not found where specified!
make: *** [/home/test/test/3/output/build/libcurl-7.37.0/.stamp_configured] Error 1

>    powerpc |                 minidlna-1.1.2 | NOK | http://autobuild.buildroot.net/results/7d10e2c13a1caf61b8bd18b85e5e5af50e5e7c48/

Will be fixed by http://patchwork.ozlabs.org/patch/359013/.

>      avr32 |                        nbd-3.8 | NOK | http://autobuild.buildroot.net/results/ab620f1dfd5a47ac3cdc8a1afe1a467263c4e7d7/

Weird symbol redefinition, not sure it's AVR32 specific:

./.libs/libnbdsrv.a(libnbdsrv_la-nbdsrv.o): In function `ntohll':
nbdsrv.c:(.text+0x0): multiple definition of `ntohll'
nbd_server-nbd-server.o:nbd-server.c:(.text+0x0): first defined here

>       bfin |                      popt-1.16 | NOK | http://autobuild.buildroot.net/results/35792bc86ca65fc2ca06db4a16ceef670489e9f7/

Might again be GNU Glob support missing from Blackfin toolchain, to be
verified:

./.libs/libpopt.a(poptconfig.o): In function `_poptGlob.clone.0':
poptconfig.c:(.text+0x36): undefined reference to `_glob_pattern_p'
./.libs/libpopt.a(poptconfig.o): In function `_poptReadConfigFile':
poptconfig.c:(.text+0x2f8): undefined reference to `_glob_pattern_p'
collect2: ld returned 1 exit status

We need help from Blackfin/ADI people here.

>        arc |                 pulseaudio-5.0 | NOK | http://autobuild.buildroot.net/results/8cb5f5258e192feeb896b5c9d4da3f616add8203/

Weird:

checking for ltdl.h... yes
checking for lt_dladvise_init in -lltdl... no
configure: error: Unable to find libltdl version 2. Makes sure you have libtool 2.4 or later installed.
make: *** [/home/test/test/3/output/build/pulseaudio-5.0/.stamp_configured] Error 1

>    powerpc |                    systemd-213 | NOK | http://autobuild.buildroot.net/results/4b00d517c17cfcd29359e63423f15ac5331096b2/
>       i686 |                    systemd-213 | NOK | http://autobuild.buildroot.net/results/33e1447949d13bccc4076b69f902432e2131cc1c/

Will be fixed by http://patchwork.ozlabs.org/patch/358913/.

>       bfin |                   zeromq-4.0.4 | NOK | http://autobuild.buildroot.net/results/74426d3150e9c7a98371d0058d78df7630770026/

/home/test/test/1/output/host/opt/ext-toolchain/bfin-linux-uclibc/bin/../lib/gcc/bfin-linux-uclibc/4.5.3/../../../../bfin-linux-uclibc/bin/ld: remote_lat: hidden symbol `___umulsi3_highpart' in /home/test/test/1/output/host/opt/ext-toolchain/bfin-linux-uclibc/bin/../lib/gcc/bfin-linux-uclibc/4.5.3/libgcc.a(_umulsi3_highpart.o) is referenced by DSO
/home/test/test/1/output/host/opt/ext-toolchain/bfin-linux-uclibc/bin/../lib/gcc/bfin-linux-uclibc/4.5.3/../../../../bfin-linux-uclibc/bin/ld: final link failed: Nonrepresentable section on output
collect2: ld returned 1 exit status

We need help from Blackfin/ADI people here.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
