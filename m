From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Dec 2013 07:11:00 +0100
Subject: [Buildroot] [PATCH] package/libgles: postpone the check for a
 missing GLES provider
In-Reply-To: <52AA41FE.6060705@mind.be>
References: <52A730B0.3020104@orange.com>
 <1386702439-10093-2-git-send-email-yann.morin.1998@free.fr>
 <52A842A3.3010302@mind.be>
 <201312111325.49600.yann.morin.1998@free.fr>
 <52A862B4.50103@orange.com> <52A8710F.7040406@orange.com>
 <52AA31F2.8070900@mind.be> <20131212231338.33eae486@skate>
 <52AA41FE.6060705@mind.be>
Message-ID: <20131217071100.04b7b3a7@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Fri, 13 Dec 2013 00:08:46 +0100, Arnout Vandecappelle wrote:

> > Huh? Can you be more specific in what you find hacky? The way the
> > OpenGL stuff is handled today is kind of becoming the norm to handle
> > virtual packages, so it'd be good to understand what you think is
> > hacky in this implementation.
> 
>   It's hacky because you have double binding between opengl/libgles
> and the gles suppliers: opengl/libgles/libgles.mk enumerates all
> possible suppliers, and the suppliers select
> BR2_PACKAGE_HAS_OPENGL_ES.

Ok, I understand. Even though I don't think it's really a major issue, I
believe there are two possible directions to fix this:

 1. Since the .mk part is centralized in opengl/libgles, but the
    Config.in is not (spread in each OpenGL implementation doing the
    select BR2_PACKAGE_HAS_OPENGL_ES), we can centralize the Config.in
    logic by removing the "select BR2_PACKAGE_HAS_OPENGL_ES" in each
    OpenGL implementation, and define BR2_PACKAGE_HAS_OPENGL_EL as
    something like:

config BR2_PACKAGE_HAS_OPENGL_ES
	bool
	default y if BR2_PACKAGE_RPI_FIRMWARE
	default y if BR2_PACKAGE_THIS_OTHER_OPENGL_IMPLEMENTATION
	default y if BR2_PACKAGE_...

 2. Or, we can take the opposite route by pushing the currently
    centralized libgles.mk logic that adds each OpenGL implementation
    in LIBGLES_DEPENDENCIES down into each OpenGL implementation .mk
    file. But that requires a late evaluation of $(generic-package), so
    that all OpenGL implementations can be registered in
    LIBGLES_DEPENDENCIES before the generic-package macro of libgles.mk
    is evaluated. This would require something like Yann's patch.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
 
