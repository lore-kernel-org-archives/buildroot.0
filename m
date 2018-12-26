From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 26 Dec 2018 09:00:49 +0100
Subject: [Buildroot] [PATCH v3 1/1] package/meson: fix cpu_family format
In-Reply-To: <20181225185624.GL2703@scaer>
References: <1545002062-20630-1-git-send-email-james.hilliard1@gmail.com>
 <20181225185624.GL2703@scaer>
Message-ID: <20181226080049.GA14286@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

James, All,

On 2018-12-25 19:56 +0100, Yann E. MORIN spake thusly:
> On 2018-12-17 07:14 +0800, james.hilliard1 at gmail.com spake thusly:
> > From: James Hilliard <james.hilliard1@gmail.com>
> > 
> > Meson expects the cpu_family to be in a specific format for
> > cross compilation, otherwise packages that use cpu_family
> > detection may fail to build.
> 
> As explained in:
>     https://mesonbuild.com/Reference-tables.html#cpu-families
> 
> > We also need to set needs_exe_wrapper = true to ensure that
> > meson won't try and execute test binaries.
> 
> As explained in:
>     https://mesonbuild.com/Cross-compilation.html
> 
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Well, now I think this should have really been two patches, like Thomas
initially suggested:

 1- prevent meson from ever thinking it can run what it builds, and so
    add needs_exe_wrapper on its own, because we may already have that
    situation today (e.g. x86_64 targetting x86_64)

 2- add the CPU fix on a second patch, which can safely be applied now
    that meson will never try to run what it builds.

Besides, you forgot, in your systemd-boot series, to specify that this
patch was required first. But I'll reply further in that series...

Regards,
Yann E. MORIN.

> Regards,
> Yann E. MORIN.
> 
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> > Changes v1 -> v2:
> >   - change riscv to 64 bit
> > 
> > Changes v2 -> v3:
> >   - combine HOST_MESON_TARGET_CPU_FAMILY archs
> > ---
> >  package/meson/cross-compilation.conf.in |  1 +
> >  package/meson/meson.mk                  | 31 ++++++++++++++++++++++++++++++-
> >  2 files changed, 31 insertions(+), 1 deletion(-)
> > 
> > diff --git a/package/meson/cross-compilation.conf.in b/package/meson/cross-compilation.conf.in
> > index 0eec740..fc8e27f 100644
> > --- a/package/meson/cross-compilation.conf.in
> > +++ b/package/meson/cross-compilation.conf.in
> > @@ -11,6 +11,7 @@ strip = '@TARGET_CROSS at strip'
> >  pkgconfig = '@HOST_DIR@/usr/bin/pkg-config'
> >  
> >  [properties]
> > +needs_exe_wrapper = true
> >  c_args = [@TARGET_CFLAGS@]
> >  c_link_args = [@TARGET_LDFLAGS@]
> >  cpp_args = [@TARGET_CXXFLAGS@]
> > diff --git a/package/meson/meson.mk b/package/meson/meson.mk
> > index e1675c2..1113bf0 100644
> > --- a/package/meson/meson.mk
> > +++ b/package/meson/meson.mk
> > @@ -16,6 +16,35 @@ HOST_MESON_NEEDS_HOST_PYTHON = python3
> >  HOST_MESON_TARGET_ENDIAN = $(call LOWERCASE,$(BR2_ENDIAN))
> >  HOST_MESON_TARGET_CPU = $(GCC_TARGET_CPU)
> >  
> > +# https://mesonbuild.com/Reference-tables.html#cpu-families
> > +ifeq ($(BR2_arcle)$(BR2_arceb),y)
> > +HOST_MESON_TARGET_CPU_FAMILY = arc
> > +else ifeq ($(BR2_arm)$(BR2_armeb),y)
> > +HOST_MESON_TARGET_CPU_FAMILY = arm
> > +else ifeq ($(BR2_aarch64)$(BR2_aarch64_be),y)
> > +HOST_MESON_TARGET_CPU_FAMILY = aarch64
> > +else ifeq ($(BR2_i386),y)
> > +HOST_MESON_TARGET_CPU_FAMILY = x86
> > +else ifeq ($(BR2_mips)$(BR2_mipsel),y)
> > +HOST_MESON_TARGET_CPU_FAMILY = mips
> > +else ifeq ($(BR2_mips64)$(BR2_mips64el),y)
> > +HOST_MESON_TARGET_CPU_FAMILY = mips64
> > +else ifeq ($(BR2_powerpc),y)
> > +HOST_MESON_TARGET_CPU_FAMILY = ppc
> > +else ifeq ($(BR2_powerpc64)$(BR2_powerpc64le),y)
> > +HOST_MESON_TARGET_CPU_FAMILY = ppc64
> > +else ifeq ($(BR2_riscv),y)
> > +HOST_MESON_TARGET_CPU_FAMILY = riscv64
> > +else ifeq ($(BR2_sparc),y)
> > +HOST_MESON_TARGET_CPU_FAMILY = sparc
> > +else ifeq ($(BR2_sparc64),y)
> > +HOST_MESON_TARGET_CPU_FAMILY = sparc64
> > +else ifeq ($(BR2_x86_64),y)
> > +HOST_MESON_TARGET_CPU_FAMILY = x86_64
> > +else
> > +HOST_MESON_TARGET_CPU_FAMILY = $(ARCH)
> > +endif
> > +
> >  HOST_MESON_SED_CFLAGS = $(if $(TARGET_CFLAGS),`printf '"%s"$(comma) ' $(TARGET_CFLAGS)`)
> >  HOST_MESON_SED_LDFLAGS = $(if $(TARGET_LDFLAGS),`printf '"%s"$(comma) ' $(TARGET_LDFLAGS)`)
> >  HOST_MESON_SED_CXXFLAGS = $(if $(TARGET_CXXFLAGS),`printf '"%s"$(comma) ' $(TARGET_CXXFLAGS)`)
> > @@ -23,7 +52,7 @@ HOST_MESON_SED_CXXFLAGS = $(if $(TARGET_CXXFLAGS),`printf '"%s"$(comma) ' $(TARG
> >  define HOST_MESON_INSTALL_CROSS_CONF
> >  	mkdir -p $(HOST_DIR)/etc/meson
> >  	sed -e "s%@TARGET_CROSS@%$(TARGET_CROSS)%g" \
> > -	    -e "s%@TARGET_ARCH@%$(ARCH)%g" \
> > +	    -e "s%@TARGET_ARCH@%$(HOST_MESON_TARGET_CPU_FAMILY)%g" \
> >  	    -e "s%@TARGET_CPU@%$(HOST_MESON_TARGET_CPU)%g" \
> >  	    -e "s%@TARGET_ENDIAN@%$(HOST_MESON_TARGET_ENDIAN)%g" \
> >  	    -e "s%@TARGET_CFLAGS@%$(HOST_MESON_SED_CFLAGS)%g" \
> > -- 
> > 2.7.4
> > 
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
> 
> -- 
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
