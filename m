From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Nov 2017 21:25:23 +0100
Subject: [Buildroot] [PATCH v4 1/2] libkrb5: New package
In-Reply-To: <1511213549-1878-1-git-send-email-nerv@dawncrow.de>
References: <1511213549-1878-1-git-send-email-nerv@dawncrow.de>
Message-ID: <20171123212523.2d7ec6dc@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 20 Nov 2017 22:32:28 +0100, Andr? Hentschel wrote:
> Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
> ---
>  DEVELOPERS                   |  1 +
>  package/Config.in            |  1 +
>  package/libkrb5/Config.in    | 11 +++++++++++
>  package/libkrb5/libkrb5.hash |  2 ++
>  package/libkrb5/libkrb5.mk   | 22 ++++++++++++++++++++++
>  5 files changed, 37 insertions(+)
>  create mode 100644 package/libkrb5/Config.in
>  create mode 100644 package/libkrb5/libkrb5.hash
>  create mode 100644 package/libkrb5/libkrb5.mk

I'm sorry but this doesn't build. First, I get:

prof_file.c: In function ?profile_update_file_data_locked?:
prof_file.c:370:16: error: ?f? may be used uninitialized in this function [-Werror=maybe-uninitialized]
         retval = profile_parse_file(f, &data->root, ret_modspec);

This is because -Werror=uninitialized. Looking at the code, I believe
gcc is wrong. So either we should initialize f = NULL at the beginning
of the function, or we should remove -Werror=uninitialized from the
build flags. After fixing this, I have a second build failure:

In file included from net-server.c:61:0:
../../include/net-server.h:32:19: fatal error: verto.h: No such file or directory
 #include <verto.h>
                   ^
compilation terminated.

You can reproduce by building the following defconfig:

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2017.11-rc1.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_4_9=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_10=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_LIBKRB5=y
# BR2_TARGET_ROOTFS_TAR is not set

Please use the test-pkg script to build test your package for the next
submission (and don't forget to remove AUTORECONF = YES, and to adjust
the comment about CONF_ENV, as we discussed previously).

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
