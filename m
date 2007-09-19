From: Thomas Lundquist <lists@zelow.no>
Date: Wed, 19 Sep 2007 22:56:03 +0200
Subject: [Buildroot] buildroot with ipkg
In-Reply-To: <20070919192740.GC817@aon.at>
References: <7fc538d30709170509s4898cc55keb14ebb718d30090@mail.gmail.com>
	<46EED912.2070902@free.fr> <20070917201401.GA28671@codepoet.org>
	<46EEEEE2.7060705@free.fr> <20070919064200.GA29317@zelow.no>
	<20070919192740.GC817@aon.at>
Message-ID: <20070919205603.GA16408@zelow.no>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Sep 19, 2007 at 09:27:40PM +0200, Bernhard Fischer wrote:
> 
> >Index: target/ext2/ext2root.mk
> >===================================================================
> >--- target/ext2/ext2root.mk	(revision 18947)
> >+++ target/ext2/ext2root.mk	(working copy)
> >@@ -75,7 +75,7 @@
> > #EXT2_ROOTFS_COMPRESSOR_PREREQ:= bzip2-host
> > endif
> > ifeq ($(BR2_TARGET_ROOTFS_EXT2_LZMA),y)
> >-EXT2_ROOTFS_COMPRESSOR:=lzma -9 -c
> >+EXT2_ROOTFS_COMPRESSOR:=$(STAGING_DIR)/bin/lzma -9 -c
> 
> This shouldn't be needed anymore, we build our own version there, if
> need be. If you have one of these "lzma e" flavour binaries, please
> flesh out toolchain/dependencies/check-host-lzma.sh
> instead (See TODO in there). TIA.

You are too fast for me. I've hand patched todays svn and this is not a
part of that patch.

> >Index: package/config/mconf.c
> >===================================================================
> >--- package/config/mconf.c	(revision 18947)
> >+++ package/config/mconf.c	(working copy)
> >@@ -165,7 +165,8 @@
> > 	"Arrow keys navigate the menu.  "
> > 	"<Enter> selects submenus --->.  "
> > 	"Highlighted letters are hotkeys.  "
> >-	"Pressing <Y> selectes a feature, while <N> will exclude a feature.  "
> >+	"Pressing <Y> selectes a feature, while <N> will exclude a feature, "
> >+	"<M> will build a separate package. "
> > 	"Press <Esc><Esc> to exit, <?> for Help, </> for Search.  "
> > 	"Legend: [*] feature is selected  [ ] feature is excluded",
> > radiolist_instructions[] =
> 
> I'm not sure if that is a good idea. You'd generally want to build all
> packages as ipkg, i'd say.

I want the users to be able to choose. This is a very simple way for
them to do so. I know I probably should find that bloody "m" and change
it to a "p" and might do it.

> >+ifeq ($(strip $(BR2_PACKAGE_DROPBEAR)),m)
> >+DROPBEAR_DESTDIR=$(TARGET_PACKAGES_DIR)/dropbear
> >+else
> >+DROPBEAR_DESTDIR=$(TARGET_DIR)
> >+endif
> 
> wow. This would be very intrusive.

but very simple.

> We should be able to use one central
> TARGET_PACKAGES_DIR that may or may not be empty that we stick into the
> individual FOO_DIR's via TARGET_DIR

Not sure I follofw you completely but you mean make sure that TARGET_DIR
changes for every make file dependant on the package/base option set in
.config?

Be my guest but I've already volunteered to do the changes to the .mk
files to make my method work.

BTW; I been away from buildroot for way too long. I just can't find out 
where or how TARGET_DIR is defined. Anyone able to enoughten me? grep is
usually a very good toy but it didn't make me any brighter this time.

> But first  we have to fix the lib vs. lib64 dir glitch with gcc, that's
> more important. And then it would be nice if somebody would look into
> multilib support, which is apparently broken since several years (way
> before i joined).

You may be right. I'd be happy to go loose on those if I had time or
even knew how to fix it (or more time, to find out how it all works).

> Still, creating ipkg would be a nice thing to have.

And here is a patch that whould do this (and .deb, and .rpm or whatever
people want or need.) together with someone wanting to add it and do the
monkey work.


Thomas.
