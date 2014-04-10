From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 10 Apr 2014 09:28:23 +0300
Subject: [Buildroot] [PATCH] ne10: bump version to 1.0.0
In-Reply-To: <CAHXCMMJB-tMOO-YaYxsBMQ7v=AonKbr9-xO4frMB4BF5yiBADw@mail.gmail.com>
References: <99baf8d8d8d05b5f2de390deef6546acab0199dd.1396965306.git.baruch@tkos.co.il>
 <CAHXCMML_DSi3Mk55ez2u3Fpn1e=0BO2s=V7wgCoXKf1M_9o6Gw@mail.gmail.com>
 <20140410043951.GS4096@tarshish>
 <CAHXCMMJB-tMOO-YaYxsBMQ7v=AonKbr9-xO4frMB4BF5yiBADw@mail.gmail.com>
Message-ID: <20140410062823.GT4096@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Samuel,

On Thu, Apr 10, 2014 at 07:26:04AM +0200, Samuel Martin wrote:
> On Thu, Apr 10, 2014 at 6:39 AM, Baruch Siach <baruch@tkos.co.il> wrote:
> [...]
> >> > +diff --git a/CMakeLists.txt b/CMakeLists.txt
> >> > +index e5a98af53c1f..22ce166650da 100644
> >> > +--- a/CMakeLists.txt
> >> > ++++ b/CMakeLists.txt
> >> > +@@ -78,7 +78,7 @@ if(ANDROID_PLATFORM)
> >> > +       add_subdirectory(android/NE10Demo/jni)
> >> > +     endif()
> >> > + elseif(GNULINUX_PLATFORM)
> >> > +-    set(CMAKE_C_FLAGS "-O2 -mthumb-interwork -mthumb -march=armv7-a -mfpu=vfp3")
> >> > ++    set(CMAKE_C_FLAGS "-O2 -mthumb-interwork -mthumb -march=armv7-a -mfloat-abi=softfp -mfpu=neon")
> >> > +     set(CMAKE_ASM_FLAGS "-mthumb-interwork -mthumb -march=armv7-a -mfpu=neon")
> >> > + elseif(IOS_PLATFORM)
> >> > +     #set minimal target ios version.If not provided this option, Xcode
> >>
> >> I clearly don't like this patch, so I nack it.
> >
> > I don't like it either.
> >
> >> [...]
> >>
> >> Instead of messing the CMAKE_C_FLAGS in the package build system
> >> itself for something related to the target, I suggest to do this logic
> >> in the Buildroot ne10.mk.
> >>
> >> I mean, the toolchainfile.cmake allows you to pass some CFLAGS because it does:
> >> set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS}   -pipe -Os ... " CACHE STRING
> >> "Buildroot CFLAGS" FORCE)
> >
> > But toolchainfile.cmake is a global file, it doesn't change per package.
> >
> >> So you can add the logic adjusting the -mfloat-abi=... and -mfpu=...
> >> in the ne10.mk:
> >> NE10_CONF_OPT +=
> >> -DCMAKE_C_FLAGS="-mfloat-abi=$(BR2_GCC_TARGET_FLOAT_ABI)
> >> -mfpu=$(BR2_GCC_TARGET_FPU)"
> >
> > A quick test shows that this solution doesn't work. Just added:
> >
> > NE10_CONF_OPT += "-DCMAKE_C_FLAGS=-O2 -mthumb-interwork -mthumb \
> >         -march=armv7-a -mfloat-abi=softfp -mfpu=neon"
> >
> > instead of patching, and got the same failure.
> 
> Arf! Indeed, our CFLAGS got override by the default ones in the
> toolchainfile.cmake.
> Could you try this patch: http://code.bulix.org/w0j2qz-86015 ?

It turns out that this patch is not needed in this case. The -float-abi and 
-mfpu parameters are set by the toolchain wrapper. ne10 just needs to depend 
on the correct float/abi configuration.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
