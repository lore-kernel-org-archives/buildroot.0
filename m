From: Herve Codina <herve.codina@bootlin.com>
Date: Thu, 24 Jun 2021 17:44:50 +0200
Subject: [Buildroot] [PATCH 04/15] package/pkg-generic.mk: Fix .la files
 overwrite detection
In-Reply-To: <20210622103039.GG44262@scaer>
References: <20210621141130.48654-1-herve.codina@bootlin.com>
 <20210621141130.48654-5-herve.codina@bootlin.com>
 <20210621214223.GC44262@scaer>
 <20210622113124.7cf2dde1@bootlin.com>
 <20210622095609.GD44262@scaer> <20210622121220.5d4520e2@windsurf>
 <20210622103039.GG44262@scaer>
Message-ID: <20210624174450.24fb83d4@fedora>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Tue, 22 Jun 2021 12:30:39 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> On 2021-06-22 12:12 +0200, Thomas Petazzoni spake thusly:
> > On Tue, 22 Jun 2021 11:56:09 +0200
> > "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:  
> > > Sorry, but this patch (4/15) is fixing an issue introduced by the first
> > > patch, with:  
> > I agree in principle. But here, it's really a new requirement that we
> > are adding on packages, and we *know* that even with Herv? patches
> > there will be some other packages that will need fixing.  
> 
> Sorry, but this patch is fixing the infra, not the packages.
> 
> > So to me it's not really like introducing a regression in a patch, and
> > fixing it later.  
> 
> I never said it was a regression. ;-)
> 
> > > > What about the others issues
> > > > detected ? Squash also together with the first patch ? I think it will
> > > > produce a huge patch quite complicate to understand even with all individual
> > > > commit message squashed.    
> > > 
> > > Ideally, I would say a series should first fix the issues, then
> > > introduce the tooling.  
> > 
> > No, please keep one series, but having the fixes *before* we introduce
> > the check.  
> 
> Exactly; I never said to split the series into two series. It should
> still be one.
> 
> > And as stated above, the fixes will not fix all problems,
> > they will only fix the problems we know about. More problems will be
> > detected by the autobuilders thanks to the overwrite check.  
> 
> And this is totally OK. [0]
> 
> > > > However, that being said, I can squash this patch (Fix .la files overwrite
> > > > detection) with the 1st one (detect files overwritten in TARGET_DIR and
> > > > HOST_DIR) if you still think it will be better.    
> > > 
> > > Yes, I still think that it is better.  
> > 
> > No, please don't squash, have fixes added before the overwrite check
> > instead.  
> 
> Well, I still disagree, because this patch really fixes an issue
> introduced *in the infra* by the first patch.
> 

Well, my bad.

I think that the better thing to do is to fully rework the history.
First fixing overwrites and then introducing the overwrite detection tooling
(ie the actual PATCH 1 will be moved just before actual PATCH 12 and so
actual PATCH 4 simply disappears).

The patch introducing the tooling will explain in its commit message
why the calls to fixup-libtool-files and fixup-python-files are performed
before taking the overwrite snapshot and why it is safe (sed --in-place).

The variable <PKG>_PER_PACKAGE_TWEAK_HOOKS (or other name) will be introduced
before the tooling. The patches changing some packages to use this variable
(move tweaks from <PKG>_POST_CONFIGURE_HOOKS to <PKG>_PER_PACKAGE_TWEAK_HOOKS)
will also be introduced before the tooling even if these changes really make
sense after the tooling introduction.
Indeed, the notion of action done before taking the overwrite detection
snapshot (<PKG>_PER_PACKAGE_TWEAK_HOOKS) and action done after
(<PKG>_PRE_CONFIGURE_HOOKS, configure and <PKG>_POST_CONFIGURE_HOOKS)
makes sense only with the overwrite detection tool.

Is that seem better for everyone ?


Regards,
Herv?

-- 
Herv? Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
