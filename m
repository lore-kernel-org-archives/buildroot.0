From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Tue, 20 Jan 2015 14:51:40 +0100
Subject: [Buildroot] [PATCH 04/11 v5] package/opengl-registry: new
	package
In-Reply-To: <a262173c20d1679301970131f119c65bc916d8be.1421699898.git.yann.morin.1998@free.fr>
References: <cover.1421699898.git.yann.morin.1998@free.fr>
 <a262173c20d1679301970131f119c65bc916d8be.1421699898.git.yann.morin.1998@free.fr>
Message-ID: <1509892.j25xWyjvC8@aquila>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann,

On Monday 19 January 2015 21:40:34 Yann E. MORIN wrote:
> The OpenGL Registry provides all GL headers, save for gl.h itself. We
> vampirise the one from mesa3d (at the version we currently package),
> which is as good as any other.
> 
> Those headers are needed when an OpenGL/EGL/GLES implementation does
> not provide its own headers, like the NVidia binary blob (to come in
> follow-up patches.)
> 
> Note that, even though this is a generic package, and we could
> everything in the BUILD_CMDS, we decided to split the tweaking of glx.h
> in a post-build script, to really make it clear we are tweaking a
> generated file.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[...]

> +# Always install gl.h since the others may depend on it, and
> +# we are sure at least one OpenGL variants will be installed.
> +define OPENGL_REGISTRY_INSTALL_STAGING_CMDS
> +	$(INSTALL) -D -m 0644 package/opengl/khronos-registry/opengl-registry/gl.h \
> +		   $(STAGING_DIR)/usr/include/GL/gl.h
> +	for d in $(OPENGL_REGISTRY_DIRS); do \
> +		for h in $(@D)/$${d}/*.h; do \
> +			$(INSTALL) -D -m 0644 $${h} $(STAGING_DIR)/usr/include/$${d}/$${h##*/} \
> +			|| exit 1; \
> +		done \
> +	done
> +endef
I think we should also provide gl.pc, egl.pc, glesv1_cm.pc, etc... no?

-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
