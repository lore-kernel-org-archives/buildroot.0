From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 13 May 2019 22:02:45 +0200
Subject: [Buildroot] [PATCH 1/1] package/log4cpp: add -lpthread to LIBS
In-Reply-To: <20190511101048.20406-1-fontaine.fabrice@gmail.com>
References: <20190511101048.20406-1-fontaine.fabrice@gmail.com>
Message-ID: <20190513220245.3984e0d3@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

Thanks for your investigation on this issue.

On Sat, 11 May 2019 12:10:48 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> diff --git a/package/log4cpp/log4cpp.mk b/package/log4cpp/log4cpp.mk
> index 8664a54385..527ad49e53 100644
> --- a/package/log4cpp/log4cpp.mk
> +++ b/package/log4cpp/log4cpp.mk
> @@ -12,7 +12,7 @@ LOG4CPP_SUBDIR = log4cpp
>  LOG4CPP_LICENSE = LGPL-2.1+
>  LOG4CPP_LICENSE_FILES = log4cpp/COPYING
>  LOG4CPP_INSTALL_STAGING = YES
> -LOG4CPP_CONF_OPTS = --enable-doxygen=no --enable-dot=no
> +LOG4CPP_CONF_OPTS = --enable-doxygen=no --enable-dot=no LIBS=-lpthread

I don't think this is the right fix for the problem. Indeed, to me
log4cpp.pc is already correct:

prefix=/usr
exec_prefix=/usr
libdir=${exec_prefix}/lib
includedir=${prefix}/include

Name: log4cpp
Description: C++ library for flexible logging, modeled after Log4j
Version: 1.1
Libs: -L${libdir} -llog4cpp  
Cflags: -I${includedir} -pthread -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os  

See the -pthread in Cflags ? This should be sufficient.

I believe the problem rather lies inside the src/Makefile.am of linknx.
It adds LOG4CPP_CFLAGS to AM_CPPFLAGS. But AM_CPPFLAGS are only used
when the pre-processor is involved, which is not the case at link time.

If you move $(LOG4CPP_CFLAGS) from AM_CPPFLAGS to AM_CXXFLAGS, it fixes
the problem. I believe this is a more correct fix, and is upstreamable
to linknx.

Could you cook such a patch ? :-)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
