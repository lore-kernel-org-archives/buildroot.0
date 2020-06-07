From: =?UTF-8?B?SsOpcsOpbXkgUk9TRU4=?= <jeremy.rosen@smile.fr>
Date: Sun, 7 Jun 2020 22:19:34 +0200
Subject: [Buildroot] [PATCH] package/haveged: Allow service to run early
In-Reply-To: <CADYdroNrgMbYrmLqRmCSobfNnQTtjN4ZfYYViS6JAdMYTZAEbA@mail.gmail.com>
References: <20200605225421.13494-1-nolange79@gmail.com>
 <CAFvCimXjptaExo7ia5XWRxrQrAYEhJqEZisTyp2_uUbWwu40uA@mail.gmail.com>
 <CADYdroMhuGysCOy2aV2ihoA3kQ9fSUdKiocpL4h2niT7=iWuHw@mail.gmail.com>
 <CAFvCimWgEF5hx+LXPasKNSP59CU2RqU-22iLkMQb_9QQRDk=mA@mail.gmail.com>
 <CADYdroM-mpaz+7zqGMnKJ5J=sJL-TiAQOXs_vieW6ts77=VBHQ@mail.gmail.com>
 <CAFvCimVmWczV2XjFsx=De3Q1ZCLxSTOu9etaFqN9z54cv0ACyw@mail.gmail.com>
 <CADYdroPOE148vzGPNQhBX3mb3tAVK0d-D4vt89rrphK=zfbzxQ@mail.gmail.com>
 <CAFvCimUXkpkYLQ8mfhvAzTcHJ14Vs4queFjipCRNkZsVyCmP=g@mail.gmail.com>
 <CADYdroPU=MZa4RCqoS9TrF89jKp2vNXGggMp3iGri8F8DAp02A@mail.gmail.com>
 <CAFvCimUod4o5Yk0UqtrgymKSD3vTMMMuT-XhNm+g4kmmysdQ4Q@mail.gmail.com>
 <CADYdroNrgMbYrmLqRmCSobfNnQTtjN4ZfYYViS6JAdMYTZAEbA@mail.gmail.com>
Message-ID: <CAFvCimWLcZxrusY5ig1fRxj-SQFQsKvxajJh_s-9==bm1ATo+w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le dim. 7 juin 2020 ? 22:14, Norbert Lange <nolange79@gmail.com> a ?crit :

> Am So., 7. Juni 2020 um 22:07 Uhr schrieb J?r?my ROSEN <
> jeremy.rosen at smile.fr>:
> >
> >
> >
> > Le dim. 7 juin 2020 ? 21:59, Norbert Lange <nolange79@gmail.com> a
> ?crit :
> >>
> >> Am So., 7. Juni 2020 um 21:47 Uhr schrieb J?r?my ROSEN <
> jeremy.rosen at smile.fr>:
> >> >
> >> >
> >> >
> >> > Le dim. 7 juin 2020 ? 21:42, Norbert Lange <nolange79@gmail.com> a
> ?crit :
> >> >>
> >> >> Am So., 7. Juni 2020 um 21:27 Uhr schrieb J?r?my ROSEN <
> jeremy.rosen at smile.fr>:
> >> >> >
> >> >> >
> >> >> >
> >> >> > Le dim. 7 juin 2020 ? 21:18, Norbert Lange <nolange79@gmail.com>
> a ?crit :
> >> >> >>
> >> >> >> Am So., 7. Juni 2020 um 21:05 Uhr schrieb J?r?my ROSEN <
> jeremy.rosen at smile.fr>:
> >> >> >> >
> >> >> >> >
> >> >> >> >
> >> >> >> > Le dim. 7 juin 2020 ? 20:35, Norbert Lange <nolange79@gmail.com>
> a ?crit :
> >> >> >> >>
> >> >> >> >> Am So., 7. Juni 2020 um 12:35 Uhr schrieb J?r?my ROSEN <
> jeremy.rosen at smile.fr>:
> >> >> >> >> >
> >> >> >> >> >
> >> >> >> >> >
> >> >> >> >> > Le sam. 6 juin 2020 ? 00:55, Norbert Lange <
> nolange79 at gmail.com> a ?crit :
> >> >> >> >> >>
> >> >> >> >> >> Drop default dependencies, haveged needs nothing but
> >> >> >> >> >> local sockets and /dev/random.
> >> >> >> >> >> This allows the entropy to be available earlier.
> >> >> >> >> >>
> >> >> >> >> >> Signed-off-by: Norbert Lange <nolange79@gmail.com>
> >> >> >> >> >> ---
> >> >> >> >> >>  package/haveged/haveged.service | 5 ++++-
> >> >> >> >> >>  1 file changed, 4 insertions(+), 1 deletion(-)
> >> >> >> >> >>
> >> >> >> >> >> diff --git a/package/haveged/haveged.service
> b/package/haveged/haveged.service
> >> >> >> >> >> index 91035c6711..ed9f043a91 100644
> >> >> >> >> >> --- a/package/haveged/haveged.service
> >> >> >> >> >> +++ b/package/haveged/haveged.service
> >> >> >> >> >> @@ -1,10 +1,13 @@
> >> >> >> >> >>  [Unit]
> >> >> >> >> >>  Description=Entropy Harvesting Daemon
> >> >> >> >> >>  Documentation=man:haveged(8)
> >> >> >> >> >> +DefaultDependencies=no
> >> >> >> >> >> +Conflicts=shutdown.target
> >> >> >> >> >> +Before=sysinit.target shutdown.target
> systemd-update-done.service
> >> >> >> >> >>
> >> >> >> >> > Since v243 (quoting  systemd's NEWS file) :
> >> >> >> >> >
> >> >> >> >> > * systemd-random-seed.service is now a synchronization point
> for full
> >> >> >> >> >           initialization of the kernel's entropy pool.
> Services that require
> >> >> >> >> >           /dev/urandom to be correctly initialized should be
> ordered after this
> >> >> >> >> >           service.
> >> >> >> >> >
> >> >> >> >> > so... in that case it might make sense to add
> Before=systemd-random-seed.service
> >> >> >> >> > (assuming that works. This a very early point, so it needs
> some testing)
> >> >> >> >>
> >> >> >> >>
> >> >> >> >> No, doesnt make sense, a "before"  only means the service is
> *started before*,
> >> >> >> >> not the process did do anything worthwile. (That's the reason
> for my
> >> >> >> >> openssh patch BTW)
> >> >> >> >> systemd-random-seed.service is a one-shot, so a "before" *that*
> >> >> >> >> service means the dependants wait till it is finished.
> >> >> >> >>
> >> >> >> > (note that I don't really understand what haveged does, so I
> might be completely wrong in my
> >> >> >> > understanding)
> >> >> >> >
> >> >> >> > systemd-random-seed is the sync point, that means that any
> service that needs
> >> >> >> > random numbers should  be ordered after random-seed.
> >> >> >> >
> >> >> >> > So, to me, it makes sense that we want to have haveged started
> before that point. Thus
> >> >> >> > having haveged ordered before random-seed.
> >> >> >> >
> >> >> >> > and I don't really understand your sentence above...
> >> >> >> > if you add Before=systemd-random-seed, it's systemd-random-seed
> that will wait for
> >> >> >> > haveged to be started, not the other way round. (which seems to
> be what you say ??)
> >> >> >>
> >> >> >>
> >> >> >>  Yes, systemd-random-seed will wait for haveged to be *startet*
> (and
> >> >> >> maybe its immediatly preempted),
> >> >> >> but it takes several seconds after that till /dev/urandom is
> "ready"
> >> >> >> (what that means changed in the last few years multiple times)
> >> >> >>
> >> >> > ... yeah ...
> >> >> >>
> >> >> >> >
> >> >> >> > now... if haveged needs some time to "do something usefull"
> then it means that haveged
> >> >> >> > is badly synchronised on startup. The Ready signal in systemd
> is defined as "the point
> >> >> >> > at which the service is able to render the service expected for
> it'
> >> >> >>
> >> >> >>
> >> >> >> Yes, but haveged does not send such a signal (and systemd only
> wait
> >> >> >> for that if the Type=notify).
> >> >> >
> >> >> >
> >> >> > There is a workaround for that. Add an ExecStartPost that detects
> readiness.
> >> >> > (mentionning that for completeness sake, not sure if it's worth
> doing here.)
> >> >> >
> >> >> >>
> >> >> >> Further the service only feeds data to the kernel, and the only
> valid
> >> >> >> meaning of /dev/urandom is "ready"
> >> >> >> comes from the kernel.
> >> >> >>
> >> >> > and random-seed will wait for that, so syncronisation will work
> correctly
> >> >>
> >> >> Nope, it does not. It's a (poor) substitute to wait after some
> entropy
> >> >> was fed to the kernel.
> >> >>
> >> > comment at the bottom of random-seed.service:
> >> >
> >> > # This service waits until the kernel's entropy pool is initialized,
> and may be
> >> > # used as ordering barrier for service that require an initialized
> entropy
> >> > # pool. Since initialization can take a while on entropy-starved
> systems, let's
> >> > # increase the time-out substantially here.
> >> >
> >> > and from the man page
> >> >
> >> >  This new seed is  retrieved synchronously from the kernel, which
> means the
> >> > service will not complete start-up until the random pool is fully
> initialized.
> >> >
> >> >  I might misread stuff, as you stated randomness handing in linux is
> complicated
> >> > but I really think that the initial idea behind that service was
> synchronisation...
> >>
> >>
> >> No you are correct, Ive been proven wrong. Did not know reading the
> >> seed would sync to the entropy pool being ready.
> >>
> >> >
> >> >
> >> >> >
> >> >> >>
> >> >> >>  The point of waiting for "systemd-random-seed" is a substitute
> if you
> >> >> >> are in a really tough spot,
> >> >> >> and independent of what haveged does.
> >> >> >>
> >> >> > No, it's more than a substitute. it's a sync point.
> >> >> > It doesn't just load entropy into the kernel, it also blocks until
> the kernel reports
> >> >> > that /dev/urandom is ready
> >> >>
> >> >> Show me where?
> >> >>
> >> >> >
> >> >> > IOW the only way to make sure that haveged is started "at the
> right point" in a generic
> >> >> > way is to add that Before=
> >> >> >
> >> >> > That would allow any service that needs reliable randomness to be
> correctly synced
> >> >> > with haveged, even if they are not aware that haveged is here...
> >> >>
> >> >> Well, consider that systemd-random-seed would block for that (which
> it
> >> >> does not),
> >> >> then it does not matter *when* haveged is started, only that it is
> not
> >> >> blocked (and it is not).
> >> >> In other words, it would make no difference.
> >>
> >>
> >> That point still stands though.
> >> -   haveged will be "startable" as early as systemd-random-seed,
> >> potentially before (does not need a filesystem).
> >> -   even if it is started later, systemd-random-seed will block until
> >> haveged was running long enough to feed entropy to the kernel
> >
> >
> > not if there are other sources of entropy available and the kernel marks
> >  urandom  as ready before haveged is started
> >
> > more importantly, I am worried about "the promise".
> > A user installing haveged will want to rely on it to provide improved
> > randomness. by not syncing correctly, we are missing on that promise.
> >
> > Overall, I think it's good practice. Haveged should be aware of
> > systemd-random-seed and should be started before systemd-random-seed.
> >
> > Having it explicitely before is more readable, safer, and doesn't rely
> on a
> > kernel sync that is hard to understand.
> >
> > The more I think about it, the more I think you should add that...
> > It's just a line in a config file and it might really improve clarity,
> avoid
> > potential bugs and better guarantee that services needing high
> > quality randomness will have it properly.
>
> haveged is *not* a prefered source of entropy,
> it's there that VMs and embedded systems don't stall for minutes at bootup
> (I use that with a ConditionVirtualization to test my rootfs under qemu)
>
> So I'd prefer any other sources to feed the kernel, this is the
> software fallback.
>

Ok, but with that i'm not sure what the proper configurtion for
buildroot in general should be...

I mean... if it's not high grade entropy, it shouldn't credit the kernel
entropy
pool,and if the user is ok with unreliable entropy, systemd-random-seed is
probably a faster way to get some.

I'm a bit confused at this point. I'm not sure what the correct default
should be.
-- 
[image: SMILE]  <http://www.smile.eu/>

20 rue des Jardins
92600 Asni?res-sur-Seine
*J?r?my ROSEN*
Architecte technique

[image: email] jeremy.rosen at smile.fr
[image: phone]  +33 6 88 25 87 42
[image: url] http://www.smile.eu

[image: Twitter] <https://twitter.com/GroupeSmile> [image: Facebook]
<https://www.facebook.com/smileopensource> [image: LinkedIn]
<https://www.linkedin.com/company/smile> [image: Github]
<https://github.com/Smile-SA>

[image: D?couvrez l?univers Smile, rendez-vous sur smile.eu]
<https://www.smile.eu/fr/publications/livres-blancs/yocto?utm_source=signature&utm_medium=email&utm_campaign=signature>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200607/83b9c7e0/attachment.html>
