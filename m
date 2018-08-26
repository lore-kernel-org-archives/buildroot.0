From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Sun, 26 Aug 2018 08:00:57 -0500
Subject: [Buildroot] Autobnuilders timeouts [was: Re: autobuilder flock
 hangs]
In-Reply-To: <20180825133116.GC2419@scaer>
References: <20180812060015.A385B207E5@mail.bootlin.com>
 <20180812223629.2bac8ebe@windsurf>
 <1a4b53ec-1ed3-7770-3a65-8d4f4f596918@mentor.com>
 <20180816111059.3a7f1b59@windsurf> <20180824070203.GK9365@scaer>
 <CANQCQpb6Cgt+YoniwLCd8jGhLdrzCCJDcAyXjcSAWbETrZ=mUQ@mail.gmail.com>
 <20180825133116.GC2419@scaer>
Message-ID: <CANQCQpbbUiODXUFouOnif8SfehqzEmwc9NBRONu0CYMhGTkhzw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Sat, Aug 25, 2018 at 8:31 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Matthew, Julien, All,
>
> On 2018-08-24 18:54 -0500, Matthew Weber spake thusly:
> > On Fri, Aug 24, 2018 at 2:02 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > > Now, I also had a look at all the timeouts, and I also noticed a single
> > > other pattern. Julien's and Matthew's autobuilder would always choke on
> > > host-libsodium, and it happens only on those two autobuilders:
> > >     http://autobuild.buildroot.org/?reason=host-libsodium
> > > All failing at the same point:
> > >     checking whether segmentation violations can be caught when using the C compiler...
> >
> > Tried a few things...
> > 1) Setup this config and did a make host-libsodium.  No hang.
> > 2) Took the test code from that configure test and could execute it without hang
> > 3) Doing a full build now and we'll see if there is a sequencing/file
> > configuration driving this.
> >
> > Any other ideas?
>
> I found the commit that added this check:
>     https://github.com/jedisct1/libsodium/commit/c3045e2cb02dc1dae29cdb0dafd6cdb6469b8de8
>
> So, does your host compiler runs asan by default? If so, do you have
> ASAN_OPTIONS set in your environment?
>

br-reproduce'd build doesn't fail or take a long time on
host-libsodium (below).  I also checked my env, no define and I don't
have asan on this machine.  Only difference now would be executing it
under the python autobuilder env. I'll see if I have autobuilder logs
from these failures (maybe I should add some logging, the signal test
maybe messes with the cmd shell?)

   2659 1535170855:start:extract             : host-libsodium
   2660 1535170855:end  :extract             : host-libsodium
   2661 1535170855:start:patch               : host-libsodium
   2662 1535170855:end  :patch               : host-libsodium
   2663 1535170856:start:configure           : host-libsodium
   2664 1535170866:end  :configure           : host-libsodium
   2665 1535170866:start:build               : host-libsodium
   2666 1535170871:end  :build               : host-libsodium
   2667 1535170871:start:install-host        : host-libsodium
   2668 1535170872:end  :install-host        : host-libsodium


Matt
