From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 12 Oct 2014 19:14:37 +0200
Subject: [Buildroot] [PATCH 06/30] package/qemu: add SDL frontends
In-Reply-To: <ed3ac18b40f236202ab544d90aa727fc14835065.1412719495.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Wed, 8 Oct 2014 00:38:15 +0200")
References: <cover.1412719495.git.yann.morin.1998@free.fr>
 <ed3ac18b40f236202ab544d90aa727fc14835065.1412719495.git.yann.morin.1998@free.fr>
Message-ID: <87wq85tdky.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > ---
 >  package/qemu/Config.in | 17 +++++++++++++++++
 >  package/qemu/qemu.mk   | 12 ++++++++++--
 >  2 files changed, 27 insertions(+), 2 deletions(-)

 > diff --git a/package/qemu/Config.in b/package/qemu/Config.in
 > index d0006d5..f81b6ca 100644
 > --- a/package/qemu/Config.in
 > +++ b/package/qemu/Config.in
 > @@ -62,4 +62,21 @@ config BR2_PACKAGE_QEMU_LINUX_USER
 
 >  endif # BR2_PACKAGE_QEMU_CUSTOM_TARGETS == ""
 
 > +config QEMU_HAS_EMULS

We have to respect the global namespace, so this should be
BR2_PACKAGE_QEMU_HAS_EMULS

 > +++ b/package/qemu/qemu.mk
 > @@ -97,7 +97,8 @@ QEMU_OPTS =
 >  QEMU_VARS = \
 >  	LIBTOOL=$(HOST_DIR)/usr/bin/libtool \
 >      PYTHON=$(HOST_DIR)/usr/bin/python \
 > -    PYTHONPATH=$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages
 > +    PYTHONPATH=$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages \
 > +    SDL_CONFIG=$(STAGING_DIR)/usr/bin/sdl-config
 
 >  ifeq ($(BR2_PACKAGE_QEMU_SYSTEM),y)
 >  QEMU_OPTS += --enable-system
 > @@ -115,6 +116,14 @@ ifneq ($(call qstrip,$(BR2_PACKAGE_QEMU_CUSTOM_TARGETS)),)
 >  QEMU_OPTS += --target-list="$(call qstrip,$(BR2_PACKAGE_QEMU_CUSTOM_TARGETS))"
 >  endif
 
 > +ifeq ($(BR2_PACKAGE_QEMU_SDL),y)
 > +QEMU_OPTS += --enable-sdl
 > +QEMU_DEPENDENCIES += sdl
 > +QEMU_VARS += SDL_CONFIG=$(BR2_STAGING_DIR)/usr/bin/sdl-config

There's no point in adding SDL_CONFIG twice, so I have removed it from
the unconditial line further above.

Committed with these fixes, thanks.

-- 
Bye, Peter Korsgaard
