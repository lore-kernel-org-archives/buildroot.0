From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 27 May 2016 21:49:22 +0200
Subject: [Buildroot] [PATCH v4 2/3] docker-containerd: new package
In-Reply-To: <CA+h8R2pT_U2JUKbW-y+y5mHrCGM08=Qq7mA2SgU9Kpk-zTLJcA@mail.gmail.com>
References: <1464324777-5364-1-git-send-email-christian@paral.in>
 <1464324777-5364-3-git-send-email-christian@paral.in>
 <20160527072720.4f3f9b21@free-electrons.com>
 <CA+h8R2pT_U2JUKbW-y+y5mHrCGM08=Qq7mA2SgU9Kpk-zTLJcA@mail.gmail.com>
Message-ID: <20160527214922.581fa744@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 27 May 2016 00:02:55 -0700, Christian Stewart wrote:

> > +     depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
> >  
> 
> > BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS dependency.
> >  
> 
> Not sure what you're saying here

I explained it in the review of another patch from you.

When you have:

comment "<foo> needs a toolchain w/ threads"
	depends on !BR2_TOOLCHAIN_HAS_THREADS

you *must* also add:

	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS

so that the comment doesn't show up on architectures for which there is
no Go support.

Otherwise, imagine a user creating a configuration for say the Blackfin
architecture (which doesn't have Go support), and initially with thread
disabled. They see the comment "<foo> needs a toolchain w/ threads". So
the user goes in the Toolchain menu, and enables thread. And then, the
comment has disappeared, but the option to enable the package has not
appeared.

Hence, we want to show the comment only when
BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS=y.

> In terms of all the versioning stuff. I'll try using the _VERSION variables
> for this. As the variable specifically references a GitCommit, I included
> the commits as it wants. But it's probably not too bad of a compromise to
> use the version ID as the commit hash.

If it works, it's much better.

> For the host variable, a patch series recently applied changed what that
> variable contained, and in particular, the changes to CGO caused the build
> to completely fail unless I included the variables from there, so I now
> include it and simply add a few things on top of it to build the full build
> env for the package.
> 
> Will revise on all of the series and respin late tomorrow, in case anyone
> else has suggestions :)

ACK, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
