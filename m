From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Mar 2014 13:40:22 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <5316F824.5000805@mind.be>
References: <20140302073008.028A91015DC@stock.ovh.net>
 <20140302095754.13319d04@skate> <53165F4D.5060405@mind.be>
 <20140305100431.62d2715c@skate> <5316F824.5000805@mind.be>
Message-ID: <20140305134022.497b1b90@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Wed, 05 Mar 2014 11:10:44 +0100, Arnout Vandecappelle wrote:

> > Indeed, DT_RUNPATH would fix the problem, but to me it feels more like
> > a workaround than a real fix, no? Wouldn't the real fix be to ensure
> > that the installation is atomic, i.e either the library is present in
> > $(HOST_DIR)/usr/lib, or it is not? The problem here apparently occurs
> > when Python is executed when the library file already exists in
> > $(HOST_DIR)/usr/lib, but its copy hasn't finished yet.
> 
>  In this case, that happens to be the problem. But in general, it is
> possible that there is already an old version of the library in
> $(HOST_DIR)/usr/lib, and then that one will be used instead of the newly
> built one. Nothing catastrophic, but still wrong.

Right.

>  The thing is, RPATH was just a mistake to begin with: you _always_ want
> LD_LIBRARY_PATH to take precedence over RPATH, otherwise LD_LIBRARY_PATH
> doesn't make much sense. That's why I think that adding
> --enable-new-dtags unconditionally for all builds would be a great idea.

True. So we should add --enable-new-dtags to HOST_LDFLAGS ?
Unfortunately, I'm pretty sure there are many packages that don't honor
HOST_LDFLAGS.

>  I just noticed now that the idea of an ld wrapper that adds that option
> would not work in this case anyway, because this is the host ld... Note
> that some distros (I think Gentoo and SUSE at least) patch binutils to
> make the --enable-new-dtags the default, so there you wouldn't even see
> this issue.

Ok, yes, indeed we don't have a wrapper for host ld, and it is
specifically for host binaries that we need to set a RUNPATH.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
