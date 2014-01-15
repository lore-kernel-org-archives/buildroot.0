From: =?ISO-8859-1?Q?Fran=E7ois_Perrad?= <francois.perrad@gadz.org>
Date: Wed, 15 Jan 2014 20:40:28 +0100
Subject: [Buildroot] [PATCH 1/3] lua: choice between 5.1.x & 5.2.x
In-Reply-To: <52D577F3.1050100@mind.be>
References: <1389705298-27263-1-git-send-email-francois.perrad@gadz.org>
 <1389705298-27263-2-git-send-email-francois.perrad@gadz.org>
 <52D577F3.1050100@mind.be>
Message-ID: <CAB0FRstXi=g90a2Q+07JY8nwoKwFDkRRERWqYqo8V34hSd17RQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2014/1/14 Arnout Vandecappelle <arnout@mind.be>:
> On 14/01/14 14:14, Francois Perrad wrote:
>>
>>
>> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
>> ---
>>   package/lua/{ => 5.1.5}/lua-01-root-path.patch     |    0
>>   .../{ => 5.1.5}/lua-02-shared-libs-for-lua.patch   |    0
>>   package/lua/{ => 5.1.5}/lua-11-linenoise.patch     |    0
>>   package/lua/5.2.3/lua-01-root-path.patch           |   17 +++++++
>>   package/lua/5.2.3/lua-02-shared-libs-for-lua.patch |   49
>> ++++++++++++++++++++
>>   package/lua/5.2.3/lua-04-lua-pc.patch              |   40
>> ++++++++++++++++
>>   package/lua/5.2.3/lua-11-linenoise.patch           |   26 +++++++++++
>>   package/lua/Config.in                              |   14 ++++++
>>   package/lua/lua.mk                                 |   18 ++++++-
>>   package/luainterpreter/Config.in                   |   10 ++++
>>   10 files changed, 172 insertions(+), 2 deletions(-)
>>   rename package/lua/{ => 5.1.5}/lua-01-root-path.patch (100%)
>>   rename package/lua/{ => 5.1.5}/lua-02-shared-libs-for-lua.patch (100%)
>>   rename package/lua/{ => 5.1.5}/lua-11-linenoise.patch (100%)
>>   create mode 100644 package/lua/5.2.3/lua-01-root-path.patch
>>   create mode 100644 package/lua/5.2.3/lua-02-shared-libs-for-lua.patch
>>   create mode 100644 package/lua/5.2.3/lua-04-lua-pc.patch
>
>
>  Why is this patch numbered 04? What happened to 03?

I skip 03 because a patch numbered 03 was recently removed.
see http://git.buildroot.net/buildroot/commit/package/lua?id=4444a76f2bdb12fa27638b9f0eac99018cb8b130

>
>>   create mode 100644 package/lua/5.2.3/lua-11-linenoise.patch
>
>
>  Note: if you use the -C option for git-send-email (or git-format-patch), it
> will detect these new files as copies of the 5.1.5 versions of the patches.
>
>>
> [snip]
>
>> diff --git a/package/lua/Config.in b/package/lua/Config.in
>> index b96ef0e..9b8b6f1 100644
>> --- a/package/lua/Config.in
>> +++ b/package/lua/Config.in
>> @@ -12,6 +12,20 @@ config BR2_PACKAGE_PROVIDES_LUA_INTERPRETER
>>         default "lua"
>>
>>   choice
>> +       prompt "Lua Version"
>> +       default BR2_PACKAGE_LUA_5_1
>> +       help
>> +         Select the version of Lua API/ABI you wish to use.
>> +
>> +       config BR2_PACKAGE_LUA_5_1
>> +               bool "Lua 5.1.x"
>> +
>> +       config BR2_PACKAGE_LUA_5_2
>> +               bool "Lua 5.2.x"
>> +
>> +endchoice
>> +
>> +choice
>>         prompt "Lua Interpreter command-line editing"
>>         default BR2_PACKAGE_LUA_INTERPRETER_EDITING_NONE
>>
>> diff --git a/package/lua/lua.mk b/package/lua/lua.mk
>> index a88a11e..97e5ea8 100644
>> --- a/package/lua/lua.mk
>> +++ b/package/lua/lua.mk
>> @@ -4,7 +4,12 @@
>>   #
>>
>> ################################################################################
>>
>> +LUA_ABIVER = $(call qstrip,$(BR2_PACKAGE_LUA_VERSION))
>
>
>  In patch 3/3, you use this variable for other packages as well, even though
> the lua package isn't used at all. So to me it makes more sense to call it
> LUAINTERPRETER_ABIVER (and move it to luainterpreter.mk).
>
Ok.

>
>> +ifeq ($(LUA_ABIVER),5.1)
>>   LUA_VERSION = 5.1.5
>> +else
>> +LUA_VERSION = 5.2.3
>> +endif
>>   LUA_SITE = http://www.lua.org/ftp
>>   LUA_INSTALL_STAGING = YES
>>   LUA_LICENSE = MIT
>> @@ -13,6 +18,14 @@ LUA_LICENSE_FILES = COPYRIGHT
>>   LUA_CFLAGS = -Wall -fPIC
>>   LUA_MYLIBS += -ldl
>>
>> +ifneq ($(BR2_LARGEFILE),y)
>> +LUA_CFLAGS += -D_FILE_OFFSET_BITS=32
>> +endif
>
>
>  Isn't this change independent of the version bump?
>
>
>> +
>> +ifeq ($(LUA_ABIVER),5.2)
>> +LUA_CFLAGS += -DLUA_COMPAT_ALL
>> +endif
>> +
>>   ifeq ($(BR2_PACKAGE_LUA_INTERPRETER_READLINE),y)
>>         LUA_DEPENDENCIES = readline ncurses
>>         LUA_MYLIBS += -lreadline -lhistory -lncurses
>> @@ -30,7 +43,7 @@ endif
>>   # We never want to have host-readline and host-ncurses as dependencies
>>   # of host-lua.
>>   HOST_LUA_DEPENDENCIES =
>> -HOST_LUA_CFLAGS = -Wall -fPIC -DLUA_USE_DLOPEN -DLUA_USE_POSIX
>> +HOST_LUA_CFLAGS = -Wall -fPIC -DLUA_USE_DLOPEN -DLUA_USE_POSIX
>> -DLUA_COMPAT_ALL
>>   HOST_LUA_MYLIBS = -ldl
>>
>>   define LUA_BUILD_CMDS
>> @@ -70,7 +83,8 @@ define LUA_INSTALL_TARGET_CMDS
>>         $(INSTALL) -m 0755 -D $(@D)/src/liblua.so.$(LUA_VERSION) \
>>                 $(TARGET_DIR)/usr/lib/liblua.so.$(LUA_VERSION)
>>         ln -sf liblua.so.$(LUA_VERSION) $(TARGET_DIR)/usr/lib/liblua.so
>> -       $(INSTALL) -m 0644 -D $(@D)/src/liblua.a
>> $(TARGET_DIR)/usr/lib/liblua.a
>> +       mkdir -p $(TARGET_DIR)/usr/lib/lua/$(LUA_ABIVER)
>> +       mkdir -p $(TARGET_DIR)/usr/share/lua/$(LUA_ABIVER)
>>   endef
>>
>>   define HOST_LUA_INSTALL_CMDS
>> diff --git a/package/luainterpreter/Config.in
>> b/package/luainterpreter/Config.in
>> index 1562145..3bc257e 100644
>> --- a/package/luainterpreter/Config.in
>> +++ b/package/luainterpreter/Config.in
>> @@ -4,3 +4,13 @@ config BR2_PACKAGE_HAS_LUA_INTERPRETER
>>   config BR2_PACKAGE_PROVIDES_LUA_INTERPRETER
>>         string
>>         depends on BR2_PACKAGE_HAS_LUA_INTERPRETER
>> +
>> +config BR2_PACKAGE_LUA_VERSION
>> +       string
>> +       default "5.1"   if BR2_PACKAGE_LUA_5_1 || BR2_PACKAGE_LUAJIT
>> +       default "5.2"   if BR2_PACKAGE_LUA_5_2
>
>
>  Since this symbol is defined here, I think it should be called
> BR2_PACKAGE_LUAINTERPRETER_VERSION. And actually, to be consistent with the
> name used in the .mk file, I'd call it BR2_PACKAGE_LUAINTERPRETER_ABI.

Ok.

>
>  Also, I think there should be a BR2_PACKAGE_LUAINTERPRETER_ABI_5_1 and _5_2
> boolean symbol. This will allow the symbol to be selected from the
> implementing package itself, which makes it easier to add new lua
> interpreters in BR2_EXTERNAL. Also, it makes it easier to depend on the ABI
> version.
>
>
>> +
>> +config BR2_PACKAGE_LUA_VERSION_NUM
>> +       int
>> +       default 501     if BR2_PACKAGE_LUA_5_1 || BR2_PACKAGE_LUAJIT
>> +       default 502     if BR2_PACKAGE_LUA_5_2
>
>
>  This symbol doesn't seem to be used anywhere.
>
Right. The last reference to LUA_VERSION_NUM was removed with
http://git.buildroot.net/buildroot/commit/package/luaexpat?id=5886f8c339fb0c37de0ba3e991471800906e310e

Fran?ois

>
>  Regards,
>  Arnout
>
>>
>
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
