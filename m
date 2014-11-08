From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 08 Nov 2014 22:40:54 +0100
Subject: [Buildroot] [PATCH 2/2] package/clamav: Fix build error
In-Reply-To: <1415042309-22291-2-git-send-email-bernd.kuhls@t-online.de>
 (Bernd Kuhls's message of "Mon, 3 Nov 2014 20:18:29 +0100")
References: <1415042309-22291-1-git-send-email-bernd.kuhls@t-online.de>
 <1415042309-22291-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <87r3xds74p.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Fixes
 > http://autobuild.buildroot.net/results/2a6/2a68aa790b1e8d6fd4dc41f2ab724dfc03b3806d/

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 > ---
 >  package/clamav/clamav-0003-execinfo_h.patch |   44 +++++++++++++++++++++++++++
 >  package/clamav/clamav.mk                    |    1 +
 >  2 files changed, 45 insertions(+)
 >  create mode 100644 package/clamav/clamav-0003-execinfo_h.patch

 > diff --git a/package/clamav/clamav-0003-execinfo_h.patch b/package/clamav/clamav-0003-execinfo_h.patch
 > new file mode 100644
 > index 0000000..29df52d
 > --- /dev/null
 > +++ b/package/clamav/clamav-0003-execinfo_h.patch
 > @@ -0,0 +1,44 @@
 > +Fixes uclibc build as uclibc does not include backtrace functionality
 > +
 > +Patch sent upstream:
 > +http://lurker.clamav.net/message/20141103.185534.c932b7fc.en.html
 > +
 > +Bugtracker: https://bugzilla.clamav.net/show_bug.cgi?id=11170
 > +
 > +Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 > +
 > +diff -uNr clamav-0.98.4.org/clamav-config.h.in clamav-0.98.4/clamav-config.h.in
 > +--- clamav-0.98.4.org/clamav-config.h.in	2014-05-21 17:25:38.000000000 +0200
 > ++++ clamav-0.98.4/clamav-config.h.in	2014-11-03 19:57:23.569041159 +0100
 > +@@ -178,6 +178,9 @@
 > + /* Define to 1 if the system has the type `error_t'. */
 > + #undef HAVE_ERROR_T
 > + 
 > ++/* Define to 1 if you have the <execinfo.h> header file. */
 > ++#undef HAVE_EXECINFO_H
 > ++
 > + /* have working file descriptor passing support */
 > + #undef HAVE_FD_PASSING
 > + 
 > +diff -uNr clamav-0.98.4.org/libclamav/mbox.c clamav-0.98.4/libclamav/mbox.c
 > +--- clamav-0.98.4.org/libclamav/mbox.c	2014-05-21 17:25:05.000000000 +0200
 > ++++ clamav-0.98.4/libclamav/mbox.c	2014-11-03 19:31:24.544320180 +0100
 > +@@ -89,7 +89,9 @@
 > + #endif
 > + 
 > + #ifdef HAVE_BACKTRACE
 > ++#ifdef HAVE_EXECINFO_H
 > + #include <execinfo.h>
 > ++#endif

But HAVE_BACKTRACE shouldn't be true in that case either, so why not
simply fix the HAVE_BACKTRACE test instead? That seems a lot simpler.

The problem is that uClibc also defines __GLIBC__, so the check
evaluates to true:

#if __GLIBC__ == 2 && __GLIBC_MINOR__ >= 1
#define HAVE_BACKTRACE
#endif

uClibc unconditionally defines __UCLIBC__ and defines
__UCLIBC_HAS_BACKTRACE__ if it has backtrace support, so we could simply
stick something like this below:

/* uClibc pretends to be glibc but may not have backtrace support */
#if defined(__UCLIBC__) && !defined(__UCLIBC_HAS_BACKTRACE__)
#undef HAVE_BACKTRACE
#endif

Care to send a patch doing that (and send it upstream)?

-- 
Bye, Peter Korsgaard
