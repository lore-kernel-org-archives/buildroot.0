From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 Jul 2016 12:39:19 +0200
Subject: [Buildroot] [PATCH 3/3] package/protobuf-lua: new package
In-Reply-To: <1467291218-7710-3-git-send-email-tiago.brusamarello@datacom.ind.br>
References: <1467291218-7710-1-git-send-email-tiago.brusamarello@datacom.ind.br>
 <1467291218-7710-3-git-send-email-tiago.brusamarello@datacom.ind.br>
Message-ID: <20160716123919.654b7d27@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 30 Jun 2016 09:53:38 -0300, Tiago Brusamarello wrote:

> +define PROTOBUF_LUA_BUILD_CMDS
> +	# build Lua Protobuf shared lib
> +	$(TARGET_CC) -Os -shared -std=gnu99 -fPIC $(@D)/protobuf/pb.c -o $(@D)/protobuf/pb.so
> +
> +	# build Protobuf examples
> +	PATH=$(BR_PATH) $(HOST_DIR)/usr/bin/protoc --lua_out=$(@D)/example --proto_path=$(@D)/example \
> +		$(@D)/example/person.proto
> +endef
> +
> +define PROTOBUF_LUA_INSTALL_TARGET_CMDS
> +	# install Lua Protobuf support
> +	mkdir -p $(TARGET_DIR)/usr/lib/lua/$(LUAINTERPRETER_ABIVER)/protobuf

Not needed if you use the -D option of $(INSTALL) and specify a full
destination path.

> +	$(INSTALL) -m 0755 $(@D)/protobuf/pb.so \
> +		$(TARGET_DIR)/usr/lib/lua/$(LUAINTERPRETER_ABIVER)/protobuf/pb.so
> +	mkdir -p $(TARGET_DIR)/usr/share/lua/$(LUAINTERPRETER_ABIVER)/protobuf

Ditto/

> +	$(INSTALL) -m 0755 $(@D)/protobuf/containers.lua \
> +		$(TARGET_DIR)/usr/share/lua/$(LUAINTERPRETER_ABIVER)/protobuf
> +	$(INSTALL) -m 0755 $(@D)/protobuf/decoder.lua \
> +		$(TARGET_DIR)/usr/share/lua/$(LUAINTERPRETER_ABIVER)/protobuf
> +	$(INSTALL) -m 0755 $(@D)/protobuf/descriptor.lua \
> +		$(TARGET_DIR)/usr/share/lua/$(LUAINTERPRETER_ABIVER)/protobuf
> +	$(INSTALL) -m 0755 $(@D)/protobuf/encoder.lua \
> +		$(TARGET_DIR)/usr/share/lua/$(LUAINTERPRETER_ABIVER)/protobuf
> +	$(INSTALL) -m 0755 $(@D)/protobuf/init.lua \
> +		$(TARGET_DIR)/usr/share/lua/$(LUAINTERPRETER_ABIVER)/protobuf
> +	$(INSTALL) -m 0755 $(@D)/protobuf/listener.lua \
> +		$(TARGET_DIR)/usr/share/lua/$(LUAINTERPRETER_ABIVER)/protobuf
> +	$(INSTALL) -m 0755 $(@D)/protobuf/text_format.lua \
> +		$(TARGET_DIR)/usr/share/lua/$(LUAINTERPRETER_ABIVER)/protobuf
> +	$(INSTALL) -m 0755 $(@D)/protobuf/type_checkers.lua \
> +		$(TARGET_DIR)/usr/share/lua/$(LUAINTERPRETER_ABIVER)/protobuf
> +	$(INSTALL) -m 0755 $(@D)/protobuf/type_checkers.lua \
> +		$(TARGET_DIR)/usr/share/lua/$(LUAINTERPRETER_ABIVER)/protobuf
> +	$(INSTALL) -m 0755 $(@D)/protobuf/wire_format.lua \
> +		$(TARGET_DIR)/usr/share/lua/$(LUAINTERPRETER_ABIVER)/protobuf

Could you replace this either with a copy of all *.lua files (if it's
OK), or otherwise by something like:

PROTOBUF_LUA_FILES = \
	decoder descriptor encoder \
	init listener ... ... ..

and then:

	$(foreach f,$(PROTOBUF_LUA_FILES),\
		$(INSTALL) -D -m 0755 $(@D)/protobuf/$(f).lua \
			$(TARGET_DIR)/usr/share/lua/$(LUAINTERPRETER_ABIVER)/protobuf/$(f).lua
	)

> +	# install example files
> +	mkdir -p $(TARGET_DIR)/usr/share/lua/$(LUAINTERPRETER_ABIVER)/protobuf/example
> +	$(INSTALL) -m 0755 $(@D)/example/person_pb.lua \
> +		$(TARGET_DIR)/usr/share/lua/$(LUAINTERPRETER_ABIVER)/protobuf/example
> +	$(INSTALL) -m 0755 $(@D)/example/person.proto \
> +		$(TARGET_DIR)/usr/share/lua/$(LUAINTERPRETER_ABIVER)/protobuf/example
> +	$(INSTALL) -m 0755 $(@D)/example/test.lua \
> +		$(TARGET_DIR)/usr/share/lua/$(LUAINTERPRETER_ABIVER)/protobuf/example

We don't normally install examples to the target, so I think you could
get rid of those lines.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
