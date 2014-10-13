From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 13 Oct 2014 22:46:22 +0200
Subject: [Buildroot] [PATCH 3/3] adding new package ubus.
In-Reply-To: <1413102033-3263-3-git-send-email-swexru@gmail.com>
References: <1413102033-3263-1-git-send-email-swexru@gmail.com>
 <1413102033-3263-3-git-send-email-swexru@gmail.com>
Message-ID: <CAHXCMMLGfZo6feA30HRadsJLkUmmYvgtX_Wxk3sAmxG=H0MGDA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Alexey,

On Sun, Oct 12, 2014 at 10:20 AM, Alexey Mednyy <swexru@gmail.com> wrote:
> Signed-off-by: Alexey Mednyy <swexru@gmail.com>
> ---
>  package/Config.in                              |  1 +
>  package/ubus/Config.in                         | 11 ++++++++++
>  package/ubus/ubus-01-json-definition-fix.patch | 28 ++++++++++++++++++++++++++
>  package/ubus/ubus.mk                           | 26 ++++++++++++++++++++++++
>  4 files changed, 66 insertions(+)
>  create mode 100644 package/ubus/Config.in
>  create mode 100644 package/ubus/ubus-01-json-definition-fix.patch
>  create mode 100644 package/ubus/ubus.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index ea89c96..92fc6bb 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -872,6 +872,7 @@ menu "Other"
>         source "package/libtasn1/Config.in"
>         source "package/libtpl/Config.in"
>         source "package/libubox/Config.in"
> +       source "package/ubus/Config.in"

Keep the list alphabetically sorted, please.

>         source "package/libuci/Config.in"
>         source "package/libunwind/Config.in"
>         source "package/liburcu/Config.in"
> diff --git a/package/ubus/Config.in b/package/ubus/Config.in
> new file mode 100644
> index 0000000..6a9c73d
> --- /dev/null
> +++ b/package/ubus/Config.in
> @@ -0,0 +1,11 @@
> +config BR2_PACKAGE_UBUS
> +       bool "ubus"
> +       select BR2_PACKAGE_LIBUBOX
> +       depends on !BR2_PREFER_STATIC_LIB
> +       help
> +         OpenWrt micro bus architecture, project
> +          provide communication between various
> +          daemons and applications.

Indentation for the help text is 1 tab + 2 spaces (the first line is
ok, the 2 following are not).
At the end of the help message, the url of the package's project is missing.

> +
> +comment "ubus needs toolchain w/ dynamic library"
> +       depends on BR2_PREFER_STATIC_LIB
> diff --git a/package/ubus/ubus-01-json-definition-fix.patch b/package/ubus/ubus-01-json-definition-fix.patch
> new file mode 100644
> index 0000000..ccef101
> --- /dev/null
> +++ b/package/ubus/ubus-01-json-definition-fix.patch
> @@ -0,0 +1,28 @@
> +Fix wrong cmake behavior with json lib search
> +
> +Signed-off-by: Alexey Mednyy swexru at gmail.com
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index cb2f420..679b258 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -25,11 +25,18 @@ TARGET_LINK_LIBRARIES(ubus ubox)
> + ADD_EXECUTABLE(ubusd ubusd.c ubusd_id.c ubusd_obj.c ubusd_proto.c ubusd_event.c)
> + TARGET_LINK_LIBRARIES(ubusd ubox)
> +
> +-find_library(json NAMES json-c json)
> ++find_library(json NAMES json-c)
> + ADD_EXECUTABLE(cli cli.c)
> + SET_TARGET_PROPERTIES(cli PROPERTIES OUTPUT_NAME ubus)
> + TARGET_LINK_LIBRARIES(cli ubus ubox blobmsg_json ${json})
> +
> ++INCLUDE(FindPkgConfig)
> ++PKG_CHECK_MODULES(JSONC json-c)
> ++IF(JSONC_FOUND)
> ++  ADD_DEFINITIONS(-DJSONC)
> ++  INCLUDE_DIRECTORIES(${JSONC_INCLUDE_DIRS})
> ++ENDIF()
> ++

hmm... something is wrong here.
First, you check for libjson-c using find_library, and you
unconditionally link cli with it, then you check for json-c headers,
and only update the cflags if they have been found.

So,
- pkg_check_modules sets both *_INCLUDE_DIRS and *_LIBRARIES variables
(and others, see cmake doc [1]); so:
  - you don't need the find_library call;
  - you should move the pkg_check_modules call above/before:
"target_link_library(cli ...)"
- Instead of "include(FindPkgConfig)", i prefer using
"find_package(PkgConfig)" which accepts options;
- Is json-c dependency optional?
  - if yes, then the "target_link_library(cli ${JSON_LIBRARIES})"
should be nested in the "if(JSONC_FOUND)"-block;
  - otherwise, the CMake should bail out because of the
missing/unfound dependency.

> + ADD_SUBDIRECTORY(lua)
> + ADD_SUBDIRECTORY(examples)
> +
> diff --git a/package/ubus/ubus.mk b/package/ubus/ubus.mk
> new file mode 100644
> index 0000000..9ac45ab
> --- /dev/null
> +++ b/package/ubus/ubus.mk
> @@ -0,0 +1,26 @@
> +################################################################################
> +#
> +# UBUS
> +#
> +################################################################################
> +
> +UBUS_VERSION = 4c4f35cf2230d70b9ddd87638ca911e8a563f2f3
> +UBUS_SITE = git://nbd.name/luci2/ubus.git
> +UBUS_LICENSE = LGPLv2.1
> +UBUS_DEPENDENCIES = host-pkgconf $(if $(BR2_PACKAGE_JSON_C),json-c)

host-pkgconf is already a CMake's dependency.

> +
> +ifeq ($(BR2_USE_MMU)$(BR2_PACKAGE_LUA_5_1),yy)
> +UBUS_DEPENDENCIES += lua
> +UBUS_CONF_OPTS += -DLUAPATH=$(STAGING_DIR)/usr/lib/lua/5.1 \
> +       -DLUA_CFLAGS=-I$(STAGING_DIR)/usr/include

We usually like symetric option, even if it is the default value of
the option; so you should add:
-DBUILD_LUA=ON

> +else
> +       UBUS_CONF_OPTS += -DBUILD_LUA:BOOL=OFF

no indentation here
":BOOL" is not necessary here

> +endif
> +
> +ifeq ($(BR2_PACKAGE_SYSTEMD),y)
> +       UBUS_DEPENDENCIES += systemd
> +else
> +       UBUS_CONF_OPTS += -DENABLE_SYSTEMD:BOOL=OFF

ditto (no indentation, no ":BOOL", symetric option)

> +endif
> +
> +$(eval $(cmake-package))
> --
> 1.9.1
>

[1] http://www.cmake.org/cmake/help/v3.0/module/FindPkgConfig.html

Regards,

-- 
Samuel
