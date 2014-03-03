From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Mar 2014 09:02:19 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20140303073010.B46B51015B7@stock.ovh.net>
References: <20140303073010.B46B51015B7@stock.ovh.net>
Message-ID: <20140303090219.65a08cc7@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  3 Mar 2014 08:30:10 +0100 (CET), Thomas Petazzoni wrote:

>     mipsel |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/a1e53d66d3962fd5431e7601937b071a0a3c2084/
>     x86_64 |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/b363c63b5dda7d55c3bd4c6aedc10666471113ad/

Problem of host python being Python 3 and not Python 2.

>       bfin | czmq-b5730c5f8290a611fd3b92... | NOK | http://autobuild.buildroot.net/results/8f8b479ac11ed35a7b20d94567bb446044dd02d4/
>       bfin | czmq-b5730c5f8290a611fd3b92... | NOK | http://autobuild.buildroot.net/results/ba626190b8019a73ecce74b1eb07eed4ec79ae56/

checking for zmq_init in -lzmq... no
configure: error: cannot link with -lzmq, install libzmq.

>     x86_64 |                      eudev-1.3 | NOK | http://autobuild.buildroot.net/results/3a0238bd1170f2e7d1257e4756553f6e2f4a1268/

Documentation problem:

I/O error : Attempt to load network entity http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl
warning: failed to load external entity "http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl"
cannot parse http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl

>     x86_64 |                     fbgrab-1.2 | NOK | http://autobuild.buildroot.net/results/9e079632a6c0556c96ec8ed7564286aa84044bf7/

Static linking problem.

> microblaze |                     gpm-1.20.7 | NOK | http://autobuild.buildroot.net/results/e99afadca6de92aad8563006fc7219aa32d77a88/

Strange:

/home/test/test/2/output/host/usr/bin/microblaze-buildroot-linux-gnu-gcc libgpm.so.2 \
	 -L/home/test/test/2/output/build/gpm-1.20.7/src  -o lib/libgpm.so.2.1.0 lib/liblow.lo lib/libhigh.lo lib/libxtra.lo lib/report-lib.lo tools.lo  -lc 	
microblaze-buildroot-linux-gnu-gcc: error: libgpm.so.2: No such file or directory

Spenser ?

>        arm |               host-scons-2.3.0 | NOK | http://autobuild.buildroot.net/results/11e6c8c8d79d56ed43daf52e6d6dc80847709926/
>        arm |               host-scons-2.3.0 | NOK | http://autobuild.buildroot.net/results/d75722fe096fc1ddbf62a51207b44b3cdbb6fed8/
>    powerpc |               host-scons-2.3.0 | NOK | http://autobuild.buildroot.net/results/09a7de5ef086005b2f003ccd58ee1dae268c26a1/

Problem of host python being Python 3 and not Python 2.

>     xtensa |                        kmod-16 | NOK | http://autobuild.buildroot.net/results/9fb1a008e5fa13425ab9fba0d497cf877ef90457/
>     xtensa |                        kmod-16 | NOK | http://autobuild.buildroot.net/results/97d4c96d6f6cdc1ed4007456f4ab70be9dfa41b5/

The xtensa binutils crash when building kmod-16. Chris, Baruch, Max ?

>       bfin |                    lftp-4.4.15 | NOK | http://autobuild.buildroot.net/results/321a6eedd2c79ce45c047cd8ebddb67124da092c/

Fixed by:

  http://git.buildroot.net/buildroot/commit/?id=5970e883419a55f25ea900d776287ae6ea34b62e

>    powerpc |                 libnftnl-1.0.0 | NOK | http://autobuild.buildroot.net/results/568d7fd5a6e6cd8a8e23184d7f977ce812b887fd/

Maybe a kernel headers problem. Gustavo ?

>       bfin | libwebsockets-v1.22-chrome2... | NOK | http://autobuild.buildroot.net/results/97e21513dba6aae5b2e2721c9218589dbc75d702/

Should add a MMU dependency:

daemonize.c: In function 'lws_daemonize':
daemonize.c:138: error: implicit declaration of function 'fork'

>        arm |                  lvm2-2.02.103 | NOK | http://autobuild.buildroot.net/results/b780582f8a1f3ac9886d4b23375d8a6a704d25a2/
>       i686 |                  lvm2-2.02.103 | NOK | http://autobuild.buildroot.net/results/a2e39cb626143c2d029ea3687891eab68ca0bde3/

Fixed by:

  http://git.buildroot.net/buildroot/commit/?id=fb36a82a745e93afc92bb5aff29daea8daecb6d3

>   mips64el | make: *** [systemd-legal-in... | NOK | http://autobuild.buildroot.net/results/e6c4dc22c014e62ce35273945a2a2307315ec3f7/

Fixed by:

  http://git.buildroot.net/buildroot/commit/?id=1862463829e8194ed768ca8cb3a4f4664b35d8bc

>     x86_64 |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/dc0592af4930b3631cc82bd0f510ee23466b3723/
>        arm |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/e9a576e2154f56c2f6b0f9ec017f04e085557a52/
>        sh4 |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/650960214be2b00ca7f028e31a36d74f3917454c/

Fixed by:

  http://git.buildroot.net/buildroot/commit/?id=8d89fd2b7c09af47f2d1b81cfa4de45a421d8a83

>       bfin |           sane-backends-1.0.22 | NOK | http://autobuild.buildroot.net/results/5efcb8d898df0e798cc19eaf28a670356fc4e049/

pixma_mp750.c: In function 'mp750_scan':
pixma_mp750.c:624: internal compiler error: Segmentation fault
Please submit a full bug report,
with preprocessed source if appropriate.

Sonic, Aaron? This triggers an internal compiler error in the Blackfin official toolchain.

> microblaze |                    systemd-207 | NOK | http://autobuild.buildroot.net/results/91010b43e63b82e050046b8f10c2c42f31a8a620/

Fixed by:

  http://git.buildroot.net/buildroot/commit/?id=f07c6c483c7d8f4718c82e91ff1c9d41a43f02e0

>       i686 |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/accfb42f28c4701207df412eb6059a34997b02dd/
>        arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/e11e28c29808202363961dfca01e9c19f5fb3eaf/
>       i686 |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/0494eff48f4b55fef42f0713668dd2ac83822043/

Ignore, those were due to incorrect toolchain configurations following
the addition of the kernel headers dependency mechanism.

>     xtensa |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/bc20297dad0f0e9b7fa79fe835b9754fbce6dfdf/

spawn_faction_adddup2.c: In function 'posix_spawn_file_actions_adddup2':
spawn_faction_adddup2.c:50:19: error: 'posix_spawn_file_actions_t' has no member named '_used'
spawn_faction_adddup2.c:50:42: error: 'posix_spawn_file_actions_t' has no member named '_allocated'
spawn_faction_adddup2.c:59:24: error: 'posix_spawn_file_actions_t' has no member named '_actions'
spawn_faction_adddup2.c:59:47: error: 'posix_spawn_file_actions_t' has no member named '_used'
spawn_faction_adddup2.c:65:19: error: 'posix_spawn_file_actions_t' has no member named '_used'
make[5]: *** [spawn_faction_adddup2.o] Error 1

Chris, Baruch, Max, an idea?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
