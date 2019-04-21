From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 21 Apr 2019 12:36:11 +0200
Subject: [Buildroot] [PATCH] ltp-testsuite: Fix uClibc build with
 disabled fts.h support
In-Reply-To: <20190417135458.15505-1-Nikita.Sobolev@synopsys.com>
References: <20190417135458.15505-1-Nikita.Sobolev@synopsys.com>
Message-ID: <20190421123611.4016cc04@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 17 Apr 2019 16:54:58 +0300
Nikita Sobolev <Nikita.Sobolev@synopsys.com> wrote:

> Add patch, that fixes build on uClibc with disabled fts.h support
> and MUSL, which does not have fts.h at all.
> 
> Original patch [1] will be a part of the next LTP release and
> current patch should be removed from Buildroot when LTP version
> is bumped.
> 
> [1] https://github.com/linux-test-project/ltp/commit/b24f3d32c54006af5499da5a7ac418eafcf6e459
> 
> Signed-off-by: Nikita Sobolev <Nikita.Sobolev@synopsys.com>
> ---
>  .../0002-cpuset-Detect-missing-fts.h.patch         | 76 ++++++++++++++++++++++
>  1 file changed, 76 insertions(+)
>  create mode 100644 package/ltp-testsuite/0002-cpuset-Detect-missing-fts.h.patch

I am confused, because the current ltp-testsuite package seems to build
properly with uClibc that doesn't have FTS support enabled. I just
built the following configuration:

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2019.02-rc1.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_4_9=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_14=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_LTP_TESTSUITE=y
# BR2_TARGET_ROOTFS_TAR is not set

It has FTS disabled:

$ grep FTS output/staging/usr/include/bits/uClibc_config.h 
#undef __UCLIBC_HAS_FTS__

And it builds perfectly fine.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
