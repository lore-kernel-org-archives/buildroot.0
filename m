From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Thu, 25 Feb 2016 15:33:24 +0000
Subject: [Buildroot] [PATCH 2/2] host-m4: fix build when -std=gnu99 and
 inline functions are used
In-Reply-To: <20160225142622.47b2841a@free-electrons.com>
References: <1456400230-4187-1-git-send-email-ltrimas@synopsys.com>
 <1456400230-4187-3-git-send-email-ltrimas@synopsys.com>
 <20160225135436.18a8385c@free-electrons.com>
 <1456405085.2312.2.camel@synopsys.com>
 <20160225142622.47b2841a@free-electrons.com>
Message-ID: <1456414403.4586.63.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Thu, 2016-02-25 at 14:26 +0100, Thomas Petazzoni wrote:
> Hello,
> 
> On Thu, 25 Feb 2016 12:58:05 +0000, Lada Trimasova wrote:
> 
> > I used CentOS 5.7, gcc 4.9.2, glibc 2.5.
> 
> Are you talking about gcc 4.9 for the target or gcc 4.9 for the host ?

Definitely we're talking about host gcc.

> It seems weird to be using such a recent gcc version with such an
> ancient glibc version.

Indeed. On our corporate farm machines we may select different tools
versions and on that particular machine that runs RedHat 5.7 we had an
option to use gcc 4.9 (the latest from available options).

But there's no way to change glibc version (really how can we change
it right beneath our feet) and glibc is really 2.5:
------------>8------------
$ ldd --version
ldd (GNU libc) 2.5
------------>8------------

And indeed on our dev machines that are up to date Fedora 23
we don't see any issues with building host-tar or m4.

So that's what happens in details:

[1] In our olde good glibc-2.5 if FORTIFY_SOURCE is defined by user
? ? (and tar does so) following implementation of ptsname_r() from
? ? /usr/include/bits/stdlib.h is used:
------------>8------------
extern __always_inline int
__NTH (ptsname_r (int __fd, char *__buf, size_t __buflen))
{
? if (__bos (__buf) != (size_t) -1
??????&& (!__builtin_constant_p (__buflen) || __buflen > __bos (__buf)))
????return __ptsname_r_chk (__fd, __buf, __buflen, __bos (__buf));
? return __ptsname_r_alias (__fd, __buf, __buflen);
}
------------>8------------

[2] Back in the day of glibc-2.5 C89 inline semantics were used, which
? ? were:
------------>8------------
...
If you specify both inline and extern in the function definition,
then the definition is used only for inlining.
------------>8------------

[3] In later inline semantics like in C99 if there's no "static"
? ? then compiler assumes this is global symbol.

That's why with older host glibc we need to pass "-fgnu89-inline"
flag to compiler. And now I think we may even consider adding it
to the top-level HOST_CFLAGS instead of fixing problem on per-package
basis.

Any thoughts?

And indeed we now have to determine last glibc version that relies on
C89 inline semantics.

-Alexey

P.S. Just in case that article was of great help:
http://stackoverflow.com/questions/2722276/multiple-definition-of-inline-function
