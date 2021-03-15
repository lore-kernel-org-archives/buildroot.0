From: Ryan Barnett <ryan.barnett@collins.com>
Date: Mon, 15 Mar 2021 11:13:17 -0500
Subject: [Buildroot] [PATCH 6/8] package/opkg-utils: add missing
 dependencies for host build
In-Reply-To: <20210312225204.GJ2737665@scaer>
References: <20210312200534.923-1-ryan.barnett@rockwellcollins.com>
 <20210312200534.923-7-ryan.barnett@rockwellcollins.com>
 <20210312225204.GJ2737665@scaer>
Message-ID: <CAMQcK5JZivpJjBCLxZ4pGamhM+kWZw7He8qcMm6j90au3em-+Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,


On Fri, Mar 12, 2021 at 4:52 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Ryan, All,
>
> On 2021-03-12 14:05 -0600, Ryan Barnett spake thusly:
> > opkg-utils is a collection of bash and python scripts which require
> > additional commands/tools be available for the bash scripts. The full
> > list of dependencies that the opkg-util scripts require is:
> >
> >   bash
> >   binutils
> >   bzip2
> >   coreutils
> >   diffutils
> >   findutils
> >   grep
> >   gzip
> >   lz4
> >   python3
> >   sed
> >   tar
> >   xz
> >
> > Since buildroot requires that bash, binutils, bzip2, gzip, sed and tar
> > be installed on the host system, only add dependencies on the
> > remaining host tools.
> >
> > Signed-off-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>
> > ---
> >  package/opkg-utils/opkg-utils.mk | 9 ++++++++-
> >  1 file changed, 8 insertions(+), 1 deletion(-)
> >
> > diff --git a/package/opkg-utils/opkg-utils.mk b/package/opkg-utils/opkg-utils.mk
> > index a250b4ef9f..d7f68b8555 100644
> > --- a/package/opkg-utils/opkg-utils.mk
> > +++ b/package/opkg-utils/opkg-utils.mk
> > @@ -10,7 +10,14 @@ OPKG_UTILS_SITE_METHOD = git
> >  OPKG_UTILS_LICENSE = GPL-2.0+
> >  OPKG_UTILS_LICENSE_FILES = COPYING
> >
> > -HOST_OPKG_UTILS_DEPENDENCIES += $(BR2_PYTHON3_HOST_DEPENDENCY)
> > +HOST_OPKG_UTILS_DEPENDENCIES += \
> > +     host-coreutils \
> > +     host-diffutils \
> > +     host-findutils \
> > +     host-grep \
>
> We already implicitely require grep: we're calling it so many times in
> the existing code. I am of the opinion that grep is a required package.
>
> That it is inot in the manual, is probably because it is so wildely
> installed by default in all distributions that we never had an issue
> with it missing so far, so it was not added to the list of required
> packages.
>
> Yes, that's basically how that list came to be: someone reported an
> issue about a tool missing, and it got added to the list (or we
> instroduced a host version).
>
> In the case of grep, I would say we should just require it on the host.
>
> find is also on the same page: it is a required package.
>
> As for coreutils, I would tend to be on the same page: it is a required
> package.

Thanks for the feedback and applying the series!

I've been looking at getting buildroot to work on a minimal Alpine
Docker container and I've found that these packages are required. I
will look to submit a patch which includes that so we can capture
this.

Thanks,
-Ryan

> However, we do have a host-coreutils package, but we only use when a
> package needs either or both of 'ln --relative' or 'realpath'. See:
> support/dependencies/check-host-coreutils.sh
>
> If that is the case for opkg-utils, then it should add
> $(BR2_COREUTILS_HOST_DEPENDENCY) to its _DEPENDENCIES. See:
>     package/libselinux/libselinux.mk
>     package/libsepol/libsepol.mk
>     package/systemd/systemd.mk
>
> Regards,
> Yann E. MORIN.
>
> > +     host-lz4 \
> > +     $(BR2_PYTHON3_HOST_DEPENDENCY) \
> > +     host-xz
> >
> >  define HOST_OPKG_UTILS_INSTALL_CMDS
> >       $(MAKE) -C $(@D) PREFIX=$(HOST_DIR) install-utils
> > --
> > 2.17.1
