From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 28 Feb 2017 21:03:13 +0100
Subject: [Buildroot] [PATCH 1/5] core/pkg-cmake: provide our own
	platform description
In-Reply-To: <20170228182631.yterrk7kcq2gjemt@tarshish>
References: <cover.1488305206.git.yann.morin.1998@free.fr>
 <f25e9ff7873418c0b323528d6a9c2482c752cd31.1488305206.git.yann.morin.1998@free.fr>
 <20170228182631.yterrk7kcq2gjemt@tarshish>
Message-ID: <20170228200313.GB3533@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, All,

On 2017-02-28 20:26 +0200, Baruch Siach spake thusly:
> On Tue, Feb 28, 2017 at 07:07:22PM +0100, Yann E. MORIN wrote:
> > diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
> > index a7c8dc3..77fa1dc 100644
> > --- a/package/pkg-cmake.mk
> > +++ b/package/pkg-cmake.mk
> > @@ -87,6 +87,7 @@ define $(2)_CONFIGURE_CMDS
> >  	PATH=$$(BR_PATH) \
> >  	$$($$(PKG)_CONF_ENV) $$(BR2_CMAKE) $$($$(PKG)_SRCDIR) \
> >  		-DCMAKE_TOOLCHAIN_FILE="$$(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake" \
> > +		-DCMAKE_MODULE_PATH="$$(HOST_DIR)/usr/share/buildroot" \
> >  		-DCMAKE_INSTALL_PREFIX="/usr" \
> >  		-DCMAKE_COLOR_MAKEFILE=OFF \
> >  		-DBUILD_DOC=OFF \
> > @@ -249,3 +250,6 @@ $(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake:
> >  		-e 's#@@CMAKE_BUILD_TYPE@@#$(if $(BR2_ENABLE_DEBUG),Debug,Release)#' \
> >  		$(TOPDIR)/support/misc/toolchainfile.cmake.in \
> >  		> $@
> > +
> > +$(HOST_DIR)/usr/share/buildroot/Platform/Buildroot.cmake:
> > +	$(Q)$(INSTALL) -D -m 0644 support/misc/Buildroot.cmake $(@)
> > diff --git a/support/misc/Buildroot.cmake b/support/misc/Buildroot.cmake
> > new file mode 100644
> > index 0000000..b0046b3
> > --- /dev/null
> > +++ b/support/misc/Buildroot.cmake
> > @@ -0,0 +1,3 @@
> > +include(Platform/Linux)
> 
> So this goes to the host directory in case of host installed cmake? What 
> happens when the host installed cmake is older than 3.1? Does the Buildroot 
> built module path override the host installed one?

When the host cmake is older than 3.1, we build and use our own cmake.

And the modules path we provide is looked for first, then cmake uses the
builtin one:
    https://cmake.org/cmake/help/v3.0/variable/CMAKE_MODULE_PATH.html

I should have written that in the commit log, indeed.

Regards,
Yann E. MORIN.

> baruch
> 
> > +set_property(GLOBAL PROPERTY FIND_LIBRARY_USE_LIB32_PATHS FALSE)
> > +set_property(GLOBAL PROPERTY FIND_LIBRARY_USE_LIB64_PATHS FALSE)
> > diff --git a/support/misc/toolchainfile.cmake.in b/support/misc/toolchainfile.cmake.in
> > index d4252dd..5a42644 100644
> > --- a/support/misc/toolchainfile.cmake.in
> > +++ b/support/misc/toolchainfile.cmake.in
> > @@ -10,7 +10,7 @@
> >  # RELOCATED_HOST_DIR variable.
> >  string(REPLACE "/usr/share/buildroot" "" RELOCATED_HOST_DIR ${CMAKE_CURRENT_LIST_DIR})
> >  
> > -set(CMAKE_SYSTEM_NAME Linux)
> > +set(CMAKE_SYSTEM_NAME Buildroot)
> >  set(CMAKE_SYSTEM_PROCESSOR @@CMAKE_SYSTEM_PROCESSOR@@)
> >  
> >  # Set the {C,CXX}FLAGS appended by CMake depending on the build type
> > diff --git a/toolchain/toolchain/toolchain.mk b/toolchain/toolchain/toolchain.mk
> > index b16db01..e298373 100644
> > --- a/toolchain/toolchain/toolchain.mk
> > +++ b/toolchain/toolchain/toolchain.mk
> > @@ -38,3 +38,4 @@ endif
> >  $(eval $(virtual-package))
> >  
> >  toolchain: $(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake
> > +toolchain: $(HOST_DIR)/usr/share/buildroot/Platform/Buildroot.cmake
> 
> -- 
>      http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
