From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 10 Sep 2015 23:26:26 +0300
Subject: [Buildroot] [PATCH] mtd: add missing -lintl from util-linux
 when building statically
In-Reply-To: <55F190CE.9000501@imgtec.com>
References: <1441881890-6521-1-git-send-email-Vincent.Riera@imgtec.com>
 <20150910134556.GQ2191@tarshish> <55F18CE8.5090909@imgtec.com>
 <20150910140626.GR2191@tarshish> <55F190CE.9000501@imgtec.com>
Message-ID: <20150910202626.GA1822@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Vincent,

On Thu, Sep 10, 2015 at 03:16:46PM +0100, Vicente Olivert Riera wrote:
> On 09/10/2015 03:06 PM, Baruch Siach wrote:
> > On Thu, Sep 10, 2015 at 03:00:08PM +0100, Vicente Olivert Riera wrote:
> >> On 09/10/2015 02:45 PM, Baruch Siach wrote:
> >>> On Thu, Sep 10, 2015 at 11:44:50AM +0100, Vicente Olivert Riera wrote:
> >>>> mtd depends on util-linux when BR2_PACKAGE_MTD_MKFSUBIFS is selected.
> >>>> Also, util-linux depends on gettext and will need to link with -lintl if
> >>>> BR2_NEEDS_GETTEXT_IF_LOCALE is selected. So, when mtd tries to link with
> >>>> util-linux's uuid (-luuid) it should add -lintl as well, but it fails
> >>>> when building statically. The uuid.pc file lists -lintl as one of the
> >>>> needed libraries, but since mtd package doesn't have a configure phase
> >>>> we can't do the following:
> >>>>
> >>>> MTD_DEPENDENCIES += host-pkgconf
> >>>> MTD_CONF_ENV += LIBS=`$(PKG_CONFIG_HOST_BINARY) --libs uuid"`
> >>>
> >>> So why not something like:
> >>>
> >>> MTD_MKFS_UBIFS_LIBS = `$(PKG_CONFIG_HOST_BINARY) --libs uuid"`
> >>>
> >>> and use $(MTD_MKFS_UBIFS_LIBS) instead of hard coding -lintl in the sed 
> >>> expression.
> >>
> >> do you mean like this?:
> >>
> >> $(SED) '/^LDLIBS_mkfs\.ubifs/ s/$$/$$(MTD_MKFS_UBIFS_LIBS)/' $(@D)/Makefile
> >>
> >> That will end up with the string "$(MTD_MKFS_UBIFS_LIBS)" written in the
> >> Makefile.
> > 
> > What happens when you put a single $ in $(MTD_MKFS_UBIFS_LIBS)?
> 
> It fails with an error like this one:
> 
> >>> mtd 1.5.2 Building
> /bin/sed -i -e '/^LDLIBS_mkfs\.ubifs/ s/$/
> "`/br/output/host/usr/bin/pkg-config --libs uuid`"/'
> /br/output/build/mtd-1.5.2/Makefile
> /bin/sed: -e expression #1, char 31: unknown option to `s'
> make: *** [/br/output/build/mtd-1.5.2/.stamp_built] Error 1

The problem is that you need to use $(shell ...) when you want make to do 
command substitution. Also, since the output of pkg-config might include a 
library path with the '/' directory separator, you need to use a different 
character to delimit the sed 's' command. Please see 
http://patchwork.ozlabs.org/patch/516419/ for my suggested solution.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
