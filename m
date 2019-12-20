From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Fri, 20 Dec 2019 12:43:30 +0100
Subject: [Buildroot] [PATCH] package/qt5/qt5webengine: fix build error
In-Reply-To: <20190811223051.707ac1a8@windsurf.home>
References: <20190730115832.21008-1-b.bilas@grinn-global.com>
 <20190730233029.7360e1bd@gmx.net>
 <ff0a929f-f321-7eb6-a9ea-91abd85bacf5@grinn-global.com>
 <20190811223051.707ac1a8@windsurf.home>
Message-ID: <238c867c-5852-8295-d62e-ee6bf6812391@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Bartosz, All,

On 8/11/19 10:30 PM, thomas.petazzoni at bootlin.com (Thomas Petazzoni) 
wrote:
> Hello,
> 
> On Wed, 31 Jul 2019 09:15:13 +0200
> Bartosz Bi?as <b.bilas@grinn-global.com> wrote:
> 
>> --sysroot=../../../../../host/arm-buildroot-linux-gnueabihf/sysroot
>> -fvisibility-inlines-hidden -c
>> ../../3rdparty/chromium/third_party/skia/third_party/skcms/skcms.cc -o
>> obj/skia/skcms/skcms.o
>> ../../3rdparty/chromium/third_party/skia/third_party/skcms/src/Transform_inl.h:
>> In function ?void exec_ops(const Op*, const void**, const char*, char*,
>> int)?:
>> ../../3rdparty/chromium/third_party/skia/third_party/skcms/src/Transform_inl.h:560:16:
>> internal compiler error: in convert_move, at expr.c:231
>>   ?static void NS(exec_ops)(const Op* ops, const void** args,
>>   ??????????????? ^
>> ../../3rdparty/chromium/third_party/skia/third_party/skcms/skcms.cc:1909:16:
>> note: in definition of macro ?NS?
>>   ?#define NS(id) id
>>   ??????????????? ^~
>> Please submit a full bug report,
>> with preprocessed source if appropriate.
>> See <http://bugs.buildroot.net/> for instructions.
>> [1902/14080] CXX obj/skia/skia_core_and_effects/SkMipMap.o
>> ninja: build stopped: subcommand failed.
> 
> Then I'm still confused.
> 
> What is the relationship between the patch you're posting and the build
> error ? It seems entirely unrelated at first sight.

They are not related, see the explanation at the end.

> Is it the requirement of gcc >= 8.x that works around the compiler
> bug ? Is there a gcc bug report for this compiler bug ?
> 
> Some googling leads to
> https://github.com/OSSystems/meta-browser/issues/135, which itself
> links to https://gcc.gnu.org/bugzilla/show_bug.cgi?id=83623.
> 
> It seems like the bug has been fixed in both the gcc 6.x (fix was in gcc 6.5.0) and gcc 7.x
> branches (fix was in gcc 7.3.0).

And indeed I've built it successfully with gcc 7.5.

> So, could you give more details about the situation in which you're
> encountering this build failure ? Which toolchain are you using ? How
> is the patch related to the build failure ?

This patch is a mix to fix 2 different problems.
1) qt5webengine include path issue leading to:
'
In file included from /usr/include/c++/6.1.1/bits/stl_algo.h:59:0,
                  from /usr/include/c++/6.1.1/algorithm:62,
                  from /usr/include/qt/QtCore/qglobal.h:85,
                  from /usr/include/qt/QtCore/QtGlobal:1,
                  from ../<Project Source File>
/usr/include/c++/6.1.1/cstdlib:75:25: fatal error: stdlib.h: No such 
file or directory
  #include_next <stdlib.h>
                          ^
compilation terminated.
'
The patch Bartosz is going to add is to solve this, it's due to 
hardcoded substitution of relative paths with -isystem in Chromium, 
while in all qt5 packages this is set to -I according to 
'MAKE_CFLAGS_ISYSTEM  =' set in qt5base/qmake.conf.in.
Chromium fixed this with adding that patch:
https://chromium.googlesource.com/chromium/src/+/a8c8396fd20d98666d517c45b358c63736e345ef
so this is fixed starting from 70.0.3511.0 version:
https://chromium.googlesource.com/chromium/src/+/refs/tags/70.0.3511.0
qt5 bumped its Chromium 3rd party copy from 69 to 73 solving this issue 
starting from qt5 version 5.13, unfortunately before they only 
backported Chromium CVEs. So bumping qt5 to version >= 5.13 we should 
see this bug to disappear.

So *Bartosz*, can you please submit a patch only for -I issue?

2) Gcc ICE, as you've already mentioned, has been fixed, so we don't 
need a workaround.

Best regards
-- 
Giulio Benetti
Benetti Engineering sas
