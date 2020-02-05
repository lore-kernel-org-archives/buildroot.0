From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 4 Feb 2020 23:23:57 -0500
Subject: [Buildroot] [PATCH 1/1] package/gcc: pass -Wno-error to debug
 builds
In-Reply-To: <7b8ffab6-a31d-6bf7-f3c7-706fb0845ba0@smile.fr>
References: <20200204001027.126863-1-james.hilliard1@gmail.com>
 <7b8ffab6-a31d-6bf7-f3c7-706fb0845ba0@smile.fr>
Message-ID: <CADvTj4rkFZXX31ESPgW=nZex494HFjB-znTZKs7TB_nfX3Dp3Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Feb 4, 2020 at 4:14 PM Romain Naour <romain.naour@smile.fr> wrote:
>
> Hi James,
>
> Le 04/02/2020 ? 01:10, James Hilliard a ?crit :
> > Fixes:
> > ../../../../libsanitizer/libbacktrace/../../libbacktrace/elf.c:772:21: error: ?st.st_mode? may be used uninitialized in this function [-Werror=maybe-uninitialized]
> >    return S_ISLNK (st.st_mode);
> >                      ^
> >
>
> Can you provide a defconfig that allow to reproduce the issue.
BR2_ENABLE_DEBUG=y
BR2_DEBUG_3=y
BR2_OPTIMIZE_G=y
BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PACKAGE_HOST_GDB=y
BR2_GDB_VERSION_8_3=y

FYI this fix was adapted from openembedded:
https://github.com/openembedded/openembedded-core/blob/d3083e941578fb343454e106eba349adcc525ad3/meta/recipes-devtools/gcc/gcc-sanitizers.inc#L48-L49
>
> Thanks!
>
> Best regards,
> Romain
>
>
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >  package/gcc/gcc.mk | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
> > index 527f30bf22..badf358707 100644
> > --- a/package/gcc/gcc.mk
> > +++ b/package/gcc/gcc.mk
> > @@ -103,6 +103,10 @@ HOST_GCC_COMMON_CONF_ENV = \
> >  GCC_COMMON_TARGET_CFLAGS = $(TARGET_CFLAGS)
> >  GCC_COMMON_TARGET_CXXFLAGS = $(TARGET_CXXFLAGS)
> >
> > +ifeq ($(BR2_ENABLE_DEBUG),y)
> > +GCC_COMMON_TARGET_CFLAGS += -Wno-error
> > +endif
> > +
> >  # Propagate options used for target software building to GCC target libs
> >  HOST_GCC_COMMON_CONF_ENV += CFLAGS_FOR_TARGET="$(GCC_COMMON_TARGET_CFLAGS)"
> >  HOST_GCC_COMMON_CONF_ENV += CXXFLAGS_FOR_TARGET="$(GCC_COMMON_TARGET_CXXFLAGS)"
> >
>
