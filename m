From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 20 Jun 2013 10:00:34 +0200
Subject: [Buildroot] [PATCH] wvstreams: Build bundled argp library with
	-fPIC
In-Reply-To: <1370440956-8000-1-git-send-email-markos.chandras@gmail.com>
 (Markos Chandras's message of "Wed, 5 Jun 2013 15:02:36 +0100")
References: <1370440956-8000-1-git-send-email-markos.chandras@gmail.com>
Message-ID: <87obb1nrdp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Markos" == Markos Chandras <markos.chandras@gmail.com> writes:

 Markos> From: Markos Chandras <markos.chandras@imgtec.com>
 Markos> Fixes linking problems on MIPS.

 Markos> Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
 Markos> ---
 Markos>  package/wvstreams/wvstreams-0006-argp-fpic.patch | 28 ++++++++++++++++++++++++
 Markos>  1 file changed, 28 insertions(+)
 Markos>  create mode 100644 package/wvstreams/wvstreams-0006-argp-fpic.patch

 Markos> diff --git a/package/wvstreams/wvstreams-0006-argp-fpic.patch b/package/wvstreams/wvstreams-0006-argp-fpic.patch
 Markos> new file mode 100644
 Markos> index 0000000..b4cf1d2
 Markos> --- /dev/null
 Markos> +++ b/package/wvstreams/wvstreams-0006-argp-fpic.patch
 Markos> @@ -0,0 +1,28 @@
 Markos> +Build argp object files with -fPIC.
 Markos> +
 Markos> +The argp bundled dependency is linked to the libwvutils.so shared library.
 Markos> +MIPS will refuce to link a non-PIC library with a shared one.
 Markos> +
 Markos> +We fix this problem by building the argp source files using -fPIC since
 Markos> +the libargp static library will only be used to link to libwvutils.so
 Markos> +as instructed by the following rule in the root Makefile:
 Markos> +
 Markos> +ifeq ($(USE_WVSTREAMS_ARGP),1)
 Markos> +  utils/wvargs.o-CPPFLAGS += -Iargp
 Markos> +  libwvutils.so-LIBS += -Largp -largp
 Markos> +
 Markos> +Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
 Markos> +
 Markos> +Index: wvstreams-4.6.1/argp/Makefile.in
 Markos> +===================================================================
 Markos> +--- wvstreams-4.6.1.orig/argp/Makefile.in
 Markos> ++++ wvstreams-4.6.1/argp/Makefile.in
 Markos> +@@ -137,7 +137,7 @@ AUTOMAKE = @AUTOMAKE@
 Markos> + AWK = @AWK@
 Markos> + CC = @CC@
 Markos> + CCDEPMODE = @CCDEPMODE@
 Markos> +-CFLAGS = @CFLAGS@
 Markos> ++CFLAGS = @CFLAGS@ -fPIC

How about when wvstreams is built as a static library
(BR2_PREFER_STATIC_LIB)?

Makefile.in is a generated file, so you should rather fix Makefile.am
and set WVSTREAMS_AUTORECONF = YES, but wouldn't it just be simpler to
just add CFLAGS="$(TARGET_CFLAGS) -fPIC" to WVSTREAMS_CONF_ENV when
building in the !BR2_PREFER_STATIC_LIB case?

-- 
Bye, Peter Korsgaard
