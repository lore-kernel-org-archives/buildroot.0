From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Apr 2017 08:40:27 +0200
Subject: [Buildroot] [PATCH v5 07/34] package/kodi-texturepacker: new
 host package
In-Reply-To: <e597f43c-aad0-f3a2-b527-a2f6ba2cb526@mind.be>
References: <20170417195433.26672-1-bernd.kuhls@t-online.de>
 <20170417195433.26672-8-bernd.kuhls@t-online.de>
 <20170422092650.GH15086@scaer>
 <e597f43c-aad0-f3a2-b527-a2f6ba2cb526@mind.be>
Message-ID: <20170423064027.GB2819@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

rnout, All,

On 2017-04-23 00:19 +0200, Arnout Vandecappelle spake thusly:
> On 22-04-17 11:26, Yann E. MORIN wrote:
> > Bernd, All,
> > 
> > On 2017-04-17 21:54 +0200, Bernd Kuhls spake thusly:
> >> Needed for upcoming kodi version bump to 17.1-Krypton which will also
> >> switch the kodi build system to CMake.
> > And now I see why you did not introduce a host-variant of Kodi: you need
> > two tools from it, and they are in different subdirs.
> 
>  ... and you don't want to build all of Kodi for the host.

I was not about building the whole Kodi for the host, but to have thinks
like:

    HOST_KODI_SUBDIR = tools/blabla

    define HOST_KODI_INSTALL_CMDS
        $(INSTALL) -D -m 0755 $(@D)/tools/blabla/foo $(HOST_DIR)/usr/bin/foo
    endef

    $(eval $(host-cmake-package))

>  Still, I think it might be easier to treat the host version as a generic
> package, and call cmake and make explicitly, once for each tool.

I would like we avoid duplicating the infra. When we fix something in
the infra, we have to hunt down all dupes in the code...

Unless we change the infra to have the common code in variables, like:

1- outside the -inner define:

    # $(1): uppercase package name
    define CMAKE_CONFIGURE_CMD
        (mkdir -p $($(1)_BUILDDIR) && \
        cd $($(1)_BUILDDIR) && \
        rm -f CMakeCache.txt && \
        PATH=$$(BR_PATH) \
        $($(1)_CONF_ENV) $(BR2_CMAKE) $($(1)_SRCDIR) \
            -DCMAKE_TOOLCHAIN_FILE="$(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake" \
            -DCMAKE_INSTALL_PREFIX="/usr" \
            -DCMAKE_COLOR_MAKEFILE=OFF \
            -DBUILD_DOC=OFF \
            -DBUILD_DOCS=OFF \
            -DBUILD_EXAMPLE=OFF \
            -DBUILD_EXAMPLES=OFF \
            -DBUILD_TEST=OFF \
            -DBUILD_TESTS=OFF \
            -DBUILD_TESTING=OFF \
            -DBUILD_SHARED_LIBS=$$(if $$(BR2_STATIC_LIBS),OFF,ON) \
            $$(CMAKE_QUIET) \
            $($(1)_CONF_OPTS) \
        )
    endef

And then inside the -inner define:

    ifndef $(2)_CONFIGURE_CMDS
    define $(2)CONFIGURE_CMDS
        $$(call CMAKE_CONFIGURE_CMD,$(2))
    endef
    endif

Or something along those lines, which would allow us to re-use the
infras and be sure that we can fix them in a single location.

Of course, is it worth the effort?

> > I still find it a bit of disapointing that the Kodi buildsystem can not
> > build its own tools... :-(
> 
>  Or indeed, patch Kodi's CMakeLists.txt so it can build its own build tools.

Meh...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
