From: Santosh Multhalli <santosh.multhalli@rockwellcollins.com>
Date: Thu, 10 Mar 2016 18:04:46 +0530
Subject: [Buildroot] [PATCH] valijson: new package
In-Reply-To: <CAHXCMMKpcxyBgU7Jj-dzVYUHfCPi-f6fdYsao_eWL7VmbobdzA@mail.gmail.com>
References: <1457096612-25468-1-git-send-email-santosh.multhalli@rockwellcollins.com>
 <CAHXCMMKpcxyBgU7Jj-dzVYUHfCPi-f6fdYsao_eWL7VmbobdzA@mail.gmail.com>
Message-ID: <CAGE8XjrT9LnxFn5JyFHn_OrON+0oFRzLaM7t9aLMASN5uHetNA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

sent a new patch with suggested comments implemented.


Thanks,
Santosh Multhalli


On Sat, Mar 5, 2016 at 3:11 PM, Samuel Martin <s.martin49@gmail.com> wrote:

> Hi Santosh,
>
> On Fri, Mar 4, 2016 at 2:03 PM, santosh.multhalli
> <santosh.multhalli@rockwellcollins.com> wrote:
> > From: "Santosh Multhalli" <santosh.multhalli@rockwellcollins.com>
> >
> > Valijson is a header-only JSON Schema Validation library for
> > C++.Add a patch
> 0001-CMake-Add-option-to-Install-headers-build-examples-a.patch
> > to install valijson headers ,provide optional compilation of unit tests
> and
> > examples.
> >
> > Signed-off-by: Santosh Multhalli <santosh.multhalli@rockwellcollins.com>
> > ---
> >  package/Config.in                                  |  1 +
> >  ...ption-to-Install-headers-build-examples-a.patch | 50
> ++++++++++++++++++++++
> >  package/valijson/Config.in                         | 13 ++++++
> >  package/valijson/valijson.hash                     |  2 +
> >  package/valijson/valijson.mk                       | 15 +++++++
> >  5 files changed, 81 insertions(+)
> >  create mode 100644
> package/valijson/0001-CMake-Add-option-to-Install-headers-build-examples-a.patch
> >  create mode 100644 package/valijson/Config.in
> >  create mode 100644 package/valijson/valijson.hash
> >  create mode 100644 package/valijson/valijson.mk
> >
> > diff --git a/package/Config.in b/package/Config.in
> > index d4cc1d7..2367a15 100644
> > --- a/package/Config.in
> > +++ b/package/Config.in
> > @@ -808,6 +808,7 @@ menu "JSON/XML"
> >         source "package/xerces/Config.in"
> >         source "package/yajl/Config.in"
> >         source "package/yaml-cpp/Config.in"
> > +       source "package/valijson/Config.in"
> >  endmenu
> >
> >  menu "Logging"
> > diff --git
> a/package/valijson/0001-CMake-Add-option-to-Install-headers-build-examples-a.patch
> b/package/valijson/0001-CMake-Add-option-to-Install-headers-build-examples-a.patch
> > new file mode 100644
> > index 0000000..4d103d5
> > --- /dev/null
> > +++
> b/package/valijson/0001-CMake-Add-option-to-Install-headers-build-examples-a.patch
> > @@ -0,0 +1,50 @@
> > +From 9ac0e0cb20604a19a6953888f4d32f665725a86b Mon Sep 17 00:00:00 2001
> > +From: Bimal Jacob <Bimal.Jacob@rockwellcollins.com>
> > +Date: Thu, 19 Nov 2015 09:55:53 -0600
> > +Subject: CMake: Add option to Install headers, build examples and
> > + tests
> > +
> > +Added 3 options - INSTALL_HEADERS, BUILD_EXAMPLES and BUILD_TESTS.
> > +INSTALL_HEADERS - Installs all header files, TRUE by default
> > +BUILD_EXAMPLES  - Builds all examples in examples directory, FALSE by
> > +                  default
> > +BUILD_TESTS     - Builds all test cases under tests directory, FALSE
> > +                  by default
> > +
> > +Signed-off-by: Bimal Jacob <bimal.jacob@rockwellcollins.com>
> > +Signed-off-by: Santosh Multhalli <santosh.multhalli@rockwellcollins.com
> >
> > +
> > +diff --git a/CMakeLists.txt b/CMakeLists.txt
> > +index 9cff096..427dca7 100644
> > +--- a/CMakeLists.txt
> > ++++ b/CMakeLists.txt
> > +@@ -1,8 +1,13 @@
> > + cmake_minimum_required (VERSION 2.6)
> > + project (valijson)
> > +
> > +-SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Werror")
> > +-SET(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -O0")
> > ++SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall ")
> > ++option (INSTALL_HEADERS "Install valijson Headers." TRUE)
> > ++option (BUILD_EXAMPLES "Build valijson Examples." FALSE)
> > ++option (BUILD_TESTS "Build valijson Tests." FALSE)
> The patch is doing 2 distinct things:
> - adding these 3 options
> - cleaning/adjusting the CXX flags
>
> Maybe doing 2 separate patchs would be better.
>
> > ++if (BUILD_TESTS OR BUILD_EXAMPLES)
> > ++
> > ++SET(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -O0 -g")
>
> -g is part of the default CMAKE_CXX_FLAGS_DEBUG, so appending it is
> not  necessary.
>
> Also, why is it necessary to adjust the debug flags when only building
> tests or examples?
>
> > + if(VALIJSON_CXX11_ADAPTERS STREQUAL "disabled")
> > +     message(STATUS "Building with C++11 support disabled")
> > + else()
> > +@@ -100,8 +105,12 @@ set(TEST_LIBS gtest gtest_main jsoncpp)
> > + if(VALIJSON_CXX11_ADAPTERS_ARE_ENABLED)
> > +     set(TEST_LIBS ${TEST_LIBS} json11)
> > + endif()
> > ++
> > +
> > + target_link_libraries(test_suite ${TEST_LIBS} ${Boost_LIBRARIES})
> > + target_link_libraries(custom_schema ${Boost_LIBRARIES})
> > + target_link_libraries(external_schema ${Boost_LIBRARIES})
> > +-
> > ++endif()
> > ++if (INSTALL_HEADERS )
> > ++install(DIRECTORY include/ DESTINATION include )
> > ++endif()
> > diff --git a/package/valijson/Config.in b/package/valijson/Config.in
> > new file mode 100644
> > index 0000000..83c162d
> > --- /dev/null
> > +++ b/package/valijson/Config.in
> > @@ -0,0 +1,13 @@
> > +config BR2_PACKAGE_VALIJSON
> > +       bool "valijson"
> > +        depends on BR2_PACKAGE_BOOST
> > +        depends on BR2_PACKAGE_BOOST_REGEX
>
> You should use "select" here instead of "depends on"; check [1] as example.
>
> > +       help
> > +         Valijson is a header-only JSON Schema Validation library for
> > +         C++. Valijson provides a simple validation API that allows you
> > +         load JSON Schemas, and validate documents loaded by one of
> > +         several supported parser libraries like boost, jsoncpp,
> > +          rapidjson and picoJSON.
> > +         https://github.com/tristanpenman/valijson
>
> Indent is wrong here, check [2] please.
> You should also add a blank line between the help text and the project url.
>
> > +comment "Valijson  needs a BOOST package with Regex feature enabled"
>
> This comment is not needed if you use "select" ;-)
>
> > +
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
> > index 0000000..0deacca
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
> > +VALIJSON_DEPENDENCIES = boost host-pkgconf
>
> Why host-pkgconf as dependencies?
> AFAICS, it does not apppear in the CMakeLists.txt.
> BTW, host-pkgconf is already a dependency of host-cmake (see [3])
>
> > +
> > +$(eval $(cmake-package))
> > --
> > 2.5.0
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
>
> [1] https://git.buildroot.org/buildroot/tree/package/libserial/Config.in
> [2] http://nightly.buildroot.org/manual.html#writing-rules-config-in
> [3] https://git.buildroot.org/buildroot/tree/package/cmake/cmake.mk#n13
>
> Regards,
>
> --
> Samuel
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160310/c2eaada8/attachment.html>
