From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 18 Jul 2021 22:25:23 +0200
Subject: [Buildroot] [PATCH 1/1] package/tftpd: fix static build
In-Reply-To: <20210710084313.893425-1-fontaine.fabrice@gmail.com>
References: <20210710084313.893425-1-fontaine.fabrice@gmail.com>
Message-ID: <20210718202523.GA1464219@scaer>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Fabrice, All,

On 2021-07-10 10:43 +0200, Fabrice Fontaine spake thusly:
> Fixes:
>  - http://autobuild.buildroot.org/results/913e8b75422c8beba60df5ea2e2c9e431364566e

So, after the discussion in this thread, Thomas and I did some
investigations, and the situation is a bit murky.

I was able to reproduce the error on 2020.08.3, with this defconfig

    BR2_powerpc=y
    BR2_STATIC_LIBS=y
    BR2_GCC_VERSION_10_X=y
    BR2_INIT_NONE=y
    BR2_SYSTEM_BIN_SH_NONE=y
    # BR2_PACKAGE_BUSYBOX is not set
    # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
    BR2_PACKAGE_TFTPD=y
    # BR2_TARGET_ROOTFS_TAR is not set

But I was also able to find an autobuild success, that hapenned on
2021.02.x:

    http://autobuild.buildroot.org/results/ecb/ecbd19e8bd26fe5527c9ce993857d202834cb0fe/

So, it breaks on 2020.08.3, succeeds on 2021.02.x, and then breaks again
on the upcoming 2021.08... WTF? tftpd does not like the summer, or what?
;-)

But the difference is that failing configs use gcc-10, while successfull
ones use gcc <9 :

    http://autobuild.buildroot.org/index.php?static=1&status=OK&symbols%5BBR2_PACKAGE_TFTPD%5D=y&symbols%5BBR2_GCC_VERSION_9_X%5D=y

So, not sure what's going on there... gcc-10 changed something?

Anyway, the fix is trivially correct, still I think we should just
switch over to using the git tree's current HEAD, which gets us this fix
and others too...

Could you look into that, please?

Regards,
Yann E. MORIN.

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0002-__progname-is-provided-by-libc.patch | 65 +++++++++++++++++++
>  1 file changed, 65 insertions(+)
>  create mode 100644 package/tftpd/0002-__progname-is-provided-by-libc.patch
> 
> diff --git a/package/tftpd/0002-__progname-is-provided-by-libc.patch b/package/tftpd/0002-__progname-is-provided-by-libc.patch
> new file mode 100644
> index 0000000000..220fda0646
> --- /dev/null
> +++ b/package/tftpd/0002-__progname-is-provided-by-libc.patch
> @@ -0,0 +1,65 @@
> +From 18ac1e26f756dd47fef33f5f706b0ec8fa696216 Mon Sep 17 00:00:00 2001
> +From: Thorsten Glaser <tg@mirbsd.de>
> +Date: Thu, 31 Jul 2014 16:29:41 +0930
> +Subject: __progname[] is provided by libc
> +
> +Rename local variable to tftpd_progname to avoid a clash with glibc
> +global symbols and work around Debian bug #519006 (Closes: #564052).
> +
> +[ hpa: specifically, double-underscore symbols in C are reserved for
> +  the implementation, i.e. compiler/libc. ]
> +
> +Signed-off-by: Ron Lee <ron@debian.org>
> +Signed-off-by: H. Peter Anvin <hpa@linux.intel.com>
> +[Retrieved from:
> +https://git.kernel.org/pub/scm/network/tftp/tftp-hpa.git/commit/?id=18ac1e26f756dd47fef33f5f706b0ec8fa696216]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + tftpd/tftpd.c | 10 +++++-----
> + 1 file changed, 5 insertions(+), 5 deletions(-)
> +
> +diff --git a/tftpd/tftpd.c b/tftpd/tftpd.c
> +index 88d2812..91f5ae1 100644
> +--- a/tftpd/tftpd.c
> ++++ b/tftpd/tftpd.c
> +@@ -76,7 +76,7 @@ static int ai_fam = AF_INET;
> + #define TRIES   6               /* Number of attempts to send each packet */
> + #define TIMEOUT_LIMIT ((1 << TRIES)-1)
> + 
> +-const char *__progname;
> ++const char *tftpd_progname;
> + static int peer;
> + static unsigned long timeout  = TIMEOUT;        /* Current timeout value */
> + static unsigned long rexmtval = TIMEOUT;       /* Basic timeout value */
> +@@ -387,9 +387,9 @@ int main(int argc, char **argv)
> +     /* basename() is way too much of a pain from a portability standpoint */
> + 
> +     p = strrchr(argv[0], '/');
> +-    __progname = (p && p[1]) ? p + 1 : argv[0];
> ++    tftpd_progname = (p && p[1]) ? p + 1 : argv[0];
> + 
> +-    openlog(__progname, LOG_PID | LOG_NDELAY, LOG_DAEMON);
> ++    openlog(tftpd_progname, LOG_PID | LOG_NDELAY, LOG_DAEMON);
> + 
> +     srand(time(NULL) ^ getpid());
> + 
> +@@ -938,14 +938,14 @@ int main(int argc, char **argv)
> +        syslog daemon gets restarted by the time we get here. */
> +     if (secure && standalone) {
> +         closelog();
> +-        openlog(__progname, LOG_PID | LOG_NDELAY, LOG_DAEMON);
> ++        openlog(tftpd_progname, LOG_PID | LOG_NDELAY, LOG_DAEMON);
> +     }
> + 
> + #ifdef HAVE_TCPWRAPPERS
> +     /* Verify if this was a legal request for us.  This has to be
> +        done before the chroot, while /etc is still accessible. */
> +     request_init(&wrap_request,
> +-                 RQ_DAEMON, __progname,
> ++                 RQ_DAEMON, tftpd_progname,
> +                  RQ_FILE, fd,
> +                  RQ_CLIENT_SIN, &from, RQ_SERVER_SIN, &myaddr, 0);
> +     sock_methods(&wrap_request);
> +-- 
> +cgit 1.2.3-1.el7
> +
> -- 
> 2.30.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
