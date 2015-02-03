From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Feb 2015 10:59:51 +0100
Subject: [Buildroot] [PATCH v6] leveldb: new package
In-Reply-To: <20150202161408.GA17739@free.fr>
References: <1421146437-17829-1-git-send-email-ste@junkomatic.net>
 <20150202161408.GA17739@free.fr>
Message-ID: <20150203105951.46ac2d50@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Mon, 2 Feb 2015 17:14:08 +0100, Yann E. MORIN wrote:

> Rather than adding this in the package's Makefile, can't we just do the
> installation manually in the .mk file, that is, something like:
> 
>     ifeq ($(BR2_STATIC_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
>     define LEVELDB_INSTALL_STATIC
>         $(INSTALL) -D -m 0644 $(@D)/lib/libleveldb.a $(1)/usr/lib/libleveldb.a
>     endef
>     endif
>     ifeq ($(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
>     define LEVELDB_INSTALL_SHARED
>         $(INSTALL) -D -m 0644 $(@D)/lib/libleveldb.so $(1)/usr/lib/libleveldb.so
>         ln -sf libleveldb.so $(1)/usr/lib/libleveldb.so.VERSION
>     endef
>     endif
> 
>     define LEVELDB_INSTALL_STAGING_CMDS
>         $(call LEVELDB_INSTALL_STATIC,$(STAGING_DIR))
>         $(call LEVELDB_INSTALL_SHARED,$(STAGING_DIR))
>         install -D -m 0644 $(@D)/leveldb.h $(STAGING_DIR)/usr/include/leveldb.h
>     endef
> 
>     define LEVELDB_INSTALL_TARGET_CMDS
>         $(call LEVELDB_INSTALL_SHARED,$(STAGING_DIR))
>     endef

Well, I actually asked Steve to write patches that can be submitted
upstream (leveldb upstream is active) rather than solving all problems
in the Buildroot .mk file.


> > +-CFLAGS += -I. -I./include $(PLATFORM_CCFLAGS) $(OPT)
> > +-CXXFLAGS += -I. -I./include $(PLATFORM_CXXFLAGS) $(OPT)
> > ++override CFLAGS += -I. -I./include $(PLATFORM_CCFLAGS) $(OPT)
> > ++override CXXFLAGS += -I. -I./include $(PLATFORM_CXXFLAGS) $(OPT)
> > + 
> > +-LDFLAGS += $(PLATFORM_LDFLAGS)
> > +-LIBS += $(PLATFORM_LIBS)
> > ++override LDFLAGS += $(PLATFORM_LDFLAGS)
> > ++override LIBS += $(PLATFORM_LIBS)
> > + 
> > + LIBOBJECTS = $(SOURCES:.cc=.o)
> > + MEMENVOBJECTS = $(MEMENV_SOURCES:.cc=.o)
> 
> I think this would not be needed if you do:
> 
>     define LEVELDB_BUILD_CMDS
>         $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) \
>             $(LEVELDB_MAKE_ARGS) -C $(@D)
>     endef
> 
> i.e. pass the TARGET_CONFIGURE_OPTS in the environment, and not as make
> arguments.

Aaah, yes, indeed. When passed in the environment, a normal += work,
and you don't need the override.


> > +# Disable the static library for shared only build
> > +ifeq ($(BR2_SHARED_LIBS),y)
> > +LEVELDB_MAKE_ARGS += LIBRARY=
> > +endif
> > +
> > +# Disable the shared library for static only build
> > +ifeq ($(BR2_STATIC_LIBS),y)
> > +LEVELDB_MAKE_ARGS += SHARED=
> > +endif
> 
> I would prefer we actually we use direct logic, like:
> 
>     ifeq ($(BR2_STATIC_LIBS),)
>     LEVELDB_MAKE_ARGS += SHARED=
>     endif
> 
>     ifeq ($(BR2_SHARED_LIBS),)
>     LEVELDB_MAKE_ARGS += LIBRARY=
>     endif

Well I actually asked for the opposite, in order to use positive logic,
i.e test BR2_SHARED_LIBS==y.

> > +define LEVELDB_INSTALL_TARGET_CMDS
> > +	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
> > +		INSTALL_ROOT=$(TARGET_DIR) INSTALL_PREFIX=/usr \
> > +		$(LEVELDB_MAKE_ARGS) -C $(@D) install
> > +endef
> 
> And adapt the install commands as explained above.

Or not, depending on whether we want the patch to be upstreamed.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
