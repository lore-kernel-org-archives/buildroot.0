From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Jul 2015 17:31:15 +0200
Subject: [Buildroot] [PATCH] berkeleydb: accommodate threads
 presence/absence
In-Reply-To: <1436194084-24502-1-git-send-email-abrodkin@synopsys.com>
References: <1436194084-24502-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <20150706173115.05596d27@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexey Brodkin,

On Mon,  6 Jul 2015 17:48:04 +0300, Alexey Brodkin wrote:
> In BerkeleyDB the most convenient implementation of mutexes on Linux is
> via POSIX mutex, and that requires pthread library.
> 
> Still it is possible to build (and hopefully use) BerkeleyDB without
> mutexes. For this we pass "--disable-mutexsupport" during configuration
> of the package.
> 
> Fixes:
> http://autobuild.buildroot.net/results/717f3b37600a56262badc6f7cb64d7949fdacb67/
> http://autobuild.buildroot.net/results/80ebf0382992b277fd94743815bbf0c7426a3654/

These build failures can no longer occur today: our toolchain
configuration for ARC does not explicitly disable threads. But they
were disabled at a specific point in time due to uClibc-ng being chosen
instead of uClibc-ARC, and with uClibc-ng, no thread implementation
could be selected for ARC, so it was default to no threads.

That being said, this isn't a reason to not fix the problem. However,
testing with an ARM no-thread toolchain
(http://autobuild.buildroot.org/toolchains/configs/br-arm-full-nothread.config),
I can't reproduce the problem. The build spits out many warnings:

#   warning requested reentrant code, but thread support was disabled

But it does build until the end, even though the mutexes fail also fails:

configure:20510: checking for mutexes
configure:20603: /home/thomas/projets/buildroot/output/host/usr/bin/arm-linux-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_F
ILE_OFFSET_BITS=64   -Os   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_GNU_SOURCE -D_REENTRANT  conftest.c  -lpthrea
d >&5
In file included from /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/stdlib.h:25:0,
                 from conftest.c:43:
/home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/features.h:209:5: warning: #warning req
uested reentrant code, but thread support was disabled [-Wcpp]
 #   warning requested reentrant code, but thread support was disabled
     ^
conftest.c:44:21: fatal error: pthread.h: No such file or directory
 #include <pthread.h>

Aah, but then it does:

checking for mutexes... ARM/gcc-assembly

so it falls back to using some internal mutex implementation. Which
explains why it doesn't build on ARC, but builds on ARM.

> diff --git a/package/berkeleydb/berkeleydb.mk b/package/berkeleydb/berkeleydb.mk
> index 30fc518..e5c11bd 100644
> --- a/package/berkeleydb/berkeleydb.mk
> +++ b/package/berkeleydb/berkeleydb.mk
> @@ -40,6 +40,7 @@ define BERKELEYDB_CONFIGURE_CMDS
>  		$(SHARED_STATIC_LIBS_OPTS) \
>  		--with-pic \
>  		--enable-o_direct \
> +		$(if $(BR2_TOOLCHAIN_HAS_THREADS),--enable-mutexsupport,--disable-mutexsupport) \
>  	)
>  endef

This doesn't get rid of the -D_REENTRANT definition that configure.ac
unconditionally add, but oh well, that's berkeleydb mess.

Conclusion: patch applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
