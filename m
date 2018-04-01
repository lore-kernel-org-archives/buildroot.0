From: Ezequiel Garcia <ezequiel@collabora.com>
Date: Sun, 01 Apr 2018 19:58:30 -0300
Subject: [Buildroot] [PATCH] board/ci20: Fix U-Boot build failure
In-Reply-To: <20180402004226.71aa48eb@windsurf>
References: <20180401135035.29655-1-ezequiel@collabora.com>
 <20180401160555.36587bd1@windsurf> <1522621901.1665.1.camel@collabora.com>
 <20180402004226.71aa48eb@windsurf>
Message-ID: <1522623510.1665.6.camel@collabora.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 2018-04-02 at 00:42 +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Sun, 01 Apr 2018 19:31:41 -0300, Ezequiel Garcia wrote:
> 
> > I was testing on top of a recent master:
> > 
> > commit 53e1b222533fd110ab9472480ded126a4762db5e (origin/master,
> > origin/HEAD)
> > Author: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> > Date:   Sat Mar 31 15:27:36 2018 +0200
> > 
> >     package/docker-proxy: convert to golang infrastructure
> > 
> > ... just tested on top of current master, same error is thrown if
> > there
> >  are no output/host/include/libfdt* files.
> > 
> > Can you point me at the recent fixes?
> 
> I was thinking about:
> 
> f437bf547ca44849db4578c31707afdd96b85018 uboot: fix build for older
> uboot source trees
> bf733342324b414a1142b57781504111f81c97ea uboot: fix build when
> libfdt-devel is installed system-wide
> 0bf80e4bcd5277e3ad935e03c632deba4c7316f2 uboot: ensure host includes
> are searched before system default includes
> b15a7a62d3f992af3fa8eca1e358735c47b64390 uboot: revert "uboot: use
> local libfdt.h"
> baae5156ce37e8b2775f04710f7d1c8e97e4114c uboot: use local fdt headers
> 
> But you have all of these. So we have another issue, it seems.
> 

I don't fully understand the issue I'm seeing. The gcc command and the
error is:

/usr/bin/gcc -O2 -isystem /home/zeta/repos/buildroot/ci20/output/host/include -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer -include /home/zeta/repos/buildroot/ci20/output/build/uboot-dd3c1b95dac7d10b2ca5806f65e5c1050d7dd0fa/include/libfdt_env.h -idirafter /home/zeta/repos/buildroot/ci20/output/build/uboot-dd3c1b95dac7d10b2ca5806f65e5c1050d7dd0fa/include -idirafter /home/zeta/repos/buildroot/ci20/output/build/uboot-dd3c1b95dac7d10b2ca5806f65e5c1050d7dd0fa/include2 -idirafter /home/zeta/repos/buildroot/ci20/output/build/uboot-dd3c1b95dac7d10b2ca5806f65e5c1050d7dd0fa/include -I /home/zeta/repos/buildroot/ci20/output/build/uboot-dd3c1b95dac7d10b2ca5806f65e5c1050d7dd0fa/lib/libfdt -I /home/zeta/repos/buildroot/ci20/output/build/uboot-dd3c1b95dac7d10b2ca5806f65e5c1050d7dd0fa/tools -DCONFIG_SYS_TEXT_BASE=0x80000000 -DUSE_HOSTCC -D__KERNEL_STRICT_NAMES -D_GNU_SOURCE   -o fit_image.o fit_image.c -c
In file included from ../include/libfdt.h:54:0,
                 from fdt_host.h:11,
                 from mkimage.h:22,
                 from aisimage.c:8:
/usr/include/libfdt_env.h:70:30: error: conflicting types for ?fdt64_t?
 typedef uint64_t FDT_BITWISE fdt64_t;

As you can see, U-Boot is passing "-include
/home/zeta/repos/buildroot/ci20/output/build/uboot-
dd3c1b95dac7d10b2ca5806f65e5c1050d7dd0fa/include/libfdt_env.h",
so I don't understand why system libfdt_env.h is being used.

My gcc is 7.3.0.

Thanks,
Eze
