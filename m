From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Wed, 19 Sep 2007 21:27:40 +0200
Subject: [Buildroot] buildroot with ipkg
In-Reply-To: <20070919064200.GA29317@zelow.no>
References: <7fc538d30709170509s4898cc55keb14ebb718d30090@mail.gmail.com>
	<46EED912.2070902@free.fr> <20070917201401.GA28671@codepoet.org>
	<46EEEEE2.7060705@free.fr> <20070919064200.GA29317@zelow.no>
Message-ID: <20070919192740.GC817@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Sep 19, 2007 at 08:42:00AM +0200, Thomas Lundquist wrote:
>On Mon, Sep 17, 2007 at 11:17:22PM +0200, Julien Boibessot wrote:
>
>> Do you think it's possible to do that without modifying all the 
>> Buildroot packages makefiles ?
>
>No, it need that work.
>
>I've attatched the last svn diff I made, which is kinda outdated. This
>makes tarballs and very simple .debs. I was about to do ipkg when work
>caught up with me.
>
>It will not apply cleanly to the newest svn but I feel I should at least
>show that I have something. It should be fairly easy to hack in but I
>have to finish the project I work on now before I can play with this.
>
>The concept is that you can choose what kind of packages you want and
>then choose between package or "base" for every package in packages/
>(the only package that you can do with it right now is Dropbear, as a
>proof of concept.)
>
>If you are in a hurry, feel free to fix and add, if not I'll try to
>finish up a new patch in a week or two (I've said that before but if I
>know I can add it to buildroot I'm more motivated for it.)
>
>
>
>Thomas.

>Index: target/ext2/ext2root.mk
>===================================================================
>--- target/ext2/ext2root.mk	(revision 18947)
>+++ target/ext2/ext2root.mk	(working copy)
>@@ -75,7 +75,7 @@
> #EXT2_ROOTFS_COMPRESSOR_PREREQ:= bzip2-host
> endif
> ifeq ($(BR2_TARGET_ROOTFS_EXT2_LZMA),y)
>-EXT2_ROOTFS_COMPRESSOR:=lzma -9 -c
>+EXT2_ROOTFS_COMPRESSOR:=$(STAGING_DIR)/bin/lzma -9 -c

This shouldn't be needed anymore, we build our own version there, if
need be. If you have one of these "lzma e" flavour binaries, please
flesh out toolchain/dependencies/check-host-lzma.sh
instead (See TODO in there). TIA.

> EXT2_ROOTFS_COMPRESSOR_EXT:=lzma
> EXT2_ROOTFS_COMPRESSOR_PREREQ:= lzma-host
> endif

>Index: package/config/mconf.c
>===================================================================
>--- package/config/mconf.c	(revision 18947)
>+++ package/config/mconf.c	(working copy)
>@@ -165,7 +165,8 @@
> 	"Arrow keys navigate the menu.  "
> 	"<Enter> selects submenus --->.  "
> 	"Highlighted letters are hotkeys.  "
>-	"Pressing <Y> selectes a feature, while <N> will exclude a feature.  "
>+	"Pressing <Y> selectes a feature, while <N> will exclude a feature, "
>+	"<M> will build a separate package. "
> 	"Press <Esc><Esc> to exit, <?> for Help, </> for Search.  "
> 	"Legend: [*] feature is selected  [ ] feature is excluded",
> radiolist_instructions[] =

I'm not sure if that is a good idea. You'd generally want to build all
packages as ipkg, i'd say.

>Index: package/dropbear/dropbear.mk
>===================================================================
>--- package/dropbear/dropbear.mk	(revision 18947)
>+++ package/dropbear/dropbear.mk	(working copy)
>@@ -11,6 +11,13 @@
> DROPBEAR_BINARY:=dropbearmulti
> DROPBEAR_TARGET_BINARY:=usr/sbin/dropbear
> 
>+ifeq ($(strip $(BR2_PACKAGE_DROPBEAR)),m)
>+DROPBEAR_DESTDIR=$(TARGET_PACKAGES_DIR)/dropbear
>+else
>+DROPBEAR_DESTDIR=$(TARGET_DIR)
>+endif

wow. This would be very intrusive. We should be able to use one central
TARGET_PACKAGES_DIR that may or may not be empty that we stick into the
individual FOO_DIR's via TARGET_DIR

But first  we have to fix the lib vs. lib64 dir glitch with gcc, that's
more important. And then it would be nice if somebody would look into
multilib support, which is apparently broken since several years (way
before i joined).

Still, creating ipkg would be a nice thing to have.
