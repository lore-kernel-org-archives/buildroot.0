From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Oct 2016 16:13:26 +0200
Subject: [Buildroot] [PATCH 1/1] package/trinity: needs headers >= 3.4
In-Reply-To: <20161016132411.17404-1-bernd.kuhls@t-online.de>
References: <20161016132411.17404-1-bernd.kuhls@t-online.de>
Message-ID: <20161022161326.56b20e14@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 16 Oct 2016 15:24:11 +0200, Bernd Kuhls wrote:
> IPV6_UNICAST_IF was added with kernel 3.4:
> https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/log/include/linux/in6.h?id=refs/tags/v3.4.112
> 
> To prove this compare with kernel 3.3:
> https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/log/include/linux/in6.h?h=linux-3.3.y
> 
> The trinity package contains some compat code in
> https://github.com/kernelslacker/trinity/blob/master/include/compat.h
> 
> but it does not trigger for IPV6_UNICAST_IF
> https://github.com/kernelslacker/trinity/blob/master/include/compat.h#L662
> 
> Instead of hacking compat.h to death just depend on headers >= 3.4.
> 
> Fixes a build error
> net/proto-ipv6.c: At top level:
> net/proto-ipv6.c:157:12: error: ?IPV6_UNICAST_IF? undeclared here (not in a function)
>   { .name = IPV6_UNICAST_IF, },
> 
> not yet caught by autobuilders using this defconfig:
> http://autobuild.buildroot.net/results/394/394e22be0ef986463e97b3040dad8f978262732c/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/trinity/Config.in | 8 ++++++++
>  1 file changed, 8 insertions(+)

I've applied, after adding a previous commit that introduces a
BR2_PACKAGE_TRINITY_ARCH_SUPPORTS variable to avoid duplicating the
architecture dependency.

Note however that this defconfig, which uses uClibc and 3.10 kernel
headers, also fails to build after this commit:

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2016.08-613-ge98b4dd.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_4_8=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_10=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_TRINITY=y
# BR2_TARGET_ROOTFS_TAR is not set

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
