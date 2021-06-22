From: Herve Codina <herve.codina@bootlin.com>
Date: Tue, 22 Jun 2021 10:43:43 +0200
Subject: [Buildroot] [PATCH 03/15] package/pkg-generic.mk: Remove Info
 documents dir entry
In-Reply-To: <20210621225120.536cd758@windsurf>
References: <20210621141130.48654-1-herve.codina@bootlin.com>
 <20210621141130.48654-4-herve.codina@bootlin.com>
 <20210621225120.536cd758@windsurf>
Message-ID: <20210622104343.0c5ea063@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Mon, 21 Jun 2021 22:51:20 +0200
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> On Mon, 21 Jun 2021 16:11:18 +0200
> Herve Codina <herve.codina@bootlin.com> wrote:
> 
> > Some packages (autotools for instance) install documentation
> > files using install-info. This program adds an entry in
> > the Info directory file (share/info/dir) and this causes
> > TARGET_DIR and/or HOST_DIR overwrite.
> > 
> > In order to avoid this overwrite this patch removes the Info
> > directory file right after any installation.
> > 
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > ---
> >  package/pkg-generic.mk | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> > index bb9ff4150a..2499c94746 100644
> > --- a/package/pkg-generic.mk
> > +++ b/package/pkg-generic.mk
> > @@ -280,6 +280,7 @@ $(BUILD_DIR)/%/.stamp_host_installed:
> >  	$(foreach hook,$($(PKG)_PRE_INSTALL_HOOKS),$(call $(hook))$(sep))
> >  	+$($(PKG)_INSTALL_CMDS)
> >  	$(foreach hook,$($(PKG)_POST_INSTALL_HOOKS),$(call $(hook))$(sep))
> > +	$(Q) rm -f $(HOST_DIR)/share/info/dir  
> 
> No space between $(Q) and rm. This should perhaps use $(RM) in fact.

Space removed

> 
> However, I'm not a huge fan of having this right in the middle of the
> infrastructure. It feels like a small detail that gets handled in the
> middle of super generic infrastructure code.
> 
> The issue is that I don't really have a good alternative proposal :-/

Maybe using a macro defined closed to fixup-libtool-files and calling
this macro here instead of '$(Q)rm ...' will help.
Do you think it will
be better ?

> 
> Instead of removing that file, ignore it in the overwrite detection,
> perhaps?

This add a little complexity in overwrite detection (filter out) and
I prefer having overwrite detection quite stupid. It checks for
overwrites without any exception.
Adding exception now in the detection mechanism is opening the door to
more and more exceptions.

Herv?

-- 
Herv? Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
