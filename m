From: Jan Heylen <heyleke@gmail.com>
Date: Fri, 29 Dec 2017 18:23:17 +0100
Subject: [Buildroot] [PATCH v2 2/2] opentracing-cpp: make shared/static
 target a configurable option
In-Reply-To: <1514014802-23736-3-git-send-email-heyleke@gmail.com>
References: <1513849309-550-2-git-send-email-heyleke@gmail.com>
 <1514014802-23736-1-git-send-email-heyleke@gmail.com>
 <1514014802-23736-3-git-send-email-heyleke@gmail.com>
Message-ID: <CAGszK3iNYTFU8V+tam+YsAkFgMFg6B7+M7Gs5-XmLsKz7q4PWA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

fyi, patch got merged into opentracing-cpp upstream, no
opentracing-cpp release yet that includes it

On Sat, Dec 23, 2017 at 8:40 AM, Jan Heylen <heyleke@gmail.com> wrote:
> From: Jan Heylen <jan.heylen@nokia.com>
>
> Signed-off-by: Jan Heylen <jan.heylen@nokia.com>
>
> ---
> Changes v1 -> v2:
>   - v1: no patch include, v2: include extra patch to make shared/static configurable
>
> ---
>  ...shared-static-target-a-configurable-optio.patch | 73 ++++++++++++++++++++++
>  package/opentracing-cpp/opentracing-cpp.mk         |  8 +++
>  2 files changed, 81 insertions(+)
>  create mode 100644 package/opentracing-cpp/0001-CMake-make-shared-static-target-a-configurable-optio.patch
>
> diff --git a/package/opentracing-cpp/0001-CMake-make-shared-static-target-a-configurable-optio.patch b/package/opentracing-cpp/0001-CMake-make-shared-static-target-a-configurable-optio.patch
> new file mode 100644
> index 0000000..1323f3f
> --- /dev/null
> +++ b/package/opentracing-cpp/0001-CMake-make-shared-static-target-a-configurable-optio.patch
> @@ -0,0 +1,73 @@
> +From 9462847f23a25524fdc2112cbc8de3f2c02a1669 Mon Sep 17 00:00:00 2001
> +From: Jan Heylen <jan.heylen@nokia.com>
> +Date: Fri, 22 Dec 2017 22:04:29 +0100
> +Subject: [PATCH] CMake: make shared/static target a configurable option
> +
> +---
> + CMakeLists.txt | 40 ++++++++++++++++++++++++++++------------
> + 1 file changed, 28 insertions(+), 12 deletions(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index aadf2f9..d03bd00 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -70,18 +70,36 @@ endif()
> + include_directories(include)
> + include_directories(SYSTEM 3rd_party/include)
> +
> ++option(BUILD_SHARED_LIBS "Build as a shared library" ON)
> ++option(BUILD_STATIC_LIBS "Build as a static library" ON)
> ++
> ++if (NOT BUILD_SHARED_LIBS AND NOT BUILD_STATIC_LIBS)
> ++    message(FATAL_ERROR "One or both of BUILD_SHARED_LIBS or BUILD_STATIC_LIBS must be set to ON to build")
> ++endif()
> ++
> + set(SRCS src/propagation.cpp src/noop.cpp src/tracer.cpp)
> +-add_library(opentracing SHARED ${SRCS})
> +-target_include_directories(opentracing INTERFACE "$<INSTALL_INTERFACE:include/>")
> +-set_target_properties(opentracing PROPERTIES VERSION ${OPENTRACING_VERSION_STRING}
> ++
> ++if (BUILD_SHARED_LIBS)
> ++  add_library(opentracing SHARED ${SRCS})
> ++  target_include_directories(opentracing INTERFACE "$<INSTALL_INTERFACE:include/>")
> ++  set_target_properties(opentracing PROPERTIES VERSION ${OPENTRACING_VERSION_STRING}
> +                                              SOVERSION ${OPENTRACING_VERSION_MAJOR})
> +-add_library(opentracing-static STATIC ${SRCS})
> +-set_target_properties(opentracing-static PROPERTIES OUTPUT_NAME opentracing)
> +-target_include_directories(opentracing-static INTERFACE "$<INSTALL_INTERFACE:include/>")
> +-if (CLANG_TIDY_EXE)
> +-  set_target_properties(opentracing PROPERTIES
> ++  install(TARGETS opentracing EXPORT OpenTracingTargets
> ++          LIBRARY DESTINATION lib
> ++          ARCHIVE DESTINATION lib)
> ++  if (CLANG_TIDY_EXE)
> ++    set_target_properties(opentracing PROPERTIES
> +                                     CXX_CLANG_TIDY "${DO_CLANG_TIDY}")
> +-endif()
> ++  endif()
> ++endif(BUILD_SHARED_LIBS)
> ++
> ++if (BUILD_STATIC_LIBS)
> ++  add_library(opentracing-static STATIC ${SRCS})
> ++  set_target_properties(opentracing-static PROPERTIES OUTPUT_NAME opentracing)
> ++  target_include_directories(opentracing-static INTERFACE "$<INSTALL_INTERFACE:include/>")
> ++  install(TARGETS opentracing-static EXPORT OpenTracingTargets
> ++          ARCHIVE DESTINATION lib)
> ++endif(BUILD_STATIC_LIBS)
> +
> +
> + install(DIRECTORY 3rd_party/include/opentracing DESTINATION include
> +@@ -89,9 +107,7 @@ install(DIRECTORY 3rd_party/include/opentracing DESTINATION include
> +                            PATTERN "*.h")
> + install(DIRECTORY include/opentracing DESTINATION include
> +             FILES_MATCHING PATTERN "*.h")
> +-install(TARGETS opentracing opentracing-static EXPORT OpenTracingTargets
> +-        LIBRARY DESTINATION lib
> +-        ARCHIVE DESTINATION lib)
> ++
> +
> + # ==============================================================================
> + # Package configuration setup
> +--
> +2.7.4
> +
> diff --git a/package/opentracing-cpp/opentracing-cpp.mk b/package/opentracing-cpp/opentracing-cpp.mk
> index f1748ef..9043966 100644
> --- a/package/opentracing-cpp/opentracing-cpp.mk
> +++ b/package/opentracing-cpp/opentracing-cpp.mk
> @@ -11,4 +11,12 @@ OPENTRACING_CPP_LICENSE_FILES = COPYING
>
>  OPENTRACING_CPP_INSTALL_STAGING = YES
>
> +ifeq ($(BR2_STATIC_LIBS),y)
> +       OPENTRACING_CPP_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF -DBUILD_STATIC_LIBS=ON
> +else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
> +       OPENTRACING_CPP_CONF_OPTS += -DBUILD_SHARED_LIBS=ON -DBUILD_STATIC_LIBS=ON
> +else ifeq ($(BR2_SHARED_LIBS),y)
> +       OPENTRACING_CPP_CONF_OPTS += -DBUILD_SHARED_LIBS=ON -DBUILD_STATIC_LIBS=OFF
> +endif
> +
>  $(eval $(cmake-package))
> --
> 2.7.4
>
