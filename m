From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 31 Jan 2021 14:11:40 +0100
Subject: [Buildroot] [PATCH 08/10] support/scripts/gen-missing-cpe: add
 new script
In-Reply-To: <CANQCQpaHbXUWm46wZsErXpPw84vi5XO-vw0MpTwx8RQCE3AihQ@mail.gmail.com>
References: <20210107133948.2997849-1-thomas.petazzoni@bootlin.com>
 <20210107133948.2997849-9-thomas.petazzoni@bootlin.com>
 <CANQCQpaHbXUWm46wZsErXpPw84vi5XO-vw0MpTwx8RQCE3AihQ@mail.gmail.com>
Message-ID: <20210131141140.5e15fe7b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 7 Jan 2021 13:33:18 -0600
Matthew Weber via buildroot <buildroot@busybox.net> wrote:

> I've tested with the following defconfig and I get the following
> output.  I know for sure that some of these are missing/need
> update/match. i.e. busybox has a exact match and kmod is pending
> update and at 25.
> 
> BR2_aarch64=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_LINUX_KERNEL=y
> BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
> BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
> BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> BR2_TARGET_ROOTFS_EXT2=y
> # BR2_TARGET_ROOTFS_TAR is not set
> 
> 
> make missing-cpe
> mkdir -p /accts/mlweber1/tmp.G9papvL0Eg-buildroot/output/cpe-updates
> CPE: Setting up NIST dictionary
> CPE: Loading CACHED dictionary
> Getting list of CPE for enabled packages
> WARNING: no match found for 'cpe:2.3:a:kernel:util-linux:2.36.1:*:*:*:*:*:*:*'
> WARNING: no match found for 'cpe:2.3:a:busybox:busybox:1.32.0:*:*:*:*:*:*:*'
> WARNING: no match found for 'cpe:2.3:a:kernel:kmod:27:*:*:*:*:*:*:*'
> WARNING: no match found for 'cpe:2.3:a:gnu:zlib:1.2.11:*:*:*:*:*:*:*'
> WARNING: no match found for 'cpe:2.3:a:linux:linux_kernel:4.16.7:*:*:*:*:*:*:*'
> WARNING: no match found for 'cpe:2.3:a:openssl:openssl:1.1.1i:*:*:*:*:*:*:*'
> Generated 0 update files out of 6 CPEs

So here as well, the issue was that your .pkl cache was empty, due to
parsing issue. This should be resolved in v2.

> Also  I noticed in this build that I get a list of 6 CPEs but pkgstats
> doesn't list the same ones.  it looks like the kernel dependencies of
> kmod / openssl / zlib don't get reflected in the per defconfig
> pkgstats.  Just checking if that was a known  bug.

gen-missing-cpe simply gets the CPE IDs visible in the "make show-info"
output, without caring whether things are a target or a host package,
so it captures all packages that have a CPE ID.

On the other hand, "make pkg-stats" looks at the package names in the
"show-info" output and these contain "host-" prefixes for host packages
which prevents those names from matching actual package names. I
proposed a patch at
http://lists.busybox.net/pipermail/buildroot/2021-January/300286.html,
but Yann/Arnout made some suggestions on how to better handle this.
It'll be part of my v2 of this series.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
