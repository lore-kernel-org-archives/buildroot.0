From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 28 Jan 2014 09:38:27 +0100
Subject: [Buildroot] [PATCH 1/1] skeleton: add systemd network.service
 unit
In-Reply-To: <CAGduivw+HOQRDN18=xrM_AwqT3YtoM7BwmcaNRDb0VFVaQM9eQ@mail.gmail.com>
References: <1388713112-4686-1-git-send-email-vsergeev@kumunetworks.com>
 <20140103201333.7f4edd47@skate>
 <CAPyrzo0q7Y3Tf1LOaCe4LK78a7sZrVdToLfnzp4Tc4kow=-nKA@mail.gmail.com>
 <52E7589F.7060301@mind.be>
 <CAGduivw+HOQRDN18=xrM_AwqT3YtoM7BwmcaNRDb0VFVaQM9eQ@mail.gmail.com>
Message-ID: <52E76C83.1020104@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 28/01/14 09:25, Maxime Hadjinlian wrote:
> Hi all
>
> On Tue, Jan 28, 2014 at 8:13 AM, Arnout Vandecappelle <arnout@mind.be> 
> wrote:
> > On 03/01/14 20:41, Ivan Sergeev wrote:
> >>
> >> Currently, it seems that the /etc/init.d scripts are copied over blindly
> >> from the target skeleton to the target even if systemd (and not busybox)
> >> is the chosen init system. Moving forward, having both busybox and
> >> systemd init files in the skeleton, like this patch would have, will
> >> always clutter /etc/ with some unused init files in the target system,
> >> since only one init system will be active.
> >>
> >> Should such init files be conditional targets in system/system.mk
> >> ?  Or should S40network be owned and copied over by
> >> package/busybox, and network.service be owned and copied over by
> >> package/systemd, instead of having them included statically in the 
> target
> >> skeleton?
> >
> >
> >   I completely agree that the way it is done now is far from ideal.
> >
> >   I think the best way to work with this would be to:
> >
> > - remove the contents of the init.d directory from the skeleton;
> >
> > - create a new skeleton fragment system/skeleton-init-sysv that contains
> > etc/init.d;
> >
> > - create a new skeleton fragment system/skeleton-init-systemd that 
> contains
> > whatever support files are needed by systemd (currently nothing, but your
> > patch would add the networking unit file);
> >
> > - copy the correct skeleton fragment as part of the .root target, but 
> only
> > if the default skeleton was selected - with a custom skeleton, it's up to
> > the user to provide the right systemd/init.d;
> I  agree with you and as a matter of fact, I had already started
> working on a patch that implement exactly this.
>
> I would even like to go even further, as I have noticed that a lot of
> the defined LIBFOO_INSTALL_INIT_SYSTEMD and LIBFOO_INSTALL_INIT_SYSV
> almost always do the exact same stuff.
> I would like for the infrastructure to take care of this, if no
> function is defined, and a .service or S\d{0,2}*, then we should take
> it and install it.

  Sounds like a great idea!

>
> In that case, any particular requirements, the package define a
> function, other than that, it's taken care of and we avoid duplicate
> code in all the packages.

  Probably the whole INSTALL_INIT_* stuff can even be removed - the 
number of packages that require special-casing is currently zero and may 
not ever be larger than zero. And if they do, it's not that difficult to 
make conditional post-install hooks.

  If you make a patch, don't forget to update the documentation!


  Regards,
  Arnout


>
> >
> >
> >
> >   Regards,
> >   Arnout
> >
> > --
> > Arnout Vandecappelle                          arnout at mind be
> > Senior Embedded Software Architect            +32-16-286500
> > Essensium/Mind                                http://www.mind.be
> > G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> > LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> > GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot


-- 
Arnout Vandecappelle arnout at mind be
Senior Embedded Software Architect +32-16-286500
Essensium/Mind http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint: 7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
