From: Quotient Remainder <quotientvremainder@gmail.com>
Date: Wed, 14 Jul 2010 13:02:00 +0100
Subject: [Buildroot] [PATCH 2/4] Implement basic non-wget download
 methods
In-Reply-To: <20100713113054.GB16232@bulix.org>
References: <L5HQ26$43638E1C3E30A4E7BE70EACE614B0470@aruba.it>
	<20100713113054.GB16232@bulix.org>
Message-ID: <1279108920.7058.123.camel@cabbage.rehill.info>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 2010-07-13 at 13:30 +0200, Maxime Petazzoni wrote:
> Hi,
> 
> * Luca Ceresoli <list@lucaceresoli.net> [2010-07-13 11:51:42]:
> 
> > > +GIT_CO:=$(call qstrip,$(BR2_GIT_CO)) $(QUIET)
> > Now I would rename GIT to GIT_CLONE to make the difference clear.
> 
> I aimed for the least modifications here. But if the consensus is on having
> GIT_CLONE and GIT_CO, I'll change it.

In a broader sense what are these configuration options for?  Is it to
allow adding switches (e.g. git checkout -f) to the commands or is it to
allow specifying the path to the executable
(e.g. /usr/bin/svn, /opt/git4.0-pre/bin/git)?
If it's the first case, I'd side with GIT_CLONE and GIT_CO.  If it's the
second case, I'd leave it as GIT but get rid of the GIT_CO and just put
the actual command in Makefile.package.in.  Is is likely that they will
ever differ from "clone" or "checkout" anyway?

> Indeed. But as I understand it, versions for packages don't change that
> often. I agree that when they do, you end up downloading more stuff to
> clone the full repository again instead of just updating.
> 
> But support for git fetch and svn update can easily be added later down
> the road if this becomes a real and frequent issue.
> 
> > > +$(2)_BASE_NAME	=  $(1)-$$($(2)_VERSION)
> > > +$(2)_DL_DIR	=  $$(DL_DIR)/$$($(2)_BASE_NAME)
> > I don't like saving in $(DL_DIR). That is a directory that I keep with
> > care so I don't have to re-download everything if I wipe buildroot and
> > start off again, and I also appreciate the chance of having it on a
> > shared storage so that different developers or different hosts save
> > bandwidth and time. So I wouldn't like it to be polluted with repository
> > clones.
> > 
> > IMHO in your proposed infrastructure the clones should go in a place
> > where `make clean` removes them. After all you never reuse them (you
> > reuse the tarball instead).
> 
> I think you missed the 'rm' line in VCS_PACK_SOURCE. Working copies are
> not kept around. I archive them with tar --exclude-vcs, and delete the
> working copy directory so only the archive remains for the extract phase
> to use.
> 
> So you can still have a shared download directories with the archives
> you need in there, even for VCS sourced packages, and Buildroot will
> know where to find them and will use them. For example for Tremor, a
> tremor-16259.tar.gz archive will be created in DL_DIR, and subsequent
> builds will use this directly (unless TREMOR_VERSION changed of course).
> 
I have to agree with Maxime here, $(DL_DIR) seems the right place for
these directories and the creation of the tarball in $(DL_DIR)
integrates nicely with the existing infrastructure.  I would prefer the
use of "git archive"/"svn export" instead of plain "tar" here though.  I
feel it's better to use the VCS native facility than relying on the
installed version of tar to know about the particulars of the VCS
metainformation.
In addition, when tar is not used, the name of the cloned directory need
not be tied to the version; a prefix can be specified in the archive
command or exporting done to a temporary directory.  $($(PKG)_BASE_NAME)
can just be $($(PKG)_NAME).$($(PKG)_SITE_METHOD) or similar.


The result is that the working copy can be left in $(DL_DIR) so it's
available for updating at a later time; I would leave out the "rm" line
so re-use is possible.  It could be regarded as a kind of hook to help
the possible future feature (discussed in the other thread) of using BR
as a development environment.

Another feature not present in this is the guessing of the download
scheme/protocol from the URI (in Luca's patch).  It seems to fit in
nicely with this patch without significant modification and adds that
extra bit of flexibility while falling back to sensible defaults, in my
opinion.
