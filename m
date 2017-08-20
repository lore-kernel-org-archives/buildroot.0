From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Aug 2017 22:26:02 +0200
Subject: [Buildroot] [PATCH] glibc: needs kernel headers >= 4.5 on
 mips(64)
In-Reply-To: <20170820144154.15347-1-romain.naour@gmail.com>
References: <20170820144154.15347-1-romain.naour@gmail.com>
Message-ID: <20170820222602.1f51bd7c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

+Vicente, since the discussion is MIPS related.

On Sun, 20 Aug 2017 16:41:54 +0200, Romain Naour wrote:

> I tried to use BR2_MIPS_NAN_2008 but it trigger a circular dependency in Kconfig.

I indeed tried:

diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index f47001f..9b25809 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -50,7 +50,8 @@ config BR2_TOOLCHAIN_BUILDROOT_GLIBC
                   BR2_microblaze || BR2_nios2
        depends on BR2_USE_MMU
        depends on !BR2_STATIC_LIBS
-       depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
+       depends on (BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2 && !BR2_MIPS_NAN_2008) || \
+               (BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_5 && BR2_MIPS_NAN_2008)
        depends on !BR2_powerpc_SPE
        select BR2_TOOLCHAIN_USES_GLIBC
        # our glibc.mk enables RPC support
@@ -63,8 +64,14 @@ config BR2_TOOLCHAIN_BUILDROOT_GLIBC
 
 comment "glibc needs a toolchain w/ dynamic library, kernel headers >= 3.2"
        depends on BR2_USE_MMU
+       depends on !BR2_MIPS_NAN_2008
        depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
 
+comment "glibc needs a toolchain w/ dynamic library, kernel headers >= 4.5"
+       depends on BR2_USE_MMU
+       depends on BR2_MIPS_NAN_2008
+       depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_5
+
 config BR2_TOOLCHAIN_BUILDROOT_MUSL
        bool "musl"
        depends on BR2_aarch64    || BR2_arm     || BR2_armeb     || BR2_i386 || \

And Kconfig yells with:

toolchain/toolchain-buildroot/Config.in:23:error: recursive dependency detected!
toolchain/toolchain-buildroot/Config.in:23:	choice <choice> contains symbol BR2_TOOLCHAIN_BUILDROOT_GLIBC
toolchain/toolchain-buildroot/Config.in:43:	symbol BR2_TOOLCHAIN_BUILDROOT_GLIBC depends on BR2_MIPS_NAN_2008
arch/Config.in.mips:168:	symbol BR2_MIPS_NAN_2008 is selected by BR2_MIPS_ENABLE_NAN_2008
arch/Config.in.mips:185:	symbol BR2_MIPS_ENABLE_NAN_2008 is part of choice <choice>
arch/Config.in.mips:171:	choice <choice> contains symbol <choice>
arch/Config.in.mips:171:	choice <choice> contains symbol BR2_TOOLCHAIN_HAS_MNAN_OPTION
toolchain/toolchain-common.in:347:	symbol BR2_TOOLCHAIN_HAS_MNAN_OPTION depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
toolchain/toolchain-common.in:314:	symbol BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 is selected by BR2_TOOLCHAIN_GCC_AT_LEAST_5
toolchain/toolchain-common.in:318:	symbol BR2_TOOLCHAIN_GCC_AT_LEAST_5 is selected by BR2_TOOLCHAIN_GCC_AT_LEAST_6
toolchain/toolchain-common.in:322:	symbol BR2_TOOLCHAIN_GCC_AT_LEAST_6 is selected by BR2_TOOLCHAIN_GCC_AT_LEAST_7
toolchain/toolchain-common.in:326:	symbol BR2_TOOLCHAIN_GCC_AT_LEAST_7 is selected by BR2_GCC_VERSION_7_X
package/gcc/Config.in.host:68:	symbol BR2_GCC_VERSION_7_X is part of choice <choice>
package/gcc/Config.in.host:3:	choice <choice> contains symbol BR2_GCC_VERSION_4_9_X
package/gcc/Config.in.host:23:	symbol BR2_GCC_VERSION_4_9_X depends on BR2_TOOLCHAIN_USES_MUSL
toolchain/Config.in:25:	symbol BR2_TOOLCHAIN_USES_MUSL is selected by BR2_TOOLCHAIN_BUILDROOT_MUSL
toolchain/toolchain-buildroot/Config.in:75:	symbol BR2_TOOLCHAIN_BUILDROOT_MUSL is part of choice <choice>

And I believe he is right to yell about this. I think the addition of
the BR2_TOOLCHAIN_HAS_<xyz>_OPTION dependencies in arch/Config.in.mips
is what causes the problem. Indeed, it's the first time we have a
dependency on an architecture option to a toolchain option. This is not
logical, because in Buildroot, you first select the architecture, and
then you select the toolchain details. For example, we disallow
selecting a given gcc version if it is not supported on a given
architecture. But here, those BR2_TOOLCHAIN_HAS_MFPXX_OPTION /
BR2_TOOLCHAIN_HAS_MNAN_OPTION are doing the opposite: they prevent you
from selecting a given architecture variant if the gcc version is not
sufficient.

I believe we need to invert those dependencies, and instead have a
mechanism where selecting a too old gcc version is not possible when
-mnan/-mfp are used on MIPS.

Yann is specifically working on a mechanism to allow architectures to
describe what minimum gcc version they need. Perhaps we should use that
to express this dependency as well. Adding Yann in Cc :)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
