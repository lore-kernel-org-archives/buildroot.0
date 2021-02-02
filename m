From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 2 Feb 2021 16:41:26 +0100
Subject: [Buildroot] [PATCH] package/libgpiod: bump to version 1.6.2
In-Reply-To: <39b-60180480-3-547e1400@130070482>
References: <6b1-6017d800-5-32d73800@194734800>
 <39b-60180480-3-547e1400@130070482>
Message-ID: <CAMRc=MeNka7f-tu_DN8H+4PdjvxL4toDgJ1gj2r7gAtXYOEe4Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Feb 1, 2021 at 2:39 PM Michael Nosthoff <buildroot@heine.tech> wrote:
>
> Bartosz,
>
> I just noticed there is another build issue with the 1.6.2 release and I'm trying to get my head around how to best fix it.
>
> When I make a clean build with C++ enabled the Buildroot build fails with this messages:
>
> make[5]: Entering directory '/build/output/build/libgpiod-1.6.2/bindings/cxx/examples'
> /build/output/host/bin/arm-none-linux-gnueabihf-g++ -DHAVE_CONFIG_H -I. -I../../..  -I../../../bindings/cxx/ -I../../../include -Wall -Wextra -g -std=gnu++11 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -D_LARGEFILE_SOURCE -D
> _LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os   -c -o gpiodetectcxx.o gpiodetectcxx.cpp
> /build/output/host/bin/arm-none-linux-gnueabihf-g++ -DHAVE_CONFIG_H -I. -I../../..  -I../../../bindings/cxx/ -I../../../include -Wall -Wextra -g -std=gnu++11 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -D_LARGEFILE_SOURCE -D
> _LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os   -c -o gpiofindcxx.o gpiofindcxx.cpp
> /build/output/host/bin/arm-none-linux-gnueabihf-g++ -DHAVE_CONFIG_H -I. -I../../..  -I../../../bindings/cxx/ -I../../../include -Wall -Wextra -g -std=gnu++11 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -D_LARGEFILE_SOURCE -D
> _LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os   -c -o gpiogetcxx.o gpiogetcxx.cpp
> /build/output/host/bin/arm-none-linux-gnueabihf-g++ -DHAVE_CONFIG_H -I. -I../../..  -I../../../bindings/cxx/ -I../../../include -Wall -Wextra -g -std=gnu++11 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -D_LARGEFILE_SOURCE -D
> _LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os   -c -o gpioinfocxx.o gpioinfocxx.cpp
> /build/output/host/bin/arm-none-linux-gnueabihf-g++ -DHAVE_CONFIG_H -I. -I../../..  -I../../../bindings/cxx/ -I../../../include -Wall -Wextra -g -std=gnu++11 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -D_LARGEFILE_SOURCE -D
> _LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os   -c -o gpiomoncxx.o gpiomoncxx.cpp
> /build/output/host/bin/arm-none-linux-gnueabihf-g++ -DHAVE_CONFIG_H -I. -I../../..  -I../../../bindings/cxx/ -I../../../include -Wall -Wextra -g -std=gnu++11 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -D_LARGEFILE_SOURCE -D
> _LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os   -c -o gpiosetcxx.o gpiosetcxx.cpp
> /bin/bash ../../../libtool  --tag=CXX   --mode=link /build/output/host/bin/arm-none-linux-gnueabihf-g++  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os   -lgpiodcxx -L../../../bindings/cxx/  -o gpiofindcxx gpiofindcxx.o
> /bin/bash ../../../libtool  --tag=CXX   --mode=link /build/output/host/bin/arm-none-linux-gnueabihf-g++  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os   -lgpiodcxx -L../../../bindings/cxx/  -o gpiodetectcxx gpiodetectcxx.o
>
> libtool: link: /build/output/host/bin/arm-none-linux-gnueabihf-g++ -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -o gpiofindcxx gpiofindcxx.o  /build/output/build/libgpiod-1.6.2/bindings/cxx/.libs/li
> bgpiodcxx.so -L../../../bindings/cxx/ -Wl,-rpath -Wl,/build/output/build/libgpiod-1.6.2/bindings/cxx/.libs
> /bin/bash ../../../libtool  --tag=CXX   --mode=link /build/output/host/bin/arm-none-linux-gnueabihf-g++  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os   -lgpiodcxx -L../../../bindings/cxx/  -o gpioinfocxx gpioinfocxx.o
> libtool: link: /build/output/host/bin/arm-none-linux-gnueabihf-g++ -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -o gpiodetectcxx gpiodetectcxx.o  /build/output/build/libgpiod-1.6.2/bindings/cxx/.lib
> s/libgpiodcxx.so -L../../../bindings/cxx/ -Wl,-rpath -Wl,/build/output/build/libgpiod-1.6.2/bindings/cxx/.libs
> /build/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-none-linux-gnueabihf/9.2.1/../../../../arm-none-linux-gnueabihf/bin/ld: /build/output/build/libgpiod-1.6.2/bindings/cxx/.libs/libgpiodcxx.so: undefined reference to `
> gpiod_line_bias'
> /build/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-none-linux-gnueabihf/9.2.1/../../../../arm-none-linux-gnueabihf/bin/ld: /build/output/build/libgpiod-1.6.2/bindings/cxx/.libs/libgpiodcxx.so: undefined reference to `
> gpiod_line_set_direction_output_bulk'
> /build/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-none-linux-gnueabihf/9.2.1/../../../../arm-none-linux-gnueabihf/bin/ld: /build/output/build/libgpiod-1.6.2/bindings/cxx/.libs/libgpiodcxx.so: undefined reference to `
> gpiod_line_set_config_bulk'
> /build/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-none-linux-gnueabihf/9.2.1/../../../../arm-none-linux-gnueabihf/bin/ld: /build/output/build/libgpiod-1.6.2/bindings/cxx/.libs/libgpiodcxx.so: undefined reference to `
> gpiod_line_set_direction_input_bulk'
> /build/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-none-linux-gnueabihf/9.2.1/../../../../arm-none-linux-gnueabihf/bin/ld: /build/output/build/libgpiod-1.6.2/bindings/cxx/.libs/libgpiodcxx.so: undefined reference to `
> gpiod_line_event_read_multiple'
> /build/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-none-linux-gnueabihf/9.2.1/../../../../arm-none-linux-gnueabihf/bin/ld: /build/output/build/libgpiod-1.6.2/bindings/cxx/.libs/libgpiodcxx.so: undefined reference to `
> gpiod_line_set_flags_bulk'
> collect2: error: ld returned 1 exit status
>
>
> When building regularly on a clean Linux system I don't have any troubles.
> If I build on a Buildroot target which already has some version of libgpiod built it works. (e.g. when bumping the version without make clean).
> So it seems that the build doesn't find the libgpiod.so that was just built inside the build directory. My guess is it has something to do with the libtools workarounds for cross-compiling (My knowledge of autotools/libtool is limited here.).
>
>
> But before I dig deeper into why this fails my question would be: does the bindings/cpp/examples directory really need to be build? In the 1.4.x branch it was not built by default. Now it is changed to a "noinst" target. So it gets build but won't be deployed to the target anyways.
>

It doesn't need to be built and in v2.0 we already have a flag to
disable building examples (because, for example, the C++ examples in
v2.0 depend on C++17 features). It would be useful however to fix the
problem because it may manifest itself somewhere else too. I'll see
about that as soon as I find some time.

Bart

> Maybe you have an Idea how this could be easily fixed. My (not so nice) solution for now would be to patch out the examples directory. But this is really a last ressort...
>
> Regards,
> Michael
>
