From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 21 Feb 2017 17:18:07 +0100
Subject: [Buildroot] [PATCH] lttng-libust: disable on musl
In-Reply-To: <1487668084-7078-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 21 Feb 2017 10:08:04 +0100")
References: <1487668084-7078-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <877f4jo6v4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Since version v2.9.0, lttng-libust has a tracepoint for the C library
 > dlmopen() function, and uses some types such as Lmid_t, related to
 > dlmopen(). However, musl doesn't provide dlmopen(), which causes a build
 > failure.

 > The Alpine Linux distribution has a patch [1] to remove this code
 > completely, but while this is a reasonable solution for a musl-only
 > distribution, it is not for a build system that also supports glibc and
 > uClibc. Therefore, we instead disable lttng-libust for the musl C
 > library.

 > The problem has been reported upstream (no mailing list archive link
 > available at the time of this commit).

 > Fixes:

 >   http://autobuild.buildroot.net/results/113fa95a054df183014b43ec36b329f9c59bd356/

I was confused why it worked on uclibc-ng which also doesn't provide
dlmopen / the Lmid_t type (well it does, but it is inside and #if 0) -
And it turns out that the dlmopen tracepoint doesn't get built when
building against uclibc-ng as dlfcn.h doesn't provide RTLD_DI_LINKMAP.

So an alternative is to convince the configure script that musl doesn't
have RTLD_DI_LINKMAP.

-- 
Bye, Peter Korsgaard
