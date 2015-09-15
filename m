From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Sep 2015 23:30:14 +0200
Subject: [Buildroot] [PATCH 1/1] package/sudo: disable use of stack
 protector when not available
In-Reply-To: <1442342953-20312-1-git-send-email-brendanheading@gmail.com>
References: <1442342953-20312-1-git-send-email-brendanheading@gmail.com>
Message-ID: <20150915233014.27cc4a34@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Brendan,

On Tue, 15 Sep 2015 19:49:13 +0100, Brendan Heading wrote:
> Fixes:
> http://autobuild.buildroot.net/results/d93/d9390b929328e6253b883f000f6f09972df90f47/
> 
> sudo, by default, attempts to use the stack protector if configure detects
> that it exists. The stack protector detection does not attempt to link
> libssp, which can cause a false positive.
> 
> Instead, check if the stack protector is enabled in the buildroot
> toolchain config, and pass --disable-hardening if it is not - similar to
> psmisc and sox.
> 
> Signed-off-by: Brendan Heading <brendanheading@gmail.com>

I'm not sure to understand here. I tested with the pre-built toolchain
at
http://autobuild.buildroot.org/toolchains/configs/br-arm-full.config,
and it does properly detect that SSP support is not available:

checking whether C compiler accepts -fstack-protector-strong... no
checking whether C compiler accepts -fstack-protector-all... yes
checking whether the linker accepts -fstack-protector-all... no
checking whether C compiler accepts -fstack-protector... yes
checking whether the linker accepts -fstack-protector... no

And therefore, it doesn't use it, and sudo builds successfully.

In the autobuilder failure you pointed, it however thinks that SSP is
available. According to config.log:

configure:24179: checking whether C compiler accepts -fstack-protector-strong
configure:24198: /home/test/autobuild/instance-2/output/host/usr/bin/powerpc-buildroot-linux-uclibc-gcc -std=gnu99 -c -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   -Os  -fvisibility=hidden  -fstack-protector-strong -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 conftest.c >&5
configure:24198: $? = 0
configure:24206: result: yes
configure:24210: checking whether the linker accepts -fstack-protector-strong
configure:24229: /home/test/autobuild/instance-2/output/host/usr/bin/powerpc-buildroot-linux-uclibc-gcc -std=gnu99 -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   -Os  -fvisibility=hidden -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   -fstack-protector-strong conftest.c  >&5
configure:24229: $? = 0
configure:24238: result: yes

I don't understand why the second test works. Without SSP support in
the toolchain, it should fail.

Do you understand why this is failing with an internal toolchain, and
not with an external toolchain (which was built by Buildroot) ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
