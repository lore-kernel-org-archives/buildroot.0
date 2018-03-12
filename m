From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 12 Mar 2018 21:08:03 +0100
Subject: [Buildroot] Build time increase in 2018.02
In-Reply-To: <1520879262.10662.24.camel@impinj.com>
References: <1520644453.25567.398.camel@impinj.com>
 <87k1ukcgjk.fsf@dell.be.48ers.dk>
 <1520879262.10662.24.camel@impinj.com>
Message-ID: <20180312200803.GA2421@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Trent, All,

On 2018-03-12 18:27 +0000, Trent Piepho spake thusly:
> On Sat, 2018-03-10 at 12:32 +0100, Peter Korsgaard wrote:
> > > > > > >  > We've seen a big increase in build time with the latest buildroot.  On
> >  > a vpshere instance, times have gone up from 45 minutes to 180+ minutes.
> > 
> > Wow! What version did you use before upgrading to 2018.02 (the 45min)?
> 
> 2017.11.1.  I see one change that went in between that and 2018.02 is,
> "core/pkg-generic: store file->package list for staging and host too"
> 
> If I breakdown step_pkg_size by tree:
> step_pkg_size-stage      143.50
> step_pkg_size-target     267.14
> step_pkg_size-host       419.21
> 
> The other targets, extract, build, etc. are <1 second.  So adding
> package size stats for staging and host is responsible for tripling the
> time this step takes.
> 
> Looking at how the file accounting is done, it will md5sum the tree
> with complexity O(n^2) on the size of the tree.  So it is not
> surprising that it is very slow.  It also explains why re-installing a
> host package after the build is done slow, since it must md5sum the
> entire host tree twice.  At least when building it takes about half as
> long since the earlier packages to install have a smaller tree to sum.

I remember very well doing some analysis back when we initially
introduced this feature just for the content of target/ and that the
overhead was virtually unnoticeable:

    http://lists.busybox.net/pipermail/buildroot/2015-February/119431.html

So I did a new round of timing on my machine, just to see how bad this
is.  My machine is: Intel(R) Core(TM) i7-7700HQ CPU @ 2.80GHz, with an
NVME SSD that can spit out at least 1.4GiB/s:

    $ dd if=/dev/nvme0n1 of=/dev/null bs=16M count=256
    4294967296 bytes (4,3 GB, 4,0 GiB) copied, 2,80702 s, 1,5 GB/s

I first created a single big file of 32GiB, which is twice the RAM I
have, so that I can be sure that nothing gets cached. Then I did a
smaller file, 2GiB, that fits in cache in RAM. I repeated each test
about 10 times, and took the mean value (roughly):

    $ dd if=/dev/urandom of=foo-32G bs=1M count=32768
    $ time md5sum foo-32G
    real    0m54,891s

    $ dd if=/dev/urandom of=foo-2G  bs=1M count=2048
    $ time md5sum foo-2G
    real    0m3,232s

What can be seen with htop and iotop, is that md5sum-ing the 32GiB file
is CPU bound, not I/O bound. And this reflects in the timings: the ratio
is roughly 17x, which can be explained by a 6x size plus I/O scheduling.

So, whether the data fits in cache or not is not meaningful, unless the
storage is not up-to-speed.

Let's say that a 32GiB is highly unlikely, but that a 2GiB is more
reasonable. Also, this is done only for host packages. So, at worst
case, this is ~3s per host package... With 50 host packages, that's
about 150s (worst case), which is very far from the 47 minutes
reported below. Even if we double the host/ size up 4GiB, we get a
3-minute overhead, still far from 47 minutes...

> Here's the time for running on a VM.  
> targetinstall             29.65
> stageinstall              31.57
> check_bin_arch            34.11
> post_image                38.63
> check_host_rpath          41.23
> hostinstall               55.40
> extract                   72.99
> other                     73.77
> build                    465.93
> configure                689.38
> step_pkg_size            2872.76
> 
> 47 minutes to check the package sizes.
> 
> While I don't use a VM myself, the people who run the infrastructure
> for the CI and nightly builds think they are great.  It's the way
> things are now.  Everyone's IT dept uses vsphere or AWS or some other
> tech to allow them to create instances that are decoupled from the
> physical hardware present (or in the cloud).

Yeah, a VM is a performance killer, especially for I/Os... :-/

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
