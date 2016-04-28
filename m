From: gwenhael.goavec <gwenj@trabucayre.com>
Date: Thu, 28 Apr 2016 09:18:43 +0200
Subject: [Buildroot] CMake can't find Boost
In-Reply-To: <5721AAA5.40208@gpsatsys.com.au>
References: <5721AAA5.40208@gpsatsys.com.au>
Message-ID: <20160428091843.114485d3@x230.trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Thu, 28 Apr 2016 16:16:05 +1000
Gareth Pye <garethp@gpsatsys.com.au> wrote:

> Hi,
> 
> I've had a lot trouble convincing cmake that boost is available. I'm 
> trying to add the UHD drivers to buildroot. We need it to connect up
> the USR B200 to our Odroid C1s.
> 
> My uhd.mk looks like:
> 
> ################################################################################
> #
> # UHD driver for USRP hardware (ettus research)
> #
> ################################################################################
> 
> UHD_VERSION = 003_009_001
> UHD_SOURCE = /release_$(UHD_VERSION).tar.gz
> UHD_SITE = https://github.com/EttusResearch/uhd/archive
> UHD_INSTALL_STAGING = YES
> UHD_INSTALL_TARGET = YES
> 
> UHD_CONF_OPTS += -DENABLE_EXAMPLES=OFF
> UHD_CONF_OPTS += -DENABLE_USB=ON
> UHD_CONF_OPTS += -DENABLE_MANUAL=OFF
> UHD_CONF_OPTS += -DENABLE_DOXYGEN=OFF
> UHD_CONF_OPTS += -DENABLE_UTILS=OFF
> UHD_CONF_OPTS += -DENABLE_TESTS=OFF
> 
> UHD_CONF_OPTS += 
> -Dtarget_link_libraries=/data/Build/buildroot/output/target/usr/lib/
> 
> UHD_CONF_OPTS +=
> -DBoost_INCLUDE_DIR=../../../../output/build/boost-1.60.0
> UHD_CONF_OPTS +=
> -DBoost_LIBRARY_DIR=../../../../output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib
> UHD_CONF_OPTS += -DCMAKE_FIND_ROOT_PATH_MODE_INCLUDE=BOTH
> 
> UHD_DEPENDENCIES = libglib2 host-pkgconf python-mako libusb boost
> UHD_SUBDIR = host
> UHD_SUPPORTS_IN_SOURCE_BUILD = NO
> 
> define UHD_PRE_CONFIGURE_FIXUP
>            cp -r output/target/usr/lib/python2.7/site-packages/mako 
> output/host/usr/lib/python2.7/site-packages/
> endef
> UHD_PRE_CONFIGURE_HOOKS += UHD_PRE_CONFIGURE_FIXUP
It's not a good thing to hard code everything. UHD is able to
work not only on ARM. But it not the current subject.
> 
> $(eval $(cmake-package))
> 
> And an attempt at building it looks like (full paste at: 
> http://pastebin.com/eQmf0YW8):
> 
> <snip>
> -- Could NOT find Boost
I think you must check if all needs boot's modules are available.
For example host/CMakeLists.txt checks for these boost's modules :
date_time, filesystem, program_options, regex, system, thread,
unit_test_framework, serialization.


> CMake Warning (dev) at CMakeLists.txt:221 (LINK_DIRECTORIES):
>    This command specifies the relative path
> 
> ../../../../output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib
> 
>    as a link directory.
> 
>    Policy CMP0015 is not set: link_directories() treats paths
> relative to the
>    source dir.  Run "cmake --help-policy CMP0015" for policy
> details. Use the
>    cmake_policy command to set the policy and suppress this warning.
> This warning is for project developers.  Use -Wno-dev to suppress it.
> 
> -- Boost include directories: ../../../../output/build/boost-1.60.0
> -- Boost library directories: 
> ../../../../output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib
> -- Boost libraries:
> -- Looking for log2
> -- Looking for log2 - found
> <snip>
> 
> 
> The uhd.mk file is similar to what worked several months ago, but it 
> appears I didn't event commit to my local repository correctly as
> trying to make that doesn't work either.
> 
> Should a cmake project using boost 'just work' & I should be
> complaining to the UHD guys or is there something I should be
> tweaking in buildroot?
> 
In my experience boost works with cmake. It's used successfully to
build, for example, gnuradio and gr-osmosdr.

Regard.
Gwen
