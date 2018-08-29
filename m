From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 29 Aug 2018 23:23:57 +0200
Subject: [Buildroot] [PATCH] pv: fix build failures when building under
 a path containing 'yes'
In-Reply-To: <20180820142216.5904-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 20 Aug 2018 16:22:16 +0200")
References: <20180820142216.5904-1-peter@korsgaard.com>
Message-ID: <87mut43lzm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Depending on the configuration, the cpp output may contain the string 'yes'
 > in a comment if built under a path containing 'yes', confusing the _AIX
 > test:

 > ${CROSS}-cpp conftest.h
 > \# 1 "conftest.h"
 > \# 1 "<built-in>"
 > \# 1 "<command-line>"
 > \# 31 "<command-line>"
 > \# 1 "/home/peko/source/buildroot/output-yes/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/stdc-predef.h"
 > \# 32 "<command-line>" 2
 > \# 1 "conftest.txt"

 > If misdetected, the configure script adds -lc128 to LIBS, causing the
 > AC_CHECKS_FUNCS check for stat64 to fail, which in turn causes compilation
 > errors about redefinition of symbols:

 > In file included from ./src/include/pv-internal.h:9:0,
 >                  from src/pv/file.c:5:
 > ./src/include/config.h:76:18: error: redefinition of 'struct stat'
 >   #  define stat64 stat
 >                    ^
 > Fix it by only matching on 'yes' on a line by itself.

 > As pv doesn't cleanly autoreconf (it doesn't use automake and configure.in
 > is located in subdir), instead directly patch configure.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2018.02.x and 2018.05.x, thanks.

-- 
Bye, Peter Korsgaard
