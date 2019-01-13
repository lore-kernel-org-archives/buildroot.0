From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 Jan 2019 22:19:28 +0100
Subject: [Buildroot] [PATCH 1/1] libserial: bump to version 1.0.0
In-Reply-To: <20190113201419.4250-1-fontaine.fabrice@gmail.com>
References: <20190113201419.4250-1-fontaine.fabrice@gmail.com>
Message-ID: <20190113221928.6ab6720c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 13 Jan 2019 21:14:19 +0100, Fabrice Fontaine wrote:
> - Move site to github
> - Remove first patch and use --without-python instead
> - Remove second patch (patch has been merged in 2015:
>   https://github.com/crayzeewulf/libserial/commit/47ca0621ccd2100e4ba0d7f4e2a861d14f05f63c)
> - Add a new patch to fix build when size_t is an unsigned int
> - Use new --disable-tests option
> - Update license to BSD-3-Clause and replace COPYING by LICENSE.txt:
>   https://github.com/crayzeewulf/libserial/commit/3f12abc045aae34a40a6fc9a9b5ed0a1bc6b2049
> - Add hash for license file
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...cpp-fix-build-when-size_t-is-an-unsigned-.patch | 39 +++++++++++++
>  .../libserial/0001-disable-python-bindings.patch   | 26 ---------
>  ...n-t-use-high-baudrates-when-not-available.patch | 65 ----------------------
>  package/libserial/libserial.hash                   |  6 +-
>  package/libserial/libserial.mk                     | 13 +++--
>  5 files changed, 50 insertions(+), 99 deletions(-)
>  create mode 100644 package/libserial/0001-SerialPort.cpp-fix-build-when-size_t-is-an-unsigned-.patch
>  delete mode 100644 package/libserial/0001-disable-python-bindings.patch
>  delete mode 100644 package/libserial/0002-Don-t-use-high-baudrates-when-not-available.patch

With this commit applied, the following defconfig:

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2018.05.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_4_9=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_1=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_LIBSERIAL=y
# BR2_TARGET_ROOTFS_TAR is not set

fails to build with:

configure: error: *** A compiler with support for C++14 language features is required.
make[1]: *** [package/pkg-generic.mk:223: /home/thomas/projets/buildroot/output/build/libserial-v1.0.0/.stamp_configured] Error 1

I guess a dependency on a minimal version of gcc is needed.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
