From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 25 Feb 2019 23:59:13 +0100
Subject: [Buildroot] [PATCH 1/3] runc: depend on linux headers >= 3.11
 for O_TMPFILE
In-Reply-To: <20190220090108.6e2d1e9a@windsurf> (Thomas Petazzoni's message of
 "Wed, 20 Feb 2019 09:01:08 +0100")
References: <20190219223530.15956-1-christian@paral.in>
 <20190220090108.6e2d1e9a@windsurf>
Message-ID: <87o96zeapq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Hello Christian,
 > On Tue, 19 Feb 2019 14:35:28 -0800
 > Christian Stewart <christian@paral.in> wrote:

 >> Add dependency on headers >= 3.11. O_TMPFILE, required by runc, was not
 >> available until this version.
 >> 
 >> Fixes:
 >> 
 >> http://autobuild.buildroot.net/results/63e9d88ae5177541be463f1e2aafec59aa410479

 > I don't see how it can fix this build issue, because the defconfig for
 > this failure has:

 > BR2_TOOLCHAIN_HEADERS_AT_LEAST="3.12"

 > so it *is* using kernel headers more recent than 3.11.

 > I had a look at your build issue following your e-mail yesterday, and
 > indeed O_TMPFILE was added in the kernel headers in 3.11, but
 > apparently having 3.11 kernel headers is not sufficient. I suppose some
 > code is also needed in the C library, and because the toolchain used by
 > this configuration has an old glibc, it doesn't have everything needed
 > for O_TMPFILE.

Indeed, O_TMPFILE support was only added to glibc in 2.19 with the
following commit:

commit ffdd31816a67f48697ea4d6b852e58d2886d42ca
Author: Andreas Schwab <schwab@suse.de>
Date:   Wed Sep 11 11:15:45 2013 +0200

    Add O_TMPFILE to <fcntl.h>

And to musl in 0.9.15 with the following commit:

commit f7d348ec39ce31efdc4963eb4a8f16f48e5ef095
Author: Szabolcs Nagy <nsz@port70.net>
Date:   Sat Nov 23 23:47:48 2013 +0000

    add O_TMPFILE flag, new in linux 3.11

    definition in linux:
     #define O_TMPFILE (__O_TMPFILE | O_DIRECTORY)
    where __O_TMPFILE and O_DIRECTORY are arch specific

We have already dropped support for glibc <= 2.17 back in 2017.08,
perhaps we should bump that to <= 2.18 now?

A number of our preconfigured toolchains do use glibc 2.18 though,
E.G. the codesourcery / mentor ARM toolchain and a number of the
toolchains we use on the autobuilders.

-- 
Bye, Peter Korsgaard
