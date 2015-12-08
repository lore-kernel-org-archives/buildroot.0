From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 8 Dec 2015 21:08:58 +0100
Subject: [Buildroot] [PATCH 3/4] package/lttng-tools: backport patch
 fixing pthread_setname_np failure
In-Reply-To: <1449092893-30664-3-git-send-email-s.martin49@gmail.com>
References: <1449092893-30664-1-git-send-email-s.martin49@gmail.com>
 <1449092893-30664-3-git-send-email-s.martin49@gmail.com>
Message-ID: <20151208200858.GR4188@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On 2015-12-02 22:48 +0100, Samuel Martin spake thusly:
> This patch, backported from upstream, prevent the build from failing due
> to:
> 
>   [...]
>     CCLD     lttng-consumerd
>   ../../../src/common/.libs/libcommon.a(runas.o): In function `run_as_worker':
>   /tmp/br/build/lttng-tools-2.7.0/src/common/runas.c:325: undefined reference to `pthread_setname_np'
>   collect2: error: ld returned 1 exit status
>   Makefile:475: recipe for target 'lttng-consumerd' failed
>   [...]
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Same comment as for patch 2:

    https://git.lttng.org/?p=lttng-tools.git;a=commit;h=b8090274814e5f6a22cff0dd656e14769cc7a7df

Regards,
Yann E. MORIN.

> ---
>  ...dependency-on-glibc-2.12-caused-by-pthrea.patch | 55 ++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 package/lttng-tools/0002-Fix-Remove-dependency-on-glibc-2.12-caused-by-pthrea.patch
> 
> diff --git a/package/lttng-tools/0002-Fix-Remove-dependency-on-glibc-2.12-caused-by-pthrea.patch b/package/lttng-tools/0002-Fix-Remove-dependency-on-glibc-2.12-caused-by-pthrea.patch
> new file mode 100644
> index 0000000..5ab187c
> --- /dev/null
> +++ b/package/lttng-tools/0002-Fix-Remove-dependency-on-glibc-2.12-caused-by-pthrea.patch
> @@ -0,0 +1,55 @@
> +Upstream status: merged
> +From 8c40c9d05cca5c9fd6b98055cb26462bc0efdab2 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?J=C3=A9r=C3=A9mie=20Galarneau?=
> + <jeremie.galarneau@efficios.com>
> +Date: Wed, 30 Sep 2015 16:48:12 -0400
> +Subject: [PATCH] Fix: Remove dependency on glibc 2.12 caused by
> + pthread_setname_np
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +prctl() can be used to set the same attribute set by
> +pthread_setname_np, but doesn't introduce a dependency on a newer
> +glibc. Using prctl(PR_SET_NAME) introduces a soft dependency on
> +Linux 2.6.9. However, the worker won't fail to launch if the call
> +fails as it is set out of convenience (debugger output).
> +
> +Signed-off-by: J?r?mie Galarneau <jeremie.galarneau@efficios.com>
> +Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> +---
> + src/common/runas.c | 10 +++++-----
> + 1 file changed, 5 insertions(+), 5 deletions(-)
> +
> +diff --git a/src/common/runas.c b/src/common/runas.c
> +index fc30a55..57f7382 100644
> +--- a/src/common/runas.c
> ++++ b/src/common/runas.c
> +@@ -31,6 +31,7 @@
> + #include <sched.h>
> + #include <sys/signal.h>
> + #include <assert.h>
> ++#include <sys/prctl.h>
> + 
> + #include <common/common.h>
> + #include <common/utils.h>
> +@@ -322,12 +323,11 @@ int run_as_worker(struct run_as_worker *worker)
> + 	memset(worker->procname, 0, proc_orig_len);
> + 	strncpy(worker->procname, DEFAULT_RUN_AS_WORKER_NAME, proc_orig_len);
> + 
> +-	ret = pthread_setname_np(pthread_self(), DEFAULT_RUN_AS_WORKER_NAME);
> ++	ret = prctl(PR_SET_NAME, DEFAULT_RUN_AS_WORKER_NAME, 0, 0, 0);
> + 	if (ret) {
> +-		errno = ret;
> +-		ret = -1;
> +-		PERROR("pthread_setname_np");
> +-		return EXIT_FAILURE;
> ++		/* Don't fail as this is not essential. */
> ++		PERROR("prctl PR_SET_NAME");
> ++		ret = 0;
> + 	}
> + 
> + 	sendret.ret = 0;
> +-- 
> +2.6.2
> +
> -- 
> 2.6.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
