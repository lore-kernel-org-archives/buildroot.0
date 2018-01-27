From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 27 Jan 2018 12:55:37 +0100
Subject: [Buildroot] [PATCHv3 1/1] thunderbolt-tools: new package
In-Reply-To: <20180126153012.32754-1-Andrei.Emeltchenko.news@gmail.com>
 (Andrei Emeltchenko's message of "Fri, 26 Jan 2018 17:30:12 +0200")
References: <20180125130903.9481-1-Andrei.Emeltchenko.news@gmail.com>
 <20180126153012.32754-1-Andrei.Emeltchenko.news@gmail.com>
Message-ID: <87d11vh5xi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Andrei" == Andrei Emeltchenko <Andrei.Emeltchenko.news@gmail.com> writes:

 > From: Andrei Emeltchenko <andrei.emeltchenko@intel.com>
 > Add package thunderbolt-tools to handle Thunderbolt devices.

 > Signed-off-by: Andrei Emeltchenko <andrei.emeltchenko@intel.com>
 > Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

Thanks, it is starting to look good, but there's still a few issues.

> ---
 >  DEVELOPERS                                       |  3 +++
 >  package/Config.in                                |  1 +
 >  package/thunderbolt-tools/Config.in              | 13 +++++++++++++
 >  package/thunderbolt-tools/thunderbolt-tools.hash |  3 +++
 >  package/thunderbolt-tools/thunderbolt-tools.mk   | 14 ++++++++++++++
 >  5 files changed, 34 insertions(+)
 >  create mode 100644 package/thunderbolt-tools/Config.in
 >  create mode 100644 package/thunderbolt-tools/thunderbolt-tools.hash
 >  create mode 100644 package/thunderbolt-tools/thunderbolt-tools.mk

 > diff --git a/DEVELOPERS b/DEVELOPERS
 > index 73c0231bc0..822961a467 100644
 > --- a/DEVELOPERS
 > +++ b/DEVELOPERS
 > @@ -1949,3 +1949,6 @@ F:	package/qjson/
 >  F:	package/quazip/
 >  F:	package/shapelib/
 >  F:	package/tinc/
 > +
 > +N:	Andrei Emeltchenko <andrei.emeltchenko@intel.com>
 > +F:	package/thunderbolt-tools/

Plese keep this file alphabetically sorted (so add before Andrey
Smirnov).

> diff --git a/package/Config.in b/package/Config.in
 > index 00451f526d..d638ac3a72 100644
 > --- a/package/Config.in
 > +++ b/package/Config.in
 > @@ -505,6 +505,7 @@ endmenu
 >  	source "package/sunxi-mali/Config.in"
 >  	source "package/sysstat/Config.in"
 >  	source "package/targetcli-fb/Config.in"
 > +	source "package/thunderbolt-tools/Config.in"
 >  	source "package/ti-gfx/Config.in"
 >  	source "package/ti-sgx-demos/Config.in"
 >  	source "package/ti-sgx-km/Config.in"
 > diff --git a/package/thunderbolt-tools/Config.in b/package/thunderbolt-tools/Config.in
 > new file mode 100644
 > index 0000000000..be80c81dc0
 > --- /dev/null
 > +++ b/package/thunderbolt-tools/Config.in
 > @@ -0,0 +1,13 @@
 > +config BR2_PACKAGE_THUNDERBOLT_TOOLS
 > +	bool "thunderbolt-tools"
 > +	select BR2_PACKAGE_BOOST
 > +	select BR2_PACKAGE_BOOST_FILESYSTEM
 > +	depends on BR2_PACKAGE_HAS_UDEV
 > +	depends on BR2_INSTALL_LIBSTDCPP
 > +	help
 > +	  Thunderbolt user space tools
 > +
 > +	  https://github.com/intel/thunderbolt-software-user-space

Please run the package through utils/check-package. Depends on should
come before select. The boost package also has a number of dependencies
that you need to propagate, E.G. something like:

        depends on BR2_TOOLCHAIN_HAS_THREADS # boost
        depends on BR2_USE_WCHAR # boost

> +
 > +comment "thunderbolt-tools package needs udev provided by systemd or eudev, C++"
 > +	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_PACKAGE_HAS_UDEV

Drop 'package' to make the text shorter. Other packages with similar
requirements (E.G. modem-manager) use wording like:

comment "thunderbolt-tools needs udev /dev management, wchar, C++, threads"


> +++ b/package/thunderbolt-tools/thunderbolt-tools.mk
 > @@ -0,0 +1,14 @@
 > +################################################################################
 > +#
 > +# thunderbolt-tools
 > +#
 > +################################################################################
 > +
 > +THUNDERBOLT_TOOLS_VERSION = 8c82b2f84dfede86683873bc47a0b95714129a66
 > +THUNDERBOLT_TOOLS_SITE = $(call github,intel,thunderbolt-software-user-space,$(THUNDERBOLT_TOOLS_VERSION))

Is there a specific reason why you are using a random git hash and not
just the latest release? Please document this in the commit message.

We normally try to use the same name for the buildroot package as for
the upstream project, but I agree that
BR2_PACKAGE_THUNDERBOLT_SOFTWARE_USER_SPACE is quite a mouthful, so OK.


 > +THUNDERBOLT_TOOLS_LICENSE = BSD-3-Clause
 > +THUNDERBOLT_TOOLS_LICENSE_FILES = COPYING
 > +
 > +THUNDERBOLT_TOOLS_DEPENDENCIES = host-pkgconf boost

I see that CMakeLists.txt looks for pkg-config variables from the udev
package, so it isn't just a runtime dependency and you need to add it to
the _DEPENDENCIES line.

I tried a test build with the above fixed, but it errors out if txt2tags
isn't available:

-- Found PkgConfig: /home/peko/source/buildroot/output-thunder/host/bin/pkg-config (found version "0.28")
CMake Warning at /usr/share/cmake-3.7/Modules/FindBoost.cmake:761 (message):
  Imported targets not available for Boost version 106600
Call Stack (most recent call first):
  /usr/share/cmake-3.7/Modules/FindBoost.cmake:865 (_Boost_COMPONENT_DEPENDENCIES)
  /usr/share/cmake-3.7/Modules/FindBoost.cmake:1470 (_Boost_MISSING_DEPENDENCIES)
  common/CMakeLists.txt:5 (find_package)


-- Boost version: 1.66.0
-- Found the following Boost libraries:
--   filesystem
CMake Error at docs/CMakeLists.txt:7 (message):
  txt2tags is needed for generating the man page

So you should make man generation optional (and disable it in the
buildroot package).

Care to fix these issues and resend? Thanks.

-- 
Bye, Peter Korsgaard
