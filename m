From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 24 Jul 2016 16:13:30 +0200
Subject: [Buildroot] [PATCH] package/gdb: fix gnulib issue with musl and
 uClibc toolchains
In-Reply-To: <20160724155515.73be1284@free-electrons.com>
References: <1469292622-32034-1-git-send-email-romain.naour@gmail.com>
 <20160724155515.73be1284@free-electrons.com>
Message-ID: <d39c775a-c185-71bd-007d-6139ba54e9d4@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 24/07/2016 ? 15:55, Thomas Petazzoni a ?crit :
> Hello,
> 
> On Sat, 23 Jul 2016 18:50:22 +0200, Romain Naour wrote:
>> gnulib whant to use rpl_gettimeofday due bad guessing when
>> cross-compiling with musl and uClibc toolchains.
>>
>> tracepoint-ipa.o: In function `get_timestamp':
>> tracepoint.c:(.text+0x147): undefined reference to `rpl_gettimeofday'
>> Makefile:329: recipe for target 'libinproctrace.so' failed
> 
> I tested the following defconfig:
> 
> BR2_arm=y
> BR2_cortex_a9=y
> BR2_ARM_ENABLE_VFP=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
> BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-cortex-a9-musl-2016.05-1162-g94c7298.tar.bz2"
> BR2_TOOLCHAIN_EXTERNAL_GCC_4_9=y
> BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_6=y
> BR2_TOOLCHAIN_EXTERNAL_CUSTOM_MUSL=y
> BR2_TOOLCHAIN_EXTERNAL_CXX=y
> BR2_INIT_NONE=y
> BR2_SYSTEM_BIN_SH_NONE=y
> # BR2_PACKAGE_BUSYBOX is not set
> BR2_PACKAGE_GDB=y
> BR2_PACKAGE_GDB_SERVER=y
> BR2_PACKAGE_GDB_DEBUGGER=y
> # BR2_TARGET_ROOTFS_TAR is not set
> 
> and did not encounter any problem.
> 
> If you can still reproduce the problem, isn't it solved by:
> 
> GDB_CONF_ENV += gl_cv_func_gettimeofday_clobber=no

Ha! yes, gdb build fine with this! (musl and uClibc)

Do you want to fix this locally (Reported-by) or I should resend a patch ?

Thanks,
Romain

> 
>  ?
> 
> Thanks,
> 
> Thomas
> 
