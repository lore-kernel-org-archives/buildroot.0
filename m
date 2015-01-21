From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Wed, 21 Jan 2015 18:42:36 +0100
Subject: [Buildroot] [PATCH 04/11 v5] package/opengl-registry: new
	package
In-Reply-To: <20150121173454.GC4375@free.fr>
References: <cover.1421699898.git.yann.morin.1998@free.fr>
 <1509892.j25xWyjvC8@aquila> <20150121173454.GC4375@free.fr>
Message-ID: <2535907.v7RVCGVWil@aquila>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wednesday 21 January 2015 18:34:54 Yann E. MORIN wrote:
> J?r^ome, All,
> 
> On 2015-01-20 14:51 +0100, J?r?me Pouiller spake thusly:
> > On Monday 19 January 2015 21:40:34 Yann E. MORIN wrote:
> > > The OpenGL Registry provides all GL headers, save for gl.h itself. We
> > > vampirise the one from mesa3d (at the version we currently package),
> > > which is as good as any other.
> > > 
> > > Those headers are needed when an OpenGL/EGL/GLES implementation does
> > > not provide its own headers, like the NVidia binary blob (to come in
> > > follow-up patches.)
> > > 
> > > Note that, even though this is a generic package, and we could
> > > everything in the BUILD_CMDS, we decided to split the tweaking of glx.h
> > > in a post-build script, to really make it clear we are tweaking a
> > > generated file.
> > > 
> > > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > [...]
> > 
> > > +# Always install gl.h since the others may depend on it, and
> > > +# we are sure at least one OpenGL variants will be installed.
> > > +define OPENGL_REGISTRY_INSTALL_STAGING_CMDS
> > > +	$(INSTALL) -D -m 0644 package/opengl/khronos-registry/opengl-registry/gl.h \
> > > +		   $(STAGING_DIR)/usr/include/GL/gl.h
> > > +	for d in $(OPENGL_REGISTRY_DIRS); do \
> > > +		for h in $(@D)/$${d}/*.h; do \
> > > +			$(INSTALL) -D -m 0644 $${h} $(STAGING_DIR)/usr/include/$${d}/$${h##*/} \
> > > +			|| exit 1; \
> > > +		done \
> > > +	done
> > > +endef
> > I think we should also provide gl.pc, egl.pc, glesv1_cm.pc, etc... no?
> 
> I think the providers of the GL libraries are to provide the .pc files,
> because only them know what they really depend on.
> 
> For example, the Rpi stuff wants to link with -lvcos for example, while
> the iMX6 may want to link with -limx6-hal  (for example), so we can not
> provide the .pc files from the registry, which only installs headers.
I agree, but you don't either provide with nvidia-driver, no?

> (but it seems you did just that in your series, right?)
Yep.


-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
