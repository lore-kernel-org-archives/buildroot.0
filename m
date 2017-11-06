From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Nov 2017 22:00:39 +0100
Subject: [Buildroot] [git commit] binutils: fix Blackfin '.rofixup
 section size mismatch' problems
In-Reply-To: <20160805191659.C19F582269@busybox.osuosl.org>
References: <20160805191659.C19F582269@busybox.osuosl.org>
Message-ID: <20171106220039.65b6b1d6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 5 Aug 2016 21:16:15 +0200, Thomas Petazzoni wrote:
> commit: https://git.buildroot.net/buildroot/commit/?id=61c7e9da0efb3bce05c8af56f732de477eb48fad
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> The bug has already been reported by Stuart Henderson to binutils
> upstream: https://sourceware.org/bugzilla/show_bug.cgi?id=13391
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/d5999ae91a1f4dee3d01a0bbc3d8a4c5939ad175/
>   http://autobuild.buildroot.net/results/17232204249aeb04150ac43a2424aa26a6b6c807/
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Unfortunately, this patch is not enough. I can reproduce
http://autobuild.buildroot.net/results/f28/f28980613173fd3fdd216218ab3ced92e01adb2b/build-end.log:

/home/buildroot/build/instance-0/output/host/opt/ext-toolchain/bin/../lib/gcc/bfin-buildroot-linux-uclibc/6.3.0/../../../../bfin-buildroot-linux-uclibc/bin/ld: LINKER BUG: .rofixup section size mismatch
/home/buildroot/build/instance-0/output/host/opt/ext-toolchain/bin/../lib/gcc/bfin-buildroot-linux-uclibc/6.3.0/../../../../bfin-buildroot-linux-uclibc/bin/ld: final link failed: Nonrepresentable section on output

with the following defconfig:

BR2_bfin=y
BR2_ENABLE_DEBUG=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PACKAGE_IBRDTND=y

Note that BR2_ENABLE_DEBUG=y is important for the issue to happen.
Without it, it doesn't happen.

We have the same problem on the stella package:

  http://autobuild.buildroot.net/results/748/7483123d5cdc4637f298d7edc5910751b27791ec/build-end.log
  (with BR2_ENABLE_DEBUG=y as well)

On the icu package:

  http://autobuild.buildroot.net/results/4e8/4e87cb455df98a9a5dcc55f39df881c63bd00158/build-end.log
  (this one without BR2_ENABLE_DEBUG)

Do you have an idea on how to solve this ? The upstream bug report has
been made 6 years ago, with no reaction, so I doubt we can hope to get
any sort of help from upstream :-/

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
