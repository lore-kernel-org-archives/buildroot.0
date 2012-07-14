From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Sat, 14 Jul 2012 11:57:44 -0400
Subject: [Buildroot] [PATCH] New package: LuaExpat
In-Reply-To: <CAB0FRssTdf-1nYWsrZ-P2Yr+hEJb8-xu8CqkMYsLR6TWa3JTiw@mail.gmail.com>
References: <1338857115-4148-1-git-send-email-danomimanchego123@gmail.com>
 <CAB0FRssTdf-1nYWsrZ-P2Yr+hEJb8-xu8CqkMYsLR6TWa3JTiw@mail.gmail.com>
Message-ID: <CANxTyt5uMPs3u5gMh51jMAhJkERMPLyZ4559uw3ffvehBFM2Bg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fran?ois,

> but Config.in contains an useless line :
>    depends on BR2_PACKAGE_LUA_SHARED_LIBRARY

To be honest, I was just following the example of most of the other
lua-related packages.  Currently, the same depends-on is listed
in luafilesystem, luasocket, cgilua, rings, xavante, and copas (with
comment indicating that this is due to luasocket).  How is usefulness
determined in these cases?

Danomi -


On Fri, Jul 13, 2012 at 5:35 AM, Fran?ois Perrad
<francois.perrad@gadz.org>wrote:

> this package works for me.
> but Config.in contains an useless line :
>    depends on BR2_PACKAGE_LUA_SHARED_LIBRARY
>
> Fran?ois
>
>
> 2012/6/5 Danomi Manchego <danomimanchego123@gmail.com>:
> > Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
> > ---
> >  package/Config.in            |    1 +
> >  package/luaexpat/Config.in   |    8 ++++++++
> >  package/luaexpat/luaexpat.mk |   39
> +++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 48 insertions(+)
> >  create mode 100644 package/luaexpat/Config.in
> >  create mode 100644 package/luaexpat/luaexpat.mk
> >
> > diff --git a/package/Config.in b/package/Config.in
> > index ca8fc96..2adf311 100644
> > --- a/package/Config.in
> > +++ b/package/Config.in
> > @@ -244,6 +244,7 @@ menu "LUA libraries/modules"
> >  source "package/cgilua/Config.in"
> >  source "package/copas/Config.in"
> >  source "package/coxpcall/Config.in"
> > +source "package/luaexpat/Config.in"
> >  source "package/luafilesystem/Config.in"
> >  source "package/luasocket/Config.in"
> >  source "package/rings/Config.in"
> > diff --git a/package/luaexpat/Config.in b/package/luaexpat/Config.in
> > new file mode 100644
> > index 0000000..dd58aeb
> > --- /dev/null
> > +++ b/package/luaexpat/Config.in
> > @@ -0,0 +1,8 @@
> > +config BR2_PACKAGE_LUAEXPAT
> > +       bool "luaexpat"
> > +       depends on BR2_PACKAGE_LUA_SHARED_LIBRARY
> > +       select BR2_PACKAGE_EXPAT
> > +       help
> > +         LuaExpat is a SAX XML parser based on the Expat library.
> > +
> > +         http://matthewwild.co.uk/projects/luaexpat/
> > diff --git a/package/luaexpat/luaexpat.mk b/package/luaexpat/luaexpat.mk
> > new file mode 100644
> > index 0000000..e23473e
> > --- /dev/null
> > +++ b/package/luaexpat/luaexpat.mk
> > @@ -0,0 +1,39 @@
> > +#############################################################
> > +#
> > +# luaexpat
> > +#
> > +#############################################################
> > +
> > +LUAEXPAT_VERSION      = 1.2.0
> > +LUAEXPAT_SOURCE       = luaexpat-$(LUAEXPAT_VERSION).tar.gz
> > +LUAEXPAT_SITE         = http://matthewwild.co.uk/projects/luaexpat
> > +LUAEXPAT_DEPENDENCIES = lua expat
> > +
> > +
> > +LUAEXPAT_MFLAGS += LUA_VERSION_NUM=501
> > +LUAEXPAT_MFLAGS += LUA_INC=$(STAGING_DIR)/usr/include/lua
> > +LUAEXPAT_MFLAGS += EXPAT_INC=$(STAGING_DIR)/usr/include
> > +LUAEXPAT_MFLAGS += LIBNAME=lxp.so
> > +LUAEXPAT_MFLAGS += LIB_OPTION="-shared -fPIC $(TARGET_CFLAGS)"
> > +LUAEXPAT_MFLAGS += CC="$(TARGET_CC) -fPIC $(TARGET_CFLAGS)"
> > +
> > +
> > +define LUAEXPAT_BUILD_CMDS
> > +       $(MAKE) -C $(@D) $(LUAEXPAT_MFLAGS)
> > +endef
> > +
> > +define LUAEXPAT_INSTALL_TARGET_CMDS
> > +       $(INSTALL) -D $(@D)/src/lxp.so $(TARGET_DIR)/usr/lib/lua/lxp.so
> > +       $(INSTALL) -D -m 0644 $(@D)/src/lxp/lom.lua
> $(TARGET_DIR)/usr/share/lua/lxp/lom.lua
> > +endef
> > +
> > +define LUAEXPAT_UNINSTALL_TARGET_CMDS
> > +       rm -f "$(TARGET_DIR)/usr/lib/lua/lxp.so"
> > +       rm -f "$(TARGET_DIR)/usr/share/lua/lxp/lom.lua"
> > +endef
> > +
> > +define LUAEXPAT_CLEAN_CMDS
> > +       $(MAKE) -C $(@D) $(LUAEXPAT_MFLAGS) clean
> > +endef
> > +
> > +$(eval $(call GENTARGETS))
> > --
> > 1.7.9.5
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120714/b600ab6d/attachment-0001.html>
