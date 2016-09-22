From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 22 Sep 2016 16:58:17 +0200
Subject: [Buildroot] [PATCH 1/2 v3] linux/tools: make it a real,
	separate package
In-Reply-To: <7af6b231b19828564aae1a098568e96e15843a62.1473171931.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Tue, 6 Sep 2016 16:29:14 +0200")
References: <cover.1473171931.git.yann.morin.1998@free.fr>
 <7af6b231b19828564aae1a098568e96e15843a62.1473171931.git.yann.morin.1998@free.fr>
Message-ID: <874m58ouba.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > The kernel source tree also contains the sources for various userland
 > tools, of which cpupower, perf or selftests.

 > Currently, we have support for building those tools as part of the
 > kernel build procedure. This looked the correct thing to do so far,
 > because, well, they *are* part of the kernel source tree and some
 > really have to be the same version as the kernel that will run.

 > However, this is causing quite a non-trivial-to-break circular
 > dependency in some configurations. For example, this defconfig fails to
 > build (similar to the one reported by Paul):

 >     BR2_arm=y
 >     BR2_cortex_a7=y
 >     BR2_ARM_FPU_NEON_VFPV4=y
 >     BR2_TOOLCHAIN_EXTERNAL=y
 >     BR2_INIT_SYSTEMD=y
 >     BR2_LINUX_KERNEL=y
 >     BR2_LINUX_KERNEL_CUSTOM_GIT=y
 >     BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/raspberrypi/linux.git"
 >     BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="26f3b72a9c049be10e6af196252283e1f6ab9d1f"
 >     BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
 >     BR2_PACKAGE_LINUX_TOOLS_CPUPOWER=y
 >     BR2_PACKAGE_CRYPTODEV=y
 >     BR2_PACKAGE_OPENSSL=y
 >     BR2_PACKAGE_LIBCURL=y

 > This causes a circular dependency, as explained by Thomas:

 >  - When libcurl is enabled, systemd depends on it

 >  - When OpenSSL is enabled, obviously, will use it for SSL support

 >  - When cryptodev-linux is enabled, OpenSSL will depend on it to use
 >    crypto accelerators supported in the kernel via cryptodev-linux.

 >  - cryptodev-linux being a kernel module, it depends on linux

 >  - linux by itself (the kernel) does not depend on pciutils, but the
 >    linux tool "cpupower" (managed in linux-tool-cpupower) depends on
 >    pciutils

 >  - pciutils depends on udev when available

 >  - udev is provided by systemd.

In this case there isn't actually a real circular dependency, as the
only dependency between openssl and cryptodev-linux is the cryptodev.h
header, right?

So another solution could have been to split the cryptodev-linux package
in two, like we do for mesa3d and mesa3d-headers. The cryptodev-linux
package would build the kernel module (and depend on linux), whereas the
cryptodev-linux-headers package would only install cryptodev.h (and not
have a compile time dependency on linux).

But ok, there could be other such dependency circles.

-- 
Bye, Peter Korsgaard
