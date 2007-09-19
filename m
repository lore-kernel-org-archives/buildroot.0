From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Wed, 19 Sep 2007 23:50:43 +0200
Subject: [Buildroot] buildroot with ipkg
In-Reply-To: <20070919205603.GA16408@zelow.no>
References: <7fc538d30709170509s4898cc55keb14ebb718d30090@mail.gmail.com>
	<46EED912.2070902@free.fr> <20070917201401.GA28671@codepoet.org>
	<46EEEEE2.7060705@free.fr> <20070919064200.GA29317@zelow.no>
	<20070919192740.GC817@aon.at> <20070919205603.GA16408@zelow.no>
Message-ID: <20070919215043.GX20058@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Sep 19, 2007 at 10:56:03PM +0200, Thomas Lundquist wrote:
>On Wed, Sep 19, 2007 at 09:27:40PM +0200, Bernhard Fischer wrote:

>> >Index: package/config/mconf.c
>> >===================================================================
>> >--- package/config/mconf.c	(revision 18947)
>> >+++ package/config/mconf.c	(working copy)
>> >@@ -165,7 +165,8 @@
>> > 	"Arrow keys navigate the menu.  "
>> > 	"<Enter> selects submenus --->.  "
>> > 	"Highlighted letters are hotkeys.  "
>> >-	"Pressing <Y> selectes a feature, while <N> will exclude a feature.  "
>> >+	"Pressing <Y> selectes a feature, while <N> will exclude a feature, "
>> >+	"<M> will build a separate package. "
>> > 	"Press <Esc><Esc> to exit, <?> for Help, </> for Search.  "
>> > 	"Legend: [*] feature is selected  [ ] feature is excluded",
>> > radiolist_instructions[] =
>> 
>> I'm not sure if that is a good idea. You'd generally want to build all
>> packages as ipkg, i'd say.
>
>I want the users to be able to choose. This is a very simple way for
>them to do so. I know I probably should find that bloody "m" and change
>it to a "p" and might do it.

m vs p doesn't make much difference.

>> >+ifeq ($(strip $(BR2_PACKAGE_DROPBEAR)),m)
>> >+DROPBEAR_DESTDIR=$(TARGET_PACKAGES_DIR)/dropbear
>> >+else
>> >+DROPBEAR_DESTDIR=$(TARGET_DIR)
>> >+endif
>> 
>> wow. This would be very intrusive.
>
>but very simple.

Don't forget about package/Makefile.autowhatever.in.
This needs adjustment too.
(and whoever hard-coded x11 specific stuff in there should be beaten)

>> We should be able to use one central
>> TARGET_PACKAGES_DIR that may or may not be empty that we stick into the
>> individual FOO_DIR's via TARGET_DIR
>
>Not sure I follofw you completely but you mean make sure that TARGET_DIR
>changes for every make file dependant on the package/base option set in
>.config?

Yes. Not sure if that'd work, but perhaps something like
$(PROJECT_BUILD_DIR)/%/$(FOO_BINARY): $(TARGET_DIR)/$(FOO_BINARY) \
	$(TARGET_PACKAGES_DIR)/$(FOO_BINARY): $(FOO_DIR)/.unpacked
	$(MAKE) -C $(FOO_DIR) et cetera

may do the trick. We'd have to see if something like that makes sense.

>Be my guest but I've already volunteered to do the changes to the .mk
>files to make my method work.

Yes, but somebody has to maintain it and explain it :)
>
>BTW; I been away from buildroot for way too long. I just can't find out 
>where or how TARGET_DIR is defined. Anyone able to enoughten me? grep is
>usually a very good toy but it didn't make me any brighter this time.

$ svngrep -r ^TARGET_DIR:= /mnt/cvs/busybox/upstream/buildroot/ 2> /dev/null
/mnt/cvs/busybox/upstream/buildroot/project/Makefile.in:TARGET_DIR:=$(PROJECT_BUILD_DIR)/root

>> Still, creating ipkg would be a nice thing to have.
>
>And here is a patch that whould do this (and .deb, and .rpm or whatever
>people want or need.) together with someone wanting to add it and do the
>monkey work.

yeah. I'll reread the dropbear example tomorrow. Perhaps somebody else
has other comments.

Cheers,
