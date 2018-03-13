From: Trent Piepho <tpiepho@impinj.com>
Date: Tue, 13 Mar 2018 19:09:42 +0000
Subject: [Buildroot] Build time increase in 2018.02
In-Reply-To: <20180312200803.GA2421@scaer>
References: <1520644453.25567.398.camel@impinj.com>
 <87k1ukcgjk.fsf@dell.be.48ers.dk> <1520879262.10662.24.camel@impinj.com>
 <20180312200803.GA2421@scaer>
Message-ID: <1520968181.10662.79.camel@impinj.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 2018-03-12 at 21:08 +0100, Yann E. MORIN wrote:
> On 2018-03-12 18:27 +0000, Trent Piepho spake thusly:
> > On Sat, 2018-03-10 at 12:32 +0100, Peter Korsgaard wrote:
> > > > > > > >  > We've seen a big increase in build time with the latest buildroot.  On
> > > 
> > >  > a vpshere instance, times have gone up from 45 minutes to 180+ minutes.
> > > 
> > > Wow! What version did you use before upgrading to 2018.02 (the 45min)?
> > 
> > 2017.11.1.  I see one change that went in between that and 2018.02 is,
> > "core/pkg-generic: store file->package list for staging and host too"
> > 
> > If I breakdown step_pkg_size by tree:
> > step_pkg_size-stage      143.50
> > step_pkg_size-target     267.14
> > step_pkg_size-host       419.21
> > 
> > So I did a new round of timing on my machine, just to see how bad this
> is.  My machine is: Intel(R) Core(TM) i7-7700HQ CPU @ 2.80GHz, with an
> NVME SSD that can spit out at least 1.4GiB/s:

I tested on an Intel(R) Core(TM) i7-7700K CPU @ 4.20GHz.
I also ran some tests last night on my home computer, AMD Ryzen 5 1600X
Six-Core Processor @ 3.60 GHz.

>     $ dd if=/dev/nvme0n1 of=/dev/null bs=16M count=256
>     4294967296 bytes (4,3 GB, 4,0 GiB) copied, 2,80702 s, 1,5 GB/s

Workstation
4294967296 bytes (4.3 GB, 4.0 GiB) copied, 1.58329 s, 2.7 GB/s

Home
4294967296 bytes (4.3 GB, 4.0 GiB) copied, 1.60107 s, 2.7 GB/s

Not surprising, since one is Samsung 960 EVO and the other is a Dell
OEM drive, both based on the same Samsung Polaris controller.

> I first created a single big file of 32GiB, which is twice the RAM I
> have, so that I can be sure that nothing gets cached. Then I did a
> smaller file, 2GiB, that fits in cache in RAM. I repeated each test
> about 10 times, and took the mean value (roughly):

I think this test simply isn't representative enough of what is really
happening.  It doesn't match the reality of timing the operations in
buildroot nor a before/after test with the package size instrumentation
disabled.  I don't know why it's different, but the numbers clearly
show that it is so.  14 minutes of a 26 minute build are accounted to
package size and without that step the build takes 12 minutes.

> t's say that a 32GiB is highly unlikely, but that a 2GiB is more
> reasonable. Also, this is done only for host packages. So, at worst

2.2G    host
89M     target
511M    staging/.

Lest you think I have some huge build that is not representative.

> case, this is ~3s per host package... With 50 host packages, that's
> about 150s (worst case), which is very far from the 47 minutes
> reported below. Even if we double the host/ size up 4GiB, we get a
> 3-minute overhead, still far from 47 minutes...

The 47 minutes is from a vm.  On the workstation, I got almost 14
minutes out of 26 total.  Still far more than 2.5 minutes worse case.

On my home computer (slightly different package selection), 711 seconds
are accounted to pkg_size out of 26:54.  The final pkg_size of a host
package took 4.267 seconds for the before install step and 4.363 for
the after install step.  The first host package only needed .001
seconds.

Why does the package size step take 4.3 seconds for a 2.2 GB host tree?
 Timing just the md5sum step, that time does not seem out of line:

$ time find host -type f -print0 | xargs -0 md5sum > /dev/null
real    0m9.454s
$ time find host -type f -print0 | xargs -0 md5sum > /dev/null
real    0m3.256s

3.2 seconds with the files in the cache vs 9.4.  I think the VM had
issues with the cache not being large enough. Also shows the I/O speed
is still relevant even with an SSD that can deliver 2.4 GB/sec.

If I look at the host install pkg size time, it starts at 0.02 with the
first host package (HOST_LZIP), then jumps quickly after the toolchain
is installed (which is a staging package, not a host package) to 5.78
seconds, ending at 8.63 seconds on the 54th host package.

If we consider 52 host packages, with md5sum, which happens twice per
package, starting at 2.9 seconds and increasing linearly to 4.3
seconds, for a 2 GB host dir.  Then we get (2.9+4.3)/2 * 52 * 2 = 374.4
seconds.  Observed is 391.38 seconds.

I think you are not taking into account:
* The md5sum happens twice per host package.
* Most of the host dir appears after just two host packages (lzip,
ccache) as part of the toolchain, causing the host dir average size to
be nearly double vs a linear increase from zero to the final size.
* md5summing many small files is slower than one large file of the same
total size.
* Searching a directory tree and reading every file is much slower than
the sequential read rate of an SSD.  The 4k random read rate for a high
end SSD, which can do 2.5 GB/sec sequential read, tops out at 250k
iops/sec.  That's only 1 GB/sec.  And that's with a huge queue depth,
more realistic would be < 100k IOPS/sec.
