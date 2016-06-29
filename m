From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Jun 2016 11:58:30 +0200
Subject: [Buildroot] [PATCH 1/1] protobuf-lua: new package
In-Reply-To: <1467141482-28706-1-git-send-email-tiago.brusamarello@datacom.ind.br>
References: <1467141482-28706-1-git-send-email-tiago.brusamarello@datacom.ind.br>
Message-ID: <20160629115830.2f9aaa6b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for this contribution!

On Tue, 28 Jun 2016 16:18:02 -0300, Tiago Brusamarello wrote:
> Google's Protocol Buffers support to Lua.
> 
> This package adds support to compile and use Google's
> Protocol buffers using Lua scripts. It also includes
> the plugin for compiling the message types (.proto files)
> to the Lua language.
> 
> The original package from GitHub supports deployment as
> a LuaRocks package, but the module name as set to 'protobuf'
> and not 'protobuf-lua' which causes naming problems when
> building it in Buildroot so the 'generick-package' method
> was used instead.

This is annoying. We can fix this with a small improvement to the
luarocks package infrastructure:

diff --git a/package/pkg-luarocks.mk b/package/pkg-luarocks.mk
index da5c912..b88957b 100644
--- a/package/pkg-luarocks.mk
+++ b/package/pkg-luarocks.mk
@@ -34,9 +34,14 @@
 define inner-luarocks-package
 
 $(2)_BUILD_OPTS                ?=
+
+ifndef $(2)_LUAROCKS_NAME
+ $(2)_LUAROCKS_NAME := $(1)
+endif
+
 $(2)_SUBDIR            ?= $(1)-$$(shell echo "$$($(3)_VERSION)" | sed -e "s/-[0-9]$$$$//")
-$(2)_ROCKSPEC          ?= $(1)-$$($(3)_VERSION).rockspec
-$(2)_SOURCE            ?= $(1)-$$($(3)_VERSION).src.rock
+$(2)_ROCKSPEC          ?= $$($(2)_LUAROCKS_NAME)-$$($(3)_VERSION).rockspec
+$(2)_SOURCE            ?= $$($(2)_LUAROCKS_NAME)-$$($(3)_VERSION).src.rock
 $(2)_SITE              ?= $$(call qstrip,$$(BR2_LUAROCKS_MIRROR))
 
 # Since we do not support host-luarocks-package, we know this is

Then you can define "PROTOBUF_LUA_LUAROCKS_NAME = protobuf" to override
it (by default it would be protobuf-lua).

However, this doesn't work because the file:

  http://rocks.moonscript.org/protobuf-1.1.1-0.src.rock

doesn't exist. I'm not sure why it doesn't work, since
https://luarocks.org/modules/djungelorm/protobuf/1.1.1-0 exists.

Fran?ois ?

> Change-Id: I50c2b0da9dedb2d8ed2dbd9635194e64402355f3

This line is unneeded.

> Signed-off-by: Tiago Brusamarello <tiago.brusamarello@datacom.ind.br>
> ---
>  package/Config.in                    |  1 +
>  package/protobuf-lua/Config.in       |  8 ++++++++
>  package/protobuf-lua/protobuf-lua.mk | 39 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 48 insertions(+)
>  create mode 100644 package/protobuf-lua/Config.in
>  create mode 100644 package/protobuf-lua/protobuf-lua.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index a2a02a8..362dbf9 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1298,6 +1298,7 @@ endif
>  	source "package/poco/Config.in"
>  	source "package/protobuf/Config.in"
>  	source "package/protobuf-c/Config.in"
> +	source "package/protobuf-lua/Config.in"

It should probably with all the other Lua packages instead.

>  	source "package/qhull/Config.in"
>  	source "package/qlibc/Config.in"
>  	source "package/startup-notification/Config.in"
> diff --git a/package/protobuf-lua/Config.in b/package/protobuf-lua/Config.in
> new file mode 100644
> index 0000000..e2a94cb
> --- /dev/null
> +++ b/package/protobuf-lua/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_PROTOBUF_LUA
> +    bool "protobuf-lua"

Please use tabs for indentation in the Config.in file.

> +    depends on BR2_PACKAGE_HAS_LUAINTERPRETER

This would be unnecessary if the inclusion of the Config.in file is
moved with the other Lua packages.

However, https://luarocks.org/modules/djungelorm/protobuf indicates
that lua >= 5.1, < 5.3 is needed. So perhaps this package should be
disabled if Lua 5.3 is selected? What about LuaJIT ?

> +    help
> +      Code generator and runtime libraries to use Protocol Buffers
> +      from Lua scripts.
> +
> +      https://github.com/djungelorm/protobuf-lua
> diff --git a/package/protobuf-lua/protobuf-lua.mk b/package/protobuf-lua/protobuf-lua.mk
> new file mode 100644
> index 0000000..0ca8c70
> --- /dev/null
> +++ b/package/protobuf-lua/protobuf-lua.mk
> @@ -0,0 +1,39 @@
> +################################################################################
> +#
> +# protobuf-lua
> +#
> +################################################################################
> +
> +PROTOBUF_LUA_VERSION = v1.1.1
> +PROTOBUF_LUA_SITE = $(call github,djungelorm,protobuf-lua,$(PROTOBUF_LUA_VERSION))
> +PROTOBUF_LUA_DEPENDENCIES = luainterpreter host-python python

Why do you need python and host-python ?

> +PROTOBUF_LUA_LICENSE = BSD-3c

According to https://luarocks.org/modules/djungelorm/protobuf, the
license is MIT, but this is indeed wrong, and your BSD-3c is correct.

> +PROTOBUF_LUA_LICENSE_FILES = LICENSE
> +
> +define PROTOBUF_LUA_BUILD_CMDS
> +	# build Lua Protobuf shared lib
> +	$(TARGET_CC) -Os -shared -std=gnu99 -fPIC $(@D)/protobuf/pb.c -o $(@D)/protobuf/pb.so
> +endef
> +
> +define PROTOBUF_LUA_INSTALL_TARGET_CMDS
> +	# install Lua Protobuf support
> +	mkdir -p $(TARGET_DIR)/usr/lib/lua/$(LUAINTERPRETER_ABIVER)/protobuf
> +	$(INSTALL) -m 0755 $(@D)/protobuf/pb.so \
> +		$(TARGET_DIR)/usr/lib/lua/$(LUAINTERPRETER_ABIVER)/protobuf
> +	mkdir -p $(TARGET_DIR)/usr/share/lua/$(LUAINTERPRETER_ABIVER)/protobuf
> +	$(INSTALL) -m 0755 $(@D)/protobuf/*.lua \
> +		$(TARGET_DIR)/usr/share/lua/$(LUAINTERPRETER_ABIVER)/protobuf
> +
> +	# install protoc Lua plugin
> +	$(INSTALL) -m 0755 $(@D)/protoc-plugin/plugin_pb2.py $(TARGET_DIR)/usr/bin
> +	$(INSTALL) -m 0755 $(@D)/protoc-plugin/protoc-gen-lua $(TARGET_DIR)/usr/bin

Please use full destination paths when using $(INSTALL) with a single
file.

However, is this protoc-gen-lua script really needed on the target?

> +endef
> +
> +define HOST_PROTOBUF_LUA_INSTALL_CMDS
> +	# install protoc Lua plugin
> +	$(INSTALL) -m 0755 $(@D)/protoc-plugin/plugin_pb2.py $(HOST_DIR)/usr/bin
> +	$(INSTALL) -m 0755 $(@D)/protoc-plugin/protoc-gen-lua $(HOST_DIR)/usr/bin
> +endef
> +
> +$(eval $(generic-package))
> +$(eval $(host-generic-package))

This host package is not used anywhere. I understand it allows to
install the scripts that generate some Lua code according to the
protobuf descriptions, but it should be used by another package
otherwise it's an orphan package.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
