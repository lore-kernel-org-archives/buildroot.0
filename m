From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Fri, 3 Jun 2016 11:50:54 +0000
Subject: [Buildroot] [arc-buildroot] [autobuild.buildroot.net] arc build
 results for 2016-06-02
In-Reply-To: <20160603063024.061EE102E94@stock.ovh.net>
References: <20160603063024.061EE102E94@stock.ovh.net>
Message-ID: <1464954612.8682.36.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Fri, 2016-06-03 at 08:30 +0200, Thomas Petazzoni wrote:
> Those results are limited to the arc architecture.
> 
> Build statistics for 2016-06-02
> ===============================
> 
> ????????success : 0??
> ???????failures : 15?
> ???????timeouts : 0??
> ??????????TOTAL : 15?
> 
> Classification of failures by reason
> ====================================
> 
> ?????host-binutils-arc-2016.03 | 8?
> ??????????binutils-arc-2016.03 | 2?

Here we're hitting what seems to be an upstream binutils
issue. If there's no prebuilt documentation (which is the case for
sources from git) binutils will fail to build documentation
if there's no "makeinfo" installed on a build host.

Note our previous binutils (from "arc-2015.12" release) even though being taken from
git repo did have prebuilt docs in place.

Now what happens with arc-2016.03 binutils or upstream sources from git...

Script "missing" returns code "127" if "makeinfo" "command not found" for real,
see?https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=blob;f=missing#l207
and its caller which is "bfd.info" in "bfd/doc/Makefile" exits with that same code,
see?https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=blob;f=bfd/doc/Makefile.in#l487
which "make" interprets as an error code, thus we see:
---------------------->8-------------------
make[4]: *** [bfd.info] Error 127
---------------------->8-------------------

On my machine I do have "makeinfo" installed as well as many real people have too that's why
nobody had this problem before.

So there're 2 solutions (one of which is a work-around which postpones the problem):
?1. Install "makeinfo" on your build server. That's obviously just a work-around.
?2. Fix bfd/doc/Makefile so it gracefully handles expected error codes returned by
? ? "missing". That looks like a proper fix.

Any thoughts are more than welcome. And indeed we'll try to fix this ASAP because nothing could
be built for target if host-binutils fails to build itself.

BTW our hack in BR when we set "ac_cv_prog_MAKEINFO=missing" to disable documentation building
turned out to be a bit naive. That's because "missing" script will anyways try to run target
tool (in our case "makeinfo").	


> ?????????????bluez_utils-4.101 | 1?
> ? ? ? ? ? ?libmemcached-1.0.18 | 1?

That's binutils' segfault - we'll be looking at it.

> ? ? ? ? ? ? ? ? e2fsprogs-1.43 | 3?

This seems to be non-ARC specific problem.

-Alexey
