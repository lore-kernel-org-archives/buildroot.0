From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 24 Nov 2019 20:57:53 +0100
Subject: [Buildroot] [PATCH/next 1/1] package/libffi: fix build failure
 with powerpc7
In-Reply-To: <20191124192800.GJ32494@scaer>
References: <20191124090305.1015485-1-fontaine.fabrice@gmail.com>
 <20191124192800.GJ32494@scaer>
Message-ID: <CAPi7W82Va+zg7xP5ujHi73pqj-beP2iHbmXwRBTqj9ALoNB3fQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

Le dim. 24 nov. 2019 ? 20:45, Yann E. MORIN <yann.morin.1998@free.fr> a ?crit :
>
> Fabrice, All,
>
> On 2019-11-24 10:03 +0100, Fabrice Fontaine spake thusly:
> > Fixes:
> >  - http://autobuild.buildroot.org/results/5c9dd8fb3b6a128882b6250f197c80232d8a3b53
>
> Will that patch still be needed on the 3.3 version, that was applied to
> next? Does that build failure still hapen with version 3.3 on next?
This patch is only for 3.3 version so it should be apply only on next.
Build failure is raised by
https://github.com/libffi/libffi/commit/73dd43afc8a447ba98ea02e9aad4c6898dc77fb0
(as stated in patch).
I'll send it upstream if you don't have any remarks in it.
>
> Regards,
> Yann E. MORIN.
>
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > ---
> >  ...pc.h-fix-build-failure-with-powerpc7.patch | 51 +++++++++++++++++++
> >  1 file changed, 51 insertions(+)
> >  create mode 100644 package/libffi/0004-ffi_powerpc.h-fix-build-failure-with-powerpc7.patch
> >
> > diff --git a/package/libffi/0004-ffi_powerpc.h-fix-build-failure-with-powerpc7.patch b/package/libffi/0004-ffi_powerpc.h-fix-build-failure-with-powerpc7.patch
> > new file mode 100644
> > index 0000000000..7ee1f1029e
> > --- /dev/null
> > +++ b/package/libffi/0004-ffi_powerpc.h-fix-build-failure-with-powerpc7.patch
> > @@ -0,0 +1,51 @@
> > +From f9d8f11d60cdc656a801e0d8116101beb22e117b Mon Sep 17 00:00:00 2001
> > +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > +Date: Sun, 24 Nov 2019 09:52:01 +0100
> > +Subject: [PATCH] ffi_powerpc.h: fix build failure with powerpc7
> > +
> > +Sicne commit 73dd43afc8a447ba98ea02e9aad4c6898dc77fb0, build on powerpc7
> > +fails on:
> > +
> > +In file included from ../src/powerpc/ffi.c:33:0:
> > +../src/powerpc/ffi_powerpc.h:61:9: error: '_Float128' is not supported on this target
> > + typedef _Float128 float128;
> > +         ^~~~~~~~~
> > +
> > +Fix this build failure by checking for __HAVE_FLOAT128 before using
> > +_Float128, as _Float128 is enabled only on specific conditions, see
> > +output/host/powerpc64-buildroot-linux-gnu/sysroot/usr/include/bits/floatn.h:
> > +
> > + /* Defined to 1 if the current compiler invocation provides a
> > +    floating-point type with the IEEE 754 binary128 format, and this glibc
> > +    includes corresponding *f128 interfaces for it.  */
> > + #if defined _ARCH_PWR8 && defined __LITTLE_ENDIAN__ && (_CALL_ELF == 2) \
> > +     && defined __FLOAT128__ && !defined __NO_LONG_DOUBLE_MATH
> > + # define __HAVE_FLOAT128 1
> > + #else
> > + # define __HAVE_FLOAT128 0
> > + #endif
> > +
> > +Fixes:
> > + - http://autobuild.buildroot.org/results/5c9dd8fb3b6a128882b6250f197c80232d8a3b53
> > +
> > +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > +---
> > + src/powerpc/ffi_powerpc.h | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/src/powerpc/ffi_powerpc.h b/src/powerpc/ffi_powerpc.h
> > +index 5ee2a70..a5a786b 100644
> > +--- a/src/powerpc/ffi_powerpc.h
> > ++++ b/src/powerpc/ffi_powerpc.h
> > +@@ -57,7 +57,7 @@ typedef union
> > +   double d;
> > + } ffi_dblfl;
> > +
> > +-#if defined(__FLOAT128_TYPE__)
> > ++#if defined(__FLOAT128_TYPE__) && defined(__HAVE_FLOAT128)
> > + typedef _Float128 float128;
> > + #elif defined(__FLOAT128__)
> > + typedef __float128 float128;
> > +--
> > +2.24.0
> > +
> > --
> > 2.24.0
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
Best Regards,

Fabrice
