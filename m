From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 28 Oct 2013 17:02:25 +0100
Subject: [Buildroot] [PATCH 1/3] libpng: disable tools
In-Reply-To: <1382914459-30545-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Sun, 27 Oct 2013 19:54:17 -0300")
References: <1382914459-30545-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87bo29s7se.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > They can fail on some odd toolchain configurations because of
 > buildsystem shortcomings and aren't expected to be used in normal
 > scenarios.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 > ---
 >  package/libpng/libpng-01-disable-tools.patch | 30 ++++++++++++++++++++++++++++


 >  1 file changed, 30 insertions(+)
 >  create mode 100644 package/libpng/libpng-01-disable-tools.patch

 > diff --git a/package/libpng/libpng-01-disable-tools.patch b/package/libpng/libpng-01-disable-tools.patch
 > new file mode 100644
 > index 0000000..cd7040c
 > --- /dev/null
 > +++ b/package/libpng/libpng-01-disable-tools.patch
 > @@ -0,0 +1,30 @@
 > +Disable the new pngfix and png-fix-itxt tools: they take up space, fail to
 > +build on some oddball toolchain configurations and aren't expected/needed
 > +in a non-interactive embedded system.
 > +
 > +Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 > +
 > +diff -Nura libpng-1.6.6.orig/Makefile.am libpng-1.6.6/Makefile.am

My first thought upon seeing this was that it would be cleaner to just
pass bin_PROGRAMS= to make instead of patching the autotools files, but
it also ends up quite ugly (especially as we need to tweak the variables
AFTER the evals if we want to append to the default values):

diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index 5ce828e..56b1cd3 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -17,3 +17,12 @@ LIBPNG_CONF_OPT = $(if $(BR2_ARM_CPU_HAS_NEON),--enable-arm-n
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
+
+# disable pngfix / png-fix-itxt tools: They take up space, fail to
+# build on oddball toolchain configurations and generally aren't
+# expected/needed on the target
+LIBPNG_MAKE_OPT = bin_PROGRAMS=
+LIBPNG_INSTALL_STAGING_OPT += $(LIBPNG_MAKE_OPT)
+LIBPNG_INSTALL_TARGET_OPT += $(LIBPNG_MAKE_OPT)
+HOST_LIBPNG_MAKE_OPT = $(LIBPNG_MAKE_OPT)
+HOST_LIBPNG_INSTALL_OPT += $(LIBPNG_MAKE_OPT)

So it probably makes more sense to just patch Makefile.am / Makefile.in
like you do - Committed, thanks.

-- 
Bye, Peter Korsgaard
