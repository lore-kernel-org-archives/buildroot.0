From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 4 Apr 2018 22:50:41 +0200
Subject: [Buildroot] [PATCH v5 1/7] package/llvm: new package
In-Reply-To: <20180404163124.27934-2-valentin.korenblit@smile.fr>
References: <20180404163124.27934-1-valentin.korenblit@smile.fr>
 <20180404163124.27934-2-valentin.korenblit@smile.fr>
Message-ID: <20180404225041.2281a856@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  4 Apr 2018 18:31:18 +0200, Valentin Korenblit wrote:
> This patch installs LLVM tools and libraries for the host and
> libLLVM.so for the target.

I've applied to master, after doing the following changes:

    [Thomas:
     - add dependency on thread and C++ and update the Config.in comment
       accordingly.
     - make the Config.in comment depend on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
       so that it isn't disabled on architectures where LLVM is anyway not
       supported.]

Also, I noticed it doesn't build on the Cortex-M4 configuration, i.e
the following defconfig doesn't build:

BR2_arm=y
BR2_cortex_m4=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-cortex-m4-full-2017.11-rc1.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_13=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_NPTL is not set
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_PACKAGE_LLVM=y

Even though I don't think it makes sense to support Cortex-M4 (and is
probably not possible anyway), the error is interesting:

-- Looking for __atomic_load_8 in atomic
-- Looking for __atomic_load_8 in atomic - not found
CMake Error at cmake/modules/CheckAtomic.cmake:74 (message):
  Host compiler appears to require libatomic, but cannot find it.
Call Stack (most recent call first):
  cmake/config-ix.cmake:326 (include)
  CMakeLists.txt:580 (include)

So LLVM uses atomic built-ins, so probably it needs to "depends on
BR2_TOOLCHAIN_HAS_ATOMIC", and link against libatomic if
BR2_TOOLCHAIN_HAS_LIBATOMIC is defined.

Please watch for the autobuilders in the next few days, and look at the
LLVM build failures. You will anyway be notified every day of such
failures by e-mail, now that you are listed in the DEVELOPERS file.

Thanks a lot Valentin for your persistence on this LLVM work. I'm sure
it will be very useful in the future, and it was a major endeavor!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
