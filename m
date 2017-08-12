From: =?ISO-8859-15?B?Qmr2cm4=?= Kirchner <bjoern@am-soft.de>
Date: Sat, 12 Aug 2017 09:48:39 +0200
Subject: [Buildroot] [PATCH v6 0/3] Qt WebEngine support
In-Reply-To: <20170811223048.0c445573@windsurf>
References: <20170811013358.26864-1-gael.portay@savoirfairelinux.com>
 <20170811212937.62d819fc@tux.kirchner>
 <20170811223048.0c445573@windsurf>
Message-ID: <20170812094839.70a0c4b1@tux.kirchner>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Am Fri, 11 Aug 2017 22:30:48 +0200
schrieb Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:

> Hello,
> 
> On Fri, 11 Aug 2017 21:29:37 +0200, Bj?rn Kirchner wrote:
> > Hello Ga?l,
> > 
> > Am Thu, 10 Aug 2017 21:33:55 -0400
> > schrieb Ga?l PORTAY <gael.portay@savoirfairelinux.com>:
> > 
> > > Hi all,
> > > 
> > > The purpose of this patch series is to continue the integration of
> > > Qt5 WebEngine in buildroot; started long time ago by Akihiko Odaki
> > > [1] and Julien Corjon [2].
> > >   
> > ...
> > > 
> > > I have tested it with a rpi 3; and I will be glad if someone else
> > > has another EGL platform to test it.
> > >   
> > 
> > Thanks for your efforts. I have tried to compile the qt5webengine
> > package for Qt 5.9.1. Unfortunatly there is a build error.
> > 
> > I applied your patches to buildroot git master. My build machine is
> > Debian 8 64bit, my target is ARM Cortex-A8 (Olimex A10 Lime board
> > with Allwinner A10 CPU).
> > 
> > It looks like the build is calling the system compiler of the host,
> > which eventually seems to lead to a missing include file
> > (bits/c++config.h). Please see snipped from build output:
> > 
> > --- snip from build output ---
> > 
> > [8/9559] CXX v8_snapshot/obj/v8/mkpeephole/bytecode-operands.o
> > FAILED: v8_snapshot/obj/v8/mkpeephole/bytecode-operands.o 
> > /usr/bin/g++ -MMD -MF
> > v8_snapshot/obj/v8/mkpeephole/bytecode-operands.o.d
> > -DV8_DEPRECATION_WARNINGS -DUSE_UDEV -DUSE_AURA=1
> > -DUSE_OPENSSL_CERTS=1 -DUSE_OZONE=1 -DNO_TCMALLOC -DDISABLE_NACL
> > -DENABLE_TASK_MANAGER=1 -DENABLE_THEMES=1 -DFULL_SAFE_BROWSING
> > -DSAFE_BROWSING_CSD -DSAFE_BROWSING_DB_LOCAL -DCHROMIUM_BUILD
> > -DFIELDTRIAL_TESTING_ENABLED -DTOOLKIT_QT -D_FILE_OFFSET_BITS=64
> > -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DNDEBUG -DNVALGRIND
> > -DDYNAMIC_ANNOTATIONS_ENABLED=0 -DV8_I18N_SUPPORT
> > -DV8_TARGET_ARCH_ARM -DCAN_USE_ARMV7_INSTRUCTIONS
> > -DCAN_USE_VFP3_INSTRUCTIONS -DUSE_EABI_HARDFLOAT=1
> > -Iv8_snapshot/gen -I../../3rdparty/chromium
> > -I../../3rdparty/chromium/v8/include -Iv8_snapshot/gen/v8/include
> > -I../../3rdparty/chromium/v8 -fno-strict-aliasing
> > --param=ssp-buffer-size=4 -fstack-protector -funwind-tables -fPIC
> > -pipe -pthread -m32 -msse2 -mfpmath=sse -mmmx -g0
> > -fvisibility=hidden
> 
> There is -m32, so it's trying to build a 32 bit binary on your x86_64
> machine...
> 
> > -Wno-unused-local-typedefs -Wno-maybe-uninitialized
> > -Wno-missing-field-initializers -Wno-unused-parameter -O3 -fno-ident
> > -fdata-sections -ffunction-sections -fno-threadsafe-statics
> > -fvisibility-inlines-hidden -std=gnu++11 -fno-rtti -fno-exceptions
> > -Wno-deprecated -Wno-narrowing
> > -c ../../3rdparty/chromium/v8/src/interpreter/bytecode-operands.cc
> > -o v8_snapshot/obj/v8/mkpeephole/bytecode-operands.o In file
> > included from /usr/include/c++/4.9/ios:38:0,
> > from /usr/include/c++/4.9/ostream:38,
> > from ../../3rdparty/chromium/v8/src/globals.h:11,
> > from ../../3rdparty/chromium/v8/src/interpreter/bytecode-operands.h:8,
> > from ../../3rdparty/chromium/v8/src/interpreter/bytecode-operands.cc:5: /usr/include/c++/4.9/iosfwd:38:28:
> > fatal error: bits/c++config.h: No such file or directory #include
> > <bits/c++config.h> ^ compilation terminated.
> 
> ... but you don't have the 32 bit development headers installed.

You were absolutely right. After installing the missing headers,
compilation finished without errors. Thanks.

Best regards,

Bj?rn

> 
> Questions are:
> 
>  * Is it normal that qtwebengine builds this for the host machine. It
>    could be normal, if it's a program later used to generate
> data/code ?
> 
>  * If it's normal that it's built for the host, why do they force
>    building for 32 bits by passing -m32 ?
> 
> Best regards,
> 
> Thomas
