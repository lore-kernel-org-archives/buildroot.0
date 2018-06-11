From: Trent Piepho <tpiepho@impinj.com>
Date: Mon, 11 Jun 2018 22:10:55 +0000
Subject: [Buildroot] [PATCH] core/sdk: generate the SDK tarball ourselves
In-Reply-To: <20180611210125.108ff027@windsurf>
References: <20180609210607.13259-1-yann.morin.1998@free.fr>
 <e4bbb78b-8301-e576-7e65-f83d55e0da7b@mind.be>
 <1528737656.28705.131.camel@impinj.com> <20180611210125.108ff027@windsurf>
Message-ID: <1528755055.28705.139.camel@impinj.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 2018-06-11 at 21:01 +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Mon, 11 Jun 2018 17:20:57 +0000, Trent Piepho wrote:
> 
> > Is the problem with using this tarball apparent?  The dockerfile needs
> > to be hand edited on every single build to use the correct path to the
> > SDK.
> > 
> > I've already added a "sdk-tar" to my external.mk to do this, but used
> > the tarbomb approach.  While annoying for those who extract it in their
> > home dir, it's much easier to use in an automated processes since there
> > is no unknown path name component.
> 
> You want to use the --strip-components=1 option of tar, which Buildroot
> is already using when extracting the tarballs of upstream packages into
> the output/build/<package>-<version>/ directories.

Which is great when using GNU tar that has that option.  But Docker
does not.

I can make a Docker friendly tarball myself, as I do now.  But after
this patch there is no way to do that without also making an unused
non-Docker friendly tarball.  Which is pretty costly on VMs with poor
io performance.

Some ideas to avoid this:
1. Make tarball generation a new target instead of "sdk".
2. Make tarball generation the "sdk" target but add another target that
does what "sdk" used to do.
3. Allow the tarball path prefix to be specified in some way, so that
it is easier to inject into an automated process that uses the SDK. 
E.g., it can be defined as a constant in the defconfig, or passed from
a higher level to both buildroot when the SDK is made and to whatever
uses the SDK.
