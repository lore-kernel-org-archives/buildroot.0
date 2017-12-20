From: Damien Riegel <damien.riegel@savoirfairelinux.com>
Date: Wed, 20 Dec 2017 18:53:11 -0500
Subject: [Buildroot] package "expat" fails to build without a C++
 compiler
In-Reply-To: <87vah19jcu.fsf@dell.be.48ers.dk>
References: <20171219215831.4rlfcixr32ocr7tg@workotop.localdomain>
 <87r2rpcf5n.fsf@dell.be.48ers.dk>
 <20171220205345.lxrjqnwcpclvcwvi@workotop.localdomain>
 <87vah19jcu.fsf@dell.be.48ers.dk>
Message-ID: <20171220235311.h34bqw7kefkvwazn@workotop.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Dec 20, 2017 at 10:31:45PM +0100, Peter Korsgaard wrote:
> >>>>> "Damien" == Damien Riegel <damien.riegel@savoirfairelinux.com> writes:
> 
>  > On Wed, Dec 20, 2017 at 09:34:12PM +0100, Peter Korsgaard wrote:
>  >> >>>>> "Damien" == Damien Riegel <damien.riegel@savoirfairelinux.com> writes:
>  >> 
>  >> > Hi,
>  >> > I tried to build an image with the "expat" package in it, using a
>  >> > toolchain without a C++ compiler. It fails with the following error:
>  >> 
>  >> >   configure: error: in `/home/dkc/src/buildroot/build/build/expat-2.2.4':
>  >> >   configure: error: C++ preprocessor "/lib/cpp" fails sanity check
>  >> 
>  >> > Enabling C++ support fixed that error.
>  >> 
>  >> Hmm, can you have a look in expat-2.2.4/config.log to see what exactly
>  >> goes wrong?
>  >> 
>  >> /lib/cpp is from your host toolchain, so enabling or not enabling C++
>  >> support shouldn't matter.
> 
>  > /lib/cpp is the default value for the C++ preprocessor when '$CXX -E'
>  > fails. When activating C++ support, $CXX points to a program that is
>  > actually there, and CXXCPP doesn't default to /lib/cpp. That's why it
>  > builds successfully when I activate C++ support.
> 
> Ok. CXX actually also points to an available program when C++ support
> isn't available (it points to 'false').
> 
>  > I guess you have /lib/cpp on your machine and I don't.
> 
> :/
> 
> Out of interest, what Distribution are you using?

Arch Linux

> 
>  > I tried to remove the AC_PROG_CXX macro, but autoreconf complains that
>  > there are C++ sources. They must be in a part of the program that isn't
>  > built by Buildroot.
> 
> I guess that is from tests/runtestspp.cpp :/

Indeed, when I only remove AC_PROG_CXX, it complains about
tests/Makefile.am:

  /usr/share/automake-1.15/am/depend2.am: error: am__fastdepCXX does not appear in AM_CONDITIONAL
  /usr/share/automake-1.15/am/depend2.am:   The usual way to define 'am__fastdepCXX' is to add 'AC_PROG_CXX'
  /usr/share/automake-1.15/am/depend2.am:   to 'configure.ac' and run 'aclocal' and 'autoconf' again
  tests/Makefile.am: error: C++ source seen but 'CXX' is undefined
  tests/Makefile.am:   The usual way to define 'CXX' is to add 'AC_PROG_CXX'
  tests/Makefile.am:   to 'configure.ac' and run 'autoconf' again.
  autoreconf: automake failed with exit status: 1


With the following snippet (against upstream libexpat), I can run
autoreconf and it seems to build just fine (not tested with Buildroot
yet). Does that look like an acceptable solution to you? If so, I can
provide a proper patch.

I feel like this would be a one-package-only fix. Maybe the right
solution would be to make Buildroot try to find the location of "cpp",
and set CXXCPP accordingly? (As a quick proof of concept, adding
EXPAT_CONF_ENV += CXXCPP=/usr/bin/cpp to expat.mk works)

diff --git a/expat/configure.ac b/expat/configure.ac
index 1dab0e7..d18ab3d 100644
--- a/expat/configure.ac
+++ b/expat/configure.ac
@@ -64,7 +64,6 @@ AC_SUBST(LIBAGE)

 dnl Checks for programs.
 AC_PROG_CC_C99
-AC_PROG_CXX
 AC_PROG_INSTALL

 if test "$GCC" = yes ; then
diff --git a/expat/tests/Makefile.am b/expat/tests/Makefile.am
index 742ed43..987fdd8 100644
--- a/expat/tests/Makefile.am
+++ b/expat/tests/Makefile.am
@@ -49,9 +49,6 @@ libruntests_a_SOURCES = \
 runtests_SOURCES = \
     runtests.c

-runtestspp_SOURCES = \
-    runtestspp.cpp
-
 runtests_LDADD = libruntests.a ../lib/libexpat.la
 runtestspp_LDADD = libruntests.a ../lib/libexpat.la


-- 
Damien
