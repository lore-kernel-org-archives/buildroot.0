From: Tiago Brusamarello <tiago.brusamarello@datacom.ind.br>
Date: Mon, 18 Jul 2016 14:31:44 -0300
Subject: [Buildroot] [PATCH 3/3] package/protobuf-lua: new package
In-Reply-To: <84f82695-4f8f-b9bd-250a-f500d92e0607@gmail.com>
References: <1467291218-7710-1-git-send-email-tiago.brusamarello@datacom.ind.br>
 <1467291218-7710-3-git-send-email-tiago.brusamarello@datacom.ind.br>
 <84f82695-4f8f-b9bd-250a-f500d92e0607@gmail.com>
Message-ID: <578D1280.30702@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Romain.

Em 16-07-2016 07:25, Romain Naour escreveu:
> Hi Tiago,
>
> Le 30/06/2016 ? 14:53, Tiago Brusamarello a ?crit :
>> This package adds support to use Google's Protocol buffers
>> from Lua scripts.
>>
>> The original package from GitHub supports deployment as
>> a LuaRocks package, but the module name as set to 'protobuf'
>> and not 'protobuf-lua' which causes naming problems when
>> building it in Buildroot so the 'generick-package' method
> s/generik/generic/
>
>> was used instead.
>>
>> This package depends on the 'protoc-gen-lua' plugin package
>> for generation of Protobuf messages types in Lua format.
>>
>> Signed-off-by: Tiago Brusamarello<tiago.brusamarello@datacom.ind.br>
>> ---
>>   package/Config.in                    |  1 +
>>   package/protobuf-lua/Config.in       |  7 +++++
>>   package/protobuf-lua/protobuf-lua.mk | 60 ++++++++++++++++++++++++++++++++++++
>>   3 files changed, 68 insertions(+)
>>   create mode 100644 package/protobuf-lua/Config.in
>>   create mode 100644 package/protobuf-lua/protobuf-lua.mk
>>
>> diff --git a/package/Config.in b/package/Config.in
>> index 715f8ab..dc32465 100644
>> --- a/package/Config.in
>> +++ b/package/Config.in
>> @@ -548,6 +548,7 @@ menu "Lua libraries/modules"
>>   	source "package/luvi/Config.in"
>>   	source "package/lzlib/Config.in"
>>   	source "package/orbit/Config.in"
>> +	source "package/protobuf-lua/Config.in"
>>   	source "package/rings/Config.in"
>>   	source "package/turbolua/Config.in"
>>   	source "package/wsapi/Config.in"
>> diff --git a/package/protobuf-lua/Config.in b/package/protobuf-lua/Config.in
>> new file mode 100644
>> index 0000000..e602111
>> --- /dev/null
>> +++ b/package/protobuf-lua/Config.in
>> @@ -0,0 +1,7 @@
>> +config BR2_PACKAGE_PROTOBUF_LUA
>> +	bool "protobuf-lua"
>> +	depends on BR2_PACKAGE_LUA_5_1 || BR2_PACKAGE_LUA_5_2
> Why protobuf-lua depends on lua 5.1 and 5.2 only ?
> What was the issue ?
It seems that the shared library 'pb.so' built by the package is only 
compatible
with Lua 5.2 and Lua 5.2.

> Also, is protobuf-lua can be used with luajit ?
> If yes, maybe you can use "depends on BR2_PACKAGE_HAS_LUAINTERPRETER" instead.
I can't tell you if it's compatible with 'luajit' or not.
>> +	help
>> +		Runtime libraries to use Protocol Buffers from Lua scripts.
>> +
>> +		https://github.com/djungelorm/protobuf-lua
> Indent with one tab and two space.
>
>> diff --git a/package/protobuf-lua/protobuf-lua.mk b/package/protobuf-lua/protobuf-lua.mk
>> new file mode 100644
>> index 0000000..1a6c693
>> --- /dev/null
>> +++ b/package/protobuf-lua/protobuf-lua.mk
>> @@ -0,0 +1,60 @@
>> +################################################################################
>> +#
>> +# protobuf-lua
>> +#
>> +################################################################################
>> +
>> +
> remove one empty line
>
>> +PROTOBUF_LUA_VERSION = v1.1.1
>> +PROTOBUF_LUA_SITE = $(call github,djungelorm,protobuf-lua,$(PROTOBUF_LUA_VERSION))
>> +PROTOBUF_LUA_DEPENDENCIES = luainterpreter host-protoc-gen-lua
> There is a missing dependency on host-protobuf which provide protoc
>
>> +PROTOBUF_LUA_LICENSE = BSD-3c
>> +PROTOBUF_LUA_LICENSE_FILES = LICENSE
>> +
>> +define PROTOBUF_LUA_BUILD_CMDS
>> +	# build Lua Protobuf shared lib
>> +	$(TARGET_CC) -Os -shared -std=gnu99 -fPIC $(@D)/protobuf/pb.c -o $(@D)/protobuf/pb.so
>> +
>> +	# build Protobuf examples
>> +	PATH=$(BR_PATH) $(HOST_DIR)/usr/bin/protoc --lua_out=$(@D)/example --proto_path=$(@D)/example \
>> +		$(@D)/example/person.proto
>> +endef
> protoc-gen-lua doesn't work with any host-python version:
>
> host-python3:
>
> Traceback (most recent call last):
>    File "output/host/usr/bin/protoc-gen-lua", line 15, in <module>
>      from cStringIO import StringIO
> ImportError: No module named 'cStringIO'
> --lua_out: protoc-gen-lua: Plugin failed with status code 1.
I guess it will not work whit Python 3 because the missing 'cStringIO '.
> host-python2:
>
> Traceback (most recent call last):
>    File "output/host/usr/bin/protoc-gen-lua", line 17, in <module>
>      import plugin_pb2
>    File "output/host/usr/bin/plugin_pb2.py", line 3, in <module>
>      from google.protobuf import descriptor
> ImportError: No module named google.protobuf
> --lua_out: protoc-gen-lua: Plugin failed with status code 1.
I've tested it with Python 2.7.11 and it worked well for me. Maybe this 
error is caused
by the missing dependency to 'host-protobuf'.

> So, I've marked your patch as Changes Requested in patchwork. Feel free
> to submit an updated version that takes into account the comments and fixed the
> build issue.
>
> Thanks!
>
> Best regards,
> Romain
>
>
>> +
>> +define PROTOBUF_LUA_INSTALL_TARGET_CMDS
>> +	# install Lua Protobuf support
>> +	mkdir -p $(TARGET_DIR)/usr/lib/lua/$(LUAINTERPRETER_ABIVER)/protobuf
>> +	$(INSTALL) -m 0755 $(@D)/protobuf/pb.so \
>> +		$(TARGET_DIR)/usr/lib/lua/$(LUAINTERPRETER_ABIVER)/protobuf/pb.so
>> +	mkdir -p $(TARGET_DIR)/usr/share/lua/$(LUAINTERPRETER_ABIVER)/protobuf
>> +	$(INSTALL) -m 0755 $(@D)/protobuf/containers.lua \
>> +		$(TARGET_DIR)/usr/share/lua/$(LUAINTERPRETER_ABIVER)/protobuf
>> +	$(INSTALL) -m 0755 $(@D)/protobuf/decoder.lua \
>> +		$(TARGET_DIR)/usr/share/lua/$(LUAINTERPRETER_ABIVER)/protobuf
>> +	$(INSTALL) -m 0755 $(@D)/protobuf/descriptor.lua \
>> +		$(TARGET_DIR)/usr/share/lua/$(LUAINTERPRETER_ABIVER)/protobuf
>> +	$(INSTALL) -m 0755 $(@D)/protobuf/encoder.lua \
>> +		$(TARGET_DIR)/usr/share/lua/$(LUAINTERPRETER_ABIVER)/protobuf
>> +	$(INSTALL) -m 0755 $(@D)/protobuf/init.lua \
>> +		$(TARGET_DIR)/usr/share/lua/$(LUAINTERPRETER_ABIVER)/protobuf
>> +	$(INSTALL) -m 0755 $(@D)/protobuf/listener.lua \
>> +		$(TARGET_DIR)/usr/share/lua/$(LUAINTERPRETER_ABIVER)/protobuf
>> +	$(INSTALL) -m 0755 $(@D)/protobuf/text_format.lua \
>> +		$(TARGET_DIR)/usr/share/lua/$(LUAINTERPRETER_ABIVER)/protobuf
>> +	$(INSTALL) -m 0755 $(@D)/protobuf/type_checkers.lua \
>> +		$(TARGET_DIR)/usr/share/lua/$(LUAINTERPRETER_ABIVER)/protobuf
>> +	$(INSTALL) -m 0755 $(@D)/protobuf/type_checkers.lua \
>> +		$(TARGET_DIR)/usr/share/lua/$(LUAINTERPRETER_ABIVER)/protobuf
>> +	$(INSTALL) -m 0755 $(@D)/protobuf/wire_format.lua \
>> +		$(TARGET_DIR)/usr/share/lua/$(LUAINTERPRETER_ABIVER)/protobuf
>> +
>> +	# install example files
>> +	mkdir -p $(TARGET_DIR)/usr/share/lua/$(LUAINTERPRETER_ABIVER)/protobuf/example
>> +	$(INSTALL) -m 0755 $(@D)/example/person_pb.lua \
>> +		$(TARGET_DIR)/usr/share/lua/$(LUAINTERPRETER_ABIVER)/protobuf/example
>> +	$(INSTALL) -m 0755 $(@D)/example/person.proto \
>> +		$(TARGET_DIR)/usr/share/lua/$(LUAINTERPRETER_ABIVER)/protobuf/example
>> +	$(INSTALL) -m 0755 $(@D)/example/test.lua \
>> +		$(TARGET_DIR)/usr/share/lua/$(LUAINTERPRETER_ABIVER)/protobuf/example
>> +endef
>> +
>> +$(eval $(generic-package))
>>
Best Regards,

Tiago.
