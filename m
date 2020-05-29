From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 29 May 2020 08:09:48 +0200
Subject: [Buildroot] [PATCH v2] package/cvs: fix mktime related compile
 failure
In-Reply-To: <20200528215912.30258-1-ps.report@gmx.net>
References: <20200528215912.30258-1-ps.report@gmx.net>
Message-ID: <20200529080948.0476a536@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 28 May 2020 23:59:12 +0200
Peter Seiderer <ps.report@gmx.net> wrote:

> Use ac_cv_func_working_mktime=yes to force the use of a provided
> mktime implementation instead of compiling the failing own one.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/5bcd8f4235002da682cc900f866116d2fe87f1c8
> 
>   mktime.c: In function 'ydhms_diff':
>   mktime.c:106:52: error: size of array 'a' is negative
>    #define verify(name, assertion) struct name { char a[(assertion) ? 1 : -1]; }
>                                                       ^
>   mktime.c:170:3: note: in expansion of macro 'verify'
>      verify (long_int_year_and_yday_are_wide_enough,
>      ^~~~~~
> 
> with the failure/assert comming from the lines:
> 
>   verify (long_int_year_and_yday_are_wide_enough,
>           INT_MAX <= LONG_MAX / 2 || TIME_T_MAX <= UINT_MAX);

Wait wait, this is verifying that TIME_T_MAX is lower than UINT_MAX, so
I guess the rest of the code assumes that the size of time_t is less or
equal than the size of an unsigned int.

With the time_t conversion to 64bit, time_t *is* larger than an
unsigned int.

So aren't you papering over the problem, and in fact potentially
causing some issues in CVS, which seems to assume the time_t fits in
32-bit ?

Or maybe I'm wrong here, because I see AlpineLinux simply updates the
mktime configure test to fix this issue:

  https://git.alpinelinux.org/aports/tree/main/cvs/mktime-configure.patch

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
