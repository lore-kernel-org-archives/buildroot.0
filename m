From: Luca Ceresoli <list@lucaceresoli.net>
Date: Fri,  2 Jul 2010 12:58:43 +0200
Subject: [Buildroot] Getting package sources from git/svn/bzr
Message-ID: <L4XFTV$372CCE1E768A6797451FB4E08C9DC692@aruba.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Quotient Remainder wrote:
> On Thu, 2010-07-01 at 09:43 +0200, Thomas Petazzoni wrote:
> > On Wed, 30 Jun 2010 10:44:08 +0200
> > "Luca Ceresoli" <luca@lucaceresoli.net> wrote:
> > 
> > 
> > > So I'd renew the question: is git/svn/bzr repository download actually
> > > working? I spent a little time in trying, but after a few dirty hacks
> > > I couldn't produce anything really working.
> > > 
> > > Am I missing something obvious?
> > 
> > No, it isn't supported as of today.
> > 
> > Quotient Remainder has proposed something last month to integrate Git
> > support (see
> > http://lists.busybox.net/pipermail/buildroot/2010-June/034942.html). I
> > unfortunately haven't had the time to carefully review his proposal,
> > but I'm not sure I like the general approach.
> > 
> 
> I'll admit I'm not all that fond of my approach either but I felt I'd
> try to get some detailed discussion the subject started at least.  Since
> I submitted it I noticed a few errors but I have since taken a new,
> though similar, approach but this is not ready for public review as yet.
> 
> This reply is both a response to some of the specific issues raised by
> Thomas and some clarifications on the direction I was taking.  My needs
> are currently git-centred but many concepts should apply to other VCS.
> 
> > Or just to improve the existing DOWNLOAD step so that if the URL starts
> > with git://, svn:// or even something like git at http:// (for Git repos
> > available through http), it knows what to do.
> 
> This is what my patch does; instead of always calling wget, DOWNLOAD is
> changed to extract the protocol at the start of the URL and then call
> DOWNLOAD_WGET, DOWNLOAD_GIT, DOWNLOAD_SVN, allowing aliases like
> DOWNLOAD_HTTP [for WGET) and DOWNLOAD_SSH (for GIT).  I hadn't
> specifically though about git over HTTP but at a stretch we could use
> something non-standard like githttp://git at site.org/... and parse out the
> user.
> 
> One problem I had is that DOWNLOAD is always evaluated by the shell (in
> the makefile command context - tabbed in) so it's not straightforward to
> do conditional stuff.  This could be greatly simplified if $(call
> DOWNLOAD ...) was called in the makefile directive context
> (non-indented).  As you can see, makefiles (and their terminology) are
> not my major.  As stated previously, I wanted to be as non-invasive as
> possible so did not do this myself.
> 
> > The issue I have with this is *when* to do a "git pull" or "svn
> > update". With normal packages, we download the particular version of a
> > particular tarball, and we uncompress it in $(BUILD_DIR)/package-X.Y.Z.
> > So, if the package gets its version bumped in the .mk file, we download
> > the new version package-X.Y.A, we extract it in a new directory
> > $(BUILD_DIR)/package-X.Y.A, and we're done.
> > ...
> > If you just give the URL of a Git or SVN repo, how is this going to 
> > work ? If you download the HEAD of a Git repo in a directory named
> > $(BUILD_DIR)/mypackage, when should the package be redownloaded ? How 
> > is the version bump going to be done ?
> 
> I wanted git to work using both the "clone" command to get a working
> copy and "archive --remote" command to get a snapshot.
> 
> For most users, the snapshot feature would be used.  Since all this does
> is get a tarball to the $(DL_DIR) the pull problem doesn't arise, if you
> change the version then there will be no archive in $(DL_DIR) with the
> new version, e.g dl/package-b78686aaadeacdda67abade29f.tgz
> 
> The clone context introduces complications though.  "make source" will
> clone the repository to $(BUILD_DIR) and check out the requested
> version.  The extract stage is not necessary and for my own purposes no
> patches should be applied so I skip the patch stage also - others may
> feel different.  My reasoning is that if you're working on source you
> will not want anyone else patches to be automatically applied.

The difference between the two methods (clone vs archive) is not clear
to me. I got how each works, but what advantages do they have over each
other?

> 
> Running "make source" again should in some way recognise source
> controlled packages and checkout the specified versions of each package.
> By this I mean that PACKAGE_VERSION in the package makefile may have
> changed since "make source" was last run.
> 
> As time passes developers may wish to get the latest updates from
> upstream.  For this I feel that a new command "make source-update" or
> similar would be needed.  This would be analogous to "git pull".
> 
> 
> One of the messy parts of my approach is that there is no good way to
> choose on a package-by-package level whether to get a snapshot or clone.
> Any ideas on this are most welcome.
> 
> 
> > MYPACKAGE_VERSION=902108904ad7daec88b367dd5fcd1c46e71ac3e6
> > MYPACKAGE_SITE=git://foo.bar.com/projects/mypackage.git
> > 
> > This way, a fixed version is choosen, so the build is reproducible. I
> > would find it rather disappointing to have "random" versions being
> > built by Buildroot.
> > 
> 
> For my own purposes I need to have all package versions in a single
> top-level file (a bit like a partial manifest to be used in combination
> with the buildroot config):
> 	PACKAGE1_VERSION=3298703984
> 	PACKAGE2_VERSION=dsaf8977dsaadfs09
> and so on.

I don't like this as a way to mainline package version management and
reproducibility. Can you explain why you find it useful?
If this is just a way to override the package/*/*.mk defaults, why not
just changing them directly?

Luca

> 
> We can support this by having a default version in the package makefile,
> which can be overridden by the top-level file:
> 	PACKAGE1_VERSION ?= djkhsad87
> 
> The top-level file can be a "-include" in the top-level Makefile or
> wherever is appropriate.
> 
> 
> Anyway, that's a selection of my thoughts on this.  All comments - bad
> and not so bad - are welcomed!
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
