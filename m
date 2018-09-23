From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 23 Sep 2018 16:52:22 +0200
Subject: [Buildroot] [PATCH 1/1] libnfs: fix build of applications like
 mpd on musl
In-Reply-To: <20180922194305.27608-1-fontaine.fabrice@gmail.com>
References: <20180922194305.27608-1-fontaine.fabrice@gmail.com>
Message-ID: <20180923165222.74cb11bb@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 22 Sep 2018 21:43:05 +0200, Fabrice Fontaine wrote:

> + #include <stdint.h>
> +-#if defined(__ANDROID__) || defined(AROS) \
> ++#if defined(__ANDROID__) || defined(AROS) || defined(__linux__) \
> +  || ( defined(__APPLE__) && defined(__MACH__) )
> + #include <sys/time.h>
> + #else

I think the proper fix would be to use the AC_HEADER_TIME macro
(https://www.gnu.org/software/autoconf/manual/autoconf.html#Particular-Headers).
First need to add:

AC_HEADER_TIME
AC_CHECK_HEADERS([sys/time.h])

And then in the code, do:

          #ifdef TIME_WITH_SYS_TIME
          # include <sys/time.h>
          # include <time.h>
          #else
          # ifdef HAVE_SYS_TIME_H
          #  include <sys/time.h>
          # else
          #  include <time.h>
          # endif
          #endif

Instead of the mess that is currently done based on the system on which
the stuff is being compiled.

Could you try to do this, and upstream the corresponding patch ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
