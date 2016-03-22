From: Santosh Multhalli <santosh.multhalli@rockwellcollins.com>
Date: Tue, 22 Mar 2016 12:51:06 +0530
Subject: [Buildroot] [PATCH valijson v3] valijson: new package
In-Reply-To: <CAHXCMMKF0yySTDUmy66DiwqHVLuEhbinCR00AVHcNOfoeQpC3w@mail.gmail.com>
References: <1458130591-8818-1-git-send-email-santosh.multhalli@rockwellcollins.com>
 <CAHXCMMKF0yySTDUmy66DiwqHVLuEhbinCR00AVHcNOfoeQpC3w@mail.gmail.com>
Message-ID: <CAGE8Xjrf91-Soxa+_8kdPHO_7N36ZarJF_sZPBAi+aW00Ai7Kg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Samuel,
The valijson is not deployed on the target . it will be only part of the
sysroot which will be exported to Developer.

*In that case should we still use the "depends on". as it is specifically
used for targets.?*


regarding the cross compilation fixing  patches

0001-CMake-Add-options.patch :- adds/sets  the options
CMAKE_CXX_FLAGS
INSTALL_HEADERS
BUILD_EXAMPLES
BUILD_TESTS
 0002-CMake-Add-conditional-check-to-Install-headers-build-examples-a.patch
does the  conditional checking of the above options



Thanks,
Santosh Multhalli




On Thu, Mar 17, 2016 at 3:38 AM, Samuel Martin <s.martin49@gmail.com> wrote:

> Hi Santosh,
>
> On Wed, Mar 16, 2016 at 1:16 PM, santosh.multhalli
> <santosh.multhalli@rockwellcollins.com> wrote:
> > Valijson is a header-only JSON Schema Validation library for
> > C++.Add a patch
> 0001-CMake-Add-option-to-Install-headers-build-examples-a.patch
> > to install valijson headers ,provide optional compilation of unit tests
> and
> > examples.
> > ---
> > Changes v2 -> v3:
> >    - changed indentation in package/valijson/Config.in (suggested by
> Samuel)
> >    - updated the comments in (package/valijson/Config.in) to reflect
> boost dependecy (suggested by Thomas)
> >    - updated to keep the alphabetical order in package/Config.in
> (suggested by Samuel)
> > ---
> > Changes v1 -> v2:
> >   - Patch splitted into two
> >     0001-CMake-Add-options.patch
> >
>  0002-CMake-Add-conditional-check-to-Install-headers-build-examples-a.patch
> >
> >   - Changed Config.in and valijson.mk as per comments ( suggested by
> Samuel and Thomas).
> >
> > Signed-off-by: santosh.multhalli <santosh.multhalli@rockwellcollins.com>
> > ---
> >  package/Config.in                                  |  1 +
> >  package/valijson/0001-CMake-Add-options.patch      | 18 +++++++++++
> >  ...check-to-Install-headers-build-examples-a.patch | 35
> ++++++++++++++++++++++
> >  package/valijson/Config.in                         | 12 ++++++++
> >  package/valijson/valijson.hash                     |  2 ++
> >  package/valijson/valijson.mk                       | 15 ++++++++++
> >  6 files changed, 83 insertions(+)
> >  create mode 100644 package/valijson/0001-CMake-Add-options.patch
> >  create mode 100644
> package/valijson/0002-CMake-Add-conditional-check-to-Install-headers-build-examples-a.patch
> >  create mode 100644 package/valijson/Config.in
> >  create mode 100644 package/valijson/valijson.hash
> >  create mode 100644 package/valijson/valijson.mk
> >
> > diff --git a/package/Config.in b/package/Config.in
> > index d4cc1d7..5409c09 100644
> > --- a/package/Config.in
> > +++ b/package/Config.in
> > @@ -805,6 +805,7 @@ menu "JSON/XML"
> >         source "package/mxml/Config.in"
> >         source "package/rapidjson/Config.in"
> >         source "package/tinyxml/Config.in"
> > +       source "package/valijson/Config.in"
> >         source "package/xerces/Config.in"
> >         source "package/yajl/Config.in"
> >         source "package/yaml-cpp/Config.in"
> > diff --git a/package/valijson/0001-CMake-Add-options.patch
> b/package/valijson/0001-CMake-Add-options.patch
> > new file mode 100644
> > index 0000000..a771ba6
> > --- /dev/null
> > +++ b/package/valijson/0001-CMake-Add-options.patch
> > @@ -0,0 +1,18 @@
> > +Added 3 options - INSTALL_HEADERS, BUILD_EXAMPLES and BUILD_TESTS.
> > +INSTALL_HEADERS - Installs all header files, TRUE by default
> > +BUILD_EXAMPLES  - Builds all examples in examples directory, FALSE by
> > +                  default
> > +BUILD_TESTS     - Builds all test cases under tests directory, FALSE
> > +                  by default
> > +--- a/CMakeLists.txt
> > ++++ b/CMakeLists.txt
> > +@@ -3,6 +3,9 @@
> > +
> > + SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Werror")
> > + SET(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -O0")
> > ++option (INSTALL_HEADERS "Install valijson Headers." TRUE)
> > ++option (BUILD_EXAMPLES "Build valijson Examples." FALSE)
> > ++option (BUILD_TESTS "Build valijson Tests." FALSE)
> > + if(VALIJSON_CXX11_ADAPTERS STREQUAL "disabled")
> > +     message(STATUS "Building with C++11 support disabled")
> > + else()
> > diff --git
> a/package/valijson/0002-CMake-Add-conditional-check-to-Install-headers-build-examples-a.patch
> b/package/valijson/0002-CMake-Add-conditional-check-to-Install-headers-build-examples-a.patch
> > new file mode 100644
> > index 0000000..7959123
> > --- /dev/null
> > +++
> b/package/valijson/0002-CMake-Add-conditional-check-to-Install-headers-build-examples-a.patch
> > @@ -0,0 +1,35 @@
> > +From 9ac0e0cb20604a19a6953888f4d32f665725a86b Mon Sep 17 00:00:00 2001
> > +From: Bimal Jacob <Bimal.Jacob@rockwellcollins.com>
> > +Date: Thu, 19 Nov 2015 09:55:53 -0600
> > +Subject: CMake: Add conditional check for options
> > +
> > +Signed-off-by: Bimal Jacob <bimal.jacob@rockwellcollins.com>
> > +Signed-off-by: Santosh Multhalli <santosh.multhalli@rockwellcollins.com
> >
> > +
> > +diff --git a/CMakeLists.txt b/CMakeLists.txt
> > +index 9cff096..427dca7 100644
> > +--- a/CMakeLists.txt
> > ++++ b/CMakeLists.txt
> > +@@ -1,11 +1,13 @@
> > + cmake_minimum_required (VERSION 2.6)
> > + project (valijson)
> > +
> > +-SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Werror")
> > ++SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall")
> > + SET(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -O0")
> > + option (INSTALL_HEADERS "Install valijson Headers." TRUE)
> > + option (BUILD_EXAMPLES "Build valijson Examples." FALSE)
> > + option (BUILD_TESTS "Build valijson Tests." FALSE)
> > ++if (BUILD_TESTS OR BUILD_EXAMPLES)
> > ++
> > + if(VALIJSON_CXX11_ADAPTERS STREQUAL "disabled")
> > +     message(STATUS "Building with C++11 support disabled")
> > + else()
> > +@@ -108,3 +110,7 @@
> > + target_link_libraries(custom_schema ${Boost_LIBRARIES})
> > + target_link_libraries(external_schema ${Boost_LIBRARIES})
> > +
> > ++endif()
> > ++if (INSTALL_HEADERS )
> > ++install(DIRECTORY include/ DESTINATION include )
> > ++endif()
> I'm afraid the patches are not what we expect.
> Sorry if I was not clear enough in the previous reviews.
> We want patches as atomic as possible and semantically consistent,
> with a commit log explain what the change does.
> In this case, it means: one patch fixing the CMAKE_CXX_FLAGS
> variables, and another patch add the 3 options and using these new
> variables; so you should got something like [1].
>
> > diff --git a/package/valijson/Config.in b/package/valijson/Config.in
> > new file mode 100644
> > index 0000000..5807a9d
> > --- /dev/null
> > +++ b/package/valijson/Config.in
> > @@ -0,0 +1,12 @@
> > +config BR2_PACKAGE_VALIJSON
> > +       bool "valijson"
> > +       select BR2_PACKAGE_BOOST
> > +       select BR2_PACKAGE_BOOST_REGEX
> Here you should propagate the "depends on" statements from boost, see
> [2] as example.
> Also, a comment should be added for the case when these dependencies
> are not met, see [2,3].
>
> To know more about the Config.in formating, you can refer to [4].
>
> > +       help
> > +        Valijson is a header-only JSON Schema Validation library for
> > +        C++. Valijson provides a simple validation API that allows you
> > +        load JSON Schemas, and validate documents loaded by one of
> > +        several supported parser libraries like boost, jsoncpp,
> > +        rapidjson and picoJSON.It depends on BOOST Libraries
> > +
> > +        https://github.com/tristanpenman/valijson
> > diff --git a/package/valijson/valijson.hash
> b/package/valijson/valijson.hash
> > new file mode 100644
> > index 0000000..7d8a508
> > --- /dev/null
> > +++ b/package/valijson/valijson.hash
> > @@ -0,0 +1,2 @@
> > +# Locally Computed:
> > +sha256
> 20ee0ba111461011012a7a5534c8f88e6a6964a2d9c665fd1b4d629ee8b8e90a
> valijson-4e941e75d99463eed988a782900e885befce47d9.tar.gz
> > diff --git a/package/valijson/valijson.mk b/package/valijson/valijson.mk
> > new file mode 100644
> > index 0000000..44aeba2
> > --- /dev/null
> > +++ b/package/valijson/valijson.mk
> > @@ -0,0 +1,15 @@
> >
> +################################################################################
> > +#
> > +# valijson
> > +#
> >
> +################################################################################
> > +
> > +VALIJSON_VERSION = ee2d24714a10fc486d160a50f58aecdcfe988e88
> > +VALIJSON_SITE = $(call
> github,tristanpenman,valijson,$(VALIJSON_VERSION))
> > +VALIJSON_LICENSE = BSD-3c
> > +VALIJSON_LICENSE_FILES = LICENSE
> > +VALIJSON_INSTALL_STAGING = YES
> > +VALIJSON_INSTALL_TARGET = NO
> > +VALIJSON_DEPENDENCIES = boost
> > +
> > +$(eval $(cmake-package))
> > --
> > 2.5.0
> >
>
> [1] http://code.bulix.org/ci83fr-93875?raw
> [2] https://git.buildroot.org/buildroot/tree/package/cc-tool/Config.in
> [3]
> http://nightly.buildroot.org/manual.html#dependencies-target-toolchain-options
> [4] http://nightly.buildroot.org/manual.html#_config_files
>
> Regards,
>
> --
> Samuel
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160322/41a42945/attachment.html>
