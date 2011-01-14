From: Michael S. Zick <minimod@morethan.org>
Date: Fri, 14 Jan 2011 07:31:28 -0600
Subject: [Buildroot] freetype: fix for multilib toolchain
In-Reply-To: <AANLkTi=4rF27ON=McqUWPnM3g7JrjBtGto2q3rMrNKbG@mail.gmail.com>
References: <BAY145-w16379D55CDD8378B320C74C2F30@phx.gbl>
	<20110114091129.13d810c8@surf>
	<AANLkTi=4rF27ON=McqUWPnM3g7JrjBtGto2q3rMrNKbG@mail.gmail.com>
Message-ID: <201101140731.30909.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri January 14 2011, Bj?rn Forsman wrote:
> Hi,
> 
> On 14 January 2011 09:11, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
> > Hello Matt,
> >
> > On Thu, 13 Jan 2011 21:18:33 -0700
> > Matt Johnson <mj1856@hotmail.com> wrote:
> >
> >> FreeType's makefile needs to have the architecture (example, -march=armv4t) passed in the LDFLAGS in order to work properly with a multilib toolchain, like CodeSourcery. ?This is the easiest way I could think of to do it. ?Tested and works.
> >
> > The description of your patch should be wrapped at ~80 columns.
> >
> >> Signed-off-by: Matt Johnson <mj1856@hotmail.com>
> >> ---
> >> ?package/freetype/freetype.mk | ? ?1 +
> >> ?1 files changed, 1 insertions(+), 0 deletions(-)
> >> diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
> >> index ad4292f..7e59b57 100644
> >> --- a/package/freetype/freetype.mk
> >> +++ b/package/freetype/freetype.mk
> >> @@ -8,6 +8,7 @@ FREETYPE_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/
> >> ?FREETYPE_SOURCE = freetype-$(FREETYPE_VERSION).tar.bz2
> >> ?FREETYPE_INSTALL_STAGING = YES
> >> ?FREETYPE_INSTALL_TARGET = YES
> >> +FREETYPE_CONF_ENV = LDFLAGS="-march=$(CC_TARGET_ARCH_) $(TARGET_LDFLAGS)"
> >
> > I am not sure I want to see this fixed this way. It looks like the
> > issue reported by Divick Kishore on sshd is similar: we need to pass
> > the -march argument in the LDFLAGS for all packages.
> >
> > So probably we should rather adjust TARGET_LDFLAGS globally (its
> > definition is in package/Makefile.in) so that it contains the
> > appropriate -march.
> 
> AFAIK, ld does not have an "-march" option (just looked at the man page).
> So I'd say that it is the freetype (and sshd?) package that needs to be fixed
> (and not BR) because they are using LDFLAGS wrong.
> 

Hmm...
there may be another source of confusion at work here also -
not one that changes the conclusion (fix is outside of BR).

First assumption: you are calling the "executable --help" function
rather than relying on "man" grabbing the correct man page 
on a machine with multiple tool chains installed.

I am basing this post on what I see from the Code Sourcery tool chain
builds for MIPS (mips-sde-elf-ld --help and mips-linux-gnu-ld --help) -
These tool chains are multi-lib configured tool chains.

I see a: 
-A ARCH to set the architecture
and a:
-m EMULATION to set the emulation

So it is possible for some processing grabbing the LDFLAGS and
translating an entry of "-march=..." (perhaps in the sshd and freetype
makefile author's build system) (I.E: ld being accessed via "gcc" front-end).

Which might account for the post's report of changing that option
fixing an observed problem. A vendor tool chain may be doing that conversion.

Four of the Code Sourcery, re-distributable, versions (for MIPS) are mirrored
from pages linked at the index page here:
http://mirrors.minimodding.com/index.html#menu-c
In case anyone needs to poke at possible vendor provided option processing.

Mike


> Best regards,
> Bj?rn Forsman
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
