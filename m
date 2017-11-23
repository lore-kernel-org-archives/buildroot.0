From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Nov 2017 21:50:28 +0100
Subject: [Buildroot] [PATCH 1/2] package/i2c-tools: bump to version 4.0
In-Reply-To: <1510656704-11153-1-git-send-email-angelo@amarulasolutions.com>
References: <1510656704-11153-1-git-send-email-angelo@amarulasolutions.com>
Message-ID: <20171123215028.1baeb519@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 14 Nov 2017 11:51:43 +0100, Angelo Compagnucci wrote:
> This patch bumps i2c-tools to version 4.0 and adds a new command
> named i2ctransfer.
> 
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>

This patch breaks the build on Cortex-M4 ARM noMMU configuration:

/home/thomas/projets/buildroot/output/host/bin/arm-linux-gcc -shared -Wl,-elf2flt -static -Wl,--version-script=lib/libi2c.map -Wl,-soname,libi2c.so.0 -o lib/libi2c.so.0.1.0 lib/smbus.o -lc
ld (ld-elf2flt): -shared used without passing a shared library ID

It is trying to unconditionally build a shared library, even when there
is no support for shared libraries.

You can reproduce using the following defconfig:

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
BR2_INIT_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_I2C_TOOLS=y
# BR2_TARGET_ROOTFS_TAR is not set

Could you look into this, and submit an updated version? It would be
preferably to support building without shared library support, because
i2c-tools are very basic, and potentially useful on noMMU systems.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
