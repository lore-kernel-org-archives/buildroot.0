From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 5 Oct 2014 23:55:53 +0200
Subject: [Buildroot] [PATCH 2/3 v2] package/nvidia-driver: add NVidia's
 OpenGL binary blob
In-Reply-To: <20141005185914.661f0c3d@free-electrons.com>
References: <cover.1411334346.git.yann.morin.1998@free.fr>
 <07a540e8ae21ae3aa8082c0031c2a204343e891b.1411334346.git.yann.morin.1998@free.fr>
 <20141005185914.661f0c3d@free-electrons.com>
Message-ID: <20141005215553.GA10457@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-10-05 18:59 +0200, Thomas Petazzoni spake thusly:
> On Sun, 21 Sep 2014 23:22:55 +0200, Yann E. MORIN wrote:
> > diff --git a/package/nvidia-driver/Config.in b/package/nvidia-driver/Config.in
> > new file mode 100644
> > index 0000000..becb1ae
> > --- /dev/null
> > +++ b/package/nvidia-driver/Config.in
> > @@ -0,0 +1,64 @@
> > +# Note: we only require 'threads', although that might well be NPTL.
> > +# But we require (e)glibc, which nowadays only has NPTL anyway.
> > +comment "nvidia-driver needs an (e)glibc toolchain w/ threads"
> > +	depends on BR2_i386 || BR2_x86_64 || BR2_PACKAGE_NVIDIA_DRIVER_arm_OK
> > +	depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_TOOLCHAIN_HAS_THREADS
> 
> Is it possible to have a glibc toolchain without thread support?

No, it's not. I've removed that depndency on threads.

> > +# Nividia has an ARM driver, but it's only little-endian,
> > +# armv7 and gnueabihf
> > +config BR2_PACKAGE_NVIDIA_DRIVER_arm_OK
> 
> Capital letters for the entire option.
> 
> > +	bool
> > +	default y
> > +	depends on BR2_arm
> > +	depends on BR2_ARM_EABIHF
> > +	depends on BR2_cortex_a5 || BR2_cortex_a7 || BR2_cortex_a8 \
> > +		|| BR2_cortex_a9 || BR2_cortex_a12 || BR2_cortex_a15 \
> > +		|| BR2_pj4
> 
> However, I'm wondering if we should use the more traditional
> BR2_PACKAGE_NVIDIA_DRIVER_ARCH_SUPPORTS logic. Something like:
[--SNIP--]

Well, see below, I'm ditching ARM support [0]...

> Maybe it's time to introduce some kconfig booleans such as
> BR2_ARM_ARMV5, BR2_ARM_ARMV6, BR2_ARM_ARMV7, because we're duplicating
> this BR2_cortexa<foo> logic in  multiple places. Not related to this
> patch, though.

I'll see to do such a patch, but later.

[--SNIP--]
> > +	depends on BR2_TOOLCHAIN_USES_GLIBC
> > +	depends on BR2_TOOLCHAIN_HAS_THREADS
> > +	depends on BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR
> 
> Should we have a comment about this? We generally depend on just
> BR2_PACKAGE_XORG7. But agree it's a bit hard to "select" the modular
> server.

OK, I will add it.

But we do not usually provide such a comment (if what you meant was a
kconfig-comment).

[--SNIP--]
> > diff --git a/package/nvidia-driver/nvidia-driver.mk b/package/nvidia-driver/nvidia-driver.mk
> > new file mode 100644
> > index 0000000..efe3fa0
> > --- /dev/null
> > +++ b/package/nvidia-driver/nvidia-driver.mk
> > @@ -0,0 +1,92 @@
> > +################################################################################
> > +#
> > +# nvidia-driver
> > +#
> > +################################################################################
> > +
> > +NVIDIA_DRIVER_VERSION = 340.32
> > +NVIDIA_DRIVER_SUFFIX = $(if $(BR2_x86_64),_64)
> > +NVIDIA_DRIVER_SITE = ftp://download.nvidia.com/XFree86/Linux-x86$(NVIDIA_DRIVER_SUFFIX)/$(NVIDIA_DRIVER_VERSION)
> > +NVIDIA_DRIVER_SOURCE = NVIDIA-Linux-x86$(NVIDIA_DRIVER_SUFFIX)-$(NVIDIA_DRIVER_VERSION).run
> 
> Hum, and this works for ARM ? the 'x86' part of the filename would
> indicate not, but I haven't checked.

Hehe... :-)

[0] I think I'll just ditch ARM support, because I'm not able to test
it. It will always be time to add it back later, when/if someone is
interested.

[--SNIP--]
> > +NVIDIA_DRIVER_LIBS_NO_VERSION =
> Not really needed, variables are empty by default.

OK.

> > +NVIDIA_DRIVER_LIBS = libEGL libGLESv1_CM libGLESv2 libGL \
> > +		       libnvidia-glcore libnvidia-eglcore libnvidia-glsi \
> > +		       tls/libnvidia-tls \
> > +		       libvdpau libvdpau_nvidia \
> > +		       libnvidia-ml
> Only one tab for the indentation on continuation lines.

OK.

> > +ifeq ($(BR2_PACKAGE_NVIDIA_DRIVER_CUDA),y)
> > +NVIDIA_DRIVER_LIBS += libcuda libnvidia-compiler libnvcuvid libnvidia-encode
> > +endif
> > +
> > +ifeq ($(BR2_PACKAGE_NVIDIA_DRIVER_OPENCL),y)
> > +NVIDIA_DRIVER_LIBS_NO_VERSION += libOpenCL.so.1.0.0
> 
> What is special about this one to be marked "NO_VERSION" ?

Instead of repeating the $(NVIDIA_DRIVER_VERSION) for each and every
libraries, NVIDIA_DRIVER_LIBS only contains the base name of the
library, and I append the version string in a single place [1].

Unfortunately a single library does not have the NVidia version string,
so I need to treat it differently [1].

> > +NVIDIA_DRIVER_LIBS += libnvidia-opencl
> > +endif
> > +
> > +# Those libraries are 'private' libraries requiring an agreement with
> > +# NVidia to develop code for those libs. There seems to be no restriction
> > +# on using those libraries (e.g. if the user has such an agreement, or
> > +# wants to run a third-party program developped under such an agreement).
> > +ifeq ($(BR2_PACKAGE_NVIDIA_DRIVER_PRIVATE_LIBS),y)
> > +NVIDIA_DRIVER_LIBS += libnvidia-ifr libnvidia-fbc
> > +endif
> > +
> > +# We refer to the destination path; the origin file has no directory component
> > +NVIDIA_DRIVER_X_MODS = drivers/nvidia_drv.so \
> > +			 extensions/libglx.so.$(NVIDIA_DRIVER_VERSION) \
> > +			 libnvidia-wfb.so.$(NVIDIA_DRIVER_VERSION)
> Ditto.

Ditto what?

They are Xorg drivers, not traditional libraries. They go to specific
places.

> > +# The downloaded archive is in fact an auto-extract script. So, it can run
> > +# virtually everywhere, and it is fine enough to provide useful options.
> > +# Except it can't extract into an existing (even empty) directory.
> > +define NVIDIA_DRIVER_EXTRACT_CMDS
> > +	$(SHELL) $(DL_DIR)/$(NVIDIA_DRIVER_SOURCE) --extract-only --target $(@D)/foo
> > +	mv $(@D)/foo/* $(@D)/foo/.manifest $(@D)
> > +	rm -rf $(@D)/foo
> Is 'foo' the right temporary name ? :-)

If that can make you happier, I'll rename. :-)

> > +endef
> > +
> > +# Helper to install libraries
> > +# $1: destination directory (target or staging)
> > +define NVIDIA_DRIVER_INSTALL_LIBS
> > +	for lib in $(patsubst %,%.so.$(NVIDIA_DRIVER_VERSION),$(NVIDIA_DRIVER_LIBS)) \
> > +	           $(NVIDIA_DRIVER_LIBS_NO_VERSION); \

[1] here.

> > +	do \
> > +		$(INSTALL) -v -D -m 0644 $(@D)/$${lib} $(1)/usr/lib/$${lib##*/}; \
> > +		n="$$( $(TARGET_READELF) -d "$(@D)/$${lib}" \
> > +		       |sed -r -e '/.*\(SONAME\).*\[(.*)\]$$/!d; s//\1/;' )"; \
> > +		if [ -n "$${n}" -a "$${n}" != "$${lib##*/}" ]; then \
> > +			ln -sfv $${lib##*/} $(1)/usr/lib/$${n}; \
> > +		fi; \
> > +		n="$${lib##*/}"; n="$${n/.so*}.so"; \
> > +		if [ -n "$${n}" -a "$${n}" != "$${lib##*/}" ]; then \
> > +			ln -sfv $${lib##*/} $(1)/usr/lib/$${n}; \
> > +		fi; \
> > +	done
> 
> Wow. This is a *lot* of $ and # signs. Do we really need to do all that
> stuff, looking at the SONAME and so on?

Ah! Glad you asked! :-)

Take this library for example: libnvidia-opencl.so.340.46. Its SONAME is
in fact libnvidia-opencl.so.1 so we need it to be named like that on the
target, or it would fail at run time.

Also, we need the short symlink, or we can't link at build time.

> At the very least, some comments would be good to have. But a simpler
> solution would be even better :-)

I'll see what I can do. Probably, add a big fat comment explaining
what's going on. My bad, I was all too hapy to submit this patch, which
took quite some work already. And takes even some more yet again. :-)

> > +endef
> > +
> > +# For staging, install libraries and development files
> > +define NVIDIA_DRIVER_INSTALL_STAGING_CMDS
> > +	$(call NVIDIA_DRIVER_INSTALL_LIBS,$(STAGING_DIR))
> > +	$(INSTALL) -v -D -m 0644 $(@D)/libGL.la $(STAGING_DIR)/usr/lib/libGL.la
> Why -v ?

Leffover debug stuff.

> > +	$(SED) 's/-L[^[:space:]]\+//' $(STAGING_DIR)/usr/lib/libGL.la
> Do we really need to install the .la file here?

Yes, it is needed (can't remember why, I added it because something else
failed to build).

> > +endef
> > +
> > +# For target, install libraries and X.org modules
> > +define NVIDIA_DRIVER_INSTALL_TARGET_CMDS
> > +	$(call NVIDIA_DRIVER_INSTALL_LIBS,$(TARGET_DIR))
> > +	for m in $(NVIDIA_DRIVER_X_MODS); do \
> > +		 $(INSTALL) -v -D -m 0644 $(@D)/$${m##*/} \
> > +					  $(TARGET_DIR)/usr/lib/xorg/modules/$${m}; \
> 
> Less indentation for the continuation line, and no -v option for
> $(INSTALL).

OK. Ditto, debug stuff.

Thank you! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
