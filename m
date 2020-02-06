From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 5 Feb 2020 19:12:22 -0600
Subject: [Buildroot] [PATCH] package/rng-tools: make jitterentropy
 conditional
In-Reply-To: <CANQCQparBzmSPD9epjQw8t6jyMejP0E1X0GjTUkXHpjXTi8Svg@mail.gmail.com>
References: <20200205182608.22695-1-matthew.weber@rockwellcollins.com>
 <20200205203257.48877881@windsurf>
 <CANQCQparBzmSPD9epjQw8t6jyMejP0E1X0GjTUkXHpjXTi8Svg@mail.gmail.com>
Message-ID: <CANQCQpZ9Hs6DA6XJpBnMLxqnnJj8N3TYQLsDSp_YR3xqR8G-bQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,


On Wed, Feb 5, 2020 at 2:46 PM Matthew Weber
<matthew.weber@rockwellcollins.com> wrote:
>
> Thomas,
>
> On Wed, Feb 5, 2020 at 1:33 PM Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
> >
> > On Wed,  5 Feb 2020 12:26:08 -0600
> > Matt Weber <matthew.weber@rockwellcollins.com> wrote:
> >
> > > The update of rng-tools from 5 to 6.7 introduced a change where
> > > the jitterentropy library was enabled by default instead of
> > > returning a special 66 return code to hangle the case of no
> > > hwrng. This patch reverts that change and allows a user to
> > > select when to enable the jitterentropy source. The bug
> > > documents an issue of when a hwrng is enabled with jitterentropy
> > > there is a longer boot time.
> >
> > I don't understand this story of the 66 return code. Could you explain
> > a bit more ?
>
> In Buildroot commit 22cb51e1 the systemd support addition included the
> successcode change based on the Fedora bugfix for ignoring if no hwrng
> is present (https://bugzilla.redhat.com/show_bug.cgi?id=892178).

Ryan Barnett noticed that rng-tools dropped the special return code.
I guess we could just drop support for this special case as well....
https://github.com/nhorman/rng-tools/blob/v6.8/rngd.c#L805

>
> >
> > > index 11386d1e5d..c0bcffe59e 100644
> > > --- a/package/rng-tools/rngd.service
> > > +++ b/package/rng-tools/rngd.service
> > > @@ -3,6 +3,7 @@ Description=Hardware RNG Entropy Gatherer Daemon
> > >
> > >  [Service]
> > >  ExecStart=/usr/sbin/rngd -f $DAEMON_ARGS
> > > +SuccessExitStatus=66
> >
> > Will this work even if jitterentropy support is enabled ?
>
> My understanding is that you'd never hit this return case when
> jitterentropy support built in as it would always init the entropy
> pool using that library as a source.  Thus the problem of the boot
> delay even when hwrng is present.
>
> Matt



-- 

Matthew Weber | Associate Director Software Engineer | Commercial Avionics

COLLINS AEROSPACE

400 Collins Road NE, Cedar Rapids, Iowa 52498, USA

Tel: +1 319 295 7349 | FAX: +1 319 263 6099

matthew.weber at collins.com | collinsaerospace.com



CONFIDENTIALITY WARNING: This message may contain proprietary and/or
privileged information of Collins Aerospace and its affiliated
companies. If you are not the intended recipient, please 1) Do not
disclose, copy, distribute or use this message or its contents. 2)
Advise the sender by return email. 3) Delete all copies (including all
attachments) from your computer. Your cooperation is greatly
appreciated.


Any export restricted material should be shared using my
matthew.weber at corp.rockwellcollins.com address.
