From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Mon, 2 Feb 2015 14:58:53 +0100
Subject: [Buildroot] target options for Cortex A8/A9
In-Reply-To: <20150201214846.52ebad82@free-electrons.com>
References: <8F194C039449403C9E9AFFB360BCF394@JohanW7>
 <20150201214846.52ebad82@free-electrons.com>
Message-ID: <66F3EFEC14AA47B8897BAEA351E714E2@JohanW7>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net


Dear Thomas ; 

Ok thanks for the info, I had selected NEON for the A8 and this resulted in a broken webkit build:
With vfpv3 selected it builds just fine.

Best Regards ,Johan

[7m>>> webkit 1.11.5 Building[27m
PATH="/home/buildroot12git/output/host/bin:/home/buildroot12git/output/host/sbin:/home/buildroot12git/output/host/usr/bin:/home/buil
droot12git/output/host/usr/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/home/buildroot12git/output/build/host-
cmake-3.0.2/bin"  /usr/bin/make -j5  -C /home/buildroot12git/output/build/webkit-1.11.5/
make[1]: Entering directory `/home/buildroot12git/output/build/webkit-1.11.5'
  GEN      generate-webkit2-forwarding-headers
  GEN      DerivedSources/JavaScriptCore/LLIntAssembly.h
offlineasm: Parsing ./Source/JavaScriptCore/llint/LowLevelInterpreter.asm and Programs/LLIntOffsetsExtractor and creating assembly
file DerivedSources/JavaScriptCore/LLIntAssembly.h.
offlineasm: No magic values found. Skipping assembly file generation.
  GEN      generate-webkit2-forwarding-headers
/usr/bin/make  all-am
make[2]: Entering directory `/home/buildroot12git/output/build/webkit-1.11.5'
/bin/mkdir -p ./.deps/DerivedSources
  CXXLD    Programs/jsc-1
  CC       Source/JavaScriptCore/API/tests/Programs_minidom-JSNodeList.o
  CC       Source/JavaScriptCore/API/tests/Programs_minidom-JSNode.o
  CC       Source/JavaScriptCore/API/tests/Programs_minidom-NodeList.o
  CXXLD    libwebkitgtk-1.0.la
In file included from ./Source/WTF/wtf/UnusedParam.h:24:0,
                 from Source/JavaScriptCore/API/tests/JSNodeList.c:30:
./Source/WTF/wtf/Platform.h:301:1: error: expected identifier or '(' before '/' token
In file included from ./Source/WTF/wtf/UnusedParam.h:24:0,
                 from Source/JavaScriptCore/API/tests/JSNode.c:33:
./Source/WTF/wtf/Platform.h:301:1: error: expected identifier or '(' before '/' token
make[2]: *** [Source/JavaScriptCore/API/tests/Programs_minidom-JSNodeList.o] Error 1
make[2]: *** Waiting for unfinished jobs....
make[2]: *** [Source/JavaScriptCore/API/tests/Programs_minidom-JSNode.o] Error 1
/home/buildroot12git/output/build/libglib2-2.42.0/glib/.libs/libglib-2.0.so: warning: the use of OBSOLESCENT `utime' is discouraged,
use `utimes'
/home/buildroot12git/output/build/libglib2-2.42.0/glib/.libs/libglib-2.0.so: warning: the use of OBSOLESCENT `utime' is discouraged,
use `utimes'
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libICE.so: warning: gethostbyaddr is
obsolescent, use getaddrinfo() instead.
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libxml2.so: warning: gethostbyname is
obsolescent, use getnameinfo() instead.
make[2]: Leaving directory `/home/buildroot12git/output/build/webkit-1.11.5'
make[1]: *** [all] Error 2
make[1]: Leaving directory `/home/buildroot12git/output/build/webkit-1.11.5'
make: *** [/home/buildroot12git/output/build/webkit-1.11.5/.stamp_built] Error 2

-----Oorspronkelijk bericht-----
Van: buildroot [mailto:buildroot-bounces at busybox.net] Namens Thomas Petazzoni
Verzonden: zondag 1 februari 2015 21:49
Aan: Sagaert Johan
CC: buildroot at busybox.net
Onderwerp: Re: [Buildroot] target options for Cortex A8/A9

Dear Sagaert Johan,

On Sun, 1 Feb 2015 20:51:48 +0100, Sagaert Johan wrote:

> I am using imx53, this cpu has according to the datasheet an NEON SIMD 
> media accelerator and an VFPv3 co-processor.
> So I would assume the same selections options as for the A9.
> I was wondering what makes the target options different for A8 vs A9.
> 
> I would think that for the imx53 it sould be the same as for the A9, 
> That is an NEON SIMD extension and a vfpv3 floating point engine.
> Please clarify, it is a bit confusing to me.
> 
> For the A8 I can select vfpv3 OR Neon, but not vfpv3 WITH NEON extension.

On Cortex-A8, NEON is mandatory. On Cortex-A9, NEON is optional. So when you activate Cortex-A8, Buildroot knows NEON is available.
When you activate Cortex-A9, since NEON is optional, you have to tell Buildroot if NEON is actually available or not.

See arch/Config.in.arm:

config BR2_cortex_a8
        bool "cortex-A8"
        select BR2_ARM_CPU_HAS_NEON
        select BR2_ARM_CPU_HAS_VFPV3
        select BR2_ARM_CPU_HAS_THUMB2
        select BR2_ARM_CPU_ARMV7A
config BR2_cortex_a9
        bool "cortex-A9"
        select BR2_ARM_CPU_MAYBE_HAS_NEON
        select BR2_ARM_CPU_MAYBE_HAS_VFPV3
        select BR2_ARM_CPU_HAS_THUMB2
        select BR2_ARM_CPU_ARMV7A

Note the difference between BR2_ARM_CPU_HAS_NEON for Cortex-A8 and BR2_ARM_CPU_MAYBE_HAS_NEON for Cortex-A9.

Best regards,

Thomas
--
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering http://free-electrons.com _______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
-------------- next part --------------
A non-text attachment was scrubbed...
Name: smime.p7s
Type: application/x-pkcs7-signature
Size: 6253 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150202/c9cea04c/attachment.bin>
