From: Max Filippov <jcmvbkbc@gmail.com>
Date: Sat, 19 Jul 2014 04:28:11 +0400
Subject: [Buildroot] glib 2.40 on xtensa
In-Reply-To: <20140719004023.4a71d4b8@free-electrons.com>
References: <20140719004023.4a71d4b8@free-electrons.com>
Message-ID: <CAMo8BfKDFvct4=wDsFVObRMab9P-73LcMvJU2JaNozR=swbT2A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Jul 19, 2014 at 2:40 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Baruch, Max,
>
> We have recently update glib to version 2.40, and this is causing
> issues on Xtensa:
>
>   http://autobuild.buildroot.org/results/a1a/a1a1f97a2c54ba4f7f7e44cc094a55bd23ca0aa0/build-end.log
>
>   CC       gspawn.lo
> gthread-posix.c: In function 'g_cond_impl_new':
> gthread-posix.c:648:2: error: #error Cannot support GCond on your platform.
>  #error Cannot support GCond on your platform.
>   ^
> gthread-posix.c: In function 'g_cond_wait_until':
> gthread-posix.c:896:2: error: #error Cannot support GCond on your platform.
>  #error Cannot support GCond on your platform.
>   ^
> gthread-posix.c:859:19: warning: unused variable 'ts' [-Wunused-variable]
>    struct timespec ts;
>                    ^
>
> Could you have a look and see what can be done to fix this problem?

It requires pthread_cond_timedwait_relative_np (not available on uclibc)
or pthread_condattr_setclock (only available with NPTL). Looks like we
need NPTL to support this glib version.

-- 
Thanks.
-- Max
