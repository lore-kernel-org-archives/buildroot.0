From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 5 Jan 2020 17:17:03 +0100
Subject: [Buildroot] [PATCH 1/1] package/freeswitch: fix gcc visibility
 flags
In-Reply-To: <20200104222403.1631525-1-bernd.kuhls@t-online.de>
References: <20200104222403.1631525-1-bernd.kuhls@t-online.de>
Message-ID: <20200105161703.GA2721@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2020-01-04 23:24 +0100, Bernd Kuhls spake thusly:
> Fixes:
> http://autobuild.buildroot.net/results/8c6/8c6671f64b2746033750ea043d9f96030ac5591d/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/freeswitch/0001-Fix-cross-compiling-libvpx.patch | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/package/freeswitch/0001-Fix-cross-compiling-libvpx.patch b/package/freeswitch/0001-Fix-cross-compiling-libvpx.patch
> index 63fa33b93a..d59e6739b3 100644
> --- a/package/freeswitch/0001-Fix-cross-compiling-libvpx.patch
> +++ b/package/freeswitch/0001-Fix-cross-compiling-libvpx.patch
> @@ -10,6 +10,8 @@ package/freeswitch/freeswitch.mk and add target=generic-gnu as
>  configure parameter:
>  https://freeswitch.org/stash/projects/FS/repos/freeswitch/browse/libs/libvpx/README#110
>  
> +Also remove VISIBILITY_FLAG to fix gcc issues.
> +
>  And yes, autoreconf is also broken, so we patch Makefile.in instead
>  of Makefile.am.
>  
> @@ -23,7 +25,7 @@ diff -uNr freeswitch-1.6.7.org/Makefile.in freeswitch-1.6.7/Makefile.in
>   
>   libs/libvpx/Makefile: libs/libvpx/.update
>  -	cd libs/libvpx && CC="$(CC)" CXX="$(CXX)" CFLAGS="$(CFLAGS) $(VISIBILITY_FLAG)" CXXFLAGS="$(CXXFLAGS)" LDFLAGS="$(LDFLAGS)" ./configure --enable-pic --disable-docs --disable-examples --disable-install-bins --disable-install-srcs --disable-unit-tests --size-limit=16384x16384
> -+	cd libs/libvpx && CROSS=$(CROSS) CC="$(CC)" CXX="$(CXX)" CFLAGS="$(CFLAGS) $(VISIBILITY_FLAG)" CXXFLAGS="$(CXXFLAGS)" LDFLAGS="$(LDFLAGS)" ./configure --enable-pic --disable-docs --disable-examples --disable-install-bins --disable-install-srcs --disable-unit-tests --size-limit=16384x16384
> ++	cd libs/libvpx && CROSS=$(CROSS) CC="$(CC)" CXX="$(CXX)" CFLAGS="$(CFLAGS) CXXFLAGS="$(CXXFLAGS)" LDFLAGS="$(LDFLAGS)" ./configure --enable-pic --disable-docs --disable-examples --disable-install-bins --disable-install-srcs --disable-unit-tests --size-limit=16384x16384

I think the problem is more profound than just that, in fact.

The failing build referenced in the commit log is on xtensa, but the
config.log for libvpx shows that it detected building for x86_64, which
is definitely incorrect:

    http://autobuild.buildroot.org/results/8c6/8c6671f64b2746033750ea043d9f96030ac5591d/freeswitch-1.10.2/libs/libvpx/config.log

    Configuring for target 'x86_64-linux-gcc'
      enabling x86_64

And then all the following tests systematically fail when it tries
various x86-only optimisation flags.

And looking at how we do build libvpx in Buildroot, it seems that
freeswitch does not properly configure and build its own bundled
copy of libvpx. Sigh... :-(

I think the best solution would be for freeswitch to use a system vpx
instead of bundling a copy, for one can dream...

Short of this ideal, maybe we could build it ourselves with pre-build
hooks, something like:

    # Freeswitch's buildsystem forgets to pass important environment
    # variables and config options when it configures libvpx, so
    # pre-build libvpx manually, so Freeswitch does not attempt to run
    # its flawed commands...
    # Freeswitch only ever uses the static libtrary, that's hard-coded,
    # we can't do anything about that...
    # From package/libvpx/libvpx.mk:
    # - this is not a true autotools package.  It is based on the ffmpeg
    #   build system.
    # - ld is being used with cc options. therefore, pretend ld is cc.
    define FREESWITCH_BUILD_LIBVPX
        cd $(@D)/libs/libvpx && \
        $(TARGET_CONFIGURE_OPTS) \
        $(TARGET_CONFIGURE_ARGS) \
        LD="$(TARGET_CC)" \
        CROSS=$(GNU_TARGET_NAME) \
        ./configure \
            --target=generic-gnu \
            --enable-pic \
            --prefix=/usr \
            --disable-shared --enable-static \
            --disable-examples \
            --disable-docs \
           --disable-unit-tests && \
        $(TARGET_MAKE_ENV) \
        $(LIBVPX_MAKE_ENV) \
        $(MAKE) \
            -C $(@D)/libs/libvpx \
            all
    endef
    FREESWITCH_PRE_BUILD_HOOKS += FREESWITCH_BUILD_LIBVPX

Care to have a look in that direction, please?

Additioanlly, working with upstream so they stop using a bundled
version, or at least that they offer the option to use a system-wide
libvpx, would be great. Could you also look into that? ;-)

Regards,
Yann E. MORIN.

>   libs/libvpx/libvpx.a: libs/libvpx/Makefile libs/libvpx/.update
>   	@cd libs/libvpx && $(MAKE)
> -- 
> 2.20.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
