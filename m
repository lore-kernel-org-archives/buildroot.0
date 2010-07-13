From: Maxime Petazzoni <maxime.petazzoni@bulix.org>
Date: Tue, 13 Jul 2010 13:30:54 +0200
Subject: [Buildroot] [PATCH 2/4] Implement basic non-wget download
 methods
In-Reply-To: <L5HQ26$43638E1C3E30A4E7BE70EACE614B0470@aruba.it>
References: <L5HQ26$43638E1C3E30A4E7BE70EACE614B0470@aruba.it>
Message-ID: <20100713113054.GB16232@bulix.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

* Luca Ceresoli <list@lucaceresoli.net> [2010-07-13 11:51:42]:

> > diff --git a/Makefile b/Makefile
> > index 2e49a6b..65b43f1 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -249,6 +249,7 @@ SVN_UP:=$(call qstrip,$(BR2_SVN_UP)) $(QUIET)
> >   BZR_CO:=$(call qstrip,$(BR2_BZR_CO)) $(QUIET)
> >   BZR_UP:=$(call qstrip,$(BR2_BZR_UP)) $(QUIET)
> >   GIT:=$(call qstrip,$(BR2_GIT)) $(QUIET)
> > +GIT_CO:=$(call qstrip,$(BR2_GIT_CO)) $(QUIET)
> Now I would rename GIT to GIT_CLONE to make the difference clear.

I aimed for the least modifications here. But if the consensus is on having
GIT_CLONE and GIT_CO, I'll change it.

> >   ################################################################################
> > +# The DOWNLOAD_{GIT,SVN,BZR} helpers are in charge of getting a working copy of
> > +# the source repository for their corresponding SCM, checkouting the requested
> checkouting -> checking out

Fixed

> Your overall approach is very clean and easy to extend to other VCSs.
> 
> The flip side of this generality is that for each new version that one
> wants to download it requires a new git clone or svn checkout. This
> takes much more bandwidth (and disk space) than git pull or svn update.
> Think about big repos such as Linux.

Indeed. But as I understand it, versions for packages don't change that
often. I agree that when they do, you end up downloading more stuff to
clone the full repository again instead of just updating.

But support for git fetch and svn update can easily be added later down
the road if this becomes a real and frequent issue.

> > +$(2)_BASE_NAME	=  $(1)-$$($(2)_VERSION)
> > +$(2)_DL_DIR	=  $$(DL_DIR)/$$($(2)_BASE_NAME)
> I don't like saving in $(DL_DIR). That is a directory that I keep with
> care so I don't have to re-download everything if I wipe buildroot and
> start off again, and I also appreciate the chance of having it on a
> shared storage so that different developers or different hosts save
> bandwidth and time. So I wouldn't like it to be polluted with repository
> clones.
> 
> IMHO in your proposed infrastructure the clones should go in a place
> where `make clean` removes them. After all you never reuse them (you
> reuse the tarball instead).

I think you missed the 'rm' line in VCS_PACK_SOURCE. Working copies are
not kept around. I archive them with tar --exclude-vcs, and delete the
working copy directory so only the archive remains for the extract phase
to use.

So you can still have a shared download directories with the archives
you need in there, even for VCS sourced packages, and Buildroot will
know where to find them and will use them. For example for Tremor, a
tremor-16259.tar.gz archive will be created in DL_DIR, and subsequent
builds will use this directly (unless TREMOR_VERSION changed of course).


Regards,
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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100713/c53b59b3/attachment.pgp>
