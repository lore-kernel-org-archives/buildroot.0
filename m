From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Jan 2018 22:16:48 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
 2018-01-07
In-Reply-To: <CANu7NGsmMRSaQm_TpLp_HXhxBCgfyTSFrVJJU_G9Wkpe6WxFNg@mail.gmail.com>
References: <20180108070010.4B8A220731@mail.free-electrons.com>
 <CANu7NGsmMRSaQm_TpLp_HXhxBCgfyTSFrVJJU_G9Wkpe6WxFNg@mail.gmail.com>
Message-ID: <20180108221648.490a7ed1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 8 Jan 2018 19:02:45 -0200, Sergio Prado wrote:

> > Build failures related to your packages:
> >
> >         i586 |                      daq-2.0.6 |  
> http://autobuild.buildroot.net/results/054f6581f67338b28af4dc2203b285ae1055581c
> 
> That is the second time I receive this build failure report in the last
> days, but I couldn't reproduce it in my machine using the defconfig from
> autobuild. It doesn't look like a build server error. Any idea?

The following defconfig produces the problem:

BR2_x86_pentium_mmx=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-i386-pentium-mmx-musl-2017.11-rc1.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_12=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_MUSL=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_SSP is not set
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_DAQ=y
BR2_PACKAGE_LIBDNET=y
BR2_PACKAGE_LIBNETFILTER_QUEUE=y
# BR2_TARGET_ROOTFS_TAR is not set

Basically, musl doesn't have any <sys/unistd.h>. The package should
include just <unistd.h>. Even on glibc, <sys/unistd.h> is just doing
#include <unistd.h>.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
