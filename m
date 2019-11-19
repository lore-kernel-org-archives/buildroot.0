From: =?UTF-8?B?SsOpcsOpbXkgUk9TRU4=?= <jeremy.rosen@smile.fr>
Date: Tue, 19 Nov 2019 11:15:44 +0100
Subject: [Buildroot] [PATCH 1/2] package/systemd: set machine id file
 instalation as optional choice
In-Reply-To: <20191119094006.065afe96@windsurf.home>
References: <20191117113345.159653-1-b.bilas@grinn-global.com>
 <0b8bd9be-3109-f998-5a44-cca063d1e207@mind.be>
 <CAFvCimUuDJUWzKPA-rX0rqcFNGgNARvD5gdLYqDjR+XVdbgUVA@mail.gmail.com>
 <6987e42b-89ad-cbf3-fd03-ee3ad74880b7@mind.be>
 <20191119094006.065afe96@windsurf.home>
Message-ID: <CAFvCimWo84uxBqohUeG9zA_nD21AfCUp6nme_a8aBQ8sRShACg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As a side-note, I am working with upstream to have a better support of (3)
: https://github.com/systemd/systemd/pull/14059

I am a bit cautious about the new config option because it seems too
"advanced" for a config option (for me, it's something that should be set
in a post-image or overlay) but that's open to discussion.

Please wait a little before applying this patch, if that's the way
buildroot wants to go, so my pull-request above is solved and we might
backport it to ease our transition.

Cheers
J?r?my

Le mar. 19 nov. 2019 ? 09:40, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
a ?crit :

> Hello,
>
> On Sun, 17 Nov 2019 17:00:05 +0100
> Arnout Vandecappelle <arnout@mind.be> wrote:
>
> > > Could something like that be enough ? can we trust "remount RW" ?
> > > maybe "remount RW" should be renamed "create a RW filesystem" and
> enable various
> > > tweaks related to RO vs RW
> >
> >  As written above: no.
> >
> >  The problem is: we're not a distro.
>
> Agreed.
>
> > We leave too much freedom for the user to
> > integrate things in various ways to be able to make assumptions about
> what is
> > the right way to do things. So, the only thing we can do is to give a
> decent
> > out-of-the-box experience, and let the user figure out how to tweak
> things -
> > possibly adding a config option for a common situation that is easily
> handled in
> > a generic way. The other thing we can do is to provide documentation
> about the
> > proper way to integrate things in different scenarios.
> >
> >  I'm starting to agree that this option is maybe not that great.
>
> But I would in fact not come to the same conclusion. Having this empty
> machine-id file is useless and causes problems when the filesystem is
> R/W. So for the sake of supporting the R/O case (for which we create
> this empty machine-id file), we make the R/W experience less good.
>
> So I'd say that the right approach is to not do too much integration by
> precisely having the option proposed by Bartosz, with many the tweak
> that it should default y if rootfs is really, and default disable
> otherwise, but while still being an option that the user can tweak,
> because as you rightfully explained, the RW/RO remount option is just a
> clue, not a definitive answer on whether /etc is writable or not.
>
> To me, having this option matches the Buildroot way: we are not a
> distro, we don't enforce how the system should work, so we provide the
> appropriate options, while making sure the option has the most sensible
> default values.
>
> Generally speaking, Buildroot kind of supports "out of the box" two use
> cases:
>
>  (1) The root filesystem is completely read-write.
>
>  (2) The root filesystem is completely read-only, and all files that need
>      to be written are stored in tmpfs, and therefore are volatile.
>
> I.e, we do not have any explicit support for what is I guess a much
> more common use case than (2):
>
>  (3) The root filesystem is completely read-only, but there is another
>      read-write partition somewhere that stores the information that can
>      change but needs to be persistent (user configuration, etc.)
>
> Since we don't have explicit support for (3), there is no way we can
> properly support machine-id and ConditionFirstBoot in the case of (2),
> because there's nowhere we can store /etc/machine-id.
>
> So the best we can do is in the case of (2), default to creating an
> empty /etc/machine-id, while giving the possibility for the user
> implementing (3) in its own way, to disable the creation of the empty
> /etc/machine-id.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20191119/4d5e4cd1/attachment.html>
