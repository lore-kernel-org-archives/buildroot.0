From: Carlos de Sa <desa.carlos@gmail.com>
Date: Thu, 16 May 2013 23:59:41 +0530
Subject: [Buildroot] qt5.0.2 build error for qtjsbackend module
In-Reply-To: <51916C7E.1040403@mind.be>
References: <CAOvs79_S7jzBFG93vQB-qKEW2JtRYeBu6_UUqTt_sjNezXWJug@mail.gmail.com>
 <51916C7E.1040403@mind.be>
Message-ID: <CAOvs79-ApDycrRaK1Ka+uTt2qHv2QCiRyuf2FuD9ngV9s8BqdQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout & Thomas,

Thanks for tips. It got me digging in the (hopefully) right direction.

The issue is basically that host tool "mkv8snapshot" which is part of
qtjsbackend is segfaulting  -

mkv8snapshot[29356]: segfault at 0 ip 0833e3b9 sp bf8ec040 error 4 in
mkv8snapshot

I still haven't been able to determine why this happens. But the solution
that works for me is to disable its usage during the Qt build as per the
info in this mail trail from Qt-project
http://comments.gmane.org/gmane.comp.lib.qt.devel/6101

So I added a patch as per below... and no more issues!

diff -urN qt-everywhere-commercial-src-5.0.2_orig//qtbase/configure
qt-everywhere-commercial-src-5.0.2//qtbase/configure---
qt-everywhere-commercial-src-5.0.2_orig//qtbase/configure   2013-05-09
18:28:22.615623889 +0530
+++ qt-everywhere-commercial-src-5.0.2//qtbase/configure    2013-05-16
18:56:21.124371988 +0530
@@ -471,7 +471,7 @@
 CFG_SKIP_MODULES=""
 CFG_RELEASE_QMAKE=no
 CFG_AUDIO_BACKEND=auto
-CFG_V8SNAPSHOT=auto
+CFG_V8SNAPSHOT=no
 CFG_QML_DEBUG=yes
 CFG_JAVASCRIPTCORE_JIT=auto
 CFG_PKGCONFIG=auto
I can't exactly figure out why this happens esp becuse it If build qt5
manually "by hand" using the same process (but just outside buildroot, but
with the same cross-toolchain) i dont see this error as the configure
script detects that this tool is not required (canUseV8Snapshot gets set to
no).

Any reasons why this is happening?

regards,
Carlos




On Tue, May 14, 2013 at 4:13 AM, Arnout Vandecappelle <arnout@mind.be>wrote:

>  On 13/05/13 19:06, Carlos de Sa wrote:
>
>> Hi,
>> I'm trying to cross-compile build Qt 5.0.2 for a TI AM3359 board using
>> the patches from Thomas Pettazoni. The qt5 build system has been modifed
>> quite a bit from his original layout but the patches, sequence and
>> commands are the same.
>> So far the qtbase, script, svg, xml patterns and image formats modules
>> are compiling sucessfully. However when compiling the javascript backend
>> "qtjsbackend" the build fails when running a python script -
>> python
>> out/build/qt5-5.0.2/**qtjsbackend/src/v8/../**3rdparty/v8/tools/js2c.py
>> generated-release/libraries.**cpp CORE off
>> out/build/qt5-5.0.2/**qtjsbackend/src/v8/../**3rdparty/v8/src/macros.py
>> ../3rdparty/v8/src/runtime.js ../3rdparty/v8/src/v8natives.**js
>> ../3rdparty/v8/src/array.js ../3rdparty/v8/src/string.js
>> ../3rdparty/v8/src/uri.js ../3rdparty/v8/src/math.js
>> ../3rdparty/v8/src/messages.js ../3rdparty/v8/src/apinatives.**js
>> ../3rdparty/v8/src/date.js ../3rdparty/v8/src/regexp.js
>> ../3rdparty/v8/src/json.js ../3rdparty/v8/src/liveedit-**debugger.js
>> ../3rdparty/v8/src/mirror-**debugger.js ../3rdparty/v8/src/debug-**
>> debugger.js
>> python
>> out/build/qt5-5.0.2/**qtjsbackend/src/v8/../**3rdparty/v8/tools/js2c.py
>> generated-release/**experimental-libraries.cpp EXPERIMENTAL off
>> out/build/qt5-5.0.2/**qtjsbackend/src/v8/../**3rdparty/v8/src/macros.py
>> ../3rdparty/v8/src/proxy.js
>> ../../bin/mkv8snapshot generated-release/snapshot.cpp
>> Extension or internal compilation error at line 0.
>> make[4]: *** [generated-release/snapshot.**cpp] Segmentation fault
>>
>
>  I've had frequent build failures in v8 and webkit due to out-of-memory.
> Can you check if that is the case? dmesg | tail would give you a hint...
>
>  Also try building with BR2_JLEVEL=1 - then at least you see which command
> is giving the error.
>
>  Regards,
>  Arnout
>
>  make[4]: *** Waiting for unfinished jobs....
>> ../3rdparty/v8/src/platform-**posix.cc:238:6: note: the mangling of
>> 'va_list' has changed in GCC 4.4
>> In file included from ../3rdparty/v8/src/v8utils.h:**32:0,
>>                   from ../3rdparty/v8/src/v8.h:56,
>>                   from ../3rdparty/v8/src/arm/**lithium-arm.cc:28:
>> ../3rdparty/v8/src/platform.h:**170:15: note: the mangling of 'va_list'
>> has
>> changed in GCC 4.4
>> In file included from ../3rdparty/v8/src/v8utils.h:**32:0,
>>                   from ../3rdparty/v8/src/v8.h:56,
>>                   from ../3rdparty/v8/src/arm/**
>> lithium-codegen-arm.cc:28:
>> ../3rdparty/v8/src/platform.h:**170:15: note: the mangling of 'va_list'
>> has
>> changed in GCC 4.4
>> make[3]: *** [sub-v8-make_first-ordered] Error 2
>> make[2]: *** [sub-src-make_first] Error 2
>> make[1]: *** [out/build/qt5-5.0.2/.stamp_**target_installed] Error 2
>> make: *** [all] Error 2
>> This seems to be a python script error but I can't figure out what it is.
>> Any help on this would be much appreciated as I need to this compile
>> qtdeclarative which depends on this module.
>> Regards,
>> Carlos
>>
>>
>> ______________________________**_________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/**mailman/listinfo/buildroot<http://lists.busybox.net/mailman/listinfo/buildroot>
>>
>>
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/**arnoutvandecappelle<http://www.linkedin.com/in/arnoutvandecappelle>
> GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130516/31f0744c/attachment.html>
