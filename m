From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 30 Dec 2019 22:13:59 +0100
Subject: [Buildroot] [PATCH] package/google-breakpad: fix build on
 modern hosts
In-Reply-To: <20191226214555.1227797-1-thomas.petazzoni@bootlin.com>
References: <20191226214555.1227797-1-thomas.petazzoni@bootlin.com>
Message-ID: <20191230211359.GW26395@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Pascal, All,

On 2019-12-26 22:45 +0100, Thomas Petazzoni spake thusly:
> Since glibc 2.30, a tgkill() function is exposed by the C library, but
> google-breakpad has its own internal definition of it, which now
> conflicts. This causes build failures on modern build machines (when
> building google-breakpad for the host).
> 
> This commit adds a patch that simply renames the internal tgkill()
> function to BreakpadTgkill() to avoid the naming conflict.
> 
> We do that instead of a configure.ac change to avoid having to
> autoreconf this package, and because the fix is anyway not
> upstreamable as upstream simply dropped the internal tgkill()
> implementation, but using that would break building google-breakpad on
> older systems.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/bc2ae827b830d23094c8b70e5b34911d060295a3/ (host)
>   http://autobuild.buildroot.net/results/21257e5a87f41487c6bf4db4e15ce49f1af1ac1e/ (target)
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.

Pascal, the version we have in Buildroot is very old now. Could you look
into updating it, please?

Regards,
Yann E. MORIN.

> ---
>  ...-handler-exception_handler.cc-rename.patch | 59 +++++++++++++++++++
>  1 file changed, 59 insertions(+)
>  create mode 100644 package/google-breakpad/0003-src-client-linux-handler-exception_handler.cc-rename.patch
> 
> diff --git a/package/google-breakpad/0003-src-client-linux-handler-exception_handler.cc-rename.patch b/package/google-breakpad/0003-src-client-linux-handler-exception_handler.cc-rename.patch
> new file mode 100644
> index 0000000000..579e7f3457
> --- /dev/null
> +++ b/package/google-breakpad/0003-src-client-linux-handler-exception_handler.cc-rename.patch
> @@ -0,0 +1,59 @@
> +From 2fa414c8655c421e7eb0bb1719928babb0ecf7c6 Mon Sep 17 00:00:00 2001
> +From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +Date: Thu, 26 Dec 2019 22:21:33 +0100
> +Subject: [PATCH] src/client/linux/handler/exception_handler.cc: rename tgkill
> + to BreakpadTgkill()
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Since glibc 2.30, a tgkill() function was added in the C library, and
> +its definition obviously conflicts with the internal definition of
> +google-breakpad, causing build failures:
> +
> +src/client/linux/handler/exception_handler.cc:109:12: error: ?int tgkill(pid_t, pid_t, int)? was declared ?extern? and later ?static? [-fpermissive]
> +  109 | static int tgkill(pid_t tgid, pid_t tid, int sig) {
> +      |            ^~~~~~
> +In file included from /usr/include/signal.h:374,
> +                 from ./src/client/linux/handler/exception_handler.h:33,
> +                 from src/client/linux/handler/exception_handler.cc:66:
> +/usr/include/bits/signal_ext.h:29:12: note: previous declaration of ?int tgkill(__pid_t, __pid_t, int)?
> +   29 | extern int tgkill (__pid_t __tgid, __pid_t __tid, int __signal);
> +      |            ^~~~~~
> +
> +Upstream google-breakpad simply dropped the use of the internal
> +tgkill() in commit
> +https://chromium.googlesource.com/breakpad/breakpad/+/7e3c165000d44fa153a3270870ed500bc8bbb461. However,
> +this is not realistic for Buildroot, since we do support old systems
> +where the system C library will not necessarily provide tgkill().
> +
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + src/client/linux/handler/exception_handler.cc | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/client/linux/handler/exception_handler.cc b/src/client/linux/handler/exception_handler.cc
> +index b63f973b..b4c279b8 100644
> +--- a/src/client/linux/handler/exception_handler.cc
> ++++ b/src/client/linux/handler/exception_handler.cc
> +@@ -106,7 +106,7 @@
> + #endif
> + 
> + // A wrapper for the tgkill syscall: send a signal to a specific thread.
> +-static int tgkill(pid_t tgid, pid_t tid, int sig) {
> ++static int BreakpadTgkill(pid_t tgid, pid_t tid, int sig) {
> +   return syscall(__NR_tgkill, tgid, tid, sig);
> +   return 0;
> + }
> +@@ -387,7 +387,7 @@ void ExceptionHandler::SignalHandler(int sig, siginfo_t* info, void* uc) {
> +     // In order to retrigger it, we have to queue a new signal by calling
> +     // kill() ourselves.  The special case (si_pid == 0 && sig == SIGABRT) is
> +     // due to the kernel sending a SIGABRT from a user request via SysRQ.
> +-    if (tgkill(getpid(), syscall(__NR_gettid), sig) < 0) {
> ++    if (BreakpadTgkill(getpid(), syscall(__NR_gettid), sig) < 0) {
> +       // If we failed to kill ourselves (e.g. because a sandbox disallows us
> +       // to do so), we instead resort to terminating our process. This will
> +       // result in an incorrect exit code.
> +-- 
> +2.24.1
> +
> -- 
> 2.24.1
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
