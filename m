From: Waldemar Brodkorb <wbx@openadk.org>
Date: Tue, 16 May 2017 12:05:10 +0200
Subject: [Buildroot] uclibc, libstdc++ and cmath
In-Reply-To: <AM2PR03MB0963417F14798ACDE0C7A5D7E7E60@AM2PR03MB0963.eurprd03.prod.outlook.com>
References: <AM2PR03MB0963417F14798ACDE0C7A5D7E7E60@AM2PR03MB0963.eurprd03.prod.outlook.com>
Message-ID: <CAFD55FE-DC55-4ECC-9846-2B85440CAF2B@openadk.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

you might try following patch instead of the included buildroot one:
https://cgit.openadk.org/cgi/cgit/openadk.git/tree/toolchain/gcc/patches/5.4.0/libstdcxx-uclibc-c99.patch

Or you might try gcc 6.x where the issue was solved upstream IIRC.

The last step would be to try with latest buildroot git master.

best regards
 Waldemar 


> Am 16.05.2017 um 09:50 schrieb luke <skywal_l@hotmail.com>:
> 
> While trying to compile qt5webengine, I stumble on a weird problem. The compiler can't find definitions of c++ math function defined in cmath (note that c++ support is activated):
> 
> ===================================================================
> user at ubuntu:/tmp/buildroot-mailinglist$ cat /tmp/test.c
> #include <cmath>
> 
> int main(int argc, char **argv) {
>   std::round(5.5);
>   return 0;
> }
> 
> user at ubuntu:/tmp$ /tmp/buildroot-2017.02.2/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-g++ -std=c++11 test.c
> test.c: In function ?int main(int, char**)?:
> test.c:4:3: error: ?round? is not a member of ?std?
>    std::round(5.5);
>    ^
> test.c:4:3: note: suggested alternative:
> In file included from /tmp/buildroot-2017.02.2/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/features.h:393:0,
>                  from /tmp/buildroot-2017.02.2/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/include/c++/5.4.0/arm-buildroot-linux-uclibcgnueabihf/bits/os_defines.h:39,
>                  from /tmp/buildroot-2017.02.2/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/include/c++/5.4.0/arm-buildroot-linux-uclibcgnueabihf/bits/c++config.h:482,
>                  from /tmp/buildroot-2017.02.2/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/include/c++/5.4.0/cmath:41,
>                  from test.c:1:
> /tmp/buildroot-2017.02.2/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/bits/mathcalls.h:326:1: note:   ?round?
>  __MATHCALLX (round,, (_Mdouble_ __x), (__const__))
> ===================================================================
> 
> Part of the cmath header is not included due to _GLIBCXX_USE_C99_MATH_TR1 not being defined. Is it related to https://github.com/maximeh/buildroot/blob/master/package/gcc/5.4.0/850-libstdcxx-uclibc-c99.patch ?
> 
> Anyway,, forced the definition of that macro but it generated more pb down the line, because it can't find a definition for global function when:
> 
> cmath(1071): using ::acoshl;
> 
> And indeed, if this function is defined in uclibc-1.0.22/libm/ldouble_wrappers.c, it is not declared in any header... There was a patch for this some time ago: http://lists.busybox.net/pipermail/buildroot/2015-April/125179.html.
> But it is removed.
> 
> All this sound like I am missing something obvious, so if any of you have in mind what could be the problem, your help is appreciated.
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170516/341d1465/attachment.html>
