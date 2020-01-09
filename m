From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Thu, 9 Jan 2020 15:01:49 +0100
Subject: [Buildroot] [PATCH] package/libnss: bump to version 3.49
In-Reply-To: <20200108221904.GJ17943@scaer>
References: <20200107162747.41821-1-giulio.benetti@benettiengineering.com>
 <20200108221904.GJ17943@scaer>
Message-ID: <ba70c084-3880-8345-006b-f8783ae5959e@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 1/8/20 11:19 PM, Yann E. MORIN wrote:
> Giulio, All,
> 
> On 2020-01-07 17:27 +0100, Giulio Benetti spake thusly:
>> Drop 2 upstreamed patches while bumping version.
>>
>> Release notes:
>> https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_3.49_release_notes
> 
> This causes build failures on ARM:
>      http://autobuild.buildroot.org/results/935/935b1bbf0dd15fce77448fa0dddab1cb1e600c9b/
>      http://autobuild.buildroot.org/results/cfa/cfa946973dd3acc60d4816273b8a64512da49737/
> 
> /home/buildroot/autobuild/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-gnueabihf/9.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld:
> Linux2.6_arm_arm-linux-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/gcm-arm32-neon.o: in function `gcm_HashMult_hw':
> /home/buildroot/autobuild/instance-1/output-1/build/libnss-3.49/nss/lib/freebl/gcm-arm32-neon.c:126: multiple definition of `gcm_HashMult_hw';
> Linux2.6_arm_arm-linux-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/gcm.o:/home/buildroot/autobuild/instance-1/output-1/build/libnss-3.49/nss/lib/freebl/gcm.c:57: first defined here
> /home/buildroot/autobuild/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-gnueabihf/9.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld:
> Linux2.6_arm_arm-linux-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/gcm-arm32-neon.o: in function `vcreate_u8':
> /home/buildroot/autobuild/instance-1/output-1/host/opt/ext-toolchain/lib/gcc/arm-buildroot-linux-gnueabihf/9.2.0/include/arm_neon.h:6582: multiple definition of `gcm_HashWrite_hw';
> Linux2.6_arm_arm-linux-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/gcm.o:/home/buildroot/autobuild/instance-1/output-1/build/libnss-3.49/nss/lib/freebl/gcm.c:49: first defined here
> /home/buildroot/autobuild/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-gnueabihf/9.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld:
> Linux2.6_arm_arm-linux-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/gcm-arm32-neon.o: in function `gcm_HashInit_hw':
> /home/buildroot/autobuild/instance-1/output-1/build/libnss-3.49/nss/lib/freebl/gcm-arm32-neon.c:186: multiple definition of `gcm_HashInit_hw';
> Linux2.6_arm_arm-linux-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/gcm.o:/home/buildroot/autobuild/instance-1/output-1/build/libnss-3.49/nss/lib/freebl/gcm.c:64: first defined here
> /home/buildroot/autobuild/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-gnueabihf/9.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld:
> Linux2.6_arm_arm-linux-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/gcm-arm32-neon.o: in function `gcm_HashZeroX_hw':
> /home/buildroot/autobuild/instance-1/output-1/build/libnss-3.49/nss/lib/freebl/gcm-arm32-neon.c:197: multiple definition of `gcm_HashZeroX_hw';
> Linux2.6_arm_arm-linux-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/gcm.o:gcm.c:(.text.gcm_HashZeroX_hw+0x0): first defined here
> collect2: error: ld returned 1 exit status
> 
> This is easy to reproduce with this defconfig:
> 
>      BR2_arm=y
>      BR2_cortex_a7=y
>      BR2_TOOLCHAIN_EXTERNAL=y
>      BR2_INIT_NONE=y
>      BR2_SYSTEM_BIN_SH_NONE=y
>      # BR2_PACKAGE_BUSYBOX is not set
>      BR2_PACKAGE_LIBNSS=y
>      # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set

Thank you for pointing me. I'm going to work on it right now.

-- 
Giulio Benetti
Benetti Engineering sas

> Regards,
> Yann E. MORIN.
> 
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> ---
>>   ...build-failure-due-to-missing-posix-s.patch | 26 --------------
>>   ...ix-PowerPc-build-sys-auxv.h-failure.patch} |  0
>>   ...nsinstall.c-build-failure-on-RHEL-7.patch} |  0
>>   ...6119-Fix-PPC-HW-Crypto-build-failure.patch | 36 -------------------
>>   package/libnss/libnss.hash                    |  2 +-
>>   package/libnss/libnss.mk                      |  2 +-
>>   6 files changed, 2 insertions(+), 64 deletions(-)
>>   delete mode 100644 package/libnss/0002-Bug-1602288-Fix-build-failure-due-to-missing-posix-s.patch
>>   rename package/libnss/{0003-Bug-1602743-Fix-PowerPc-build-sys-auxv.h-failure.patch => 0002-Bug-1602743-Fix-PowerPc-build-sys-auxv.h-failure.patch} (100%)
>>   rename package/libnss/{0004-Bug-1603398-Fix-nsinstall.c-build-failure-on-RHEL-7.patch => 0003-Bug-1603398-Fix-nsinstall.c-build-failure-on-RHEL-7.patch} (100%)
>>   delete mode 100644 package/libnss/0005-Bug-1606119-Fix-PPC-HW-Crypto-build-failure.patch
>>
>> diff --git a/package/libnss/0002-Bug-1602288-Fix-build-failure-due-to-missing-posix-s.patch b/package/libnss/0002-Bug-1602288-Fix-build-failure-due-to-missing-posix-s.patch
>> deleted file mode 100644
>> index 95e7b2bb56..0000000000
>> --- a/package/libnss/0002-Bug-1602288-Fix-build-failure-due-to-missing-posix-s.patch
>> +++ /dev/null
>> @@ -1,26 +0,0 @@
>> -From 2e1b003600156e4adcb88998eabf18addee45be1 Mon Sep 17 00:00:00 2001
>> -From: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> -Date: Sun, 8 Dec 2019 11:57:45 +0100
>> -Subject: [PATCH] Bug 1602288 - Fix build failure due to missing posix signal.h
>> -
>> -Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> ----
>> - nss/coreconf/Linux.mk | 2 +-
>> - 1 file changed, 1 insertion(+), 1 deletion(-)
>> -
>> -diff --git a/nss/coreconf/Linux.mk b/nss/coreconf/Linux.mk
>> -index d07f8a3c5..854d3ca96 100644
>> ---- a/nss/coreconf/Linux.mk
>> -+++ b/nss/coreconf/Linux.mk
>> -@@ -21,7 +21,7 @@ ifeq ($(USE_PTHREADS),1)
>> - endif
>> -
>> - DEFAULT_COMPILER = gcc
>> --DEFINES += -D_DEFAULT_SOURCE -D_BSD_SOURCE
>> -+DEFINES += -D_DEFAULT_SOURCE -D_BSD_SOURCE -D_POSIX_SOURCE
>> -
>> - ifeq ($(OS_TARGET),Android)
>> - ifndef ANDROID_NDK
>> ---
>> -2.20.1
>> -
>> diff --git a/package/libnss/0003-Bug-1602743-Fix-PowerPc-build-sys-auxv.h-failure.patch b/package/libnss/0002-Bug-1602743-Fix-PowerPc-build-sys-auxv.h-failure.patch
>> similarity index 100%
>> rename from package/libnss/0003-Bug-1602743-Fix-PowerPc-build-sys-auxv.h-failure.patch
>> rename to package/libnss/0002-Bug-1602743-Fix-PowerPc-build-sys-auxv.h-failure.patch
>> diff --git a/package/libnss/0004-Bug-1603398-Fix-nsinstall.c-build-failure-on-RHEL-7.patch b/package/libnss/0003-Bug-1603398-Fix-nsinstall.c-build-failure-on-RHEL-7.patch
>> similarity index 100%
>> rename from package/libnss/0004-Bug-1603398-Fix-nsinstall.c-build-failure-on-RHEL-7.patch
>> rename to package/libnss/0003-Bug-1603398-Fix-nsinstall.c-build-failure-on-RHEL-7.patch
>> diff --git a/package/libnss/0005-Bug-1606119-Fix-PPC-HW-Crypto-build-failure.patch b/package/libnss/0005-Bug-1606119-Fix-PPC-HW-Crypto-build-failure.patch
>> deleted file mode 100644
>> index 03ca25edf7..0000000000
>> --- a/package/libnss/0005-Bug-1606119-Fix-PPC-HW-Crypto-build-failure.patch
>> +++ /dev/null
>> @@ -1,36 +0,0 @@
>> -From ebf185f8e48b5aec622dc949cef1b19b0a7669ef Mon Sep 17 00:00:00 2001
>> -From: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> -Date: Wed, 1 Jan 2020 12:54:45 +0100
>> -Subject: [PATCH] Bug 1606119 - Fix PPC HW Crypto build failure
>> -
>> -All Altivec *_be() functions are supported from gcc version 8.x not 5.x
>> -so modify gcc version check that at the moment cause build failure due
>> -to missing Altivec *_be() functions.
>> -
>> -Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> -Upstream issue: https://bugzilla.mozilla.org/show_bug.cgi?id=1606119
>> ----
>> - nss/lib/freebl/gcm.h | 4 ++--
>> - 1 file changed, 2 insertions(+), 2 deletions(-)
>> -
>> -diff --git a/nss/lib/freebl/gcm.h b/nss/lib/freebl/gcm.h
>> -index 571b9ec55..aa4dee824 100644
>> ---- a/nss/lib/freebl/gcm.h
>> -+++ b/nss/lib/freebl/gcm.h
>> -@@ -41,11 +41,11 @@
>> - #endif
>> -
>> - /*
>> -- * PPC CRYPTO requires at least gcc 5 or clang. The LE check is purely
>> -+ * PPC CRYPTO requires at least gcc 8 or clang. The LE check is purely
>> -  * because it's only been tested on LE. If you're interested in BE,
>> -  * please send a patch.
>> -  */
>> --#if (defined(__clang__) || (defined(__GNUC__) && __GNUC__ >= 5)) && \
>> -+#if (defined(__clang__) || (defined(__GNUC__) && __GNUC__ >= 8)) && \
>> -     defined(IS_LITTLE_ENDIAN)
>> - #define USE_PPC_CRYPTO
>> - #endif
>> ---
>> -2.20.1
>> -
>> diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
>> index b53fc6d5f0..d87ad8e3ab 100644
>> --- a/package/libnss/libnss.hash
>> +++ b/package/libnss/libnss.hash
>> @@ -1,4 +1,4 @@
>>   # From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_48_RTM/src/SHA256SUMS
>> -sha256	3f9c822a86a4e3e1bfe63e2ed0f922d8b7c2e0b7cafe36774b1c627970d0f8ac  nss-3.48.tar.gz
>> +sha256	6738094dc4fd63061118a122bf3999a64fe8c7117fc52f6e81c2279181bde71d  nss-3.49.tar.gz
>>   # Locally calculated
>>   sha256	a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
>> diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
>> index 68389d46fc..950c9850d3 100644
>> --- a/package/libnss/libnss.mk
>> +++ b/package/libnss/libnss.mk
>> @@ -4,7 +4,7 @@
>>   #
>>   ################################################################################
>>   
>> -LIBNSS_VERSION = 3.48
>> +LIBNSS_VERSION = 3.49
>>   LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
>>   LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
>>   LIBNSS_DISTDIR = dist
>> -- 
>> 2.20.1
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
> 
