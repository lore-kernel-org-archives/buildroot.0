From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 5 Feb 2020 14:46:45 -0600
Subject: [Buildroot] [PATCH] package/rng-tools: make jitterentropy
 conditional
In-Reply-To: <20200205203257.48877881@windsurf>
References: <20200205182608.22695-1-matthew.weber@rockwellcollins.com>
 <20200205203257.48877881@windsurf>
Message-ID: <CANQCQparBzmSPD9epjQw8t6jyMejP0E1X0GjTUkXHpjXTi8Svg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Wed, Feb 5, 2020 at 1:33 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Wed,  5 Feb 2020 12:26:08 -0600
> Matt Weber <matthew.weber@rockwellcollins.com> wrote:
>
> > The update of rng-tools from 5 to 6.7 introduced a change where
> > the jitterentropy library was enabled by default instead of
> > returning a special 66 return code to hangle the case of no
> > hwrng. This patch reverts that change and allows a user to
> > select when to enable the jitterentropy source. The bug
> > documents an issue of when a hwrng is enabled with jitterentropy
> > there is a longer boot time.
>
> I don't understand this story of the 66 return code. Could you explain
> a bit more ?

In Buildroot commit 22cb51e1 the systemd support addition included the
successcode change based on the Fedora bugfix for ignoring if no hwrng
is present (https://bugzilla.redhat.com/show_bug.cgi?id=892178).

>
> > index 11386d1e5d..c0bcffe59e 100644
> > --- a/package/rng-tools/rngd.service
> > +++ b/package/rng-tools/rngd.service
> > @@ -3,6 +3,7 @@ Description=Hardware RNG Entropy Gatherer Daemon
> >
> >  [Service]
> >  ExecStart=/usr/sbin/rngd -f $DAEMON_ARGS
> > +SuccessExitStatus=66
>
> Will this work even if jitterentropy support is enabled ?

My understanding is that you'd never hit this return case when
jitterentropy support built in as it would always init the entropy
pool using that library as a source.  Thus the problem of the boot
delay even when hwrng is present.

Matt
