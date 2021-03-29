From: Aleksander Morgado <aleksander@aleksander.es>
Date: Tue, 30 Mar 2021 00:13:07 +0200
Subject: [Buildroot] [PATCH 2/2] package/libqmi: needs headers >= 4.14
In-Reply-To: <CAPi7W81whpXvH0unTvU=HE5nb11-UeLbX5QK6WAPoOTrMroXcA@mail.gmail.com>
References: <20210329211957.321612-1-fontaine.fabrice@gmail.com>
 <20210329211957.321612-2-fontaine.fabrice@gmail.com>
 <CAAP7uc+4zEWFj-unho79p7mm6puX_XR-xiXPjcLqpfbScuwUYA@mail.gmail.com>
 <CAPi7W81whpXvH0unTvU=HE5nb11-UeLbX5QK6WAPoOTrMroXcA@mail.gmail.com>
Message-ID: <CAAP7ucKogo=ZMH4fz3CwcgoOEwdGuxx4VPBs7OMvv4wkNHRvuQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey Fabrice

> > On Mon, Mar 29, 2021 at 11:23 PM Fabrice Fontaine
> > <fontaine.fabrice@gmail.com> wrote:
> > >
> > > libqmi unconditionnally uses ARPHRD_RAWIP since version 1.28.0 and
> > > https://github.com/freedesktop/libqmi/commit/4085a2d6b771a40fb637433ed6a05b9d5d4d94b9
> > > https://github.com/freedesktop/libqmi/commit/19f4b39ee85500e7e868b8a100fba19c04fb3c30
> > >
> > > However, ARPHRD_RAWIP is only available since kernel 4.14 and
> > > https://github.com/torvalds/linux/commit/cdf4969c42a6c1a376dd03a9e846cf638d3cd4b1
> > >
> > > Fixes:
> > >  - http://autobuild.buildroot.org/results/c8853b7161bd85d46c1282c6c097e7ef4042ae68
> > >
> >
> > This is totally not intentional; the ARPHRD_RAWIP symbol is used in
> > the rmnet backend, and the rmnet backend itself should only be used if
> > the kernel has rmnet support, which we look for at configure time with
> > the following check:
> >
> > AC_EGREP_HEADER([ifla_rmnet_flags],
> >                 [linux/if_link.h],
> >                 [enable_rmnet_support=yes],
> >                 [enable_rmnet_support=no])
> >
> > We should probably improve that check to also include a lookup for the
> > ARPHRD_RAWIP symbol.
> > What do you think?
> Thanks for your feedback, I wasn't sure if it was intentional or not
> by reading the two commit messages.
> I'll set this patch as rejected on patchwork.
> Feel free to send another patch as avoiding this dependency on kernel
> 4.14 would be great indeed.

Oh, I don't think the issue is related to needing 4.14 or newer. The
build you posted as failing was using (if I'm reading it correctly in
the config file) kernel 5.11 headers. The ARPHRD_RAWIP symbol was
indeed introduced in 4.14, but the ifla_rmnet_flags (what we check for
during configure) were introduced much later in 4.17.

The problem is, I believe, that we're including libc's if_arp.h, and
that one may not have that symbol defined yet, and so it failed the
build. I'll fix that in upstream and provide a patch here.

-- 
Aleksander
https://aleksander.es
