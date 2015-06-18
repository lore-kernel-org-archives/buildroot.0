From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 18 Jun 2015 22:21:50 +0200
Subject: [Buildroot] [PATCH] glog: disable on blackfin
In-Reply-To: <1434632555-10004-1-git-send-email-rahul.bedarkar@imgtec.com>
References: <1434632555-10004-1-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <20150618222150.543fa16d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Rahul,

On Thu, 18 Jun 2015 18:32:35 +0530, Rahul Bedarkar wrote:

> 1. http://autobuild.buildroot.net/results/c70/c704c70ae2f066f85dd6a5fa6a73789bc358d368/
> 
> when when BR2_BINFMT_FDPIC=y
> 
> ../usr/include/bits/elf-fdpic.h: In function 'void* __reloc_pointer(void*, const elf32_fdpic_loadmap*)':
> ../usr/bfin-buildroot-linux-uclibc/sysroot/usr/include/bits/elf-fdpic.h:95: error: invalid use of 'void'
> 
> code snippet at line 95 in elf-fdpic.h
> -------------------------------------------------------
> unsigned long offset = p - (void*)map->segs[c].p_vaddr;
> -------------------------------------------------------
> 
> void pointer addition and subtraction is not allowed in C++ as it has undetermined size,
> however in C with language extension it is possible because sizeof void is treated
> as one byte.

I believe this is more a toolchain-specific problem, not really a
Blackfin problem per-se. So we should instead disable this package on
the specific Blackfin external toolchains.

> 2. http://autobuild.buildroot.net/results/75d/75d17ceb764c2c1136047c089a0c554770ca98a4/
> 
> when BR2_BINFMT_FLAT=y
> 
> src/symbolize.cc:110:19: error: dlfcn.h: No such file or directory

Then you should add a dependency on !BR2_STATIC_LIBS: there are other
architectures that can lack dlfcn.h. And in fact all architectures can
be missing dlfcn.h if BR2_STATIC_LIBS=y.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
