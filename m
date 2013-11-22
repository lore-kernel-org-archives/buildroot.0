From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 22 Nov 2013 09:22:44 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2013-11-21
In-Reply-To: <CA+csPL55=jghW9jAuzqYW2sbDJgBE4EWfvani-5phAAr9si7-A@mail.gmail.com>
References: <20131122073003.1B835101305@stock.ovh.net>
 <CA+csPL55=jghW9jAuzqYW2sbDJgBE4EWfvani-5phAAr9si7-A@mail.gmail.com>
Message-ID: <20131122092244.03b0b696@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Espen Frimann Koren,

On Fri, 22 Nov 2013 08:58:22 +0100, Espen Frimann Koren wrote:

> I tried last week to tell you that I found the reason for the
> qt5declarative-5.1.1 build failure on ARM.
> 
> Either you have to change the defconfig of the build, or you have to
> put in a dependency on the package qt5declarative to locale support
> in the toolchain. For instance hide the package as long as the
> toolchain doesn't support locale (BR2_TOOLCHAIN_BUILDROOT_LOCALE), or
> automatically select BR2_TOOLCHAIN_BUILDROOT_LOCALE when ticking off
> qt5declarative

What bothers me a bit with this conclusion is that the compilation
fails when building something for the *host*, so the fact that the
target does or does not support locales should not make any difference.

See the compilation line:

g++ -c -pipe -O2 -fPIC -fvisibility=hidden -fvisibility-inlines-hidden -fno-exceptions -Wall -W -D_REENTRANT -DQT_NO_LIBUDEV -DQT_NO_XCB -DQT_BUILD_QMLDEVTOOLS_LIB -DQT_BUILDING_QT -DQT_NO_CAST_TO_ASCII -DQT_ASCII_CAST_WARNINGS -DQT_MOC_COMPAT -DQT_USE_QSTRINGBUILDER -DQT_DEPRECATED_WARNINGS -DQT_DISABLE_DEPRECATED_BEFORE=0x050000 -DQT_NO_EXCEPTIONS -D_LARGEFILE64_SOURCE -D_LARGEFILE_SOURCE -DQT_NO_DEBUG -DQT_BOOTSTRAP_LIB -DQT_BOOTSTRAPPED -DQT_LITE_UNICODE -DQT_NO_CAST_TO_ASCII -DQT_NO_CODECS -DQT_NO_DATASTREAM -DQT_NO_LIBRARY -DQT_NO_QOBJECT -DQT_NO_SYSTEMLOCALE -DQT_NO_THREAD -DQT_NO_UNICODETABLES -DQT_NO_USING_NAMESPACE -DQT_NO_DEPRECATED -DQT_NO_TRANSLATION -DQT_QMAKE_LOCATION="/scratch/peko/build/qt5base-5.1.1/bin/qmake" -I/scratch/peko/host/usr/mkspecs/linux-g++ -I. -I../../include -I../../include/QtQml -I../../include/QtQml/5.1.1 -I../../include/QtQml/5.1.1/QtQml -I/scratch/peko/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include -I/scratch/peko/host/usr/a
 rm-build
 root-linux-uclibcgnueabi/sysroot/usr/include/QtCore -I/scratch/peko/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/QtXml -I/scratch/peko/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/QtCore/5.1.1 -I/scratch/peko/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/QtCore/5.1.1/QtCore -I/scratch/peko/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/QtXml/5.1.1 -I/scratch/peko/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/QtXml/5.1.1/QtXml -o .obj/release-shared/qqmljsparser.o ../qml/qml/parser/qqmljsparser.cpp

It is using "g++", so it is building for the *host*. But it is using a
huge number of header files for the target. So I think there is
something screwed in the Qt build process *or* in the way we use it.

Selecting locale support for the target will just "hide" the problem
without fixing it for real, I believe (but I may have misunderstood the
problem, of course).

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
