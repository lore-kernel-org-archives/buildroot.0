From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Jul 2017 12:37:13 +0200
Subject: [Buildroot] [PATCH 17/20] sytem: no-init systems may use our
 default, common skeleton
In-Reply-To: <e2c4710c-9f86-7b37-2628-3242c0bf5d63@mind.be>
References: <cover.1500398733.git.yann.morin.1998@free.fr>
 <1df0016f5de4edda2fc57e3c5a2cc26e2838d239.1500398733.git.yann.morin.1998@free.fr>
 <e2c4710c-9f86-7b37-2628-3242c0bf5d63@mind.be>
Message-ID: <20170723103713.GG26998@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2017-07-23 02:18 +0200, Arnout Vandecappelle spake thusly:
> On 18-07-17 19:25, Yann E. MORIN wrote:
> > Requiring that no-init system indeed provide their own custom skeletons
>                          systems
> 
> > is a bit too-high a burden, especially for quick one-off tests when
> > testing our packages.
> > 
> > Allow no-init systems to use our default skeleton, but only use the
> > common part, for the specific sysv or systemd ones are unfit.
> 
>  For people who use BR2_INIT_NONE to create a chroot-able rootfs, this entails
> an important change: the /var stuff (e.g. /var/run symlink) is no longer there.
> This could have implications for some use cases. So I think a comment about this
> should be added to the release notes.
> 
> > 
> > Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > ---
> >  package/skeleton-common/Config.in | 29 +++++++++++++++++++++++++++++
> >  system/Config.in                  |  5 +----
> >  2 files changed, 30 insertions(+), 4 deletions(-)
> > 
> > diff --git a/package/skeleton-common/Config.in b/package/skeleton-common/Config.in
> > index 9abed4292a..ba0abe9d35 100644
> > --- a/package/skeleton-common/Config.in
> > +++ b/package/skeleton-common/Config.in
> > @@ -1,2 +1,31 @@
> > +# Normally, skeleton-common is a dependency of either the sysv or
> > +# the systemd ones, so it should not declare itself as a provider
> > +# for the skeleton virtual package.
> > +#
> > +# However, when one uses a no-init system (BR2_INIT_NONE), neither
> > +# the sysv not the systemd skeleton are enabled, so skeleton-common
> > +# is the one and only skeleton available, so it must declare itself
> > +# as a provider.
> > +#
> > +# We can safely select _HAS_SKELETON, because either we are the only
> > +# provider (in which case we must select it) or we were selected by
> > +# another skeleton which would have selected it by itself (in which
> > +# case us selecting _HAS_SKELETON is harmless).
> > +#
> >  config BR2_PACKAGE_SKELETON_COMMON
> >  	bool
> > +	select BR2_PACKAGE_HAS_SKELETON
> 
>  Instead of putting it here...
> 
> > +
> > +if BR2_PACKAGE_SKELETON_COMMON
> > +
> > +config BR2_PACKAGE_SKELETON_COMMON_ONLY
> > +	bool
> > +	default y
> > +	depends on !BR2_PACKAGE_SKELETON_SYSV
> > +	depends on !BR2_PACKAGE_SKELETON_SYSTEMD
> > +	depends on !BR2_PACKAGE_SKELETON_CUSTOM
> 
>  ... put it here. Then you don't need the comment above, there will always be
> just one symbol that selects skeleton.

But, but. but... My nice comment... It took me so much time to write
that big, nice, explication... I would be sad to let it go...

Yes, you're right, it would be much cleaner and more obvious.

>  But as I wrote in an earlier reply, we don't even need to select
> BR2_PACKAGE_HAS_SKELETON, so the point is moot.

And I stand by my previous reply, that we should not try to be smart.
Well, we can try to be smart, but not _too_ smart, becasue it _will_
cause grievance later on. ;-]

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
