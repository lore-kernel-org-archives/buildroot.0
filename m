From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Fri, 20 Feb 2015 13:39:55 +0100
Subject: [Buildroot] [PATCH 03/10 v7] package/mesa3d-headers: new package
In-Reply-To: <20150211180201.GB4003@free.fr>
References: <cover.1423597914.git.yann.morin.1998@free.fr>
 <20150211150602.7fbe2f38@nserafini-N550JK> <20150211180201.GB4003@free.fr>
Message-ID: <4515429.pQa1GoOtyN@ursae>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann, Nicolas,

On Wednesday 11 February 2015 19:02:01 Yann E. MORIN wrote:
> Nicolas, All,
> 
> On 2015-02-11 15:06 +0100, Nicolas Serafini spake thusly:
> > I have done some build tests with the nvidia-tegra packages and opengl
> > support.
> > 
> > I was able to build QT5 with opengl without problem but I get errors
> > with QT4.
> > 
> > This is a known problem of QT4 with the inclusion of eglplatform.h
> > inside which there is an inclusion of X11 headers.
> 
> I'm not sure I understand. Is that an known issue because of Buildroot,
> or is that a known issue that also happens outside Buildroot?
> 
> I mean: is that problem caused by Buildroot?
> 
> > The result is that we have some conflicting #define. For me this can be
> > resolved by adding several #undef at the end of eglplatform.h.
> > 
> > Here is the end of my eglplatform.h header
> > 
> >  typedef khronos_int32_t EGLint;
> > 
> >  #undef None
> >  #undef KeyPress
> >  #undef KeyRelease
> >  #undef FocusIn
> >  #undef FocusOut
> >  #undef FontChange
> >  #undef CursorShape
> >  #undef Bool
> >  #undef Status
> >  #undef Unsorted
> >  #undef GrayScale
> >  #undef Expose
> >  
> >  #endif /* __eglplatform_h */
> 
> Well, I'm not too fond of patching those headers.
> 
> I do not completely grok all the inter-relations between X, egl and all
> the other stuff, so I'd prefer we do not have such hack, especially if
> the answer to my question aboce is that the issue is not caused by
> Buildroot.
I think you can compile Qt4 by passing -DMESA_EG_NO_X11_HEADERS to Qt cflags. 
However, I think the result will not work.


MESA_EG_NO_X11_HEADERS should be defined in egl.pc by your OpenGL provider. 
However, some OpenGL driver only provide support EGL under Xorg (as it is the 
case for Nvidia driver). So, in this case, you just cannot compile Qt4 w/ 
OpenGL ES with this driver.

I think it should also fail if you enable mesa3d + xorg + qt4/opengles, no?


BR,

-- 
J?r?me Pouiller
