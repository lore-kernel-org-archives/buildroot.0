From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 11 Nov 2013 06:30:00 -0300
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <201311111426.34194.fatih.asici@gmail.com>
References: <20131109073028.B3C2E52C614@lolut.humanoidz.org>
 <201311111114.51686.fatih.asici@gmail.com> <20131111110906.7585ca0e@skate>
 <201311111426.34194.fatih.asici@gmail.com>
Message-ID: <5280A398.9080908@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/11/2013 09:26 AM, Fatih A??c? wrote:

> Probably the following change will fix it:
> 
> --- a/src/3rdparty/sqlite/sqlite3.c
> +++ b/src/3rdparty/sqlite/sqlite3.c
> @@ -22938,7 +22938,8 @@ SQLITE_PRIVATE const char *sqlite3OpcodeName(int i){
>  /* Use posix_fallocate() if it is available
>  */
>  #if !defined(HAVE_POSIX_FALLOCATE) \
> -      && (_XOPEN_SOURCE >= 600 || _POSIX_C_SOURCE >= 200112L)
> +      && (_XOPEN_SOURCE >= 600 || _POSIX_C_SOURCE >= 200112L) \
> +      && !defined(__UCLIBC__)
>  # define HAVE_POSIX_FALLOCATE 1
>  #endif
>  
> 
> 
> sqlite3's own build system (which is not available in qt) checks if 
> posix_fallocate() is available. I wonder if there is a special reason for 
> providing an option to use the built-in sqlite.

There was a bug in sqlite 3.7.17 with this, see
http://git.buildroot.net/buildroot/commit/package/sqlite?id=316f991729c423c9a49a955d3747ff31ad7a0068
It's fixed now, but a similar solution might be appropiate.
Newer uClibc versions might have posix_fallocate so excluding uClibc
might not be appropiate in the future.
Regards.
