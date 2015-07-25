From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 25 Jul 2015 18:43:58 +0200
Subject: [Buildroot] [PATCH 03/47] package/libcec: bump to version 3.0.1
In-Reply-To: <1437597069-6448-4-git-send-email-bernd.kuhls@t-online.de>
References: <1437597069-6448-1-git-send-email-bernd.kuhls@t-online.de>
 <1437597069-6448-4-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150725164358.GL3662@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2015-07-22 22:30 +0200, Bernd Kuhls spake thusly:
> - reflect upstream changes of the build system by switching from
>   an autotools-package to cmake-package
> - package is broken with gcc 4.5.4
>   https://github.com/Pulse-Eight/libcec/issues/78#issuecomment-91578591
>   "4.6 is no longer supported. you need a C++ 11 compatible compiler,
>    so 4.7 or newer"
>   Since buildroot does not contain gcc 4.6 anymore, using
>   depends on !BR2_GCC_VERSION_4_5_X
>   is enough.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

This does not build with the toolchain Linaro ARM 2014.09 (gcc-4.9), with
a *lot* of error messages:


1) at configure time, a git issue:

-- git found: fatal: Not a git repository (or any parent up to mount point /home)
Stopping at filesystem boundary (GIT_DISCOVERY_ACROSS_FILESYSTEM not set).
\n

-- lib info: git revision: fatal: Not a git repository (or any parent up to mount point /home)
Stopping at filesystem boundary (GIT_DISCOVERY_ACROSS_FILESYSTEM not set).
\n, compiled on Sat Jul 25 16:13:04 UTC 2015 by ymorin at ns304657.ip-46-105-103.eu on
Linux 3.13.0-55-generic (x86_64), features: P8_USB, P8_detect, 'RPi'

====================

2) at build time, the consequences of that git issue:

[  2%] Building CXX object src/libcec/CMakeFiles/cec.dir/CECClient.cpp.o
arm-linux-gnueabihf-g++: WARNING: unsafe header/library path used in cross-compilation: '/usr/include/platform'
In file included from /home/ymorin/dev/buildroot/O/build/libcec-libcec-3.0.1/src/libcec/CECClient.cpp:34:0:
/home/ymorin/dev/buildroot/O/build/libcec-libcec-3.0.1/src/libcec/env.h:76:19: warning: missing terminating " character
 #define LIB_INFO ("git revision: fatal: Not a git repository (or any parent up to mount point /home)
                   ^
/home/ymorin/dev/buildroot/O/build/libcec-libcec-3.0.1/src/libcec/env.h:78:1: error: stray ?\? in program
 \n, compiled on Sat Jul 25 16:35:56 UTC 2015 by ymorin at ns304657.ip-46-105-103.eu on Linux 3.13.0-55-generic (x86_64), features: P8_USB, P8_detect, 'RPi'")
 ^
/home/ymorin/dev/buildroot/O/build/libcec-libcec-3.0.1/src/libcec/env.h:78:55: error: stray ?@? in program
 \n, compiled on Sat Jul 25 16:35:56 UTC 2015 by ymorin at ns304657.ip-46-105-103.eu on Linux 3.13.0-55-generic (x86_64), features: P8_USB, P8_detect, 'RPi'")
                                                       ^
/home/ymorin/dev/buildroot/O/build/libcec-libcec-3.0.1/src/libcec/env.h:78:75: error: exponent has no digits
 \n, compiled on Sat Jul 25 16:35:56 UTC 2015 by ymorin at ns304657.ip-46-105-103.eu on Linux 3.13.0-55-generic (x86_64), features: P8_USB, P8_detect, 'RPi'")
                                                                           ^
/home/ymorin/dev/buildroot/O/build/libcec-libcec-3.0.1/src/libcec/env.h:78:91: error: too many decimal points in number
 \n, compiled on Sat Jul 25 16:35:56 UTC 2015 by ymorin at ns304657.ip-46-105-103.eu on Linux 3.13.0-55-generic (x86_64), features: P8_USB, P8_detect, 'RPi'")
                                                                                           ^
In file included from /home/ymorin/dev/buildroot/O/build/libcec-libcec-3.0.1/src/libcec/CECClient.cpp:34:0:
/home/ymorin/dev/buildroot/O/build/libcec-libcec-3.0.1/src/libcec/env.h:78:148: warning: multi-character character constant [-Wmultichar]
 \n, compiled on Sat Jul 25 16:35:56 UTC 2015 by ymorin at ns304657.ip-46-105-103.eu on Linux 3.13.0-55-generic (x86_64), features: P8_USB, P8_detect, 'RPi'")
                                                                                                                                                    ^
/home/ymorin/dev/buildroot/O/build/libcec-libcec-3.0.1/src/libcec/env.h:78:153: warning: missing terminating " character
 \n, compiled on Sat Jul 25 16:35:56 UTC 2015 by ymorin at ns304657.ip-46-105-103.eu on Linux 3.13.0-55-generic (x86_64), features: P8_USB, P8_detect, 'RPi'")
                                                                                                                                                         ^
In file included from /home/ymorin/dev/buildroot/O/build/libcec-libcec-3.0.1/src/libcec/CECClient.cpp:34:0:
/home/ymorin/dev/buildroot/O/build/libcec-libcec-3.0.1/src/libcec/env.h:78:1: error: missing terminating " character
 \n, compiled on Sat Jul 25 16:35:56 UTC 2015 by ymorin at ns304657.ip-46-105-103.eu on Linux 3.13.0-55-generic (x86_64), features: P8_USB, P8_detect, 'RPi'")
 ^
/home/ymorin/dev/buildroot/O/build/libcec-libcec-3.0.1/src/libcec/env.h:77:1: error: ?Stopping? does not name a type
 Stopping at filesystem boundary (GIT_DISCOVERY_ACROSS_FILESYSTEM not set).
 ^^

====================

3) at build time, a thread issue:

[  2%] Building CXX object src/libcec/CMakeFiles/cec.dir/CECClient.cpp.o
arm-linux-gnueabihf-g++: WARNING: unsafe header/library path used in cross-compilation: '/usr/include/platform'
[--SNIP--]
In file included from /home/ymorin/dev/buildroot/O/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/platform/threads/threads.h:34:0,
                 from /home/ymorin/dev/buildroot/O/build/libcec-libcec-3.0.1/src/libcec/CECClient.h:37,
                 from /home/ymorin/dev/buildroot/O/build/libcec-libcec-3.0.1/src/libcec/CECClient.cpp:35:
/home/ymorin/dev/buildroot/O/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/platform/threads/mutex.h:123:5: error: ?mutex_t? does not name a type
     mutex_t               m_mutex;
     ^
In file included from /home/ymorin/dev/buildroot/O/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/platform/threads/mutex.h:39:0,
                 from /home/ymorin/dev/buildroot/O/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/platform/threads/threads.h:34,
                 from /home/ymorin/dev/buildroot/O/build/libcec-libcec-3.0.1/src/libcec/CECClient.h:37,
                 from /home/ymorin/dev/buildroot/O/build/libcec-libcec-3.0.1/src/libcec/CECClient.cpp:35:
/home/ymorin/dev/buildroot/O/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/platform/threads/mutex.h: In constructor ?PLATFORM::CMutex::CMutex()?:
/home/ymorin/dev/buildroot/O/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/platform/threads/mutex.h:68:7: error: ?m_mutex? was not declared in this scope
       MutexCreate(m_mutex);
       ^
/home/ymorin/dev/buildroot/O/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/platform/threads/mutex.h:68:7: error: ?GetRecursiveMutexAttribute? was not declared in this scope
       MutexCreate(m_mutex);
       ^
/home/ymorin/dev/buildroot/O/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/platform/threads/mutex.h: In destructor ?PLATFORM::CMutex::~CMutex()?:
/home/ymorin/dev/buildroot/O/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/platform/threads/mutex.h:74:7: error: ?m_mutex? was not declared in this scope
       MutexDelete(m_mutex);
       ^
/home/ymorin/dev/buildroot/O/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/platform/threads/mutex.h: In member function ?bool PLATFORM::CMutex::TryLock()?:
/home/ymorin/dev/buildroot/O/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/platform/threads/mutex.h:79:11: error: ?m_mutex? was not declared in this scope
       if (MutexTryLock(m_mutex))
           ^
/home/ymorin/dev/buildroot/O/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/platform/threads/mutex.h: In member function ?bool PLATFORM::CMutex::Lock()?:
/home/ymorin/dev/buildroot/O/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/platform/threads/mutex.h:89:7: error: ?m_mutex? was not declared in this scope
       MutexLock(m_mutex);
       ^
/home/ymorin/dev/buildroot/O/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/platform/threads/mutex.h: In member function ?void PLATFORM::CMutex::Unlock()?:
/home/ymorin/dev/buildroot/O/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/platform/threads/mutex.h:101:11: error: ?m_mutex? was not declared in this scope
           MutexUnlock(m_mutex);
           ^
/home/ymorin/dev/buildroot/O/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/platform/threads/mutex.h:105:9: error: ?m_mutex? was not declared in this scope
         MutexUnlock(m_mutex);
         ^
In file included from /home/ymorin/dev/buildroot/O/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/platform/threads/threads.h:34:0,
                 from /home/ymorin/dev/buildroot/O/build/libcec-libcec-3.0.1/src/libcec/CECClient.h:37,
                 from /home/ymorin/dev/buildroot/O/build/libcec-libcec-3.0.1/src/libcec/CECClient.cpp:35:
/home/ymorin/dev/buildroot/O/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/platform/threads/mutex.h: At global scope:
/home/ymorin/dev/buildroot/O/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/platform/threads/mutex.h:285:7: error: ?CConditionImpl? does not name a type
       CConditionImpl m_condition;
       ^
/home/ymorin/dev/buildroot/O/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/platform/threads/mutex.h: In destructor ?PLATFORM::CCondition<_Predicate>::~CCondition()?:
/home/ymorin/dev/buildroot/O/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/platform/threads/mutex.h:243:9: error: ?m_condition? was not declared in this scope
         m_condition.Broadcast();
         ^
/home/ymorin/dev/buildroot/O/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/platform/threads/mutex.h: In member function ?void PLATFORM::CCondition<_Predicate>::Broadcast()?:
/home/ymorin/dev/buildroot/O/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/platform/threads/mutex.h:248:9: error: ?m_condition? was not declared in this scope
         m_condition.Broadcast();
         ^
/home/ymorin/dev/buildroot/O/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/platform/threads/mutex.h: In member function ?void PLATFORM::CCondition<_Predicate>::Signal()?:
/home/ymorin/dev/buildroot/O/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/platform/threads/mutex.h:253:9: error: ?m_condition? was not declared in this scope
         m_condition.Signal();
         ^
/home/ymorin/dev/buildroot/O/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/platform/threads/mutex.h: In member function ?bool PLATFORM::CCondition<_Predicate>::Wait(PLATFORM::CMutex&, uint32_t)?:
/home/ymorin/dev/buildroot/O/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/platform/threads/mutex.h:258:16: error: ?m_condition? was not declared in this scope
         return m_condition.Wait(mutex.m_mutex, iTimeout);
                ^
/home/ymorin/dev/buildroot/O/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/platform/threads/mutex.h:258:39: error: ?class PLATFORM::CMutex? has no member named ?m_mutex?
         return m_condition.Wait(mutex.m_mutex, iTimeout);
                                       ^
/home/ymorin/dev/buildroot/O/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/platform/threads/mutex.h: In member function ?bool PLATFORM::CCondition<_Predicate>::Wait(PLATFORM::CMutex&, PLATFORM::PredicateCallback, void*, uint32_t)?:
/home/ymorin/dev/buildroot/O/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/platform/threads/mutex.h:273:11: error: ?m_condition? was not declared in this scope
           m_condition.Wait(mutex.m_mutex, iMsLeft);
           ^
/home/ymorin/dev/buildroot/O/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/platform/threads/mutex.h:273:34: error: ?class PLATFORM::CMutex? has no member named ?m_mutex?
           m_condition.Wait(mutex.m_mutex, iMsLeft);
                                  ^
In file included from /home/ymorin/dev/buildroot/O/build/libcec-libcec-3.0.1/src/libcec/CECClient.h:37:0,
                 from /home/ymorin/dev/buildroot/O/build/libcec-libcec-3.0.1/src/libcec/CECClient.cpp:35:
/home/ymorin/dev/buildroot/O/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/platform/threads/threads.h: At global scope:
/home/ymorin/dev/buildroot/O/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/platform/threads/threads.h:151:5: error: ?thread_t? does not name a type
     thread_t         m_thread;
     ^
In file included from /home/ymorin/dev/buildroot/O/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/platform/threads/mutex.h:39:0,
                 from /home/ymorin/dev/buildroot/O/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/platform/threads/threads.h:34,
                 from /home/ymorin/dev/buildroot/O/build/libcec-libcec-3.0.1/src/libcec/CECClient.h:37,
                 from /home/ymorin/dev/buildroot/O/build/libcec-libcec-3.0.1/src/libcec/CECClient.cpp:35:
/home/ymorin/dev/buildroot/O/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/platform/threads/threads.h: In member function ?virtual bool PLATFORM::CThread::CreateThread(bool)?:
/home/ymorin/dev/buildroot/O/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/platform/threads/threads.h:97:15: error: ?m_thread? was not declared in this scope
           if (ThreadsCreate(m_thread, CThread::ThreadHandler, ((void*)static_cast<CThread *>(this))))
               ^
/home/ymorin/dev/buildroot/O/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/platform/threads/threads.h:97:15: error: ?GetDetachedThreadAttribute? was not declared in this scope
           if (ThreadsCreate(m_thread, CThread::ThreadHandler, ((void*)static_cast<CThread *>(this))))
               ^
make[4]: *** [src/libcec/CMakeFiles/cec.dir/CECClient.cpp.o] Error 1
make[3]: *** [src/libcec/CMakeFiles/cec.dir/all] Error 2
make[2]: *** [all] Error 2
make[1]: *** [/home/ymorin/dev/buildroot/O/build/libcec-libcec-3.0.1/.stamp_built] Error 2
make: *** [_all] Error 2

====================

Here's my defconfig  (with your full Kodi-15.0 series applied):

BR2_arm=y
BR2_cortex_a7=y
BR2_ARM_EABIHF=y
BR2_ARM_FPU_NEON_VFPV4=y
BR2_JLEVEL=1
BR2_TOOLCHAIN_EXTERNAL=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_TARGET_GENERIC_GETTY_PORT="tty1"
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_GIT=y
BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/raspberrypi/linux.git"
BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="f90f981770e3ac8506dc84c9cd01471faaa0b0c2"
BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
BR2_LINUX_KERNEL_ZIMAGE=y
BR2_LINUX_KERNEL_DTS_SUPPORT=y
BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2709-rpi-2-b"
BR2_PACKAGE_KODI=y
BR2_PACKAGE_KODI_ALSA_LIB=y
BR2_PACKAGE_KODI_AVAHI=y
BR2_PACKAGE_KODI_DBUS=y
BR2_PACKAGE_KODI_LIBBLURAY=y
BR2_PACKAGE_KODI_LIBCEC=y
BR2_PACKAGE_KODI_LIRC=y
BR2_PACKAGE_KODI_LIBMICROHTTPD=y
BR2_PACKAGE_KODI_LIBNFS=y
BR2_PACKAGE_KODI_RTMPDUMP=y
BR2_PACKAGE_KODI_LIBSHAIRPLAY=y
BR2_PACKAGE_KODI_LIBSMBCLIENT=y
BR2_PACKAGE_KODI_LIBTHEORA=y
BR2_PACKAGE_KODI_LIBUSB=y
BR2_PACKAGE_KODI_LIBVA=y
BR2_PACKAGE_KODI_WAVPACK=y
BR2_PACKAGE_KODI_ADDON_XVDR=y
BR2_PACKAGE_KODI_PVR_ARGUSTV=y
BR2_PACKAGE_KODI_PVR_DVBLINK=y
BR2_PACKAGE_KODI_PVR_DVBVIEWER=y
BR2_PACKAGE_KODI_PVR_FILMON=y
BR2_PACKAGE_KODI_PVR_HTS=y
BR2_PACKAGE_KODI_PVR_IPTVSIMPLE=y
BR2_PACKAGE_KODI_PVR_MEDIAPORTAL_TVSERVER=y
BR2_PACKAGE_KODI_PVR_MYTHTV=y
BR2_PACKAGE_KODI_PVR_NEXTPVR=y
BR2_PACKAGE_KODI_PVR_NJOY=y
BR2_PACKAGE_KODI_PVR_PCTV=y
BR2_PACKAGE_KODI_PVR_STALKER=y
BR2_PACKAGE_KODI_PVR_VBOX=y
BR2_PACKAGE_KODI_PVR_VDR_VNSI=y
BR2_PACKAGE_KODI_PVR_VUPLUS=y
BR2_PACKAGE_KODI_PVR_WMC=y
BR2_PACKAGE_KODI_AUDIODECODER_MODPLUG=y
BR2_PACKAGE_KODI_AUDIODECODER_NOSEFART=y
BR2_PACKAGE_KODI_AUDIODECODER_SIDPLAY=y
BR2_PACKAGE_KODI_AUDIODECODER_SNESAPU=y
BR2_PACKAGE_KODI_AUDIODECODER_STSOUND=y
BR2_PACKAGE_KODI_AUDIODECODER_TIMIDITY=y
BR2_PACKAGE_KODI_AUDIODECODER_VGMSTREAM=y
BR2_PACKAGE_KODI_AUDIOENCODER_FLAC=y
BR2_PACKAGE_KODI_AUDIOENCODER_LAME=y
BR2_PACKAGE_KODI_AUDIOENCODER_VORBIS=y
BR2_PACKAGE_KODI_AUDIOENCODER_WAV=y
BR2_PACKAGE_KODI_SCREENSAVER_ASTEROIDS=y
BR2_PACKAGE_KODI_SCREENSAVER_BIOGENESIS=y
BR2_PACKAGE_KODI_SCREENSAVER_GREYNETIC=y
BR2_PACKAGE_KODI_SCREENSAVER_PINGPONG=y
BR2_PACKAGE_KODI_SCREENSAVER_PYRO=y
BR2_PACKAGE_KODI_SCREENSAVER_STARS=y
BR2_PACKAGE_KODI_VISUALISATION_SHADERTOY=y
BR2_PACKAGE_KODI_VISUALISATION_SPECTRUM=y
BR2_PACKAGE_KODI_VISUALISATION_WAVEFORHUE=y
BR2_PACKAGE_KODI_VISUALISATION_WAVEFORM=y
BR2_PACKAGE_RPI_FIRMWARE=y
# BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS is not set
BR2_PACKAGE_RPI_USERLAND=y


Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
