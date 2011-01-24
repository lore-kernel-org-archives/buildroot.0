From: Mike Frysinger <vapier@gentoo.org>
Date: Mon, 24 Jan 2011 16:48:15 -0500
Subject: [Buildroot] [PATCH 1/4] libpcap: update static handling
In-Reply-To: <20110124171642.6cff75a4@surf>
References: <1295493022-4659-1-git-send-email-vapier@gentoo.org>
	<201101231607.30938.vapier@gentoo.org>
	<20110124171642.6cff75a4@surf>
Message-ID: <201101241648.15991.vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday, January 24, 2011 11:16:42 Thomas Petazzoni wrote:
> On Sun, 23 Jan 2011 16:07:30 -0500 Mike Frysinger wrote:
> > hmm, well Thomas' suggestion before doesnt work ... the current autotools
> > Makefile only adds $(PKG)_MAKE_OPT to the build step instead of all the
> > steps. so ignore this patch until that can be fixed.
> 
> For the moment:
> 
>  $(PKG)_MAKE_OPT is passed at build time for target and host packages
>  (maybe we should rename it $(PKG)_BUILD_MAKE_OPT, or pass it during all
>  steps)
> 
>  $(PKG)_INSTALL_STAGING_OPT is passed at staging installation time for
>  target packages
> 
>  $(PKG)_INSTALL_TARGET_OPT is passed at target installation time for
>  target packages
> 
> So in your case you probably need to do something like:
> 
> LIBPCAP_INSTALL_STAGING_OPT = DYEXT=none DESTDIR="$(STAGING_DIR)" install
> LIBPCAP_INSTALL_TARGET_OPT  = DYEXT=none DESTDIR="$(TARGET_DIR)" install

yes, that would make it work, but that just makes me want to cry.  it makes a 
lot more sense imo to have $(PKG)_MAKE_OPT be passed for all steps (and 
grepping the tree doesnt show any cases where this would be a problem).  if 
people still want a hook specific to the build step, then it'd make sense to 
add $(PKG)_BUILD_OPT or something similiar.
-mike
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 836 bytes
Desc: This is a digitally signed message part.
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110124/29accfff/attachment.asc>
