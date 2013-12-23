From: =?ISO-8859-1?Q?Fran=E7ois_Perrad?= <francois.perrad@gadz.org>
Date: Mon, 23 Dec 2013 08:56:29 +0100
Subject: [Buildroot] [pkg-luarocks infra V4 05/10] luarocks: new package
In-Reply-To: <20131222182858.1709cbc3@skate>
References: <1384520859-3189-1-git-send-email-francois.perrad@gadz.org>
 <1384520859-3189-5-git-send-email-francois.perrad@gadz.org>
 <20131222182858.1709cbc3@skate>
Message-ID: <CAB0FRsvstaeTyhaf0YNi_8HGvBp52kJME1T1-cJcYppf0s4gqA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2013/12/22 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
> Dear Francois Perrad,
>
> On Fri, 15 Nov 2013 14:07:34 +0100, Francois Perrad wrote:
>>
>> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
>> ---
>>  package/luarocks/luarocks-build-minimal.patch |   17 ++++++++++
>>  package/luarocks/luarocks-unpack.patch        |   24 ++++++++++++++
>
> We want patches to be numbered:
>
>  luarocks-001-<foo>.patch
>  luarocks-002-<bar>.patch
>
> This guarantees that they are applied in the right order.
>
>>  package/luarocks/luarocks.mk                  |   42 +++++++++++++++++++++++++
>>  3 files changed, 83 insertions(+)
>>  create mode 100644 package/luarocks/luarocks-build-minimal.patch
>>  create mode 100644 package/luarocks/luarocks-unpack.patch
>>  create mode 100644 package/luarocks/luarocks.mk
>>
>> diff --git a/package/luarocks/luarocks-build-minimal.patch b/package/luarocks/luarocks-build-minimal.patch
>> new file mode 100644
>> index 0000000..3a4794e
>> --- /dev/null
>> +++ b/package/luarocks/luarocks-build-minimal.patch
>> @@ -0,0 +1,17 @@
>> +hack for buildroot which needs independant steps : download, unpack, build
>> +
>> +Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
>> +
>> +Index: b/src/luarocks/build.lua
>> +===================================================================
>> +--- a/src/luarocks/build.lua
>> ++++ b/src/luarocks/build.lua
>> +@@ -362,6 +362,8 @@
>> +
>> +    if flags["pack-binary-rock"] then
>> +       return pack.pack_binary_rock(name, version, do_build, name, version, deps.get_deps_mode(flags))
>> ++   elseif flags["minimal"] then
>> ++      return build_rockspec(name, false, true, "none")
>> +    else
>> +       local ok, err = fs.check_command_permissions(flags)
>> +       if not ok then return nil, err end
>> diff --git a/package/luarocks/luarocks-unpack.patch b/package/luarocks/luarocks-unpack.patch
>> new file mode 100644
>> index 0000000..0f036ee
>> --- /dev/null
>> +++ b/package/luarocks/luarocks-unpack.patch
>> @@ -0,0 +1,24 @@
>> +allows unpack in existing directory
>> +
>> +Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
>> +
>> +Index: b/src/luarocks/unpack.lua
>> +===================================================================
>> +--- a/src/luarocks/unpack.lua
>> ++++ b/src/luarocks/unpack.lua
>> +@@ -101,11 +101,10 @@
>> +       return nil, file.." does not seem to be a valid filename."
>> +    end
>> +
>> +-   if (fs.exists(dir_name)) then
>> +-      return nil, "Directory "..dir_name.." already exists."
>> ++   if not fs.exists(dir_name) then
>> ++      local ok, err = fs.make_dir(dir_name)
>> ++      if not ok then return nil, err end
>> +    end
>> +-   local ok, err = fs.make_dir(dir_name)
>> +-   if not ok then return nil, err end
>> +    local rollback = util.schedule_function(fs.delete, fs.absolute_name(dir_name))
>> +
>> +    local rockspec, err
>> +
>
> Any chance these patches make it their way upstream?
>

With the next release of LuaRocks, these patches will be removed.
See https://github.com/keplerproject/luarocks/commit/a1f62e69ee7fdb1dfd6dc36aad48e1306a70bb14
and the whole discussion
http://sourceforge.net/mailarchive/message.php?msg_id=31645659

Fran?ois

>> diff --git a/package/luarocks/luarocks.mk b/package/luarocks/luarocks.mk
>> new file mode 100644
>> index 0000000..d996ccc
>> --- /dev/null
>> +++ b/package/luarocks/luarocks.mk
>> @@ -0,0 +1,42 @@
>> +################################################################################
>> +#
>> +# luarocks
>> +#
>> +################################################################################
>> +
>> +LUAROCKS_VERSION = 2.1.1
>> +LUAROCKS_SITE = http://luarocks.org/releases/
>> +LUAROCKS_LICENSE = MIT
>> +LUAROCKS_LICENSE_FILES = COPYING
>> +
>> +HOST_LUAROCKS_DEPENDENCIES = host-lua luainterpreter
>> +
>> +LUAROCKS_CONFIG_DIR  = $(HOST_DIR)/usr/etc/luarocks
>> +LUAROCKS_CONFIG_FILE = $(LUAROCKS_CONFIG_DIR)/config-5.1.lua
>> +
>> +define HOST_LUAROCKS_CONFIGURE_CMDS
>> +     cd $(@D) && ./configure \
>> +             --prefix=$(TARGET_DIR)/usr \
>> +             --sysconfdir=$(LUAROCKS_CONFIG_DIR) \
>> +             --with-lua=$(HOST_DIR)/usr \
>> +             --with-lua-include=$(STAGING_DIR)/usr/include \
>> +             --with-lua-lib=$(STAGING_DIR)/usr/lib
>> +     @echo "$(@D)/config.unix generated"
>
> This echo is probably not needed.
>
>> +endef
>> +
>> +define HOST_LUAROCKS_INSTALL_CMDS
>> +     $(MAKE1) -C $(@D) install \
>> +             PREFIX=$(HOST_DIR)/usr
>> +     echo "-- BR cross-compilation"                          >> $(LUAROCKS_CONFIG_FILE)
>> +     echo "variables = {"                                    >> $(LUAROCKS_CONFIG_FILE)
>> +     echo "   CC = [[$(TARGET_CC)]],"                        >> $(LUAROCKS_CONFIG_FILE)
>> +     echo "   LD = [[$(TARGET_CC)]],"                        >> $(LUAROCKS_CONFIG_FILE)
>> +     echo "   CFLAGS = [[$(TARGET_CFLAGS)]],"                >> $(LUAROCKS_CONFIG_FILE)
>> +     echo "   LIBFLAG = [[-shared $(TARGET_LDFLAGS)]],"      >> $(LUAROCKS_CONFIG_FILE)
>> +     echo "}"                                                >> $(LUAROCKS_CONFIG_FILE)
>> +     echo "external_deps_dirs = { [[$(STAGING_DIR)/usr]] }"  >> $(LUAROCKS_CONFIG_FILE)
>> +     echo "gcc_rpath = false"                                >> $(LUAROCKS_CONFIG_FILE)
>> +endef
>> +
>> +$(eval $(host-generic-package))
>> +
>
> Other than that, it looks ok to me.
>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
