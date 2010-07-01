From: Michael S. Zick <minimod@morethan.org>
Date: Thu, 1 Jul 2010 07:22:54 -0500
Subject: [Buildroot] Getting package sources from git/svn/bzr
In-Reply-To: <20100701094307.337bc422@surf>
References: <L4TK9K$D17BBF1C51BFC0643CBBFAC2EB922E1E@aruba.it>
	<20100701094307.337bc422@surf>
Message-ID: <201007010722.56603.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu July 1 2010, Thomas Petazzoni wrote:
>
- - - -
> 
> Or just to improve the existing DOWNLOAD step so that if the URL starts
> with git://, svn:// or even something like git at http:// (for Git repos
> available through http), it knows what to do.
> 
> The issue I have with this is *when* to do a "git pull" or "svn
> update". With normal packages, we download the particular version of a
> particular tarball, and we uncompress it in $(BUILD_DIR)/package-X.Y.Z.
> So, if the package gets its version bumped in the .mk file, we download
> the new version package-X.Y.A, we extract it in a new directory
> $(BUILD_DIR)/package-X.Y.A, and we're done.
> 

And with a lot of things, they have version specific patches;
So how would that be made to work grabbing random versions?

Of course some patches are not version specific, they usually deal
with some sort of structural or build environment differences.
Which does not help this situation, now both version specific and
non-version specific patches have to be dealt with along with
how to tell the difference.

> If you just give the URL of a Git or SVN repo, how is this going to
> work ? If you download the HEAD of a Git repo in a directory named
> $(BUILD_DIR)/mypackage, when should the package be redownloaded ? How
> is the version bump going to be done ?
> 
> IMO, the simplest solution is to do something like for SVN
> 
> MYPACKAGE_VERSION=23678 # is in fact the SVN revision
> MYPACKAGE_SITE=svn://foo.bar.com/projects/mypackage/trunk
> 
> and similarly for Git :
> 
> MYPACKAGE_VERSION=902108904ad7daec88b367dd5fcd1c46e71ac3e6
> MYPACKAGE_SITE=git://foo.bar.com/projects/mypackage.git
> 
> This way, a fixed version is choosen, so the build is reproducible. I
> would find it rather disappointing to have "random" versions being
> built by Buildroot.
> 

Version control systems often employ tags or revision numbers that
point into the version control storage in such a way that a constant
content image can be pulled.

Planning a syntax that allows a version tag or a revision number to
be included, perhaps sourced from a menuconfig string field should
deal with the repeatability of a build.

Mercurial takes schemes of http://, https://, ssh:// for its network
operations that a repository-remote build system might use.

Here is a small one you can browse - note that the web interface allows
you to pull an archive from any specific revision number (or tag, or branch
but I don't have any tags (other than tip) or branches (other than default))
http://hg.minimodding.com

Same with the remote commands - they can pull a clone or a bundle by tag/branch.

Mike
> Best regards,
> 
> Thomas
