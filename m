From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 17 Dec 2013 08:58:13 +0100
Subject: [Buildroot] [PATCH] package/libgles: postpone the check for a
	missing GLES provider
In-Reply-To: <20131217071100.04b7b3a7@skate>
References: <52A730B0.3020104@orange.com> <52AA41FE.6060705@mind.be>
 <20131217071100.04b7b3a7@skate>
Message-ID: <201312170858.13393.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Tuesday 17 December 2013 07:11:00 Thomas Petazzoni wrote:
> On Fri, 13 Dec 2013 00:08:46 +0100, Arnout Vandecappelle wrote:
> > > Huh? Can you be more specific in what you find hacky? The way the
> > > OpenGL stuff is handled today is kind of becoming the norm to handle
> > > virtual packages, so it'd be good to understand what you think is
> > > hacky in this implementation.
> > 
> >   It's hacky because you have double binding between opengl/libgles
> > and the gles suppliers: opengl/libgles/libgles.mk enumerates all
> > possible suppliers, and the suppliers select
> > BR2_PACKAGE_HAS_OPENGL_ES.
> 
> Ok, I understand. Even though I don't think it's really a major issue, I
> believe there are two possible directions to fix this:
> 
>  1. Since the .mk part is centralized in opengl/libgles, but the
>     Config.in is not (spread in each OpenGL implementation doing the
>     select BR2_PACKAGE_HAS_OPENGL_ES), we can centralize the Config.in
>     logic by removing the "select BR2_PACKAGE_HAS_OPENGL_ES" in each
>     OpenGL implementation, and define BR2_PACKAGE_HAS_OPENGL_EL as
>     something like:
> 
> config BR2_PACKAGE_HAS_OPENGL_ES
> 	bool
> 	default y if BR2_PACKAGE_RPI_FIRMWARE
> 	default y if BR2_PACKAGE_THIS_OTHER_OPENGL_IMPLEMENTATION
> 	default y if BR2_PACKAGE_...

With this first proposal, it becomes a bit more complex to
implement providers in BR2_EXTERNAL.

>  2. Or, we can take the opposite route by pushing the currently
>     centralized libgles.mk logic that adds each OpenGL implementation
>     in LIBGLES_DEPENDENCIES down into each OpenGL implementation .mk
>     file. But that requires a late evaluation of $(generic-package), so
>     that all OpenGL implementations can be registered in
>     LIBGLES_DEPENDENCIES before the generic-package macro of libgles.mk
>     is evaluated. This would require something like Yann's patch.

Needless to say I would highly prefer this second solution.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +0/33 662376056 | Software  Designer | \ / CAMPAIGN     |   ^                |
| --==< O_o >==-- '------------.-------:  X  AGAINST      |  /e\  There is no  |
| http://ymorin.is-a-geek.org/ | (*_*) | / \ HTML MAIL    |  """  conspiracy.  |
'------------------------------'-------'------------------'--------------------'
