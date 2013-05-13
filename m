From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 14 May 2013 00:43:10 +0200
Subject: [Buildroot] qt5.0.2 build error for qtjsbackend module
In-Reply-To: <CAOvs79_S7jzBFG93vQB-qKEW2JtRYeBu6_UUqTt_sjNezXWJug@mail.gmail.com>
References: <CAOvs79_S7jzBFG93vQB-qKEW2JtRYeBu6_UUqTt_sjNezXWJug@mail.gmail.com>
Message-ID: <51916C7E.1040403@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13/05/13 19:06, Carlos de Sa wrote:
> Hi,
> I'm trying to cross-compile build Qt 5.0.2 for a TI AM3359 board using
> the patches from Thomas Pettazoni. The qt5 build system has been modifed
> quite a bit from his original layout but the patches, sequence and
> commands are the same.
> So far the qtbase, script, svg, xml patterns and image formats modules
> are compiling sucessfully. However when compiling the javascript backend
> "qtjsbackend" the build fails when running a python script -
> python
> out/build/qt5-5.0.2/qtjsbackend/src/v8/../3rdparty/v8/tools/js2c.py
> generated-release/libraries.cpp CORE off
> out/build/qt5-5.0.2/qtjsbackend/src/v8/../3rdparty/v8/src/macros.py
> ../3rdparty/v8/src/runtime.js ../3rdparty/v8/src/v8natives.js
> ../3rdparty/v8/src/array.js ../3rdparty/v8/src/string.js
> ../3rdparty/v8/src/uri.js ../3rdparty/v8/src/math.js
> ../3rdparty/v8/src/messages.js ../3rdparty/v8/src/apinatives.js
> ../3rdparty/v8/src/date.js ../3rdparty/v8/src/regexp.js
> ../3rdparty/v8/src/json.js ../3rdparty/v8/src/liveedit-debugger.js
> ../3rdparty/v8/src/mirror-debugger.js ../3rdparty/v8/src/debug-debugger.js
> python
> out/build/qt5-5.0.2/qtjsbackend/src/v8/../3rdparty/v8/tools/js2c.py
> generated-release/experimental-libraries.cpp EXPERIMENTAL off
> out/build/qt5-5.0.2/qtjsbackend/src/v8/../3rdparty/v8/src/macros.py
> ../3rdparty/v8/src/proxy.js
> ../../bin/mkv8snapshot generated-release/snapshot.cpp
> Extension or internal compilation error at line 0.
> make[4]: *** [generated-release/snapshot.cpp] Segmentation fault

  I've had frequent build failures in v8 and webkit due to out-of-memory. 
Can you check if that is the case? dmesg | tail would give you a hint...

  Also try building with BR2_JLEVEL=1 - then at least you see which 
command is giving the error.

  Regards,
  Arnout

> make[4]: *** Waiting for unfinished jobs....
> ../3rdparty/v8/src/platform-posix.cc:238:6: note: the mangling of
> 'va_list' has changed in GCC 4.4
> In file included from ../3rdparty/v8/src/v8utils.h:32:0,
>                   from ../3rdparty/v8/src/v8.h:56,
>                   from ../3rdparty/v8/src/arm/lithium-arm.cc:28:
> ../3rdparty/v8/src/platform.h:170:15: note: the mangling of 'va_list' has
> changed in GCC 4.4
> In file included from ../3rdparty/v8/src/v8utils.h:32:0,
>                   from ../3rdparty/v8/src/v8.h:56,
>                   from ../3rdparty/v8/src/arm/lithium-codegen-arm.cc:28:
> ../3rdparty/v8/src/platform.h:170:15: note: the mangling of 'va_list' has
> changed in GCC 4.4
> make[3]: *** [sub-v8-make_first-ordered] Error 2
> make[2]: *** [sub-src-make_first] Error 2
> make[1]: *** [out/build/qt5-5.0.2/.stamp_target_installed] Error 2
> make: *** [all] Error 2
> This seems to be a python script error but I can't figure out what it is.
> Any help on this would be much appreciated as I need to this compile
> qtdeclarative which depends on this module.
> Regards,
> Carlos
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
