From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 May 2016 21:23:46 +0200
Subject: [Buildroot] [PATCH v3] gdb: enable simulator support for host
 build
In-Reply-To: <20160528205724.GA10651@waldemar-brodkorb.de>
References: <20160528205724.GA10651@waldemar-brodkorb.de>
Message-ID: <20160531212346.58960194@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 28 May 2016 22:57:25 +0200, Waldemar Brodkorb wrote:
> Add an option to enable simulator support, so
> it can be used to test some no-MMU systems.
> 
> Newer GDB need a workaround for in-tree compile.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

This new version still doesn't build with gdb 7.10 (i.e the default).
It fails with:

In file included from ./../common/callback.c:24:0:
./../common/cconfig.h:212:21: fatal error: tconfig.h: No such file or directory
compilation terminated.
Makefile:531: recipe for target 'callback.o' failed
make[5]: *** [callback.o] Error 1
make[5]: *** Waiting for unfinished jobs....
In file included from ./../common/syscall.c:27:0:
./../common/cconfig.h:212:21: fatal error: tconfig.h: No such file or directory
compilation terminated.
In file included from wrapper.c:23:0:
config.h:161:21: fatal error: tconfig.h: No such file or directory
compilation terminated.
In file included from targ-map.c:4:0:
config.h:161:21: fatal error: tconfig.h: No such file or directory
Makefile:531: recipe for target 'syscall.o' failed
compilation terminated.
make[5]: *** [syscall.o] Error 1
Makefile:531: recipe for target 'targ-map.o' failed
make[5]: *** [targ-map.o] Error 1
Makefile:531: recipe for target 'wrapper.o' failed
make[5]: *** [wrapper.o] Error 1
Makefile:129: recipe for target 'all' failed
make[4]: *** [all] Error 1
Makefile:8201: recipe for target 'all-sim' failed
make[3]: *** [all-sim] Error 2
Makefile:845: recipe for target 'all' failed
make[2]: *** [all] Error 2
package/pkg-generic.mk:195: recipe for target '/home/thomas/projets/buildroot/output/build/host-gdb-7.10.1/.stamp_built' failed
make[1]: *** [/home/thomas/projets/buildroot/output/build/host-gdb-7.10.1/.stamp_built] Error 2
Makefile:36: recipe for target '_all' failed
make: *** [_all] Error 2

Using the following defconfig:

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2016.05-rc2-3-g011d4e2.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_4_8=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_10=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_PACKAGE_HOST_GDB=y
BR2_PACKAGE_HOST_GDB_SIM=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
# BR2_TARGET_ROOTFS_TAR is not set

> +# workaround a bug if in-tree build is used

If I understood correctly, it has been fixed in newer versions of gdb,
right? If that's the case, please indicate here in which version it has
been fixed, so that we can remove this workaround at some point in the future.

> +define GDB_SIM_WORKAROUND

It would be better named HOST_GDB_SIM_WORKAROUND.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
