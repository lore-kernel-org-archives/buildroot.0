From: Steve James <ste@junkomatic.net>
Date: Mon, 12 Jan 2015 17:43:09 +0000
Subject: [Buildroot] [PATCH v5] leveldb: new package
In-Reply-To: <20150110111950.45e3baf2@free-electrons.com>
References: <1420823386-18874-1-git-send-email-ste@junkomatic.net>
 <20150110111950.45e3baf2@free-electrons.com>
Message-ID: <201501121743.09235.ste@junkomatic.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Saturday 10 Jan 2015 10:19:50 Thomas Petazzoni wrote:
> Dear Steve James,
> 
> Thanks for this new version!
> 
--snip--
> > +Subject: [PATCH 1/1] facilitate integration into Buildroot:
> > +  - Add Buildroot TARGET_OS
> > +  - Allow flags from the environment
> > +  - Add install recipe
> 
> There are three different things being done, so it should be three
> separate patches, especially for upstream submission.

OK.

> However, I believe adding a Buildroot TARGET_OS is a mistake, and has
> no chance of being merged upstream. Buildroot is not an OS. It builds
> Linux based systems, so the existing TARGET_OS=Linux should work just
> fine for Buildroot.

Hmm. Yes TARGET_OS=Linux should be enough, but I failed to make this work with 
Leveldb's home-brew autoconf script. Unfortunately that was a while ago so I 
can't added any data here. It may just be that I was simply failing to pass 
the target compiler path to the configure script...

> 
> > +-CFLAGS += -I. -I./include $(PLATFORM_CCFLAGS) $(OPT)
--snip--
> > ++override LIBS += $(PLATFORM_LIBS)
> 
> So this should be one patch.

OK, now submitted upstream.

> > + LIBOBJECTS = $(SOURCES:.cc=.o)
> > + MEMENVOBJECTS = $(MEMENV_SOURCES:.cc=.o)
--snip--
> 
> This should be another patch.

OK, now submitted upstream.

> > ++    Buildroot)
> > ++        PLATFORM=OS_LINUX
> > ++        COMMON_FLAGS="$MEMCMP_FLAG -pthread -DOS_LINUX
> > -DLEVELDB_PLATFORM_POSIX -DLEVELDB_ATOMIC_PRESENT"
> > ++        PLATFORM_LDFLAGS="-pthread"
> > ++        PLATFORM_CXXFLAGS="-std=c++0x"
> > ++        PORT_FILE=port/port_posix.cc
> > ++        CROSS_COMPILE=true
> > ++        ;;
> 
> This should not be needed.

The configure-style script uses the usual method of compiling test programs to 
detect target features and libraries. The one exception to this method is when 
TARGET_OS=Android. In this case the compile options are set in-line in the 
case statement. What I have done is re-use the Android method for Buildroot.

Note that TARGET_OS does not appear in the code: PLATFORM is set to OS_LINUX 
when TARGET_OS=Linux|CYGWIN_*|Buildroot and it is PLATFORM that affects the 
code.

So something is needed somewhere to capture the correct combination of flags 
for use with Buildroot. My first attempt of putting them in leveldb.mk was 
ugly. At least my later proposed changes for Buildroot are simple, confined to 
a new case statement and follow the precedent set by Android.

That said, I will try once more to make the the configure script work as 
intended.

> > +ifeq ($(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),)
> > +# Dynamic library not required
> > +LEVELDB_MAKE_ARGS += SHARED=
> > +endif
> > +
> > +ifeq ($(BR2_STATIC_LIBS)$(BR2_SHARED_STATIC_LIBS),)
> > +# Static library not required
> > +LEVELDB_MAKE_ARGS += LIBRARY=
> > +endif
> 
> I found this a bit odd to read, maybe:
> 
> # Disable the static library for shared only build
> ifeq ($(BR2_SHARED_LIBS),y)
> LEVELDB_MAKE_ARGS += LIBRARY=
> endif
> 
> # Disable the shared library for static only build
> ifeq ($(BR2_STATIC_LIBS),y)
> LEVELDB_MAKE_ARGS += SHARED=
> endif
> 
> is more readable.

Agreed, that's better.

> > +ifeq ($(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
> 
> Not needed, just call install unconditionally. It will install the
> static library to $(TARGET_DIR), but that's not a problem, as it gets
> removed afterwards by Buildroot anyway.

OK.

Thanks,
Steve.
