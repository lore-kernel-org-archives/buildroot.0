From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 7 Sep 2020 17:19:31 +0200
Subject: [Buildroot] [PATCH 1/2] package/re2: new  package
In-Reply-To: <d85-5f564700-5-4ec33a00@2159074>
References: <d85-5f564700-5-4ec33a00@2159074>
Message-ID: <20200907171931.7e971984@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Michael,

Romain: there are some LLVM questions below.

On Mon, 07 Sep 2020 16:43:42 +0200
"Michael Nosthoff" <buildroot@heine.tech> wrote:

> I did a check on what might happen when we add -DBUILD_SHARED_LIBS to package/pkg-cmake.mk for host packages.
> 
> In Summary: a few packages change their output. Most stay stable. (see at the end for details)

First, thanks a lot for this extensive research.

> Builds that change their output from .a to .so: host-clang, host-grpc, host-flatcc, host-libabseil-cpp, host-lld, host-pugixml
> builds that break: host-doxygen
> 
> So for doxygen that is not good. They mix add_library calls which explicitly set STATIC and one that sets nothing. 
> So this creates a .so but when it should be linked a .a is needed because the lib to be linked is static.
> If we change the default doxygen would need an explicit -DBUILD_SHARED_LIBS=OFF Flag.

I think we could live with one host package explicitly disabling shared
libraries.

> What I'm not sure about is the output of clang. Should this be built
> as a shared lib? For llvm this is explicitly set to static in the
> .mk. For clang this is not done for host builds. Is this maybe an
> oversight?

On this, I don't know, but I've added Romain in Cc.

> So what do you think? Is this something we should go forward on or
> should I just change the re2 package?

I think we should have the simple fix that tweaks just the re2 package,
and then a more global fix in pkg-cmake.

> How is -DBUILD_SHARED_LIBS set and/or handled currently on the host packages?
> 
> host-cdrkit always uses ADD_LIBRARY with STATIC flag
> host-clang not set explicitly for host, so it might change from STATIC to SHARED here. Is this intentional or an oversight (compared to llvm)? [1]
> host-doxygen adds most libs with STATIC but not all -> breaks on linking
> host-fatcat Does not build libs
> host-flatbuffers uses its own FLATBUFFERS_BUILD_SHAREDLIB, host .mk build sets it to OFF
> host-flatcc has no preference, CMakeList.txt states explicitly that it honors BUILD_SHARED_LIBS
> host-grpc honors the flag, .mk sets nothing
> host-json-c Builds static and shared by default, setting flag doesn't change that
> host-kodi-jsonschemabuilder only builds executable
> host-kodi-texturepacker only builds executable
> host-libabseil-cpp honors the flag, .mk sets nothing
> host-libnetconf2 always uses ADD_LIBRARY with SHARED flag [2]
> host-libyang Builds SHARED when ENABLE_STATIC is not set, which is the case [3]
> host-libzip builds as shared as default
> host-lld honors the flag, .mk sets nothing
> host-llvm set to OFF by BR .mk file [4]
> host-lzo .mk sets -DENABLE_SHARED=ON -DENABLE_STATIC=OFF
> host-mariadb ignores DBUILD_SHARED_LIBS
> host-mfgtools .mk defines its own build step (and builds shared lib)
> host-ninja only build executable
> host-pugixml honors -DBUILD_SHARED_LIBS
> host-sysrepo sets shared as default [5]
> host-thrift Sets to ON when not on windows [6]
> host-waylandpp Defaults to OFF but doesn't build libs for host (-DBUILD_LIBRARIES=OFF) [7]

Again, thanks for this extensive research!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
