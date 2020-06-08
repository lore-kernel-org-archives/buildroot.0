From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 8 Jun 2020 23:34:29 +0200
Subject: [Buildroot] [PATCH] package/haveged: Allow service to run early
In-Reply-To: <CAFvCimW_m5hQ3Y2+DJyRmD-Wjvu5AmL2HyYrCtXCFbBZqhXybA@mail.gmail.com>
References: <CAFvCimWgEF5hx+LXPasKNSP59CU2RqU-22iLkMQb_9QQRDk=mA@mail.gmail.com>
 <CADYdroM-mpaz+7zqGMnKJ5J=sJL-TiAQOXs_vieW6ts77=VBHQ@mail.gmail.com>
 <CAFvCimVmWczV2XjFsx=De3Q1ZCLxSTOu9etaFqN9z54cv0ACyw@mail.gmail.com>
 <CADYdroPOE148vzGPNQhBX3mb3tAVK0d-D4vt89rrphK=zfbzxQ@mail.gmail.com>
 <CAFvCimUXkpkYLQ8mfhvAzTcHJ14Vs4queFjipCRNkZsVyCmP=g@mail.gmail.com>
 <CADYdroPU=MZa4RCqoS9TrF89jKp2vNXGggMp3iGri8F8DAp02A@mail.gmail.com>
 <CAFvCimUod4o5Yk0UqtrgymKSD3vTMMMuT-XhNm+g4kmmysdQ4Q@mail.gmail.com>
 <CADYdroNrgMbYrmLqRmCSobfNnQTtjN4ZfYYViS6JAdMYTZAEbA@mail.gmail.com>
 <CAFvCimWLcZxrusY5ig1fRxj-SQFQsKvxajJh_s-9==bm1ATo+w@mail.gmail.com>
 <CADYdroOVGUozgyP258MinUAtznRSRSw-SvrGbD7ZGkqAVdfQJw@mail.gmail.com>
 <20200608083829.dm3kjkjo2q2j3xd3@falbala.internal.home.lespocky.de>
 <CAFvCimW_m5hQ3Y2+DJyRmD-Wjvu5AmL2HyYrCtXCFbBZqhXybA@mail.gmail.com>
Message-ID: <20200608233429.4a64a8a9@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello J?r?my, Norbert, Alexander,

On Mon, 8 Jun 2020 16:14:00 +0200, J?r?my ROSEN <jeremy.rosen@smile.fr> wrote:

> Le lun. 8 juin 2020 ? 10:38, Alexander Dahl <post@lespocky.de> a ?crit :
> 
> > Hei hei,
> >
> > I'd like to hook in, because I had that topic on my desk lately
> > (although not with buildroot).
> >
> > On Sun, Jun 07, 2020 at 10:36:18PM +0200, Norbert Lange wrote:  
> > > > I mean... if it's not high grade entropy, it shouldn't credit the  
> > kernel entropy  
> > > > pool,and if the user is ok with unreliable entropy,  
> > systemd-random-seed is  
> > > > probably a faster way to get some.  
> > >
> > >
> > > haveged is barely entropy, certainly not more than the kernel
> > > provides, it is a means to fake entropy. Gets you to boot faster.  
> >
> > Well, the system can boot faster, because haveged provides entropy
> > from unpredictable internal CPU states. It's not just another PRNG.
> >
> > Oh. I didn't know that... interesting  
> 
> So. haveged provides high quality entropy to the kernel.
> That entropy is probably credited (unlike systemd-random-seed)
> So it is even more important that it is ordered before systemd-random-seed.
> 
> > systemd-random-seed needs a filesystem to store stuff, does not credit  
> > > the entropy pool (by default).. and won't help at all when booting the
> > > first time.
> > >  
> 
> 
> > > I think what you have in mind is more like rng-tools, which feed real,
> > > quality entropy to the kernel.  
> >
> > rng-tools can not do that by itself, but needs a real HWRNG or
> > something like jitterentropy-rng (which gets its entropy from CPU
> > execution timing jitter). So rng-tools alone doesn't help you,
> > especially if your hardware has no hwrng.
> >  
> > > The user should pick what he needs, haveged will never give you better
> > > entropy over the kernel or real HW sources,  systemd-random-seed will
> > > not let you boot faster (by default).  
> >
> > I'm curious, where do you think the kernel gets entropy from? ;-)
> >
> > What you all might find interesting: newer OpenSSL versions, I think
> > from some 1.1.1 bugfix release onwards block until the kernel has
> > initialized its crng.  The upcoming (not yet released) dropbear will
> > do that, too. Both don't rely on /dev/urandom for that but on the
> > getrandom(2) syscall IIRC. Without having looked in systemd source, I
> > would guess they do something similar?
> >
> > Yes it's exactly that. systemd-random-seed will block until urng is ready  
> so
> other services don't have to do that themselves (it makes sense for
> dropbear/openssl to do that themselves anyway, for the non-systemd case,
>  but in a systemd-based distro, they won't wait because systemd-random-seed
>  will already have done the waiting)
> 
> So at this point,  I am more and more convinced that haveged must be
> ordered before systemd-random-seed. Not doing so is incorrect. At best
> it will work by luck and at worst the entropy provided by haveged will
> arrive
> too late.
> 
> On a read-only filesystem, systemd-random-seed will not read the file and
> feed
> entropy (which is not credited anyway) but it will still block the boot and
> thus
> ensure that any "normal" (post sysinit) daemon will have proper urng.
> 
> Please add the Before= it has no ill effect AFAICT and not doing so might
> prevent faster boots in the very cases where you try to avoid it.

Did not follow the thread in detail, but did a quick search for
haveged and systemd, found two relevant hits [1], [2], debian
(and other) had 'After=systemd-random-seed.service' but dropped
it leaving only:

    After=apparmor.service systemd-tmpfiles-setup.service
    Before=sysinit.target shutdown.target

Regards,
Peter

[1] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=938939
[2] https://salsa.debian.org/debian/haveged/-/merge_requests/1?commit_id=f92a246e53de88a346a2fb6dc770a624f0660bef

> 
> Regards.
> Jeremy
> 
> 
> 
> > So, it's complicated ? ;-)
> >
> > Greets
> > Alex
> >
> > --
> > /"\ ASCII RIBBON | ?With the first link, the chain is forged. The first
> > \ / CAMPAIGN     | speech censured, the first thought forbidden, the
> >  X  AGAINST      | first freedom denied, chains us all irrevocably.?
> > / \ HTML MAIL    | (Jean-Luc Picard, quoting Judge Aaron Satie)
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
> >  
> 
> 
