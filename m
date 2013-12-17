From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Dec 2013 10:04:14 +0100
Subject: [Buildroot] [PATCH] package/libgles: postpone the check for a
 missing GLES provider
In-Reply-To: <201312170858.13393.yann.morin.1998@free.fr>
References: <52A730B0.3020104@orange.com> <52AA41FE.6060705@mind.be>
 <20131217071100.04b7b3a7@skate>
 <201312170858.13393.yann.morin.1998@free.fr>
Message-ID: <20131217100414.551a3832@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Tue, 17 Dec 2013 08:58:13 +0100, Yann E. MORIN wrote:

> >  1. Since the .mk part is centralized in opengl/libgles, but the
> >     Config.in is not (spread in each OpenGL implementation doing the
> >     select BR2_PACKAGE_HAS_OPENGL_ES), we can centralize the
> > Config.in logic by removing the "select BR2_PACKAGE_HAS_OPENGL_ES"
> > in each OpenGL implementation, and define BR2_PACKAGE_HAS_OPENGL_EL
> > as something like:
> > 
> > config BR2_PACKAGE_HAS_OPENGL_ES
> > 	bool
> > 	default y if BR2_PACKAGE_RPI_FIRMWARE
> > 	default y if BR2_PACKAGE_THIS_OTHER_OPENGL_IMPLEMENTATION
> > 	default y if BR2_PACKAGE_...
> 
> With this first proposal, it becomes a bit more complex to
> implement providers in BR2_EXTERNAL.

Ah, true.

> >  2. Or, we can take the opposite route by pushing the currently
> >     centralized libgles.mk logic that adds each OpenGL
> > implementation in LIBGLES_DEPENDENCIES down into each OpenGL
> > implementation .mk file. But that requires a late evaluation of
> > $(generic-package), so that all OpenGL implementations can be
> > registered in LIBGLES_DEPENDENCIES before the generic-package macro
> > of libgles.mk is evaluated. This would require something like
> > Yann's patch.
> 
> Needless to say I would highly prefer this second solution.

Right. In principle, I have nothing against this solution. It's just
that I am not sure to fully grasp the consequences of the change you're
proposing. I'm a bit worried about "weird" consequences that we may not
be thinking of at this time. But maybe we should simply apply the
patch, and see if it causes problems for some specific use cases.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
