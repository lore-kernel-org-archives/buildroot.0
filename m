From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Nov 2015 18:51:47 +0100
Subject: [Buildroot] [PATCH] ubus: new package
In-Reply-To: <1448669738-18880-1-git-send-email-sergio.prado@e-labworks.com>
References: <1448669738-18880-1-git-send-email-sergio.prado@e-labworks.com>
Message-ID: <20151128185147.6de4bfcf@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sergio Prado,

On Fri, 27 Nov 2015 22:15:38 -0200, Sergio Prado wrote:

> +diff --git a/examples/CMakeLists.txt b/examples/CMakeLists.txt
> +index 0279f6e66b50..7cec87e5e8f9 100644
> +--- a/examples/CMakeLists.txt
> ++++ b/examples/CMakeLists.txt
> +@@ -10,3 +10,7 @@ IF (BUILD_EXAMPLES)
> + 	ADD_EXECUTABLE(client client.c count.c)
> + 	TARGET_LINK_LIBRARIES(client ubus ubox)
> + ENDIF()
> ++
> ++INSTALL(TARGETS server client
> ++	RUNTIME DESTINATION sbin
> ++)

I think this patch is wrong, because if you build with the examples
disabled, the configure step fails with:

-- Detecting C compile features
-- Detecting C compile features - done
CMake Error at examples/CMakeLists.txt:14 (INSTALL):
  install TARGETS given target "server" which does not exist in this
  directory.



> +-- 
> +1.9.1
> +
> diff --git a/package/ubus/Config.in b/package/ubus/Config.in
> new file mode 100644
> index 000000000000..fa89c8f3cd68
> --- /dev/null
> +++ b/package/ubus/Config.in
> @@ -0,0 +1,26 @@
> +config BR2_PACKAGE_UBUS
> +	bool "ubus"
> +	select BR2_PACKAGE_LIBUBOX
> +	select BR2_PACKAGE_JSON_C
> +	depends on !BR2_STATIC_LIBS # libubox

You need to add a comment:

comment "ubus needs a toolchain w/ dynamic library"
	depends on BR2_STATIC_LIBS

> +	help
> +	  IPC/RPC bus that allows communication between processes.
> +
> +	  It consists of few parts including a daemon (ubusd), a library
> +	  (libubus) and a command line interface (ubus). Although created
> +	  for the OpenWRT project, it can be used as a general IPC/RPC
> +	  mechanism in other projects.
> +
> +	  * Select BR2_PACKAGE_LUA_5_1 if you want to have Lua support.
> +
> +	  https://wiki.openwrt.org/doc/techref/ubus
> +
> +if BR2_PACKAGE_UBUS
> +
> +config BR2_PACKAGE_UBUS_EXAMPLES
> +	bool "build and install ubus examples"
> +	default n

Not needed, this is the default

> +	help
> +	  Build and install client and server ubus examples.
> +
> +endif
> diff --git a/package/ubus/ubus.hash b/package/ubus/ubus.hash
> new file mode 100644
> index 000000000000..af9b652b0e1d
> --- /dev/null
> +++ b/package/ubus/ubus.hash
> @@ -0,0 +1,2 @@
> +# No hash for this git snapshot
> +none  xxx  ubus-259450f414d8c9ee41896e8e6d6bc57ec00e2b63.tar.gz
> diff --git a/package/ubus/ubus.mk b/package/ubus/ubus.mk
> new file mode 100644
> index 000000000000..2ecc023e110a
> --- /dev/null
> +++ b/package/ubus/ubus.mk
> @@ -0,0 +1,47 @@
> +################################################################################
> +#
> +# ubus
> +#
> +################################################################################
> +
> +UBUS_VERSION = 259450f414d8c9ee41896e8e6d6bc57ec00e2b63
> +UBUS_SITE = git://git.openwrt.org/project/ubus.git
> +
> +UBUS_LICENSE = LGPLv2.1
> +UBUS_LICENSE_FILES = ubusd_acl.h
> +
> +UBUS_INSTALL_STAGING = YES
> +
> +UBUS_DEPENDENCIES = json-c libubox
> +
> +# package only compiles with Lua 5.1
> +ifeq ($(BR2_PACKAGE_LUA_5_1),y)
> +UBUS_DEPENDENCIES += lua
> +UBUS_CONF_OPTS += -DBUILD_LUA=ON \
> +                  -DLUA_CFLAGS=-I$(STAGING_DIR)/usr/include \
> +                  -DLUAPATH=/usr/lib/lua/$(LUAINTERPRETER_ABIVER)

Indent with just one tab here.

> +else
> +UBUS_CONF_OPTS += -DBUILD_LUA=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_SYSTEMD),y)
> +UBUS_DEPENDENCIES += systemd
> +UBUS_CONF_OPTS += -DENABLE_SYSTEMD=ON
> +else
> +UBUS_CONF_OPTS += -DENABLE_SYSTEMD=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_UBUS_EXAMPLES),y)
> +UBUS_CONF_OPTS += -DBUILD_EXAMPLES=ON
> +else
> +UBUS_CONF_OPTS += -DBUILD_EXAMPLES=OFF
> +endif
> +
> +define UBUS_INSTALL_STAGING_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/libubus.so* $(STAGING_DIR)/usr/lib
> +	$(INSTALL) -D -m 0644 $(@D)/ubusmsg.h $(STAGING_DIR)/usr/include
> +	$(INSTALL) -D -m 0644 $(@D)/ubus_common.h $(STAGING_DIR)/usr/include
> +	$(INSTALL) -D -m 0644 $(@D)/libubus.h $(STAGING_DIR)/usr/include
> +endef

Why don't you just use the default installation logic, like is done for
the target installation ? Installing more than strictly needed to
staging is not a problem.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
