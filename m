From: Hans Bulfone <hans@nil.at>
Date: Tue, 30 Jul 2013 04:20:26 +0200
Subject: [Buildroot] ERROR: Binary compiled with -mfloat-abi=hard but
 without -DUSE_EABI_HARDFLOAT
Message-ID: <20130730022026.GD1269@nil.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I've been playing around with Qt5/Qml on a Raspberry Pi.  Recently, after
pulling from git, qmlscene stopped working:

# echo "import QtQuick 2.0" > x.qml 
# echo "Item {}" >> x.qml 
# qmlscene x.qml
ERROR: Binary compiled with -mfloat-abi=hard but without -DUSE_EABI_HARDFLOAT
# 

The error message comes from V8 (a Javascript engine), and it's compiled
like this with -mfloat-abi=softfp and -DUSE_EABI_HARDFLOAT=0:

Executing /home/hans/dev/buildroot/output/host/opt/ext-toolchain/bin/arm-none-linux-gnueabi-g++ --sysroot /home/hans/dev/buildroot/output/host/usr/arm-buildroot-linux-gnueabi/sysroot -march=armv6zk -mtune=arm1176jzf-s -mabi=aapcs-linux -mfpu=vfp -marm -pipe -mfloat-abi=softfp -c -pipe -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -pipe -Os --sysroot=/home/hans/dev/buildroot/output/host/usr/arm-buildroot-linux-gnueabi/sysroot -O2 -O3 -w -fvisibility=hidden -fvisibility-inlines-hidden -fno-exceptions -D_REENTRANT -fPIC -DQT_NO_LIBUDEV -DQT_NO_XCB -DQT_BUILD_V8_LIB -DQT_BUILDING_QT -DQT_NO_CAST_TO_ASCII -DQT_ASCII_CAST_WARNINGS -DQT_MOC_COMPAT -DQT_USE_QSTRINGBUILDER -DQT_DEPRECATED_WARNINGS -DQT_DISABLE_DEPRECATED_BEFORE=0x050000 -DV8_SHARED -DBUILDING_V8_SHARED -DENABLE_DEBUGGER_SUPPORT -DENABLE_VMSTATE_TRACKING -DENABLE_LOGGING_AND_PROFILING -DNDEBUG -DV8_TARGET_ARCH_ARM -DUSE_EABI_HARDFLOAT=0 -DQT_NO_EXCEPTIONS -D_LARGEFILE64_SOURCE -D_LARGEFILE_SOURCE -DQT_NO_DEBUG -I/home/hans/dev/buildroot/output/host/usr/mkspecs/devices/linux-buildroot-g++ -I. -I/home/hans/dev/buildroot/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/include -I../../include -I../../include/QtV8 -I../../include/QtV8/5.0.2 -I../../include/QtV8/5.0.2/QtV8 -I../3rdparty/v8/src -o .obj/release-shared/platform-linux.o ../3rdparty/v8/src/platform-linux.cc

The check in
output/build/qt5jsbackend-5.0.2/src/3rdparty/v8/src/platform-linux.cc:

// Simple helper function to detect whether the C code is compiled with
// option -mfloat-abi=hard. The register d0 is loaded with 1.0 and the register
// pair r0, r1 is loaded with 0.0. If -mfloat-abi=hard is pased to GCC then
// calling this will return 1.0 and otherwise 0.0.
static void ArmUsingHardFloatHelper() {
  asm("mov r0, #0":::"r0");
#if defined(__VFP_FP__) && !defined(__SOFTFP__)
  // Load 0x3ff00000 into r1 using instructions available in both ARM
  // and Thumb mode.
  asm("mov r1, #3":::"r1");
  asm("mov r2, #255":::"r2");
  asm("lsl r1, r1, #8":::"r1");
  asm("orr r1, r1, r2":::"r1");
  asm("lsl r1, r1, #20":::"r1");
  // For vmov d0, r0, r1 use ARM mode.
#ifdef __thumb__
  asm volatile(
    "@   Enter ARM Mode  \n\t"
    "    adr r3, 1f      \n\t"
    "    bx  r3          \n\t"
    "    .ALIGN 4        \n\t"
    "    .ARM            \n"
    "1:  vmov d0, r0, r1 \n\t"
    "@   Enter THUMB Mode\n\t"
    "    adr r3, 2f+1    \n\t"
    "    bx  r3          \n\t"
    "    .THUMB          \n"
    "2:                  \n\t":::"r3");
#else
  asm("vmov d0, r0, r1");
#endif  // __thumb__
#endif  // defined(__VFP_FP__) && !defined(__SOFTFP__)
  asm("mov r1, #0":::"r1");
}


bool OS::ArmUsingHardFloat() {
  // Cast helper function from returning void to returning double.
  typedef double (*F)();
  F f = FUNCTION_CAST<F>(FUNCTION_ADDR(ArmUsingHardFloatHelper));
  return f() == 1.0;
}


[...]

  // When running on ARM hardware check that the EABI used by V8 and
  // by the C code is the same.
  bool hard_float = OS::ArmUsingHardFloat();
  if (hard_float) {
#if !USE_EABI_HARDFLOAT
    PrintF("ERROR: Binary compiled with -mfloat-abi=hard but without "
           "-DUSE_EABI_HARDFLOAT\n");
    exit(1);
#endif
  } else {
#if USE_EABI_HARDFLOAT
    PrintF("ERROR: Binary not compiled with -mfloat-abi=hard but with "
           "-DUSE_EABI_HARDFLOAT\n");
    exit(1);
#endif
  }



I don't really understand the assembler code, but the comment seems
reasonable.  Except that it seems to return 1.0 when it shouldn't :(

I'm going to try a build with BR2_ARM_SOFT_FLOAT and investigate this
further tomorrow but perhaps someone more knowledgeable than me has
a suggestion in the meantime :)

tnx&bye,
hans.
