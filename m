From: Bob Beckett <bbeckett@netvu.org.uk>
Date: Mon, 4 Jun 2018 15:59:29 +0100
Subject: [Buildroot] [PATCH 1/2] git: fix handling of git repos using
 master as version
In-Reply-To: <20180604163302.2d529afd@windsurf>
References: <1528119150-28659-1-git-send-email-bbeckett@netvu.org.uk>
 <20180604163302.2d529afd@windsurf>
Message-ID: <CAESO2E+hb8=2vfAstXvYeG05L6ELKMHcYCGkoHRukptkrDhZHQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Is this philosophy set in stone? I can conceive of useful situations where
branches are preferable.
During large projects, where the rootfs is being developed at the same time
as some custom packages,
it is quite useful to have a branch as the target. Usually, I just do a
dirclean and delete the tar when I know
something has changed.

If you wanted to make it more predictable, then maybe name the tar based on
the version (branch name in this case) plus the sha, this way new tar
packages would be created if the branch advances and also if a tag (or
other supported refspec) changes via a rebase etc.

The particular thing I like to avoid is multiple version bumps in the
package spec and tags in the package source repos during development. When
many people are working on package project, expecting them all to take time
to publish tags for every little change gets unrealistic.

The question I would ask is is there any harm in supporting that if it can
be done reliably and predictably?

Anyway, if this design is locked down, then I will just maintain this patch
locally for us to use :)

Thanks

Bob


On Mon, Jun 4, 2018 at 3:33 PM, Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> Hello,
>
> On Mon,  4 Jun 2018 14:32:29 +0100, Robert Beckett wrote:
> > Since changing to git init followed by fetch to initialise
> > git cache, when using master branch as the target version
> > for a package, git refuses to fetch in to currently checkout
> > out branch or master.
>
> I think we don't want to support using branches as Git versions, as it
> doesn't make sense, because it won't behave as the user expects.
>
> If you use a branch as _VERSION for a package, Buildroot will only
> download once, and never update to newer commits in this branch,
> because it will already have a cached tarball in its DL_DIR.
>
> So I'm not sure we want to add some code to support a use case that we
> don't want support :-)
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180604/8f042d7f/attachment.html>
