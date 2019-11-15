From: Petr Vorel <petr.vorel@gmail.com>
Date: Fri, 15 Nov 2019 21:19:09 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/ltp-testsuite: proper fix
 for missing __kernel_fsid_t
In-Reply-To: <20191115193118.GA19966@x230>
References: <20191114200219.1568-1-petr.vorel@gmail.com>
 <20191114213050.GF26360@scaer> <20191115193118.GA19966@x230>
Message-ID: <20191115201909.GA24188@x230>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

> Musl config which works:
> * /home/pevik/br-test-pkg/br-x86-64-musl/.config
> BR2_DEFCONFIG="$(CONFIG_DIR)/defconfig"
> BR2_TOOLCHAIN_USES_MUSL=y
> BR2_TOOLCHAIN_EXTERNAL_MUSL=y
> BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-x86-64-musl-2019.05.1.tar.bz2"
> BR2_TOOLCHAIN_EXTERNAL_CUSTOM_MUSL=y
> BR2_PACKAGE_MUSL_COMPAT_HEADERS=y
> BR2_PACKAGE_MUSL_FTS=y
> # BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS is not set

> Broken one (
> * pc_x86_64_bios_defconfig, libc changed to musl
> BR2_DEFCONFIG="/home/pevik/install/src/buildroot.git/configs/pc_x86_64_bios_defconfig"
> BR2_TOOLCHAIN_USES_MUSL=y
> BR2_TOOLCHAIN_BUILDROOT_MUSL=y
> BR2_TOOLCHAIN_BUILDROOT_LIBC="musl"
> BR2_PACKAGE_MUSL=y
> BR2_PACKAGE_MUSL_COMPAT_HEADERS=y
> BR2_PACKAGE_MUSL_FTS=y
> # BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS is not set

> There are more differences in these 2 configs, but I bet this
> BR2_TOOLCHAIN_BUILDROOT_MUSL=y vs. BR2_TOOLCHAIN_EXTERNAL_MUSL=y can be
> the difference.

OK, external toolchain has older MUSL, it's without 
f67b3c17 ("sys/fanotify.h: update for linux v5.1")
from v1.1.23. => need to fix autoconf in LTP for latest musl release.

I didn't realized that there could be more MUSL versions,
next time, I'll check with utils/test-pkg
support/config-fragments/autobuild/*musl*
and also for internal toolchain (somehow wasn't able to use 
support/config-fragments/autobuild/*internal-*musl* with utils/test-pkg).

Kind regards,
Petr
