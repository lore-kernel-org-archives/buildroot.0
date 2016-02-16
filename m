From: Waldemar Brodkorb <wbx@openadk.org>
Date: Tue, 16 Feb 2016 20:03:29 +0100
Subject: [Buildroot] [PATCH 1/1] package/iputils: patch ping to link
 against libm
In-Reply-To: <20160215231703.2052c7e0@free-electrons.com>
References: <1455541206-18200-1-git-send-email-martin@barkynet.com>
 <20160215231703.2052c7e0@free-electrons.com>
Message-ID: <20160216190329.GO14809@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
Thomas Petazzoni wrote,

> Martin,
> 
> On Mon, 15 Feb 2016 13:00:06 +0000, Martin Bark wrote:
> > ping fails to compile with uClibc based toolchains with the error
> > 
> > undefined reference to `__finite'
> > 
> > Add a patch to link ping against libm to resolve the math library function
> > finite().
> > 
> > Note, this error is not seen with glibc based toolchains because finite
> > seems to be resolved in both libm and libc.
> > 
> > Fixes:
> > http://autobuild.buildroot.net/results/08f7386f75c881bc582b338824f8ccd509b2921e/
> > http://autobuild.buildroot.net/results/5aeef61fbd399dd78dc72b9e7cce978e6f1f58b4/
> > 
> > A pull request has been sent to fix this issue upstream, see
> > https://github.com/iputils/iputils/pull/42
> > 
> > Signed-off-by: Martin Bark <martin@barkynet.com>
> 
> Thanks for working on this issue. However, I am not entirely happy with
> the explanation.
> 
> Indeed, if you try to build iputils against uClibc, it builds just
> fine. It is apparently only when the entire build is done with
> BR2_ENABLE_DEBUG=y that the build failure occurs. And your commit log
> doesn't explain at all why the problem only occurs when the build is
> done with debugging symbols enabled.
> 
> I've tried building iputils against uClibc, it works fine. I've tried
> building iputils against uClibc with BR2_ENABLE_DEBUG=y (using a
> pre-built uClibc toolchain, which isn't built with debugging symbols),
> and it works fine. So it seems that it only happens when the entire
> build is done with debugging symbols, including uClibc itself.
> 
> While linking with -lm might be the correct fix, I am not convinced yet
> due the lack of explanation for the root of the problem.

The root of the problem is rather simple. When you use math library
functions you are required to link libm explicitely. I think for
historical reasons. For musl this is no issue as everything is
included in libc.so. In uClibc world you have the choice and could simply
build a system without any math library. 
GNU libc seems to have weak aliases for finitef even in libc.so:
nm output/build/glibc-2.22/build/libc.so|grep finitef                                                                                                      
0002ba9c W finitef
0002ba9c T __finitef
0002ba9c t __GI___finitef

So linking with GNU libc does not fail for iputils even without -lm.

Not sure, I cannot find every libm function, but some. tgamma or
exp10 is not referenced in libc.so.

May be Mike can explain the Glibc behaviour?

The finite macros where added here:
http://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/include/math.h?id=21902b578e96fd6b85b9bcda8a0e929fc844ec51
So 1.0.10 is the first release containing this BSD specific
functions in a usable way.

I think BR2_*DEBUG* option is not related to this error.

best regards
 Waldemar
