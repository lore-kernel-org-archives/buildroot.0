From: =?UTF-8?B?SsOpcsOpbXkgUk9TRU4=?= <jeremy.rosen@smile.fr>
Date: Sun, 17 Nov 2019 18:47:59 +0100
Subject: [Buildroot] [PATCH 1/2] package/systemd: set machine id file
 instalation as optional choice
In-Reply-To: <782843ef-67eb-d6df-c97d-dc7877448918@mind.be>
References: <20191117113345.159653-1-b.bilas@grinn-global.com>
 <0b8bd9be-3109-f998-5a44-cca063d1e207@mind.be>
 <CAFvCimUuDJUWzKPA-rX0rqcFNGgNARvD5gdLYqDjR+XVdbgUVA@mail.gmail.com>
 <6987e42b-89ad-cbf3-fd03-ee3ad74880b7@mind.be>
 <CAFvCimW2Pp+j4O2TtXGbXW-9uf_epkpbA-q7+Sq1sTGrTD5bEw@mail.gmail.com>
 <782843ef-67eb-d6df-c97d-dc7877448918@mind.be>
Message-ID: <CAFvCimXjAe0+DbgcQfwn5vPiGSzP3DS57cnnCFULpkREyfxhjQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>
>
> [snip]
> >      Actually, come to think of it, maybe it's better to never create
> the machine-id
> >     at all. What is the effect (with a readonly rootfs) if machine-id
> doesn't exist?
> >     Does it block booting, does the boot take a little longer, or do we
> boot with a
> >     different machine-id all the time? And in the latter case, is there
> a real
> >     problem with that?
> >
> >
> > on a RO filesystem
> > * if /etc/machine-id exists and contains a machine-id, systemd will use
> it
> > * if it's an empty file, systemd will bind-mount a file with a
> machine-id over
> > the file
>
>  Where I suppose the machine-id is regenerated on every boot.
>
> yes, which is fine, that's the intended behaviour


> > * if the file does not exist, systemd can't bind mount over the file...
> systemd
> > itself should be fine, but other services might not, it's hard to tell
>
>  That's not good...
>
I just tested, and systemd logs an error message that it can't boot in that
case.

more precisely, when systemd starts
* either /etc is readwrite
* or it should have a /etc/machine-id
so we need the file, since our rootfs is read-only when systemd starts
* it's just an error message, everything turns out fine once we remount rw
and we save the machine-id only
* sounds like a bug from upstream... read-only rootfs and read-only rootfs
that become RW are supposed to be supported


>
> >
> > So the recommended way for a read-only rootfs is to have that empty
> file, which
> > is why this is what currently have.
> > it works both for RW and RO filesystems..
>
>  Another option would be to make it a symlink to a file in tmpfs, but that
> doesn't help because the net effect is the same: machine-id is regenerated
> on
> every boot :-(
>
>
regenerated every boot is fine, i'm just not sure in what way a symlink to
a tmpfs would be different/better than what systemd currently does

symlink to a r/w partition makes sense, but that would not work for
ConditionFirstBoot


>
> > A longer-term solution would be to add a patch upstream to allow to
> specify in a
> > systemd configuration file what is
> > the file to check for first boot instead of /etc/machine-id.
>
>  No, that makes very little sense. If a system has any kind of
> persistency, then
> machine-id should definitely be one of the things that is persisted, so
> it's a
> perfect flag for firstboot.
>
> no because it makes sense to have it be a symlink to a RW file... in which
case it exists even in first boot..



>  Upstream's vision is that /etc should be persistent and empty on factory
> reset
> [1]. But we're far away from having an empty /etc in Buildroot...
>
> yeah, but I think the assumption empty /etc == first boot is wrong...
in the real world, the assumption is no /etc/machine-id == first boot makes
more sense, but it doesn't work for us.
No... upstream patch is really the way to go (and i'm already working on it
:P )

>
>
> > I can look into that, but for the short term, i'd rather break
> > ConditionFirstBoot than read-only rootfs
> >
> > so... not sure what to advise at that point. that choice is something a
> bit too
> > specialized for a config option
> > especially if we plan to drop it in the future
> >
> > so not sure where to go...
>
>  As is often the case: it looks to me that the status quo is the best we
> can do :-)
>

it could be slightly improved by removing /etc/machine-id when
systemd-firstboot is selected, but I agree...
Until we can change and configure how to detect first-boot, we are kinda
stuck...


>
>  Regards,
>  Arnout
>
> [1] http://0pointer.net/blog/projects/stateless.html
>
> [snip]
>


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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20191117/07e9350f/attachment.html>
