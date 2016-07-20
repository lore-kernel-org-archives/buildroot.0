From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Jul 2016 22:52:15 +0200
Subject: [Buildroot] [PATCH v2 3/3] package/protobuf-lua: new package
In-Reply-To: <1468931473-19614-3-git-send-email-tiago.brusamarello@datacom.ind.br>
References: <1468931473-19614-1-git-send-email-tiago.brusamarello@datacom.ind.br>
 <1468931473-19614-3-git-send-email-tiago.brusamarello@datacom.ind.br>
Message-ID: <20160720225215.23112d47@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 19 Jul 2016 09:31:13 -0300, Tiago Brusamarello wrote:

> The original package from GitHub supports deployment as
> a LuaRocks package, but the module name as set to 'protobuf'
> and not 'protobuf-lua' which causes naming problems when
> building it in Buildroot so the 'generick-package' method
> was used instead.

Again, I already suggested that the naming conflict is not a good
enough reason, and can be resolved.


> diff --git a/package/protobuf-lua/Config.in b/package/protobuf-lua/Config.in
> new file mode 100644
> index 0000000..3c5274c
> --- /dev/null
> +++ b/package/protobuf-lua/Config.in
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_PROTOBUF_LUA
> +	bool "protobuf-lua"
> +	depends on BR2_PACKAGE_LUA_5_1 || BR2_PACKAGE_LUA_5_2
> +	depends on !BR2_PACKAGE_PYTHON3

depends on BR2_PACKAGE_PYTHON would be better here

> +PROTOBUF_LUA_VERSION = v1.1.1
> +PROTOBUF_LUA_SITE = $(call github,djungelorm,protobuf-lua,$(PROTOBUF_LUA_VERSION))
> +PROTOBUF_LUA_DEPENDENCIES = luainterpreter host-protobuf host-protoc-gen-lua
> +PROTOBUF_LUA_LICENSE = BSD-3c
> +PROTOBUF_LUA_LICENSE_FILES = LICENSE
> +
> +define PROTOBUF_LUA_BUILD_CMDS
> +	# build Lua Protobuf shared lib
> +	$(TARGET_CC) -Os -shared -std=gnu99 -fPIC $(@D)/protobuf/pb.c -o $(@D)/protobuf/pb.so
> +
> +	# build Lua Protobuf examples
> +	PATH=$(BR_PATH) $(HOST_DIR)/usr/bin/protoc --lua_out=$(@D)/example --proto_path=$(@D)/example \
> +		$(@D)/example/person.proto

Why do you build examples? We generally don't care about building
example code in Buildroot.

> +endef
> +
> +PROTOBUF_LUA_FILES = \
> +	containers decoder descriptor encoder init listener \
> +	text_format type_checkers wire_format
> +
> +define PROTOBUF_LUA_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/protobuf/pb.so \
> +		$(TARGET_DIR)/usr/lib/lua/$(LUAINTERPRETER_ABIVER)/protobuf/pb.so
> +
> +	$(foreach f,$(PROTOBUF_LUA_FILES),\
> +		$(INSTALL) -D -m 0755 $(@D)/protobuf/$(f).lua \
> +			$(TARGET_DIR)/usr/share/lua/$(LUAINTERPRETER_ABIVER)/protobuf/$(f).lua
> +	)
> +endef
> +
> +$(eval $(generic-package))



-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
