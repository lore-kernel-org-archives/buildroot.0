From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Jul 2017 12:15:59 +0200
Subject: [Buildroot] [PATCH 15/20] package/skeleton: introduce sysv- and
 systemd-specific skeletons
In-Reply-To: <0f62a3f9-76f0-75ed-762b-d5fbae224fad@mind.be>
References: <cover.1500398733.git.yann.morin.1998@free.fr>
 <4cba79eb00daaaea1bd8bdb5a49a2aefd39b390d.1500398733.git.yann.morin.1998@free.fr>
 <0f62a3f9-76f0-75ed-762b-d5fbae224fad@mind.be>
Message-ID: <20170723101559.GD26998@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2017-07-23 01:49 +0200, Arnout Vandecappelle spake thusly:
> On 18-07-17 19:25, Yann E. MORIN wrote:
> > Currently, we use the same skeleton for sysv-like init systems and
> > systemd, even though systemd has some peculiarities that makes out
>                                                                  our
> > default skeleton unfit.
> > 
> > So, we'll need to provide different skeletons (really, only part of it)
> > for sysv-like and systemd.
> > 
> > Introduce two new skeleton packages, aptly named skeleton-sysv and
> > skeleton-systemd, one for each, that are both providers of the skeleton
> > package, in lieue of the skeleton-common, which is now a simple
> > dependency of both the two new skeletons.
> > 
> > Those packages are empty for now. In followup changes:
> >   - sysv-specific stuff will be moved out of skeleton-common and into
> >     skeleton-sysv;
> >   - systemd-specific stuff will be added to skeleton-systemd.
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> 
>  But...
> 
> [snip]
> > +config BR2_PACKAGE_SKELETON_SYSTEMD
> > +	bool
> > +	select BR2_PACKAGE_HAS_SKELETON
> > +	select BR2_PACKAGE_SKELETON_COMMON
> > +
> > +config BR2_PACKAGE_PROVIDES_SKELETON
> > +	default "skeleton-systemd" if BR2_PACKAGE_SKELETON_SYSTEMD
> 
>  Again, we usually do it with if...config...endif. Same for sysv, obviously.
> 
> [snip]
> > @@ -12,7 +12,9 @@ choice
> >  config BR2_ROOTFS_SKELETON_DEFAULT
> >  	bool "default target skeleton"
> >  	depends on !BR2_INIT_NONE
> > -	select BR2_PACKAGE_SKELETON_COMMON
> > +	select BR2_PACKAGE_SKELETON_SYSV if BR2_INIT_SYSV
> > +	select BR2_PACKAGE_SKELETON_SYSV if BR2_INIT_BUSYBOX
> > +	select BR2_PACKAGE_SKELETON_SYSTEMD if BR2_INIT_SYSTEMD
> 
>  This works, but I'm thinking of an alternative, let's see if it flies:
> 
>  Instead of choosing the different skeletons here, we could do it in the select
> of BR2_INIT_*. Indeed, you have a skeleton for each init option. Of course, all
> the selects there would have to look like
> 
> 	select BR2_PACKAGE_SKELETON_SYSV if BR2_ROOTFS_SKELETON_DEFAULT
> 
> 
>  I'm not entirely sure if it's an improvement, but I have the feeling it's
> easier to follow if the different skeleton options are put together with the
> different init options.

I also tried that, but I found it uglier, because it is split away in
various options, while here it is fully concentrated in a single one, so
it is (arguably) easier to maintain...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
