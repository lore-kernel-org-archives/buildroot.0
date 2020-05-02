From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 2 May 2020 11:39:43 +0200
Subject: [Buildroot] [PATCH 2/2] package/cegui: select libglu when libgl
 is detected
In-Reply-To: <605471f7-f313-6c79-af48-a36b928013f3@grinn-global.com>
References: <20200428195844.48124-1-b.bilas@grinn-global.com>
 <20200428195844.48124-2-b.bilas@grinn-global.com>
 <20200429225315.5d39a390@windsurf.home>
 <605471f7-f313-6c79-af48-a36b928013f3@grinn-global.com>
Message-ID: <20200502113943.6d9dfe49@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 30 Apr 2020 21:54:15 +0200
Bartosz Bilas <b.bilas@grinn-global.com> wrote:

> >> Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>  
> > This should not be solved inside cegui: it's the glew.h header that
> > includes GL/glu.h, so from the look of it, glew should depend on glu.  
> 
> Are you sure? There is a couple of packages which have similar fix such as:
> 
> package/ogre/Config.in:??? select BR2_PACKAGE_LIBGLU # GL/glu.h
> package/supertux/Config.in:??? select BR2_PACKAGE_LIBGLU # GL/glu.h
> package/lugaru/Config.in:?? ?select BR2_PACKAGE_LIBGLU # GL/glu.h

And these packages are similarly wrong I believe. And yes, I am sure,
see the code below:

> > However, it turns out that glew has a GLEW_NO_GLU flag:
> >
> > #ifndef GLEW_NO_GLU
> > /* this is where we can safely include GLU */
> > #  if defined(__APPLE__) && defined(__MACH__)
> > #    include <OpenGL/glu.h>
> > #  else
> > #    include <GL/glu.h>
> > #  endif
> > #endif

This clearly shows that glew is including <GL/glu.h>. So it should be
the responsibility of glew to depend on glu, or to make it properly
optional by defining GLEW_NO_GLU.

Hopefully Bernd will be able to comment on this.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
