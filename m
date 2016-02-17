From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 18 Feb 2016 00:12:21 +0100
Subject: [Buildroot] [PATCH v2 1/1] libcapn : new package
In-Reply-To: <1455732246-27866-1-git-send-email-sagaert.johan@proximus.be>
References: <1455732246-27866-1-git-send-email-sagaert.johan@proximus.be>
Message-ID: <56C4FE55.3030405@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17-02-16 19:04, Sagaert Johan wrote:
> libcapn is a C Library to interact with the Apple Push Notification Service
> (APNs for short) using simple and intuitive API.
> With the library you can easily send push notifications to iOS and OS X (>= 10.8) devices.
> 
> The patches remove the jansson git submodule requirement
> and links against the jansson Builtroot package instead.
> 
> Signed-off-by: Sagaert Johan <sagaert.johan@proximus.be>
> ---
> Changes V1->V2
> 	include missing hash file.
> ---
>  package/Config.in                                  |  1 +
>  .../0001-use-global-jansson-include-file.patch     | 26 +++++++++++
>  ...ve-the-jansson-git-submodule-requirements.patch | 54 ++++++++++++++++++++++
>  .../0003-remove-ld.so.conf.d-creation.patch        | 29 ++++++++++++
>  package/libcapn/Config.in                          | 13 ++++++
>  package/libcapn/libcapn.hash                       |  2 +
>  package/libcapn/libcapn.mk                         | 18 ++++++++
>  7 files changed, 143 insertions(+)
>  create mode 100644 package/libcapn/0001-use-global-jansson-include-file.patch
>  create mode 100644 package/libcapn/0002-remove-the-jansson-git-submodule-requirements.patch
>  create mode 100644 package/libcapn/0003-remove-ld.so.conf.d-creation.patch
>  create mode 100644 package/libcapn/Config.in
>  create mode 100644 package/libcapn/libcapn.hash
>  create mode 100644 package/libcapn/libcapn.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 529ad33..30042fe 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1073,6 +1073,7 @@ menu "Networking"
>  	source "package/gupnp-av/Config.in"
>  	source "package/ibrcommon/Config.in"
>  	source "package/ibrdtn/Config.in"
> +	source "package/libcapn/Config.in"
>  	source "package/libcgi/Config.in"
>  	source "package/libcgicc/Config.in"
>  	source "package/libcurl/Config.in"
> diff --git a/package/libcapn/0001-use-global-jansson-include-file.patch b/package/libcapn/0001-use-global-jansson-include-file.patch
> new file mode 100644
> index 0000000..8e89b7e
> --- /dev/null
> +++ b/package/libcapn/0001-use-global-jansson-include-file.patch
> @@ -0,0 +1,26 @@
> +From d696407e5fe6d14ac18f4b63532c4eaa80699fa3 Mon Sep 17 00:00:00 2001
> +From: Sagaert Johan <sagaert.johan@proximus.be>
> +Date: Wed, 17 Feb 2016 10:05:13 +0100
> +Subject: [PATCH 1/3] use global jansson include file

 Please generate patches with -N so they are not numbered in the subject line.
If a 4th patch is added, the numbering will be wrong. This is explained in the
manual.

> +
> +Signed-off-by: Sagaert Johan <sagaert.johan@proximus.be>
> +---
> + src/library/apn_payload.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/library/apn_payload.c b/src/library/apn_payload.c
> +index eaf5010..ac000e5 100644
> +--- a/src/library/apn_payload.c
> ++++ b/src/library/apn_payload.c
> +@@ -24,7 +24,7 @@
> + #include <errno.h>
> + #include <assert.h>
> + 
> +-#include "src/jansson.h"
> ++#include "jansson.h"

 That should probably be <jansson> instead.

> + #include "apn_strings.h"
> + #include "apn_memory.h"
> + #include "apn_private.h"
> +-- 
> +2.3.3
> +
> diff --git a/package/libcapn/0002-remove-the-jansson-git-submodule-requirements.patch b/package/libcapn/0002-remove-the-jansson-git-submodule-requirements.patch
> new file mode 100644
> index 0000000..7de9095
> --- /dev/null
> +++ b/package/libcapn/0002-remove-the-jansson-git-submodule-requirements.patch
> @@ -0,0 +1,54 @@
> +From e418621d70d05ca9b77de6a1d369ff01266a3347 Mon Sep 17 00:00:00 2001
> +From: Sagaert Johan <sagaert.johan@proximus.be>
> +Date: Wed, 17 Feb 2016 10:05:58 +0100
> +Subject: [PATCH 2/3] remove the jansson git submodule requirements
> +
> +Signed-off-by: Sagaert Johan <sagaert.johan@proximus.be>
> +---
> + CMakeLists.txt | 16 +---------------
> + 1 file changed, 1 insertion(+), 15 deletions(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index 75e3b35..7a80fe6 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -94,10 +94,6 @@ ENDFOREACH(STRERROR_R_HEADER)
> + 
> + INCLUDE(ExternalProject)
> + 
> +-INCLUDE_DIRECTORIES ("${CAPN_THIRD_PARTY_DIR}/jansson")
> +-INCLUDE_DIRECTORIES ("${CAPN_THIRD_PARTY_DIR}/jansson/include")
> +-
> +-
> + CONFIGURE_FILE("${CAPN_SOURCE_LIB_DIR}/apn_platform.h.cmake" "${PROJECT_BINARY_DIR}/src/library/apn_platform.h")
> + CONFIGURE_FILE("${CAPN_SOURCE_LIB_DIR}/apn_version.h.cmake" "${PROJECT_BINARY_DIR}/src/library/apn_version.h")
> + 
> +@@ -206,16 +202,6 @@ ELSE(WIN32)
> +             ENDIF()
> +         ENDIF()
> + 
> +-        ExternalProject_Add(
> +-            jansson
> +-            SOURCE_DIR "${CAPN_THIRD_PARTY_DIR}/jansson"
> +-            BINARY_DIR "${CAPN_THIRD_PARTY_DIR}/jansson"
> +-            INSTALL_DIR "${CAPN_THIRD_PARTY_DIR}/jansson"
> +-            CMAKE_COMMAND cmake . -DCMAKE_C_FLAGS=-fPIC -DJANSSON_BUILD_DOCS=OFF
> +-            BUILD_COMMAND make
> +-            INSTALL_COMMAND ""
> +-        )
> +-		
> +         SET(CAPN_INSTALL_PATH_LIB "${CAPN_INSTALL_PATH_LIB}/${CAPN_LIB_NAME}")
> +         SET(CAPN_PKGCONF_FILE_NAME "libcapn.pc")
> +         CONFIGURE_FILE("${CAPN_PKGCONF_FILE_NAME}.cmake" "${PROJECT_BINARY_DIR}/${CAPN_PKGCONF_FILE_NAME}")
> +@@ -255,7 +241,7 @@ IF(WIN32)
> + 	TARGET_LINK_LIBRARIES(${CAPN_LIB_NAME} ${OPENSSL_SSLEAY_LIBRARY})
> + 	TARGET_LINK_LIBRARIES(${CAPN_LIB_NAME} ${OPENSSL_LIBEAY_LIBRARY})
> + ELSE()
> +-	TARGET_LINK_LIBRARIES(${CAPN_LIB_NAME} "${CAPN_THIRD_PARTY_DIR}/jansson/lib/libjansson.a")
> ++	TARGET_LINK_LIBRARIES(${CAPN_LIB_NAME} "jansson")

 The "system" jansson library should be discovered with pkg-config. And as
Thomas explained, to be upstreamable you should support both the internal and
the system jansson library.

> + 	TARGET_LINK_LIBRARIES(${CAPN_LIB_NAME} ${OPENSSL_LIBRARIES})
> + ENDIF()
> + 
> +-- 
> +2.3.3
> +
> diff --git a/package/libcapn/0003-remove-ld.so.conf.d-creation.patch b/package/libcapn/0003-remove-ld.so.conf.d-creation.patch
> new file mode 100644
> index 0000000..1605b37
> --- /dev/null
> +++ b/package/libcapn/0003-remove-ld.so.conf.d-creation.patch
> @@ -0,0 +1,29 @@
> +From e5d1accd8dca48639dea6f7c98501b1040652cea Mon Sep 17 00:00:00 2001
> +From: Sagaert Johan <sagaert.johan@proximus.be>
> +Date: Wed, 17 Feb 2016 10:12:58 +0100
> +Subject: [PATCH 3/3] remove ld.so.conf.d creation
> +
> +Signed-off-by: Sagaert Johan <sagaert.johan@proximus.be>
> +---
> + CMakeLists.txt | 5 -----
> + 1 file changed, 5 deletions(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index 7a80fe6..354688f 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -211,11 +211,6 @@ ELSE(WIN32)
> +             IF(NOT DEFINED CAPN_INSTALL_PATH_SYSCONFIG)
> +                 SET(CAPN_INSTALL_PATH_SYSCONFIG "/etc"  CACHE PATH "")
> +             ENDIF()
> +-            IF(EXISTS "${CAPN_INSTALL_PATH_SYSCONFIG}/ld.so.conf.d" AND IS_DIRECTORY "${CAPN_INSTALL_PATH_SYSCONFIG}/ld.so.conf.d")

 Since 9c407234 we don't have an ld.so.conf.d anymore in the default skeleton,
so this piece of code is actually harmless and the patch is not needed.

> +-                SET(CAPN_LDCONF_FILE_NAME "libcapn-${CAPN_VERSION}-${CAPN_ARCH_STR}.conf")
> +-                CONFIGURE_FILE(libcapn.ld.conf.cmake "${PROJECT_BINARY_DIR}/${CAPN_LDCONF_FILE_NAME}")
> +-                INSTALL(FILES "${PROJECT_BINARY_DIR}/${CAPN_LDCONF_FILE_NAME}" DESTINATION "${CAPN_INSTALL_PATH_SYSCONFIG}/ld.so.conf.d")
> +-            ENDIF()
> +         ENDIF()
> + 
> +         CONFIGURE_FILE("${CMAKE_CURRENT_SOURCE_DIR}/src/config/apn_config.c.cmake" "${PROJECT_BINARY_DIR}/src/config/apn_config.c")
> +-- 
> +2.3.3
> +
> diff --git a/package/libcapn/Config.in b/package/libcapn/Config.in
> new file mode 100644
> index 0000000..5b25910
> --- /dev/null
> +++ b/package/libcapn/Config.in
> @@ -0,0 +1,13 @@
> +config BR2_PACKAGE_LIBCAPN
> +	bool "libcapn"
> +	select BR2_PACKAGE_OPENSSL
> +	select BR2_PACKAGE_JANSSON
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_6
> +	help
> +	  libcapn is a C Library to interact with the 
> +	  Apple Push Notification Service (APNs for short)
> +	  using simple and intuitive API.
> +	  With the library you can easily send push 
> +	  notifications to iOS and OS X (>= 10.8) devices.
> +	  
> +	  http://libcapn.org
> diff --git a/package/libcapn/libcapn.hash b/package/libcapn/libcapn.hash
> new file mode 100644
> index 0000000..b2a2fad
> --- /dev/null
> +++ b/package/libcapn/libcapn.hash
> @@ -0,0 +1,2 @@
> +# Locally computed
> +sha256	726aac9ca0dc26fd5e43d7b6a942fb2520a078c0bf2af1aac2b9ad12311a55e5  libcapn-7a6dc662e9daa864f687.tar.gz
> diff --git a/package/libcapn/libcapn.mk b/package/libcapn/libcapn.mk
> new file mode 100644
> index 0000000..df8e162
> --- /dev/null
> +++ b/package/libcapn/libcapn.mk
> @@ -0,0 +1,18 @@
> +################################################################################
> +#
> +# libcapn
> +#
> +################################################################################
> +
> +LIBCAPN_VERSION = 7a6dc662e9daa864f687

 Any reason to use a random commit rather than the "released" 2.0.0-beta?

 We normally use the full, unabbreviated sha1:
7a6dc662e9daa864f687e121a906fd9d462966cd

> +LIBCAPN_SITE = $(call github,adobkin,libcapn,$(LIBCAPN_VERSION))
> +LIBCAPNLICENSE = MIT
> +LIBCAPN_DEPENDENCIES += jansson openssl
> +LIBCAPN_INSTALL_STAGING = YES
> +LIBCAPN_CONF_OPTS = -DCMAKE_BUILD_TYPE=Release \
> +  -DAPN_HAVE_GLIBC_STRERROR_R=OFF \
> +  -DAPN_HAVE_POSIX_STRERROR_R=OFF \

 This one should be ON, because we do have the POSIX signature.

 However, the whole thing is completely pointless: it will always use the
internal strerror_r implementation, because APN_HAVE_STRERROR_R is never set. In
the CMakeLists.txt, it is misspelled as HAVE_STRERROR_R so that will be set but
it's not used anywhere...

 In addition, instead of the whole try_run construct, the check should have been
done using CMake's standard check_prototype_definition function.

 Perhaps you can upstream patches that fix both these issues?


 Regards,
 Arnout


> +  -DAPN_HAVE_GLIBC_STRERROR_R__TRYRUN_OUTPUT=OFF \
> +  -DAPN_HAVE_POSIX_STRERROR_R__TRYRUN_OUTPUT=OFF 
> +    
> +$(eval $(cmake-package))
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
