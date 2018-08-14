From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Aug 2018 14:03:05 +0200
Subject: [Buildroot] Setting Defaults for RISCV64 Architecture
In-Reply-To: <862bfe2f-fc60-ead9-2b63-b6a0f23c59cd@embecosm.com>
References: <862bfe2f-fc60-ead9-2b63-b6a0f23c59cd@embecosm.com>
Message-ID: <20180814140305.0184f5a1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Mark,

On Tue, 14 Aug 2018 10:39:01 +0100, Mark Corbin wrote:

> I am working on adding RISCV64 support to Buildroot

Nice!

> and was wondering how best to set some of the defaults when the
> riscv64 architecture is selected.
> 
> The two issues that I currently have are that the version of binutils
> needs to be 2.30 (or greater) and that the kernel needs to be a custom
> version from the riscv git repo (the 4.17 mainline kernel doesn't
> appear to have full riscv support).
> 
> In both of these cases I could either:
> 
> a) Add some architecture specific options to the 'Config.in' files,
> i.e. packages/binutils/Config.in.host and linux/Config.in, to select
> the appropriate default versions/values .
> or
> b)? Set the appropriate variables in a board or architecture specific
> '_defconfig' file, e.g.
> ??? ??? BR2_BINUTILS_VERSION_2_30_X=y
> ??? ??? BR2_LINUX_KERNEL=y
> ??? ??? BR2_LINUX_KERNEL_CUSTOM_GIT=y
> ??? ???
> BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/riscv/riscv-linux.git"
> ??? ??? BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="riscv-linux-4.15"
> 
> I think that I prefer option a) as option b) would require a specific
> config to be selected every time rather than just working by default
> when you set the Target Architecture.

Yes, in general (a) is preferred, as a defconfig is just an "example"
configuration, and nothing prevents a user from not using some existing
example configuration: he can instead start from scratch his
Buildroot configuration, and we should ensure that only valid
configurations can be created by the user.

For binutils, things are pretty easy, since
package/binutils/Config.in.host already hides/show some binutils
versions depending on the architecture. For example,
BR2_BINUTILS_VERSION_2_28_X is not visible on the ARC architecture.

For the Linux kernel itself, there isn't really a problem, as we allow
the user to select the Linux kernel version/source with lots of freedom
(arbitrary official version from kernel.org, arbitrary commit/tag from
a Git repository, arbitrary tarball, etc.).

However, there is a problem for the kernel headers. If the recently
released 4.18 kernel still doesn't have what's need for RISCV64, then I
guess we'll have to temporarily add a special Linux kernel headers
version in package/linux-headers/Config.in.host for RISCV64.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
