From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Tue, 03 Nov 2009 15:01:25 +0100
Subject: [Buildroot] [RFC] Package infrastructure: make variables or
 make targets ?
In-Reply-To: <20091103091445.07b50723@surf>
References: <20091025224056.59c9a6ef@surf> <20091027090628.0aa7b0df@surf>
	<1257110818.2515.67.camel@coalu.atr>  <20091103091445.07b50723@surf>
Message-ID: <1257256885.2515.129.camel@coalu.atr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Woaa, this mail took more than a day to be delivered...

Le mardi 03 novembre 2009 ? 09:14 +0100, Thomas Petazzoni a ?crit :
> Hello,
> 
> Thanks Lionel for your feedback.
> 
> Le Sun, 01 Nov 2009 22:26:58 +0100,
> Lionel Landwerlin <llandwerlin@gmail.com> a ?crit :
> 
> > First thanks for your work. I like it much, it makes package's
> > makefiles a lot more clean.
> 
> Thanks :)
> 
> > I have little question about the autotool stuff. I seen that the
> > patching and the autoreconf steps has been merged together. Is it
> > because you did not finish yet or do you plan keep it like that ?
> 
> I was planning to keep it like that, but if it's not satisfying, we can
> probably find ways to improve it.
> 
> The generic package infrastructure, in package/Makefile.package.in [1]
> is not supposed to know anything about autotools. Therefore, it
> implements a set of generic steps :
> 
>  * Download
>  * Extract
>  * Patch
>  * Configure
>  * Build
>  * Host installation
>  * Target installation
>  * Staging installation
>  * Clean
>  * Uninstall
> 
> ? autoreconf ? is *not* one of these steps because it is autotools
> specific.
> 
> Then, the package/Makefile.autotools.in [2] ? inherits ? from this
> package infrastructure by :
> 
>  * Providing a definition for the Configure, Build, Host installation,
>    Target installation, Staging installation, Clean and Uninstall
>    steps ;
> 
>  * Add hooks for autoreconf and libtool patching. The autoreconf hook
>    is attached to the $(PKG)_POST_PATCH_HOOKS hook point, and is
>    therefore included into the generic ? Patch ? step in terms of stamp
>    files and dependencies
> 
> Considering this more or less clean separation between generic
> infrastructure and autotools infrastructure, I'd like (if possible) to
> keep autotools-specific things outside the generic infrastructure.
> 
> > I'm asking that because I'm using buildroot more as a development tool
> > than a rootfs generation tool. I try to work upstream with packages
> > I'm hacking on. A few days ago I sent a patch to allow to retrigger
> > some part of the build process on a particular package
> > (http://lists.busybox.net/pipermail/buildroot/2009-October/030104.html).
> > It currently only work with "autotooled" packages, but with you
> > ongoing work it will be easier to provide that feature on all
> > packages.
> > 
> > So to me, it is important to separate the patching from the
> > autoreconfiguring part, because when adding new source files to an
> > autotooled package there is a need to regenerate the Makefile.in files
> > without repatching.
> 
> Would attaching the autoreconf hook to a
> (not-yet-existing-but-easily-created) $(PKG)_PRE_CONFIGURE_HOOKS hook
> point solve the problem ?
> 

The fact you had removed the stamp file for the autoreconf step annoyed
me at first, but in the end I can add a rule that does not prerequise
the stamp files to retrigger the autogen stuff.

Create a PRE_CONFIGURE hook could be better but that's just
trolling... :)

Thanks for the explanation/rebased patches.

-- 
Lionel Landwerlin <llandwerlin@gmail.com>
