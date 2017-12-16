From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 16 Dec 2017 22:41:33 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-12-11
In-Reply-To: <20171212070027.6D87F20949@mail.free-electrons.com>
References: <20171212070027.6D87F20949@mail.free-electrons.com>
Message-ID: <20171216224133.06948a63@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 12 Dec 2017 08:00:27 +0100 (CET), Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:


> Results for branch 'master'
> ===========================
[...]
>          arm |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/0d6fd4e47866bdc19cad5d8183d8d02696b22121 |     
[...]

  checking for ICU...
  .../host/bin/arm-none-linux-gnueabi-g++ -c -pipe -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -g2 --sysroot=.../host/arm-buildroot-linux-gnueabi/sysroot -O2 -O3 -Wall -W -fPIC  -I. -I../../../mkspecs/devices/linux-buildroot-g++ -o icu.o icu.cpp
  In file included from .../host/arm-buildroot-linux-gnueabi/sysroot/usr/include/unicode/utypes.h:38:0,
                   from icu.cpp:34:
  .../host/arm-buildroot-linux-gnueabi/sysroot/usr/include/unicode/umachine.h:347:13: error: 'char16_t' does not name a type
       typedef char16_t UChar;
               ^
  In file included from .../host/arm-buildroot-linux-gnueabi/sysroot/usr/include/unicode/utypes.h:39:0,
                   from icu.cpp:34:
  .../host/arm-buildroot-linux-gnueabi/sysroot/usr/include/unicode/uversion.h:167:55: error: 'UChar' does not name a type
   u_versionFromUString(UVersionInfo versionArray, const UChar *versionString);
                                                         ^

The char16_t type is defined since c++11 (see [1]), but the qt icu test is compiled
without the -std=c++11 option, could be fixed by:

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index b3f9c799cb..b138624314 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -184,7 +184,10 @@ QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_QT5BASE_TSLIB),tslib)
 QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_LIBGLIB2),-glib,-no-glib)
 QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_LIBGLIB2),libglib2)
 
-QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_ICU),-icu,-no-icu)
+QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_ICU),-icu -c++std c++11,-no-icu)
+ifeq ($(BR2_PACKAGE_QT5BASE_ICU),y)
+QT5BASE_EXTRA_CFLAGS += -std=c++11
+endif
 QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_QT5BASE_ICU),icu)
 
 QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_EXAMPLES),-make,-nomake) examples

Feasible solution?

Regards,
Peter


[1] http://en.cppreference.com/w/cpp/keyword/char16_t
