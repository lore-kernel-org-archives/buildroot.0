From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 19 Jul 2020 14:09:21 +0200
Subject: [Buildroot] [PATCH] initscripts: Make installation of
 S20urandom optional.
In-Reply-To: <20200719114950.GT18825@scaer>
References: <20200718224444.2748609-1-christoph.muellner@theobroma-systems.com>
 <20200719100514.618894ca@windsurf.home>
 <20200719114950.GT18825@scaer>
Message-ID: <20200719140921.5bc74639@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello *,

On Sun, 19 Jul 2020 13:49:50 +0200, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Thomas, Christoph, Al,
> 
> On 2020-07-19 10:05 +0200, Thomas Petazzoni spake thusly:
> > On Sun, 19 Jul 2020 00:44:44 +0200
> > christoph.muellner at theobroma-systems.com wrote:
> >   
> > > From: Christoph M?llner <christoph.muellner@theobroma-systems.com>
> > > 
> > > S20urandom is a nice script. However, there are systems, which
> > > cannot make use of that script for some reasons (e.g. systems that
> > > only have read-only partitions).
> > > 
> > > So let's install S20urandom only if configured to do so
> > > (with default y to keep backwards-compatibility).
> > > 
> > > Signed-off-by: Christoph M?llner <christoph.muellner@theobroma-systems.com>  
> > 
> > Hm, indeed it saves to /var/lib/random-seed, which we do not seem to
> > symlink to a tmpfs place when the rootfs is read-only. I'm not entirely
> > sure we want to add yet another option for this, or if we want to fix
> > it so that it "works" even in read-only rootfs scenarios. I don't have
> > a very clear opinion on how to handle that.  
> 
> I too don't think that warrants a kconfig option.
> 
> I would however believe this script is not interesting at all. In fact,
> an ambedded device seldom reboots nicely; instead, it is most often a
> hard-reboot (with a power cycle). In that case, the script would have no
> chance whatsoever to save the current seed before shutdown, thus on next
> boot we would restore a seed that would have already been used, thus
> defeating randomness to begin with; worse, it would give people a sense
> of security where there would in fact be a hole.

This is a very limited view of the buildroot use-cases, I believe there
are although some, call it 'mid-range' embedded systems, with a proper
power-down button shutting down the system before killing the power
(or at least the use-case of two of my customer projects)...

Regards,
Peter 

> 
> If people do not have a good source of randomness in their kernel and/or
> hardware, they should switch to using things like rng-tools with
> jitterentropy or the likes, rather than rely on saving and restoring the
> seed.
> 
> It is my opinion that we should just drop that startup script altogether
> and be done with it.
> 
> Regards,
> Yann E. MORIN.
> 
