From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 1 Jul 2010 09:43:07 +0200
Subject: [Buildroot] Getting package sources from git/svn/bzr
In-Reply-To: <L4TK9K$D17BBF1C51BFC0643CBBFAC2EB922E1E@aruba.it>
References: <L4TK9K$D17BBF1C51BFC0643CBBFAC2EB922E1E@aruba.it>
Message-ID: <20100701094307.337bc422@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 30 Jun 2010 10:44:08 +0200
"Luca Ceresoli" <luca@lucaceresoli.net> wrote:

> I'm trying to understand how a buildroot generic (or autotools-based)
> package can download sources from a git repository instead of just
> grabbing a tarball.

As of today, this isn't supported.

> In an old post Peter wrote:
> > See the tremor handling in package/multimedia/libvorbis/libvorbis.mk
> > for an example. You could argue about the usefullness of creating a
> > dated tarball of the checkout or not.
> (http://lists.busybox.net/pipermail/buildroot/2009-August/028932.html)
> 
> The odd thing is that tremor does *not* checkout anything: it just
> downloads a tarball which presumably contains the snapshot (see log
> below). I didn't find any other supposedly-working example in the
> current tree.

Yes, it just a normal HTTP download, where the file happens to be a SVN
snapshot.

> So I'd renew the question: is git/svn/bzr repository download actually
> working? I spent a little time in trying, but after a few dirty hacks
> I couldn't produce anything really working.
> 
> Am I missing something obvious?

No, it isn't supported as of today.

Quotient Remainder has proposed something last month to integrate Git
support (see
http://lists.busybox.net/pipermail/buildroot/2010-June/034942.html). I
unfortunately haven't had the time to carefully review his proposal,
but I'm not sure I like the general approach.

> I suspect it is not currently possible, and a clean way to do it would
> require some changes in package/Makefile.package.in, making the
> download step overridable by the package, such as:
> 
> @@ -118,19 +118,19 @@
>  # Retrieve the archive
>  $(BUILD_DIR)/%/.stamp_downloaded:
>  # support make source-check/external-deps
>  ifeq ($(SPIDER),)
>  # Only show the download message if it isn't already downloaded
>  	$(Q)(test -e $(DL_DIR)/$($(PKG)_SOURCE) && \
>  		(test -z $($(PKG)_PATCH) || test -e
> $(DL_DIR)$($(PKG)_PATCH))) || \ $(call MESSAGE,"Downloading")
>  endif
> -	$(call DOWNLOAD,$($(PKG)_SITE),$($(PKG)_SOURCE))
> +	$($(PKG)_DOWNLOAD_CMDS)
>  	$(if $($(PKG)_PATCH),$(call
> DOWNLOAD,$($(PKG)_SITE),$($(PKG)_PATCH)))
> 
> where of course $(PKG)_DOWNLOAD_CMDS would default to $(call
> DOWNLOAD,...).

Or just to improve the existing DOWNLOAD step so that if the URL starts
with git://, svn:// or even something like git at http:// (for Git repos
available through http), it knows what to do.

The issue I have with this is *when* to do a "git pull" or "svn
update". With normal packages, we download the particular version of a
particular tarball, and we uncompress it in $(BUILD_DIR)/package-X.Y.Z.
So, if the package gets its version bumped in the .mk file, we download
the new version package-X.Y.A, we extract it in a new directory
$(BUILD_DIR)/package-X.Y.A, and we're done.

If you just give the URL of a Git or SVN repo, how is this going to
work ? If you download the HEAD of a Git repo in a directory named
$(BUILD_DIR)/mypackage, when should the package be redownloaded ? How
is the version bump going to be done ?

IMO, the simplest solution is to do something like for SVN

MYPACKAGE_VERSION=23678 # is in fact the SVN revision
MYPACKAGE_SITE=svn://foo.bar.com/projects/mypackage/trunk

and similarly for Git :

MYPACKAGE_VERSION=902108904ad7daec88b367dd5fcd1c46e71ac3e6
MYPACKAGE_SITE=git://foo.bar.com/projects/mypackage.git

This way, a fixed version is choosen, so the build is reproducible. I
would find it rather disappointing to have "random" versions being
built by Buildroot.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
