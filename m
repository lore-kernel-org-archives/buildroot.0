From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 29 Dec 2020 22:14:45 +0100
Subject: [Buildroot] [PATCH 1/3] Revert "package/assimp: fix musl
 zlib/zip related compile failure"
In-Reply-To: <20201229220459.137b9f03@gmx.net>
References: <20201228120102.3055620-1-fontaine.fabrice@gmail.com>
 <20201229220459.137b9f03@gmx.net>
Message-ID: <20201229211445.GZ1680670@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2020-12-29 22:04 +0100, Peter Seiderer spake thusly:
> On Mon, 28 Dec 2020 13:01:00 +0100, Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
> > This reverts commit b529a582ba4d7671597e95d7ab54ee652cbbc261 as it
> > raises a build failure with hiawatha because assimp installs its own
> > zlib library in staging directory.
[--SNIP--]
> > diff --git a/package/assimp/assimp.mk b/package/assimp/assimp.mk
> > index e1b9a23499..eddfbc48b0 100644
> > --- a/package/assimp/assimp.mk
> > +++ b/package/assimp/assimp.mk
> > @@ -8,6 +8,7 @@ ASSIMP_VERSION = 5.0.1
> >  ASSIMP_SITE = $(call github,assimp,assimp,v$(ASSIMP_VERSION))
> >  ASSIMP_LICENSE = BSD-3-Clause
> >  ASSIMP_LICENSE_FILES = LICENSE
> > +ASSIMP_DEPENDENCIES = zlib
> >  ASSIMP_INSTALL_STAGING = YES
> >
> >  # relocation truncated to fit: R_68K_GOT16O. We also need to disable
> > @@ -36,7 +37,7 @@ ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
> >  ASSIMP_CXXFLAGS += -O0
> >  endif
> >
> > -ASSIMP_CONF_OPTS += -DASSIMP_BUILD_ZLIB=ON -DASSIMP_BUILD_TESTS=OFF \
> > +ASSIMP_CONF_OPTS += -DASSIMP_BUILD_TESTS=OFF \
> >  	-DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) $(ASSIMP_CXXFLAGS)"
> >
> >  $(eval $(cmake-package))
> 
> Using system/buildroot provided zlib works for BR2_PACKAGE_LIBZLIB but
> not for BR2_PACKAGE_ZLIB_NG (maybe that was the meaning of 'assimp fails
> to use [...] zlib/zip (and is pick about the provided versions)'...

Ah, OK, thanks for the explanations.

But then it should depend on libzlib instead of plain zlib. And it can't
select it, because it is an entry in a choice, so it can only depend on
it.

Regards,
Yann E. MORIN.

> With this I believe your initial approach/patch to prevent the
> installation of libzlibstatic.a to staging is the better one...
> 
> Regards,
> Peter

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
