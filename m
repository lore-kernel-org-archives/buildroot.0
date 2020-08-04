From: Michael Nosthoff <buildroot@heine.tech>
Date: Tue, 04 Aug 2020 15:47:59 +0200
Subject: [Buildroot] package/boost: Optimization is always -O3
Message-ID: <52-5f296700-1-3f60f940@29255497>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

while doing some debugging on code which uses boost_program_options I stumbled upon a possible issue
with the boost package.

It seems that the boost object files are always built with the -O3 option.

I'm building for an arm32 system using gcc 9.2.1.
My Buildroot 2020.05.1 config contains:

BR2_OPTIMIZE_S
BR2_SHARED_LIBS
BR2_TOOLCHAIN_EXTERNAL
BR2_TOOLCHAIN_EXTERNAL_ARM_ARM
BR2_PACKAGE_BOOST
BR2_PACKAGE_BOOST_LAYOUT_SYSTEM
BR2_PACKAGE_BOOST_PROGRAM_OPTIONS


I adjusted the boost.mk with '-d+2' to get the used build commands.

So when building I see the following:

"/build/build/host/bin/arm-none-linux-gnueabihf-g++"   -fvisibility-inlines-hidden -D_LARGEFILE_SOURCE \
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os   -fPIC -pthread -O3 -finline-functions -Wno-inline \
-Wall -fvisibility=hidden  -DBOOST_ALL_NO_LIB=1 -DBOOST_PROGRAM_OPTIONS_DYN_LINK=1 -DNDEBUG  -I"." -c -o \
"bin.v2/libs/program_options/build/gcc-9.2.1/release/threading-multi/visibility-hidden/positional_options.o" \
"libs/program_options/src/positional_options.cpp"

Notice how there is -Os followed by an -O3 flag.

The part up to the -Os is the <cxxflags> from the buildroot generated user-config.jam file. 
Everything after is generated while compiling.

I tinkered around a bit more. When I set "variant=debug" the second -O changes to -O0.
So this seems depend on the variant and basically ignores the value from the flags.

This jam stuff is pretty complicated to grasp, but I think this basically is defined in [0].
This is actually documented at [1].

Nevertheless the boost build system knows another parameter: <optimization>

So maybe this would be the way to go to configure the optimization level.

Available values are:

off, speed and space. which translate to -O0, -03 and -Os. (from [2])

So this wouldn't be mappable cleanly to all optimization levels Buildroot knows.
I didn't find a senseable way to set the -O level manually so it is not overwritten by boost, 
but maybe somebody has an idea...

If there is interest I could come up with a patch mapping the optimization values.

Regards,
Michael


[0] https://github.com/boostorg/build/blob/develop/src/tools/builtin.jam#L48
[1] https://boostorg.github.io/build/manual/master/index.html#bbv2.overview.builtins.features
[2] https://github.com/boostorg/build/blob/master/src/tools/gcc.jam#L707
