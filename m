From: Maxime Petazzoni <maxime.petazzoni@bulix.org>
Date: Fri, 16 Jul 2010 12:39:02 +0200
Subject: [Buildroot] [PATCH 2/4] Implement basic non-wget download
 methods
In-Reply-To: <1279108920.7058.123.camel@cabbage.rehill.info>
References: <L5HQ26$43638E1C3E30A4E7BE70EACE614B0470@aruba.it>
	<20100713113054.GB16232@bulix.org>
	<1279108920.7058.123.camel@cabbage.rehill.info>
Message-ID: <20100716103902.GF16232@bulix.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* Quotient Remainder <quotientvremainder@gmail.com> [2010-07-14 13:02:00]:

> > > > +GIT_CO:=$(call qstrip,$(BR2_GIT_CO)) $(QUIET)
> > > Now I would rename GIT to GIT_CLONE to make the difference clear.
> > 
> > I aimed for the least modifications here. But if the consensus is on having
> > GIT_CLONE and GIT_CO, I'll change it.
> 
> In a broader sense what are these configuration options for?  Is it to
> allow adding switches (e.g. git checkout -f) to the commands or is it to
> allow specifying the path to the executable
> (e.g. /usr/bin/svn, /opt/git4.0-pre/bin/git)?
> If it's the first case, I'd side with GIT_CLONE and GIT_CO.  If it's the
> second case, I'd leave it as GIT but get rid of the GIT_CO and just put
> the actual command in Makefile.package.in.  Is is likely that they will
> ever differ from "clone" or "checkout" anyway?

I don't really know what they are for. Maybe some "older" Buildroot
developers could give us some details there. Because you're right, git
clone will most likely remain git clone. But having the option to use a
specific path is usefull, in which case I'd leave only GIT="git". But
then the same would apply to SVN_CO/SVN_UP where we should only keep
SVN="svn".

Thoughts?

> I have to agree with Maxime here, $(DL_DIR) seems the right place for
> these directories and the creation of the tarball in $(DL_DIR)
> integrates nicely with the existing infrastructure.  I would prefer the
> use of "git archive"/"svn export" instead of plain "tar" here though.  I
> feel it's better to use the VCS native facility than relying on the
> installed version of tar to know about the particulars of the VCS
> metainformation.

Makes sense. I'm more used to --exclude-vcs because I don't have to
remember the different syntax of all VCS, especially for the ones I
don't use frequently like Bzr, Mercurial, etc.

I'll change that in my next resend.

> In addition, when tar is not used, the name of the cloned directory need
> not be tied to the version; a prefix can be specified in the archive
> command or exporting done to a temporary directory.  $($(PKG)_BASE_NAME)
> can just be $($(PKG)_NAME).$($(PKG)_SITE_METHOD) or similar.
> 
> The result is that the working copy can be left in $(DL_DIR) so it's
> available for updating at a later time; I would leave out the "rm" line
> so re-use is possible.  It could be regarded as a kind of hook to help
> the possible future feature (discussed in the other thread) of using BR
> as a development environment.

Although this would work fairly well for Git repository, it is not the
case for Subversion repositories, especially if the PGK_SITE changes to
point to a different tag, in which case you need to svn switch
--relocate, etc.

I think it's best for now to go with the current method of checking out,
creating the tarball and removing the working copy, and later work on
how/where to keep the working copies and using them efficiently for
updates. This makes the incremental changes smaller and easier to deal
with. Not necessarily in terms of code, but also in terms of the
discussions around it.

> Another feature not present in this is the guessing of the download
> scheme/protocol from the URI (in Luca's patch).  It seems to fit in
> nicely with this patch without significant modification and adds that
> extra bit of flexibility while falling back to sensible defaults, in my
> opinion.

It does indeed fit very nicely with my patch, so I'll go ahead and
integrate it in my next resend.

- Maxime
-- 
Maxime Petazzoni <http://www.bulix.org>
 ``One by one, the penguins took away my sanity.''
Linux kernel and software developer at MontaVista Software
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 198 bytes
Desc: Digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100716/091183f7/attachment.pgp>
