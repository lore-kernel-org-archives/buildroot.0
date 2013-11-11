From: Fatih =?utf-8?q?A=C5=9F=C4=B1c=C4=B1?= <fatih.asici@gmail.com>
Date: Mon, 11 Nov 2013 14:26:33 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20131111110906.7585ca0e@skate>
References: <20131109073028.B3C2E52C614@lolut.humanoidz.org>
 <201311111114.51686.fatih.asici@gmail.com> <20131111110906.7585ca0e@skate>
Message-ID: <201311111426.34194.fatih.asici@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday 11 November 2013 12:09:06 Thomas Petazzoni wrote:
> Dear Fatih A??c?,
> 
> On Mon, 11 Nov 2013 11:14:51 +0200, Fatih A??c? wrote:
> > >   http://autobuild.buildroot.net/results/555278227680e90737e6dbe0a6dcc0
> > >   35507150aa/build-end.log (sqlite problem)
> > 
> > Needs posix_fallocate() which is not available in the test toolchain.
> 
> Except that posix_fallocate() is not available in uClibc. It is indeed
> available in the internal toolchain backend, due to a patch that we
> have added, but we cannot assume it will be available in external
> uClibc toolchains that may not have the same of patches applied.
> 
> Moreover, the sqlite3.c code in Qt seems to have some code to handle
> the absence of posix_fallocate():
> 
> #if defined(HAVE_POSIX_FALLOCATE) && HAVE_POSIX_FALLOCATE
>   { "fallocate",    (sqlite3_syscall_ptr)posix_fallocate,  0 },
> #else
>   { "fallocate",    (sqlite3_syscall_ptr)0,                0 },
> #endif
> 
> It would be nice to have a look at why HAVE_POSIX_FALLOCATE is defined
> even though posix_fallocate() is not available.

Probably the following change will fix it:

--- a/src/3rdparty/sqlite/sqlite3.c
+++ b/src/3rdparty/sqlite/sqlite3.c
@@ -22938,7 +22938,8 @@ SQLITE_PRIVATE const char *sqlite3OpcodeName(int i){
 /* Use posix_fallocate() if it is available
 */
 #if !defined(HAVE_POSIX_FALLOCATE) \
-      && (_XOPEN_SOURCE >= 600 || _POSIX_C_SOURCE >= 200112L)
+      && (_XOPEN_SOURCE >= 600 || _POSIX_C_SOURCE >= 200112L) \
+      && !defined(__UCLIBC__)
 # define HAVE_POSIX_FALLOCATE 1
 #endif
 


sqlite3's own build system (which is not available in qt) checks if 
posix_fallocate() is available. I wonder if there is a special reason for 
providing an option to use the built-in sqlite.
