From: Matt Fornero <Matt.Fornero@mathworks.com>
Date: Wed, 30 Mar 2016 21:50:42 +0000
Subject: [Buildroot] [PATCH v2] toolchain-external: Commonize
 /lib/<tuple> symlinks
In-Reply-To: <56FC3977.3030708@mind.be>
References: <1459186584-4229-1-git-send-email-matt.fornero@mathworks.com>
 <56FC3977.3030708@mind.be>
Message-ID: <472f6e1646ad406b8bb62cc2964812c4@ex13amer-00-ah.ad.mathworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: Arnout Vandecappelle [mailto:arnout at mind.be]
> Sent: Wednesday, March 30, 2016 1:39 PM
> 
>   Hi Matthew,
> 
>   It's a bit nitpicking, but I have one more change to request...
> 
> >
> > +config BR2_TOOLCHAIN_EXTERNAL_NEEDS_PREFIX_SYMLINK
> > +	bool
> > +	default y if BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM
> > +	default y if BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64
> > +	default y if BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB
> > +	default y if BR2_TOOLCHAIN_EXTERNAL_PREFIX_SYMLINK
> 
>   The logic should be reverted here: it's the individual toolchains that
> "know"
> that they need a symlink, it shouldn't be the NEEDS_PREFIX_SYMLINK
> that "knows"
> which toolchains need it. IOW, remove all the 'default y' here, and add
> "select BR2_TOOLCHAIN_EXTERNAL_NEEDS_PREFIX_SYMLINK" to each
> of the toolchains.

So update the Linaro toolchains to select this option-- makes sense. I
think I did it this way originally to make merge conflicts with upstream
less likely, but that no longer matters if this patch gets commited.
 
> 
> > +
> >   config BR2_TOOLCHAIN_EXTERNAL_GLIBC
> >   	bool
> >   	select BR2_TOOLCHAIN_USES_GLIBC
> > @@ -1055,6 +1062,13 @@ config
> BR2_TOOLCHAIN_EXTRA_EXTERNAL_LIBS
> >   	  here, separated by spaces. They will be copied to the
> >   	  target's /lib directory.
> >
> > +config BR2_TOOLCHAIN_EXTERNAL_PREFIX_SYMLINK
> > +	bool "Symlink /lib/<tuple>"
> 
>   So
> 	select BR2_TOOLCHAIN_EXTERNAL_NEEDS_PREFIX_SYMLINK
> here.
> 

Sounds good, I'll submit v3 later today.

-Matt
