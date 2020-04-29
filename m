From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 29 Apr 2020 22:53:15 +0200
Subject: [Buildroot] [PATCH 2/2] package/cegui: select libglu when libgl
 is detected
In-Reply-To: <20200428195844.48124-2-b.bilas@grinn-global.com>
References: <20200428195844.48124-1-b.bilas@grinn-global.com>
 <20200428195844.48124-2-b.bilas@grinn-global.com>
Message-ID: <20200429225315.5d39a390@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Adding Bernd for libglew/libglu questions.

On Tue, 28 Apr 2020 21:58:44 +0200
Bartosz Bilas <b.bilas@grinn-global.com> wrote:

> Fixes:
>   include/GL/glew.h:1205:14: fatal error: GL/glu.h: No such file or directory
> 
> Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>

This should not be solved inside cegui: it's the glew.h header that
includes GL/glu.h, so from the look of it, glew should depend on glu.

However, it turns out that glew has a GLEW_NO_GLU flag:

#ifndef GLEW_NO_GLU
/* this is where we can safely include GLU */
#  if defined(__APPLE__) && defined(__MACH__)
#    include <OpenGL/glu.h>
#  else
#    include <GL/glu.h>
#  endif
#endif

I'm not sure how we should use that GLEW_NO_GLU flag. Should it be the
responsibility of the package using glew to define it?

Could you do a bit of research on this?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
