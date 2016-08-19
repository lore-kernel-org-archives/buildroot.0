From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 19 Aug 2016 23:00:10 +0200
Subject: [Buildroot] [PATCH v2 master 1/2] logrotate: fix up build error
 with gcc 6
In-Reply-To: <1471626904-29215-1-git-send-email-rahul.bedarkar@imgtec.com>
References: <1471626904-29215-1-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <20160819230010.6b48365f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 19 Aug 2016 22:45:03 +0530, Rahul Bedarkar wrote:
> With gcc version 6, we see following warnings.
> 
>   logrotate.c: In function 'postrotateSingleLog':
>   logrotate.c:1784:5: error: this 'if' clause does not guard... [-Werror=misleading-indentation]
>        if (!state->doRotate)
>        ^~
>   logrotate.c:1787:2: note: ...this statement, but the latter is misleadingly indented as if it is guarded by the 'if'
>     if (!hasErrors && log->flags & LOG_FLAG_TMPFILENAME) {
>     ^~
> Add a upstream patch to fix above warning.
> 
>   config.c: In function 'strndup':
>   config.c:87:10: error: nonnull argument 's' compared to NULL [-Werror=nonnull-compare]
>           if(!s)
>             ^
>   cc1: all warnings being treated as errors
>   make[2]: *** [config.o] Error 1
>   make[2]: *** Waiting for unfinished jobs....
>   cc1: all warnings being treated as errors
>   make[2]: *** [logrotate.o] Error 1
> 
> Add a patch to drop check for nonnull to fix above warning.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/6dc/6dc2eb22104076920d77425b1e608ef9b9e01c94/
> 
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>

Thanks, I've applied, but I've completely changed your patch
0002-fix-up-warning-with-gcc6.patch to use a different approach.
strndup() is already in the C library, so there is no reason in our
case for logrotate to use its implementation. So I've instead fixed how
the availability of strndup() (and also asprintf) is checked, so that
the C library version is used.

I've submitted my patch upstream:
https://github.com/logrotate/logrotate/pull/55.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
