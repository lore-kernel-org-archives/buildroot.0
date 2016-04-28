From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 28 Apr 2016 14:15:55 +0200
Subject: [Buildroot] CMake can't find Boost
In-Reply-To: <20160428091843.114485d3@x230.trabucayre.com>
References: <5721AAA5.40208@gpsatsys.com.au>
 <20160428091843.114485d3@x230.trabucayre.com>
Message-ID: <CAHXCMMKnnma-XC5NfJfzkYFxv6t_=_=Kkj4h1a8Hjk+NVgpSUQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Thu, Apr 28, 2016 at 9:18 AM, gwenhael.goavec <gwenj@trabucayre.com> wrote:
> Hi,
>
> On Thu, 28 Apr 2016 16:16:05 +1000
> Gareth Pye <garethp@gpsatsys.com.au> wrote:
>
>> Hi,
>>
>> I've had a lot trouble convincing cmake that boost is available. I'm
>> trying to add the UHD drivers to buildroot. We need it to connect up
>> the USR B200 to our Odroid C1s.
>>
>> My uhd.mk looks like:
>>
>> ################################################################################
>> #
>> # UHD driver for USRP hardware (ettus research)
>> #
>> ################################################################################
>>
>> UHD_VERSION = 003_009_001
>> UHD_SOURCE = /release_$(UHD_VERSION).tar.gz
>> UHD_SITE = https://github.com/EttusResearch/uhd/archive
>> UHD_INSTALL_STAGING = YES
>> UHD_INSTALL_TARGET = YES
>>
>> UHD_CONF_OPTS += -DENABLE_EXAMPLES=OFF
>> UHD_CONF_OPTS += -DENABLE_USB=ON
>> UHD_CONF_OPTS += -DENABLE_MANUAL=OFF
>> UHD_CONF_OPTS += -DENABLE_DOXYGEN=OFF
>> UHD_CONF_OPTS += -DENABLE_UTILS=OFF
>> UHD_CONF_OPTS += -DENABLE_TESTS=OFF
>>
>> UHD_CONF_OPTS +=
>> -Dtarget_link_libraries=/data/Build/buildroot/output/target/usr/lib/
target_link_libraries is a CMake  builtin function [1], so AFAIK it
cannot be override like this.
Anyway, this is not needed; the cmake-package infrastructure [2] (via
CMAKE_TOOLCHAIN_FILE) should take care of setting this kind of stuff
for you.

>>
>> UHD_CONF_OPTS +=
>> -DBoost_INCLUDE_DIR=../../../../output/build/boost-1.60.0
This is not needed, CMake comes with a FindBoost.cmake module, which
should work as expected [3] (as mention by Gwen).
Also, pointing to the build directory is usually a bad practice; there
is absolutely no warranty that the layout where the headers and libs
are matches the installation layout.

>> UHD_CONF_OPTS +=
>> -DBoost_LIBRARY_DIR=../../../../output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib
>> UHD_CONF_OPTS += -DCMAKE_FIND_ROOT_PATH_MODE_INCLUDE=BOTH
As said before the infra takes care of this.

>>
>> UHD_DEPENDENCIES = libglib2 host-pkgconf python-mako libusb boost
>> UHD_SUBDIR = host
>> UHD_SUPPORTS_IN_SOURCE_BUILD = NO
>>
>> define UHD_PRE_CONFIGURE_FIXUP
>>            cp -r output/target/usr/lib/python2.7/site-packages/mako
>> output/host/usr/lib/python2.7/site-packages/
>> endef
hmm! This fixup looks dubious!
If python-mako is needed, then you should wonder:
- is it needed only for the target (e.g. only at runtime)?
- is it needed at buildtime (i.e. by the UHD build-system itself)?
then host-python-mako must be added to the dependency list.


>> UHD_PRE_CONFIGURE_HOOKS += UHD_PRE_CONFIGURE_FIXUP
> It's not a good thing to hard code everything. UHD is able to
> work not only on ARM. But it not the current subject.
>>
>> $(eval $(cmake-package))
>>
>> And an attempt at building it looks like (full paste at:
>> http://pastebin.com/eQmf0YW8):
>>
>> <snip>
>> -- Could NOT find Boost
> I think you must check if all needs boot's modules are available.
> For example host/CMakeLists.txt checks for these boost's modules :
> date_time, filesystem, program_options, regex, system, thread,
> unit_test_framework, serialization.

As already said, make sure boost components listed in [4] are selected
in the Config.in file.

>
>
>> CMake Warning (dev) at CMakeLists.txt:221 (LINK_DIRECTORIES):
>>    This command specifies the relative path
>>
>> ../../../../output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib
>>https://cmake.org/cmake/help/v3.5/module/FindBoost.html
>>    as a link directory.
>>
>>    Policy CMP0015 is not set: link_directories() treats paths
>> relative to the
>>    source dir.  Run "cmake --help-policy CMP0015" for policy
>> details. Use the
>>    cmake_policy command to set the policy and suppress this warning.
>> This warning is for project developers.  Use -Wno-dev to suppress it.
>>
>> -- Boost include directories: ../../../../output/build/boost-1.60.0
>> -- Boost library directories:
>> ../../../../output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib
>> -- Boost libraries:
>> -- Looking for log2
>> -- Looking for log2 - found
>> <snip>
>>
>>
>> The uhd.mk file is similar to what worked several months ago, but it
>> appears I didn't event commit to my local repository correctly as
>> trying to make that doesn't work either.
>>
>> Should a cmake project using boost 'just work' & I should be
>> complaining to the UHD guys or is there something I should be
>> tweaking in buildroot?
So far, boost with cmake projects just work.
Hint: check all required boost components are selected in your config.

>>
> In my experience boost works with cmake. It's used successfully to
> build, for example, gnuradio and gr-osmosdr.
>
> Regard.
> Gwen
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

[1] https://cmake.org/cmake/help/v3.5/command/target_link_libraries.html
[2] http://nightly.buildroot.org/#_infrastructure_for_cmake_based_packages
[3] https://cmake.org/cmake/help/v3.5/module/FindBoost.html
[4] https://github.com/EttusResearch/uhd/blob/master/host/CMakeLists.txt#L235


Regards,

-- 
Samuel
