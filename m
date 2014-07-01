From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 01 Jul 2014 14:51:54 +0200
Subject: [Buildroot] [PATCH 3/3] sox: new package
In-Reply-To: <1403919534-28847-3-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Fri, 27 Jun 2014 22:38:54 -0300")
References: <1403919534-28847-1-git-send-email-gustavo@zacarias.com.ar>
 <1403919534-28847-3-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87tx71gs2d.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Like ImageMagick, but for audio files.
 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 > ---
 >  package/Config.in                 |  1 +
 >  package/sox/Config.in             | 10 ++++
 >  package/sox/sox-0001-uclibc.patch | 26 +++++++++++
 >  package/sox/sox.mk                | 98 +++++++++++++++++++++++++++++++++++++++
 >  4 files changed, 135 insertions(+)
 >  create mode 100644 package/sox/Config.in
 >  create mode 100644 package/sox/sox-0001-uclibc.patch
 >  create mode 100644 package/sox/sox.mk

 > diff --git a/package/Config.in b/package/Config.in
 > index 51cf204..4889c33 100644
 > --- a/package/Config.in
 > +++ b/package/Config.in
 > @@ -23,6 +23,7 @@ menu "Audio and video applications"
 >  	source "package/on2-8170-libs/Config.in"
 >  	source "package/opus-tools/Config.in"
 >  	source "package/pulseaudio/Config.in"
 > +	source "package/sox/Config.in"
 >  	source "package/tidsp-binaries/Config.in"
 >  	source "package/tstools/Config.in"
 >  	source "package/twolame/Config.in"
 > diff --git a/package/sox/Config.in b/package/sox/Config.in
 > new file mode 100644
 > index 0000000..57585d7
 > --- /dev/null
 > +++ b/package/sox/Config.in
 > @@ -0,0 +1,10 @@
 > +config BR2_PACKAGE_SOX
 > +	bool "sox"
 > +	help
 > +	  SoX is a cross-platform (Windows, Linux, MacOS X, etc.) command line
 > +	  utility that can convert various formats of computer audio files
 > +	  in to other formats.
 > +	  It can also apply various effects to these sound files, and, as an
 > +	  added bonus, SoX can play and record audio files on most platforms.
 > +
 > +	  http://sox.sourceforge.net/
 > diff --git a/package/sox/sox-0001-uclibc.patch b/package/sox/sox-0001-uclibc.patch
 > new file mode 100644
 > index 0000000..5c118fa
 > --- /dev/null
 > +++ b/package/sox/sox-0001-uclibc.patch
 > @@ -0,0 +1,26 @@
 > +Make SoX support uclibc-based toolchains, from:
 > +http://sourceforge.net/p/sox/bugs/179/
 > +
 > +Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 > +
 > +Index: sox-14.4.1/src/formats.c
 > +===================================================================
 > +--- sox-14.4.1.orig/src/formats.c
 > ++++ sox-14.4.1/src/formats.c
 > +@@ -409,7 +409,7 @@ static void UNUSED rewind_pipe(FILE * fp
 > + #if defined _FSTDIO || defined _NEWLIB_VERSION || defined __APPLE__
 > +   fp->_p -= PIPE_AUTO_DETECT_SIZE;
 > +   fp->_r += PIPE_AUTO_DETECT_SIZE;
 > +-#elif defined __GLIBC__
 > ++#elif defined __GLIBC__ && ! defined __UCLIBC__
 > +   fp->_IO_read_ptr = fp->_IO_read_base;
 > + #elif defined _MSC_VER || defined _WIN32 || defined _WIN64 || defined _ISO_STDIO_ISO_H
 > +   fp->_ptr = fp->_base;
 > +@@ -417,7 +417,6 @@ static void UNUSED rewind_pipe(FILE * fp
 > +   /* To fix this #error, either simply remove the #error line and live without
 > +    * file-type detection with pipes, or add support for your compiler in the
 > +    * lines above.  Test with cat monkey.wav | ./sox --info - */
 > +-  #error FIX NEEDED HERE
 > +   #define NO_REWIND_PIPE
 > +   (void)fp;
 > + #endif
 > diff --git a/package/sox/sox.mk b/package/sox/sox.mk
 > new file mode 100644
 > index 0000000..508faf7
 > --- /dev/null
 > +++ b/package/sox/sox.mk
 > @@ -0,0 +1,98 @@
 > +################################################################################
 > +#
 > +# sox
 > +#
 > +################################################################################
 > +
 > +SOX_VERSION = 14.4.1
 > +SOX_SITE = http://downloads.sourceforge.net/project/sox/sox/$(SOX_VERSION)
 > +SOX_DEPENDENCIES = host-pkgconf
 > +SOX_CONF_OPT = --with-distro="Buildroot" --without-ffmpeg --disable-gomp

Any specific reason to unconditionally disable ffmpeg support?

-- 
Bye, Peter Korsgaard
