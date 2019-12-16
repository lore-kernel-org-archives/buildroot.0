From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 16 Dec 2019 15:28:51 +0000
Subject: [Buildroot] [Bug 12411] Kernel zImage is actually a uImage
In-Reply-To: <bug-12411-163@https.bugs.busybox.net/>
References: <bug-12411-163@https.bugs.busybox.net/>
Message-ID: <bug-12411-163-Q7AySgqmYZ@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12411

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Thanks for your bug report! Could you provide some simple Buildroot
configuration that we can actually build that reproduces the issue ?

Indeed, I just built the following configuration:

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2019.05.1.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_4_9=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_14=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_DEFCONFIG="mvebu_v5"
# BR2_PACKAGE_BUSYBOX is not set
# BR2_TARGET_ROOTFS_TAR is not set

And it does produce a zImage, as expected:

$ file output/images/zImage 
output/images/zImage: Linux kernel ARM boot executable zImage (little-endian)

But it seems like your issue is on PowerPC. So I suspect PowerPC produces a
uImage by default, and then we copy it to zImage. Again, if you could provide a
Buildroot configuration that we can build, to reproduce and fix the problem,
that would be very useful. Thanks!

-- 
You are receiving this mail because:
You are on the CC list for the bug.
