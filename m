From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Tue, 21 Oct 2014 20:45:48 +0200
Subject: [Buildroot] systemd: write-up and packaging questions
In-Reply-To: <5446A8C9.7070407@mind.be>
References: <543AC16C.7000100@mailerd.de>
 <CAGduivzUiy3C6rykCd33GE5iAQh+YVJ5LueGp5c5MKTfDeM1-w@mail.gmail.com>
 <A2A6A18A7161D44FBCA90D5B3AF90A2E5A4987DD@AMEHLEX02.ehl.pri>
 <CAGduivzknkxu+cFrV61eJdFuTF1Tvrb0RZaCZh5cFE1iNuO+Hg@mail.gmail.com>
 <5446A8C9.7070407@mind.be>
Message-ID: <CAGduivz004S9QgoUpZqe=1L44VQOV_i0HL0cx=279p0a_dbvfg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Oct 21, 2014 8:41 PM, "Arnout Vandecappelle" <arnout@mind.be> wrote:
>
> On 17/10/14 12:07, Maxime Hadjinlian wrote:
> > Hello Hiram, all
> >
> > On Fri, Oct 17, 2014 at 10:21 AM, Paassen, Hiram van
> > <Hiram.van.Paassen@mastervolt.com> wrote:
> >> On zo, 2014-10-12 at 21:12 +0200, Maxime Hadjinlian wrote:
> >>>   Hi Andr?, All
> >>>
> >>> On Sun, Oct 12, 2014 at 7:59 PM, Andr? Erdmann <dywi@mailerd.de>
wrote:
> [snip]
> >>>> Installation
> >>>> ------------
> >>>>
> >>>> systemd's libdir is /lib/system.
> >>>> Most unit files (.service et al) are installed to
/etc/systemd/system,
> >>>> systemd's own unit files are installed to /lib/systemd/system and
some
> >>>> packages(*) install their files to /usr/lib/systemd/system, which is
rather
> >>>> confusing. Either dir works (search order is /etc > /lib > /usr/lib),
> >>>> but what's the recommended location?
> >>> If I'm reading the FHS correctly, /usr/lib/systemd/ would the the
> >>> targets and what nots for systemd itself, and so everything in /etc is
> >>> hosts specific so I would keep everything installed by our packages in
> >>> /etc/systemd/system.
> >> I think this depends on your viewpoint:
> >> /usr/lib is for "distros" since you might say that buildroot is
> >> generating a custom distro I would say that one might want to
> >> use /usr/lib
> >>
> >> This keeps /etc/ for making persistent changes based on individual
> >> systems and /run/ for making non persistent changes
> >>
> >> systemd itself mostly uses /lib
> >>
> >> Also:
> >> See my other mail about systemctl for an hour ago (was unaware of this
> >> discussion) The script I'm referring to, taken from open-embedded
> >> uses /etc to install symlinks to.
> >> So open-embedded seems to have chosen /etc for enable-symlinks
> >> independent of where the original unit files are installed (as per
> >> systemctl behavior I suppose)
> > It usually what is done, yes. You get the symlinks in /etc and you
> > install your unit files and targets, where you feel they should be.
> > Debian has the symlinks in /etc and the files in /lib/systemd/system/
> > I would say that we should follow what the major distribution are
> > doing. I assume they already had discussion on how to organize theses
> > files.
>
>  FYI, what I learned at ELC-E is that systemd is moving towards being
able to
> boot with a completely empty /etc. This will allow /etc to be a tmpfs in
itself,
> or if some configuration needs to be persistent it can be a writable fs
and you
> can do a factory reset by wiping it. There is some support in the latest
systemd
> to copy in a skeleton /etc when /etc is empty.
>
>  So with this in mind, a systemd setup would put as little as possible in
/etc.
>
In the v2 of my series to include the install of the services to
pkg-generic.mk I changed the install path to /lib/systems/system/

That would already be a step in, if not the right, at least a direction.
>
>  Regards,
>  Arnout
>
>
> [snip]
>
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141021/0bf21ff3/attachment.html>
