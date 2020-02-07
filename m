From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 7 Feb 2020 13:26:18 +0100
Subject: [Buildroot] [PATCH] package/libftdi1: fix python support
In-Reply-To: <875zgiy8dq.fsf@dell.be.48ers.dk>
References: <20200206095421.12987-1-yegorslists@googlemail.com>
 <87imkiyd32.fsf@dell.be.48ers.dk>
 <CAGm1_kvMR9y5FtiAUNcMDT8V4diTFNk=3KSD7twQzkXw0jm-tQ@mail.gmail.com>
 <875zgiy8dq.fsf@dell.be.48ers.dk>
Message-ID: <CAGm1_ksGCvr8bmLMjrrNaGQvcaGS=2GuC7yqQcvTBE93_1Z-Jw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Feb 7, 2020 at 11:55 AM Peter Korsgaard <peter@korsgaard.com> wrote:
>
> >>>>> "Yegor" == Yegor Yefremov <yegorslists@googlemail.com> writes:
>
>  > Hi Peter,
>  > On Fri, Feb 7, 2020 at 10:13 AM Peter Korsgaard <peter@korsgaard.com> wrote:
>  >>
>  >> >>>>> "yegorslists" == yegorslists  <yegorslists@googlemail.com> writes:
>  >>
>  >> > From: Yegor Yefremov <yegorslists@googlemail.com>
>  >> > Add an upstreamed patch that reorders find_package() commands.
>  >> > This way Python interpreter will be detected first and based on
>  >> > it the Python libraries can be found.
>  >>
>  >> > Fixes the following CMake error:
>  >>
>  >> > Could NOT find PythonLibs (missing: PYTHON_LIBRARIES PYTHON_INCLUDE_DIRS)
>  >>
>  >> We don't seem to have any autobuilder failures in libftdi1 for almost 1
>  >> year. Any idea why this doesn't trigger on the autobuilders?
>
>  > In the version 1.4 find_package() calls were made without the REQUIRED
>  > keyword. Hence, this error wasn't detected by the autobuilders. This
>  > is now fixed upstream and I hope a new release will appear soon. But
>  > meanwhile let's apply this fix.
>
> Ahh, so you mean that the python module would just not be built?
>
> That is not what I see here using a defconfig with libftdi1 and python3
> on a machine with python 2.7 and python 3.7:
>
> -- Could NOT find Boost
> -- Could NOT find Doxygen (missing: DOXYGEN_EXECUTABLE)
> -- Not generating API documentation
> -- Detected git snapshot version: 2019.11-1302-ge5e84823bb
> -- Found SWIG: /home/peko/source/buildroot/output-ftdi/host/bin/swig (found version "4.0.1")
> -- Found PythonLibs: /home/peko/source/buildroot/output-ftdi/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libpython3.8.so (found version "3.8.1")
> -- Found PythonInterp: /home/peko/source/buildroot/output-ftdi/host/bin/python3.8 (found version "3.8.1")
> CMake Deprecation Warning at /usr/share/cmake-3.13/Modules/UseSWIG.cmake:524 (message):
>   SWIG_ADD_MODULE is deprecated.  Use SWIG_ADD_LIBRARY instead.
> Call Stack (most recent call first):
>   python/CMakeLists.txt:28 (swig_add_module)
>
>
> CMake Warning (dev) at /usr/share/cmake-3.13/Modules/UseSWIG.cmake:564 (message):
>   Policy CMP0078 is not set.  Run "cmake --help-policy CMP0078" for policy
>   details.  Use the cmake_policy command to set the policy and suppress this
>   warning.
> Call Stack (most recent call first):
>   /usr/share/cmake-3.13/Modules/UseSWIG.cmake:525 (swig_add_library)
>   python/CMakeLists.txt:28 (swig_add_module)
> This warning is for project developers.  Use -Wno-dev to suppress it.
>
> -- Building python bindings via swig. Will be installed under /usr/lib/python3.8/site-packages
>
>
> So it correctly finds our host-python3 and does not get confused about
> the python 2.7 / 3.7 on my build machine.
>
> In what setup is it failing for you without this patch?

This is what I get when invoking "make libftdi1"

>>> libftdi1 1.4 Configuring
(mkdir -p /home/YegorYefremov/MyProjects/oss/br-test-v2/bsp-uboot/build/libftdi1-1.4/
&& cd /home/YegorYefremov/MyProjects/oss/br-test-v2/bsp-uboot/build/libftdi1-1.4/
&& rm -f CMakeCache.txt &&
PATH="/home/YegorYefremov/MyProjects/oss/br-test-v2/bsp-uboot/host/bin:/home/YegorYefremov/MyProjects/oss/br-test-v2/bsp-uboot/host/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
 /usr/bin/cmake
/home/YegorYefremov/MyProjects/oss/br-test-v2/bsp-uboot/build/libftdi1-1.4/
-DCMAKE_TOOLCHAIN_FILE="/home/YegorYefremov/MyProjects/oss/br-test-v2/bsp-uboot/host/share/buildroot/toolchainfile.cmake"
-DCMAKE_INSTALL_PREFIX="/usr" -DCMAKE_COLOR_MAKEFILE=OFF
-DBUILD_DOC=OFF -DBUILD_DOCS=OFF -DBUILD_EXAMPLE=OFF
-DBUILD_EXAMPLES=OFF -DBUILD_TEST=OFF -DBUILD_TESTS=OFF
-DBUILD_TESTING=OFF -DBUILD_SHARED_LIBS=ON  -DDOCUMENTATION=OFF
-DEXAMPLES=OFF -DFTDIPP=OFF -DPYTHON_BINDINGS=ON -DFTDI_EEPROM=OFF )
-- The C compiler identification is GNU 9.2.1
-- Check for working C compiler:
/home/user/br-test-v2/bsp-uboot/host/bin/arm-none-linux-gnueabihf-gcc
-- Check for working C compiler:
/home/user/br-test-v2/bsp-uboot/host/bin/arm-none-linux-gnueabihf-gcc
-- works
-- Detecting C compiler ABI info
-- Detecting C compiler ABI info - done
-- Detecting C compile features
-- Detecting C compile features - done
-- Build type: Release
-- Found PkgConfig:
/home/user/br-test-v2/bsp-uboot/host/bin/pkg-config (found version
"1.6.1")
-- Checking for module 'libusb-1.0'
--   Found libusb-1.0, version 1.0.23
-- Found LIBUSB:
/home/user/br-test-v2/bsp-uboot/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libusb-1.0.so
-- Could NOT find Boost
-- Found Doxygen: /usr/bin/doxygen (found version "1.8.13") found
components:  doxygen dot
-- Not generating API documentation
-- Detected git snapshot version: 2019.11-1302-ge5e84823bb
-- Found SWIG: /usr/bin/swig3.0 (found version "3.0.12")
-- Could NOT find PythonLibs (missing: PYTHON_LIBRARIES PYTHON_INCLUDE_DIRS)
-- Found PythonInterp: /home/user/br-test-v2/bsp-uboot/host/bin/python
(found version "3.8.1")
-- Not building python bindings
-- ftdi_eeprom build is disabled
-- libConfuse not found, won't build ftdi_eeprom
-- Not building example programs.
-- NOT building unit test
-- Configuring done
-- Generating done

I was using this defconfig [1]. To speed up the build I've changed the
ABI to ARMHF and used the default external toolchain. And python3,
libftdi1 together with python bindings were selected.

My host has:

Python 3.6.7
Python 2.7.15rc1

[1] https://github.com/visionsystemsgmbh/onrisc_br_bsp/blob/master/configs/baltos_defconfig

P.S. another issue is that as you can see cmake has found the host's
own SWIG version and not BR's version which is 4.0.x.

Yegor
