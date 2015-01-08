From: Steve James <ste@junkomatic.net>
Date: Thu, 8 Jan 2015 12:09:41 +0000
Subject: [Buildroot] [PATCH v4] leveldb: new package
In-Reply-To: <20150107101218.22b5455f@free-electrons.com>
References: <1420469267-26272-1-git-send-email-ste@junkomatic.net>
 <20150107101218.22b5455f@free-electrons.com>
Message-ID: <201501081209.41211.ste@junkomatic.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas, Thanks for the feedback...

On Wednesday 07 Jan 2015 09:12:18 Thomas Petazzoni wrote:
> Dear Steve James,
> 
> On Mon,  5 Jan 2015 14:47:47 +0000, Steve James wrote:
> > +comment "leveldb needs a toolchain w/ C++, threads"
> > +	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_HAS_THREADS)
> 
> I find it more natural to have
> 
> 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS

OK, if you wish (I just copy-pasted from elsewhere). BTW I don't find this 
statement natural to read whichever way the logic is expressed. I think it 
would read better if "depends on" where replaced with "when" (or "if") 
instead:-

comment "leveldb needs a toolchain w/ C++, threads"
	when !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS)

But maybe that's just something I have to get used to.

> > +LEVELDB_FLAGS += -DNDEBUG -I. -I./include -pthread -DOS_LINUX
> > -DLEVELDB_PLATFORM_POSIX +LEVELDB_CFLAGS += $(LEVELDB_FLAGS)
> > $(TARGET_CFLAGS)
> > +LEVELDB_CXXFLAGS += $(LEVELDB_FLAGS) $(TARGET_CXXFLAGS) -std=c++0x
> > +
> > +LEVELDB_MAKE_ARGS += CFLAGS="$(LEVELDB_CFLAGS)"
> > CXXFLAGS="$(LEVELDB_CXXFLAGS)"
> 
> I don't really like this solution, because you have to duplicate flags
> from the leveldb Makefile into Buildroot, which isn't very future
> proof.

Fair enough. I don't like it either, for the same reason (but I thought I 
might get away with it :). I have been resisting making a patch for leveldb 
but...

> Instead, I would prefer:
> 
>  (1) A patch for leveldb that changes the CFLAGS, LDFLAGS, LIBS and
>      CXXFLAGS line from:
> 
>        CFLAGS += ...
> 
>      to
> 
>        override CFLAGS += ...
> 
>      This way, we can pass CFLAGS and LDFLAGS in the environment, and
>      leveldb Makefile can still add more flags.
> 
>      This patch can (should?) be submitted to leveldb upstream
>      developers.

OK I give in. I'll make a patch to adjust the leveldb Makefile and I'll send 
it upstream.

>  (2) A simplification of leveldb.mk to remove all this complexity. I
>      got it to work with the following change:
> 
> diff --git a/package/leveldb/leveldb.mk b/package/leveldb/leveldb.mk
> index 1612c9d..8688599 100644
> --- a/package/leveldb/leveldb.mk
> +++ b/package/leveldb/leveldb.mk
> @@ -11,18 +11,9 @@ LEVELDB_LICENSE_FILES = LICENSE
>  LEVELDB_INSTALL_STAGING = YES
>  LEVELDB_DEPENDENCIES = snappy
> 
> -LEVELDB_FLAGS += -DNDEBUG -I. -I./include -pthread -DOS_LINUX
> -DLEVELDB_PLATFORM_POSIX -LEVELDB_CFLAGS += $(LEVELDB_FLAGS)
> $(TARGET_CFLAGS)
> -LEVELDB_CXXFLAGS += $(LEVELDB_FLAGS) $(TARGET_CXXFLAGS) -std=c++0x
> -
> -LEVELDB_MAKE_ARGS += CFLAGS="$(LEVELDB_CFLAGS)"
> CXXFLAGS="$(LEVELDB_CXXFLAGS)" -
> -# The lelveldb build has some basic autoconf-style behaviour.
> -# We hard-wire it here to the right outcome for Buildroot
> -LEVELDB_MAKE_ARGS += TARGET_OS=Linux
> -
>  define LEVELDB_BUILD_CMDS
> -       $(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS)
> $(LEVELDB_MAKE_ARGS) -C $(@D) +       $(TARGET_MAKE_ENV) $(MAKE)
> $(TARGET_CONFIGURE_OPTS) \
> +               OPT=-DNDEBUG TARGET_OS=Linux -C $(@D)
>  endef

Yes, the ugly complexity can go away when the Makefile isn't fighting back.

>  ifeq ($(BR2_STATIC_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
> 
> > +ifeq ($(BR2_STATIC_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
> > +define LEVELDB_INSTALL_STAGING_STATIC
> > +	$(INSTALL) -D -m 0644 $(@D)/libleveldb.a $(STAGING_DIR)/usr/lib
> > +endef
> > +endif
> > +
> > +ifeq ($(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
> > +define LEVELDB_INSTALL_STAGING_SHARED
> > +	$(INSTALL) -D -m 0755 $(@D)/libleveldb.so.1.18 $(STAGING_DIR)/usr/lib
> 
> Full path for the destination is needed:
> 
> 							
$(STAGING_DIR)/usr/lib/libleveldb.so.1.18

No, I don't think so. From install(1) man page:-

SYNOPSIS
       install [OPTION]... [-T] SOURCE DEST
       install [OPTION]... SOURCE... DIRECTORY
       install [OPTION]... -t DIRECTORY SOURCE...
       install [OPTION]... -d DIRECTORY...

I'm just using the syntax on the second line.

> > +	$(HOSTLN) -sf libleveldb.so.1.18 
$(STAGING_DIR)/usr/lib/libleveldb.so.1
> > +	$(HOSTLN) -sf libleveldb.so.1.18 $(STAGING_DIR)/usr/lib/libleveldb.so
> > +endef
> > +endif
> > +
> > +define LEVELDB_INSTALL_STAGING_CMDS
> > +	$(LEVELDB_INSTALL_STAGING_STATIC)
> > +	$(LEVELDB_INSTALL_STAGING_SHARED)
> > +	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/include/leveldb
> > +	$(INSTALL) -D -m 0644 $(@D)/include/leveldb/*.h
> > $(STAGING_DIR)/usr/include/leveldb
> 
> I'm not sure of the behavior of $(INSTALL) -D for multiple source files.

I have accidentally used -D redundantly here, since the preceding line creates 
the destination directory first any way.

> > +endef
> > +
> > +ifeq ($(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
> > +define LEVELDB_INSTALL_TARGET_CMDS
> > +	$(INSTALL) -D -m 0755 $(@D)/libleveldb.so.1.18 $(TARGET_DIR)/usr/lib
> > +	$(HOSTLN) -sf libleveldb.so.1.18 $(TARGET_DIR)/usr/lib/libleveldb.so.1
> > +	$(HOSTLN) -sf libleveldb.so.1.18 $(TARGET_DIR)/usr/lib/libleveldb.so
> > +endef
> > +endif
> 
> It would be good to add a comment above all these installation rules to
> indicate that the leveldb build system doesn't provide any "make
> install" rule.

Or better: I'll add the missing install recipe to the Makefile.

> Thanks!
> 
> Thomas

Thanks,
Steve.
