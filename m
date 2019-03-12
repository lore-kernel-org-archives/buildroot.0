From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 12 Mar 2019 09:05:18 +0100
Subject: [Buildroot] 2019.02 performance
In-Reply-To: <1552341542.7410.20.camel@impinj.com>
References: <1552341542.7410.20.camel@impinj.com>
Message-ID: <20190312090518.692f21a9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

First of all, thanks a *lot* for sharing this kind of analysis. This is
very useful.

On Mon, 11 Mar 2019 21:59:03 +0000
Trent Piepho <tpiepho@impinj.com> wrote:

> With 2018.02, I had to disable the package size and related hooks as
> they were too slow: over half the build time.  As I'm sure some
> remember, there was a thread about it and performance was
> improved.  Here's the results with 2019.02.  I'm using a real config
> for a product we have and testing on a reasonably modern native Linux
> workstation with a decent NVMe SSD and a four core processor.  Using
> ccache, which had already built the software.

A hot ccache will drastically decrease the time of the "build" step of
each package, and make the "configure" and "install" steps look
comparatively very long. A build without ccache support or with a cold
cache will show a much larger "build" time I believe.

> Breakdown by build step (host/stage/target/images mean install same),
> across all packages:
> 
> configure                666.223
> build                    381.480
> host                     122.191
> extract                   57.489
> target                    57.039
> stage                     28.356
> patch                      9.711
> postimage                  9.008
> finalize                   6.396
> images                     0.063
> download                   0.022
> 
> 
> The single threaded configure and cmake scripts remain the killer,
> through total of all install steps is about 2/3 of the build step time.
> 
> Breakdown for the global instrumentation hooks, across all packages and
> build steps:
> 
> check_host_rpath          64.345
> step_pkg_size             32.992
> check_bin_arch            26.286
> step_check_build_dir       8.365
> step_time                  7.895
> 
> pkg_size is much more reasonable now.  In total, these are about 10.2%
> of the total build time.

10% just for the instrumentation is still a lot. Our of 22 minutes of
your build time, it's still ~2 minutes. The clear dominating factor
here is check_host_rpath. If I'm reading the check-host-rpath
correctly, we are checking all files in $(HOST_DIR) at the end of the
build of every package. Couldn't this be optimized by using the list of
files installed by a package, like we do for check-bin-arch ?

I think that back when check-host-rpath we introduced, we did not had
the list of files installed by host packages. But now that we do,
perhaps we should use it ?

For the other ones, I don't immediately see any easy optimization
route, except perhaps writing some dedicated C programs instead of
using the slower shell scripts forking like crazy.

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
