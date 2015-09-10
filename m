From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 10 Sep 2015 17:06:27 +0300
Subject: [Buildroot] [PATCH] mtd: add missing -lintl from util-linux
 when building statically
In-Reply-To: <55F18CE8.5090909@imgtec.com>
References: <1441881890-6521-1-git-send-email-Vincent.Riera@imgtec.com>
 <20150910134556.GQ2191@tarshish> <55F18CE8.5090909@imgtec.com>
Message-ID: <20150910140626.GR2191@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Vincent,

On Thu, Sep 10, 2015 at 03:00:08PM +0100, Vicente Olivert Riera wrote:
> On 09/10/2015 02:45 PM, Baruch Siach wrote:
> > On Thu, Sep 10, 2015 at 11:44:50AM +0100, Vicente Olivert Riera wrote:
> >> mtd depends on util-linux when BR2_PACKAGE_MTD_MKFSUBIFS is selected.
> >> Also, util-linux depends on gettext and will need to link with -lintl if
> >> BR2_NEEDS_GETTEXT_IF_LOCALE is selected. So, when mtd tries to link with
> >> util-linux's uuid (-luuid) it should add -lintl as well, but it fails
> >> when building statically. The uuid.pc file lists -lintl as one of the
> >> needed libraries, but since mtd package doesn't have a configure phase
> >> we can't do the following:
> >>
> >> MTD_DEPENDENCIES += host-pkgconf
> >> MTD_CONF_ENV += LIBS=`$(PKG_CONFIG_HOST_BINARY) --libs uuid"`
> > 
> > So why not something like:
> > 
> > MTD_MKFS_UBIFS_LIBS = `$(PKG_CONFIG_HOST_BINARY) --libs uuid"`
> > 
> > and use $(MTD_MKFS_UBIFS_LIBS) instead of hard coding -lintl in the sed 
> > expression.
> 
> do you mean like this?:
> 
> $(SED) '/^LDLIBS_mkfs\.ubifs/ s/$$/$$(MTD_MKFS_UBIFS_LIBS)/' $(@D)/Makefile
> 
> That will end up with the string "$(MTD_MKFS_UBIFS_LIBS)" written in the
> Makefile.

What happens when you put a single $ in $(MTD_MKFS_UBIFS_LIBS)?

> > This way you can remove the condition from the sed expression.
> 
> What condition? I don't what you mean Baruch, sorry.

The

   ifeq ($(BR2_STATIC_LIBS)$(BR2_NEEDS_GETTEXT_IF_LOCALE),yy)

condition. pkg-config should know the right answer in any case.

> If you provide a patch that it fixes the problem following a different
> approach, I would be happy to review it and test it.

I'll try doing so in the evening, if you don't beat me to it.

baruch

> >> So, in further investigations I have seen that mtd hardcodes the libs
> >> for mkfs.ubifs in the Makefile, in a variable called LDLIBS_mkfs.ubifs,
> >> and that variable can't be overwritten by passing options or environment
> >> variables to make.
> >>
> >> So, to fix the problem, we use a sed command to append -lintl to the
> >> LDLIBS_mkfs.ubifs variable only when building statically, because it's
> >> the case when it fails, and only when BR2_NEEDS_GETTEXT_IF_LOCALE is
> >> selected, because is the case when you also need -lintl when linking
> >> with util-linux.
> >>
> >> Fixes:
> >>
> >>   http://autobuild.buildroot.net/results/2dd/2ddd714446d9eb75701bd48c117dc5bbbd291a76/
> >>
> >> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> >> ---
> >>  package/mtd/mtd.mk |    6 ++++++
> >>  1 files changed, 6 insertions(+), 0 deletions(-)
> >>
> >> diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
> >> index 0fb9fc2..a34c840 100644
> >> --- a/package/mtd/mtd.mk
> >> +++ b/package/mtd/mtd.mk
> >> @@ -18,6 +18,12 @@ endif
> >>  
> >>  ifeq ($(BR2_PACKAGE_MTD_MKFSUBIFS),y)
> >>  MTD_DEPENDENCIES += util-linux zlib lzo
> >> +ifeq ($(BR2_STATIC_LIBS)$(BR2_NEEDS_GETTEXT_IF_LOCALE),yy)
> >> +define MTD_ADD_MISSING_LINTL
> >> +	$(SED) '/^LDLIBS_mkfs\.ubifs/ s/$$/ -lintl/' $(@D)/Makefile
> >> +endef
> >> +MTD_PRE_BUILD_HOOKS += MTD_ADD_MISSING_LINTL
> >> +endif
> >>  endif
> >>  
> >>  ifeq ($(BR2_PACKAGE_BUSYBOX),y)

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
