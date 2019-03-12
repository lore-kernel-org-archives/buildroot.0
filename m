From: Trent Piepho <tpiepho@impinj.com>
Date: Tue, 12 Mar 2019 20:30:50 +0000
Subject: [Buildroot] 2019.02 performance
In-Reply-To: <20190312090518.692f21a9@windsurf>
References: <1552341542.7410.20.camel@impinj.com>
 <20190312090518.692f21a9@windsurf>
Message-ID: <1552422649.7410.30.camel@impinj.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 2019-03-12 at 09:05 +0100, Thomas Petazzoni wrote:
> 
> A hot ccache will drastically decrease the time of the "build" step of
> each package, and make the "configure" and "install" steps look
> comparatively very long. A build without ccache support or with a cold
> cache will show a much larger "build" time I believe.

Yes, it will be larger.  I don't have a benchmark handy with that info.
 Perhaps I'll do one overnight.  But what I see here, is that nearly
every build we do, both manually and as part of CI, has a very high
ccache hit rate.  I was keeping track of the stats from CI for a while
on that.  

> > 
> > pkg_size is much more reasonable now.  In total, these are about 10.2%
> > of the total build time.
> 
> 10% just for the instrumentation is still a lot. Our of 22 minutes of
> your build time, it's still ~2 minutes. The clear dominating factor

This is just the build image time (from scratch + ccache).  There is
also a documentation build, and steps like legal info, package build
time graphs, and dependency graphs are quite long.  The dependency
graphs are clearly the biggest low hanging fruit once this step is
considered.

Though check host rpath could be sped up!  One thing that might skew
these results is our host packages to target packages ratio might be
higher than typical.  If I took out the host based python software and
host based image crypto signing stuff there'd be a lot fewer host ELF
files.
