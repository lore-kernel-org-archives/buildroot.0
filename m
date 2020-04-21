From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 Apr 2020 16:51:57 +0200
Subject: [Buildroot] [PATCH 1/1] package/mbuffer: fix build with powerpc
In-Reply-To: <20200421123852.3529227-1-fontaine.fabrice@gmail.com>
References: <20200421123852.3529227-1-fontaine.fabrice@gmail.com>
Message-ID: <20200421165157.6cc14384@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Tue, 21 Apr 2020 14:38:52 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> ++#if defined(__linux) || defined(__linux__)
> + #include <linux/limits.h>

This shouldn't include <linux/limits.h> directly. Indeed, PIPE_BUF is
defined by the POSIX standard as being defined in <limits.h>, see man
limits.h(0P):

       {PIPE_BUF}
             Maximum number of bytes that is guaranteed to be atomic when writing to a pipe.
             Minimum Acceptable Value: {_POSIX_PIPE_BUF}

However, it is only defined if _POSIX_SOURCE is defined, which may gets
done automatically or not depending on which C standard you're building
with.

Demo:

$ cat toto.c 
#include <limits.h>
#include <stdio.h>
int main(void) { printf("%d\n", PIPE_BUF); return 0; }

$ gcc -std=c89 -o toto toto.c 
toto.c: In function ?main?:
toto.c:4:33: error: ?PIPE_BUF? undeclared (first use in this function)
    4 | int main(void) { printf("%d\n", PIPE_BUF); return 0; }
      |                                 ^~~~~~~~
toto.c:4:33: note: each undeclared identifier is reported only once for each function it appears in

$ gcc -std=gnu89 -o toto toto.c
$ # i.e, builds fine!

$ gcc -std=c89 -D_POSIX_SOURCE -o toto toto.c
$ # i.e, builds fine!

That being said, it's not your fault: the upstream code already does
the bad thing of including <linux/limits.h>.

And BTW, this issue has nothing to do with PowerPC at all. As you can
see, even on my x64-64 platform, if you use PIPE_BUF in c89 or c99
code, it doesn't work unless you define _POSIX_SOURCE.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
