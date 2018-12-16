From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 16 Dec 2018 10:31:46 +0200
Subject: [Buildroot] [PATCH 1/1] package/meson: fix cpu_family format
In-Reply-To: <CADvTj4o_UCq4xBgE9A_S+zN2uVduiCwmRxZ3BUBGeeOKROAmAQ@mail.gmail.com>
References: <1544944395-2049-1-git-send-email-james.hilliard1@gmail.com>
 <87tvjdapl8.fsf@tkos.co.il>
 <CADvTj4o_UCq4xBgE9A_S+zN2uVduiCwmRxZ3BUBGeeOKROAmAQ@mail.gmail.com>
Message-ID: <87pnu1an4d.fsf@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi James,

James Hilliard writes:
> On Sun, Dec 16, 2018 at 12:38 AM Baruch Siach <baruch@tkos.co.il> wrote:
>> james.hilliard1 at gmail.com writes:
>> > From: James Hilliard <james.hilliard1@gmail.com>
>> >
>> > Meson expects the cpu_family to be in a specific format for
>> > cross compilation, otherwise packages that use cpu_family
>> > detection may fail to build.
>> >
>> > We also need to set needs_exe_wrapper = true to ensure that
>> > meson won't try and execute test binaries.
>> >
>> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>> > ---
>> >  package/meson/cross-compilation.conf.in |  1 +
>> >  package/meson/meson.mk                  | 43 ++++++++++++++++++++++++++++++++-
>> >  2 files changed, 43 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/package/meson/cross-compilation.conf.in b/package/meson/cross-compilation.conf.in
>> > index 0eec740..fc8e27f 100644
>> > --- a/package/meson/cross-compilation.conf.in
>> > +++ b/package/meson/cross-compilation.conf.in
>> > @@ -11,6 +11,7 @@ strip = '@TARGET_CROSS at strip'
>> >  pkgconfig = '@HOST_DIR@/usr/bin/pkg-config'
>> >
>> >  [properties]
>> > +needs_exe_wrapper = true
>> >  c_args = [@TARGET_CFLAGS@]
>> >  c_link_args = [@TARGET_LDFLAGS@]
>> >  cpp_args = [@TARGET_CXXFLAGS@]
>> > diff --git a/package/meson/meson.mk b/package/meson/meson.mk
>> > index e1675c2..51512b2 100644
>> > --- a/package/meson/meson.mk
>> > +++ b/package/meson/meson.mk
>> > @@ -16,6 +16,47 @@ HOST_MESON_NEEDS_HOST_PYTHON = python3
>> >  HOST_MESON_TARGET_ENDIAN = $(call LOWERCASE,$(BR2_ENDIAN))
>> >  HOST_MESON_TARGET_CPU = $(GCC_TARGET_CPU)
>> >
>> > +# https://mesonbuild.com/Reference-tables.html#cpu-families
>> > +ifeq ($(BR2_arcle),y)
>> > +HOST_MESON_TARGET_CPU_FAMILY = arc
>> > +else ifeq ($(BR2_arceb),y)
>> > +HOST_MESON_TARGET_CPU_FAMILY = arc
>> > +else ifeq ($(BR2_arm),y)
>> > +HOST_MESON_TARGET_CPU_FAMILY = arm
>> > +else ifeq ($(BR2_armeb),y)
>> > +HOST_MESON_TARGET_CPU_FAMILY = arm
>> > +else ifeq ($(BR2_aarch64),y)
>> > +HOST_MESON_TARGET_CPU_FAMILY = aarch64
>> > +else ifeq ($(BR2_aarch64_be),y)
>> > +HOST_MESON_TARGET_CPU_FAMILY = aarch64
>> > +else ifeq ($(BR2_i386),y)
>> > +HOST_MESON_TARGET_CPU_FAMILY = x86
>> > +else ifeq ($(BR2_mips),y)
>> > +HOST_MESON_TARGET_CPU_FAMILY = mips
>> > +else ifeq ($(BR2_mipsel),y)
>> > +HOST_MESON_TARGET_CPU_FAMILY = mips
>> > +else ifeq ($(BR2_mips64),y)
>> > +HOST_MESON_TARGET_CPU_FAMILY = mips64
>> > +else ifeq ($(BR2_mips64el),y)
>> > +HOST_MESON_TARGET_CPU_FAMILY = mips64
>> > +else ifeq ($(BR2_powerpc),y)
>> > +HOST_MESON_TARGET_CPU_FAMILY = ppc
>> > +else ifeq ($(BR2_powerpc64),y)
>> > +HOST_MESON_TARGET_CPU_FAMILY = ppc64
>> > +else ifeq ($(BR2_powerpc64le),y)
>> > +HOST_MESON_TARGET_CPU_FAMILY = ppc64
>> > +else ifeq ($(BR2_riscv),y)
>> > +HOST_MESON_TARGET_CPU_FAMILY = riscv32
>>
>> Are you sure? Buildroot only supports riscv64 currently. See
>> arch/Config.in.riscv.
> You're right, I was only looking for BR2_ARCH_IS_64 in arch/Config.in,
> is riscv the only arch where BR2_ARCH_IS_64 isn't set in
> arch/Config.in?

So it seems:

git grep 'select BR2_ARCH_IS_64' -- arch/
arch/Config.in: select BR2_ARCH_IS_64
arch/Config.in: select BR2_ARCH_IS_64
arch/Config.in: select BR2_ARCH_IS_64
arch/Config.in: select BR2_ARCH_IS_64
arch/Config.in: select BR2_ARCH_IS_64
arch/Config.in: select BR2_ARCH_IS_64
arch/Config.in: select BR2_ARCH_IS_64
arch/Config.in: select BR2_ARCH_IS_64
arch/Config.in.riscv:   select BR2_ARCH_IS_64

Not sure what the reason for that is. riscv is also special in that
there is no support for its 32bit variant in Buildroot.

Mark?

baruch

>> > +else ifeq ($(BR2_sparc),y)
>> > +HOST_MESON_TARGET_CPU_FAMILY = sparc
>> > +else ifeq ($(BR2_sparc64),y)
>> > +HOST_MESON_TARGET_CPU_FAMILY = sparc64
>> > +else ifeq ($(BR2_x86_64),y)
>> > +HOST_MESON_TARGET_CPU_FAMILY = x86_64
>> > +else
>> > +HOST_MESON_TARGET_CPU_FAMILY = $(ARCH)
>> > +endif
>> > +
>> >  HOST_MESON_SED_CFLAGS = $(if $(TARGET_CFLAGS),`printf '"%s"$(comma) ' $(TARGET_CFLAGS)`)
>> >  HOST_MESON_SED_LDFLAGS = $(if $(TARGET_LDFLAGS),`printf '"%s"$(comma) ' $(TARGET_LDFLAGS)`)
>> >  HOST_MESON_SED_CXXFLAGS = $(if $(TARGET_CXXFLAGS),`printf '"%s"$(comma) ' $(TARGET_CXXFLAGS)`)
>> > @@ -23,7 +64,7 @@ HOST_MESON_SED_CXXFLAGS = $(if $(TARGET_CXXFLAGS),`printf '"%s"$(comma) ' $(TARG
>> >  define HOST_MESON_INSTALL_CROSS_CONF
>> >       mkdir -p $(HOST_DIR)/etc/meson
>> >       sed -e "s%@TARGET_CROSS@%$(TARGET_CROSS)%g" \
>> > -         -e "s%@TARGET_ARCH@%$(ARCH)%g" \
>> > +         -e "s%@TARGET_ARCH@%$(HOST_MESON_TARGET_CPU_FAMILY)%g" \
>> >           -e "s%@TARGET_CPU@%$(HOST_MESON_TARGET_CPU)%g" \
>> >           -e "s%@TARGET_ENDIAN@%$(HOST_MESON_TARGET_ENDIAN)%g" \
>> >           -e "s%@TARGET_CFLAGS@%$(HOST_MESON_SED_CFLAGS)%g" \

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
