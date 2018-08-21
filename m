From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 Aug 2018 11:20:23 +0200
Subject: [Buildroot] [PATCH] pv: fix build failures when building under
 a path containing 'yes'
In-Reply-To: <20180820142216.5904-1-peter@korsgaard.com>
References: <20180820142216.5904-1-peter@korsgaard.com>
Message-ID: <20180821112023.7237c5c1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 20 Aug 2018 16:22:16 +0200, Peter Korsgaard wrote:
> Depending on the configuration, the cpp output may contain the string 'yes'
> in a comment if built under a path containing 'yes', confusing the _AIX
> test:
> 
> ${CROSS}-cpp conftest.h
> \# 1 "conftest.h"
> \# 1 "<built-in>"
> \# 1 "<command-line>"
> \# 31 "<command-line>"
> \# 1 "/home/peko/source/buildroot/output-yes/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/stdc-predef.h"
> \# 32 "<command-line>" 2
> \# 1 "conftest.txt"
> 
> If misdetected, the configure script adds -lc128 to LIBS, causing the
> AC_CHECKS_FUNCS check for stat64 to fail, which in turn causes compilation
> errors about redefinition of symbols:
> 
> In file included from ./src/include/pv-internal.h:9:0,
>                  from src/pv/file.c:5:
> ./src/include/config.h:76:18: error: redefinition of 'struct stat'
>   #  define stat64 stat
>                    ^
> Fix it by only matching on 'yes' on a line by itself.
> 
> As pv doesn't cleanly autoreconf (it doesn't use automake and configure.in
> is located in subdir), instead directly patch configure.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  .../pv/0001-configure.in-tighten-AIX-test.patch    | 57 ++++++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 package/pv/0001-configure.in-tighten-AIX-test.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
