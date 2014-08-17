From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 17 Aug 2014 12:53:00 +0200
Subject: [Buildroot] [PATCH] package/lame: Fix compile on 32bit Intel
	with gcc-4.9.x
References: <1408227494-20770-1-git-send-email-bernd.kuhls@t-online.de>
 <20140817093621.664fad88@free-electrons.com>
Message-ID: <XnsA38C830E65DF6berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8
@public.gmane.org> wrote in news:20140817093621.664fad88 at free-
electrons.com:

> Dear Bernd Kuhls,
> 
> On Sun, 17 Aug 2014 00:18:14 +0200, Bernd Kuhls wrote:
> 
>> +# http://lists.linuxfromscratch.org/pipermail/blfs-dev/2014-
April/027259.html
>> +# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=56145
>> +ifeq ($(BR2_i386)$(BR2_GCC_VERSION_4_9_X),yy)
>> +define LAME_COMPILE_FIX
>> +     $(SED) '/xmmintrin\.h/d' $(@D)/configure
>> +endef
>> +LAME_PRE_CONFIGURE_HOOKS += LAME_COMPILE_FIX
>> +endif
> 
> Unfortunately, this sort of check is not really acceptable, because it
> doesn't work with external toolchains: BR2_GCC_VERSION_* symbols are
> defined only for internal toolchains.

Hi Thomas,

I understand, but removing the gcc version check, which would remove 
support for xmmintrin.h in all i386 builds, would remove the mmx support 
for lame on many builds, where it is not necessary.

Would something like this, extended to all external toolchains, be 
acceptable?

--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -18,6 +18,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM
        select BR2_INSTALL_LIBSTDCPP
        select BR2_HOSTARCH_NEEDS_IA32_LIBS
        select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_1
+       select BR2_GCC_VERSION_4_9_X
        help
          Linaro toolchain for the ARM architecture. It uses Linaro
          GCC 2014.05 (based on gcc 4.9), Linaro GDB 2014.05 (based on

In addition I could add a warning to package/lame/Config.in when gcc-4.9 is 
activated to inform users that mmx support is broken.

Regards, Bernd
