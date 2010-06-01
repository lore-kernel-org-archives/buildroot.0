From: Quotient Remainder <quotientvremainder@gmail.com>
Date: Tue, 01 Jun 2010 17:10:05 +0100
Subject: [Buildroot] Custom packages: downloading non-tarball packages
In-Reply-To: <AANLkTimEByzZygt96Dynu6jbpJC456AVoJZxEKDRW4Da@mail.gmail.com>
References: <AANLkTin1HjC23NvIyQVP2yzNQIYGaNLUIa88NWWnWIKn@mail.gmail.com>
	<20100519122140.51743f4e@surf>
	<AANLkTimEByzZygt96Dynu6jbpJC456AVoJZxEKDRW4Da@mail.gmail.com>
Message-ID: <1275408610.18231.0.camel@dubciaranr1.verifone.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 2010-05-19 at 06:33 -0400, Jonathan Bowman wrote:
> Thank you, Thomas, for your gracious and clear response, and the
> invitation to contribute patches.
> 
> I will look at the items you mentioned and see if I have both the time
> and expertise to attend to them.
> 
> Regards,
> Jonathan
> 
> On Wed, May 19, 2010 at 6:21 AM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
> > Hello Jonathan,
> >
> > On Mon, 17 May 2010 21:42:30 -0400
> > Jonathan Bowman <bowmanjd@gmail.com> wrote:
> >
> >> I am new to buildroot, but thanks to an elegant interface and clear
> >> documentation, it is serving my needs quite nicely.
> >
> > Thank you :)
> >
> >> However, I do have a question regarding best practices. I note that in
> >> the documentation it is not recommended to use the "manual" method in
> >> the makefiles of new packages.
> >
> > Yes, correct.
> >
> >> However, I do not see in the other methods how to deal with sources
> >> that are not tarballs. Some code (strangely) only comes in zip files,
> >> while other code I would prefer to download using svn, git, or
> >> another system.
> >>
> >> Is there a recommended practice for these scenarios?
> >
> > It is true that today both package infrastructure (generic and
> > autotools) assume that the package is retrieved as a tarball from a
> > http or ftp server. These infrastructures could of course be extended
> > to handle svn, git or even zip files.
> >
> > .zip files should be handled automatically just as we handle .tar.gz
> > and .tar.bz2 today. This would require some modifications in
> > package/Makefile.package.in in the $(BUILD_DIR)/%/.stamp_extracted
> > target.
> >
> > For git/svn, we could probably act differently in the download stage if
> > the URL starts with git:// or svn://. But we need to define what the
> > semantic of <pkg>_VERSION, <pkg>_SOURCE, <pkg>_SITE will be, how this
> > should interact with the directory that caches downloads and how build
> > directories should be named.
> >
> > Don't hesitate to make proposals, either in the form of patches or in
> > the form of small design documents.

Attached is a first draft of an idea that may be along the lines of what
you're looking for.
Based on commit 4a640e464439a5e78458ae969dcc6017aa96278f

It's far from perfect but should allow cloning or getting a snapshot
from a git server, configurable through the "Build" menu.
It does not, at present, allow per-package choice of working copy or
snapshot mode.
I tried to make it as non-invasive as possible.
The URLs are not generic but can be changed easily enough.  I'm more
just looking for comments on the overall approach.
Many improvements are required, including "pull" to update already
cloned repositories.

"Converting" a simple generic package to use this should just be a
matter of changing the relevant "package/package.mk": <PKG>_SITE to
git://git.package.org/repobase and adding a new variable <PKG>_REPO to
the name of the repository itself.

I'll admit I don't know exactly what all the LINUX*_VERSION variables
are for so the top of "target/linux/Makefile.advanced" is a heavy hack
that needs attention.

--

> >
> > Thomas
> > --
> > Thomas Petazzoni, Free Electrons
> > Kernel, drivers, real-time and embedded Linux
> > development, consulting, training and support.
> > http://free-electrons.com
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
> >
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot


-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0002-Add-support-for-version-controlled-working-copies.patch
Type: text/x-patch
Size: 11906 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100601/7aef11fa/attachment.bin>
