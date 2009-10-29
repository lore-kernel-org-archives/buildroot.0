From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 29 Oct 2009 16:39:16 +0100
Subject: [Buildroot] [RFC] Package infrastructure: make variables or
 make targets ?
In-Reply-To: <20091027090628.0aa7b0df@surf>
References: <20091025224056.59c9a6ef@surf>
	<20091027090628.0aa7b0df@surf>
Message-ID: <20091029163916.49c81f50@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Tue, 27 Oct 2009 09:06:28 +0100,
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> a ?crit :

> > I've already started prototyping a solution, but I'm facing a choice
> > on which I'd like to have the community opinion. Usually, I don't
> > like talking without showing patches, but as this choice is fairly
> > intrusive in the design of the new infrastructure, I don't want to
> > start the wrong way.
> 
> I've pushed a set of commits to
> http://git.buildroot.net/~tpetazzoni/git/buildroot/log/?h=package-infrastructure
> which shows the current status of my work. Warning: it is currently in
> an ugly state: documentation not updated, the generic package
> infrastructure still contains some autotools-specific stuff, the
> autotools infrastructure ported over the generic infrastructure does
> not work yet.
> 
> But it still allows you to see how the .mk files look like for three
> examples : icu, zlib and olsr (randomly choosen).

I've pushed more changes. Since my previous e-mails, the changes are
the following :

 * Improved the autotools infrastructure on top of the new generic
   package infrastructure. It now works for at least the few packages
   I've tested ;

 * Improved the generic infrastructure to support registration of
   multiple hooks. The old hook mechanism is also kept for backward
   compatibility, but if we agree on the new hook mechanism, I'd like
   to slowly get rid of the old one ;

 * The pkg-config for host build has been rewritten on top of the new
   autotools infrastructure. Much simpler. But packages must now depend
   on host-pkg-config instead of host-pkgconfig (a commit in my branch
   updates all packages) ;

 * directfb + directfb-examples build properly, which means that
   pkg-config for host, libpng, libts, zlib, freetype, jpeg, directfb
   and directfb-examples do work on top of the new infrastructure ;

 * I've added a crappy package statistics script, which tries to guess
   which package should be converted to autotools, to the new
   infrastructure, both for target and host.

A lot more work remains:

 * Cleanup
 * Documentation
 * Testing

I have one naming issue in the generic package infrastructure
(package/Makefile.package.in) on which I'd like to get your input. The
generic package infrastructure let the package specific .mk file
specify what the configure, build and install steps should do, by
defining variables :

 <PKG>_CONFIGURE for configure
 <PKG>_BUILD for build

for installation, I wanted to use

 <PKG>_INSTALL_STAGING for staging installation
 <PKG>_INSTALL_TARGET for target installation

but these variables are already existing boolean variables (YES/NO)
that allows the package to specify whether it wants TARGET installation
and/or STAGING installation. So we have a naming conflict, that I
solved by using

 <PKG>_INSTALL_STAGING_CMDS
 <PKG>_INSTALL_TARGET_CMDS

for the variables that a package specific .mk must define to list the
operations to be performed at staging install and target install. But I
don't like this naming since it isn't coherent with <PKG>_CONFIGURE and
<PKG>_BUILD.

Any suggestion ?

Sincerly,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
