From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 7 May 2016 14:43:13 +0200
Subject: [Buildroot] [PATCH 1/1] package/go: bump version to 1.6.2
In-Reply-To: <1462551812-8952-1-git-send-email-christian@paral.in>
References: <1462551812-8952-1-git-send-email-christian@paral.in>
Message-ID: <20160507144313.4e7112af@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  6 May 2016 12:23:32 -0400, Christian Stewart wrote:
> Golang has significant improvements to support for multiarch in later
> versions. This bump is required to make many go programs functional
> under arm64, for example.
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>  package/go/go.hash | 2 +-
>  package/go/go.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks. However, I've noticed that on my machine,
host-go-bootstrap doesn't build:

net/rpc/jsonrpc
# cmd/pprof
/home/thomas/projets/buildroot/output/build/host-go-bootstrap-1.4.2/pkg/linux_amd64/runtime/cgo.a(_all.o): unknown relocation type 42; compiled without -fpic?
/home/thomas/projets/buildroot/output/build/host-go-bootstrap-1.4.2/pkg/linux_amd64/runtime/cgo.a(_all.o): unknown relocation type 42; compiled without -fpic?
runtime/cgo(.text): unexpected relocation type 298
runtime/cgo(.text): unexpected relocation type 298
# cmd/go
/home/thomas/projets/buildroot/output/build/host-go-bootstrap-1.4.2/pkg/linux_amd64/runtime/cgo.a(_all.o): unknown relocation type 42; compiled without -fpic?
/home/thomas/projets/buildroot/output/build/host-go-bootstrap-1.4.2/pkg/linux_amd64/runtime/cgo.a(_all.o): unknown relocation type 42; compiled without -fpic?
runtime/cgo(.text): unexpected relocation type 298
runtime/cgo(.text): unexpected relocation type 298
package/pkg-generic.mk:195: recipe for target '/home/thomas/projets/buildroot/output/build/host-go-bootstrap-1.4.2/.stamp_built' failed
make[1]: *** [/home/thomas/projets/buildroot/output/build/host-go-bootstrap-1.4.2/.stamp_built] Error 2
Makefile:36: recipe for target '_all' failed
make: *** [_all] Error 2

You should be able to reproduce with the following defconfig:

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2016.02-3-g762b7c9.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_4_7=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_10=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_FLANNEL=y
# BR2_TARGET_ROOTFS_TAR is not set

Could you look into this?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
