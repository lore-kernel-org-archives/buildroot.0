From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 26 Feb 2019 09:33:25 +0100
Subject: [Buildroot] [PATCH 1/3] runc: depend on linux headers >= 3.11
 for O_TMPFILE
In-Reply-To: <20190226083225.2b23e850@windsurf.home> (Thomas Petazzoni's
 message of "Tue, 26 Feb 2019 08:32:25 +0100")
References: <20190219223530.15956-1-christian@paral.in>
 <20190220090108.6e2d1e9a@windsurf> <87o96zeapq.fsf@dell.be.48ers.dk>
 <20190226083225.2b23e850@windsurf.home>
Message-ID: <87d0nfdk4q.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

Hi,

 >> We have already dropped support for glibc <= 2.17 back in 2017.08,
 >> perhaps we should bump that to <= 2.18 now?
 >> 
 >> A number of our preconfigured toolchains do use glibc 2.18 though,
 >> E.G. the codesourcery / mentor ARM toolchain and a number of the
 >> toolchains we use on the autobuilders.

 > While I understand the maintenance burden that it causes, I would like
 > to try to keep support for fairly old toolchains. Even if it seems
 > crazy, a number of companies are still using oldish toolchains
 > (typically provided by SoC vendors) to build stuff with relatively
 > recent Buildroot versions. It is becoming more and more difficult due
 > to the use of C++11 in many userspace components (which requires gcc >=
 > 4.8), but still. So we should be careful about bumping our glibc
 > version requirements in a global way, when only a package like "runc"
 > is affected, which serves some very specific purpose.

I understand that dropping support for stuff isn't nice for the users.

Just to make sure I understand the use case - These people are using old
toolchains for some reason but uptodate Linux kernels? Why can the
kernel be updated but not the toolchain?

If they are also using old kernels, then fixing up these things will
just lead to runtime errors instead, which is even worse.

Last time I was stuck with an ancient BSP, I even had to backport new
syscalls to build and use modern user space (I believe it was accept4 or
recvmmsg).

I could imagine more software starting to use O_TMPFILE in the future as
well.

In general, mixing components of different vintage is a recipe for pain.



 > Can we work around the lack of O_TMPFILE in the C library directly in
 > the package source code, and then rely on a >= 3.11 kernel headers
 > dependency ?

 > Systemd has this logic in missing_fcntl.h:

I also had a look at doing that, but it is not completely trivial as the
definitions are arch specific (as you show) and fcntl.h (on glibc at
least) does not include asm/fcntl.h

According to https://lwn.net/Articles/619146/, glibc also used to
forward arguments wrong to the open syscall:

https://sourceware.org/bugzilla/show_bug.cgi?id=17523

So given how security sensitive this is, I'm wary of patching it up - I
don't want to end up like Debian with the openssl patch :/


As the recent iproute2 patch showed, we do still have users on glibc <=
2.17 even though we do not officially support it, and do accept patches
when they are simple - But people are on their own if some package
doesn't build with such old toolchains, so the real impact of dropping
official support for glibc 2.18 as well is not so big, E.G. it would
just mean that we drop the preconfigured toolchains using it and stop
testing on the autobuilders.

-- 
Bye, Peter Korsgaard
