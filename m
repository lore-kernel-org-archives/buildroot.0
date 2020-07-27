From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Mon, 27 Jul 2020 18:59:43 +0200
Subject: [Buildroot] [PATCH 01/11] lua: add 5.4.0 version
In-Reply-To: <20200727160038.6fcf446a@windsurf.home>
References: <20200702202230.1531929-1-francois.perrad@gadz.org>
 <20200702202230.1531929-2-francois.perrad@gadz.org>
 <20200727160038.6fcf446a@windsurf.home>
Message-ID: <CAB0FRstQrGkP2tBB5DUNoEtTRCnOJOfW3MSnD8XB8z5oDphfwg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le lun. 27 juil. 2020 ? 16:00, Thomas Petazzoni <
thomas.petazzoni@bootlin.com> a ?crit :

> Hello Fran?ois,
>
> Most issues are small details, except the last one, which really needs
> a reply from you.
>
> On Thu,  2 Jul 2020 22:22:20 +0200
> Francois Perrad <fperrad@gmail.com> wrote:
>
> > diff --git a/package/lua/lua.mk b/package/lua/lua.mk
> > index ce75af6b0..0b6d2c1dc 100644
> > --- a/package/lua/lua.mk
> > +++ b/package/lua/lua.mk
> > @@ -4,15 +4,19 @@
> >  #
> >
> ################################################################################
> >
> > +ifeq ($(BR2_PACKAGE_LUA_5_4),y)
> > +LUA_VERSION = 5.4.0
> > +else
> >  ifeq ($(BR2_PACKAGE_LUA_5_3),y)
>
> else ifeq
>
> on one line...
>
> >  LUA_VERSION = 5.3.5
> >  else
> >  LUA_VERSION = 5.1.5
> >  endif
> > +endif
>
> ... as it avoids the need for that additional endif.
>
> >  LUA_SITE = http://www.lua.org/ftp
> >  LUA_INSTALL_STAGING = YES
> >  LUA_LICENSE = MIT
> > -ifeq ($(BR2_PACKAGE_LUA_5_3),y)
> > +ifeq ($(BR2_PACKAGE_LUA_5_3)$(BR2_PACKAGE_LUA_5_4),y)
> >  LUA_LICENSE_FILES = doc/readme.html
> >  else
> >  LUA_LICENSE_FILES = COPYRIGHT
> > @@ -22,6 +26,10 @@ LUA_PROVIDES = luainterpreter
> >
> >  LUA_CFLAGS = -Wall -fPIC -DLUA_USE_POSIX
> >
> > +ifeq ($(BR2_PACKAGE_LUA_5_4),y)
> > +LUA_CFLAGS += -DLUA_COMPAT_5_3
> > +endif
> > +
> >  ifeq ($(BR2_PACKAGE_LUA_5_3),y)
>
> This could be changed to:
>
> else ifeq ($(BR2_PACKAGE_LUA_5_3),y)
>
> > diff --git a/package/pkg-luarocks.mk b/package/pkg-luarocks.mk
> > index 603c0851b..be85563ba 100644
> > --- a/package/pkg-luarocks.mk
> > +++ b/package/pkg-luarocks.mk
> > @@ -20,9 +20,9 @@
> >  LUAROCKS_RUN_CMD = $(HOST_DIR)/bin/luarocks
> >  LUAROCKS_CFLAGS = $(TARGET_CFLAGS) -fPIC
> >  HOST_LUAROCKS_CFLAGS = $(HOST_CFLAGS) -fPIC
> > -ifeq ($(BR2_PACKAGE_LUA_5_3),y)
> > -LUAROCKS_CFLAGS += -DLUA_COMPAT_5_2
> > -HOST_LUAROCKS_CFLAGS += -DLUA_COMPAT_5_2
>
> I don't understand why this is being dropped. Could you clarify ?
>

good catch!



>
> > +ifeq ($(BR2_PACKAGE_LUA_5_4),y)
> > +LUAROCKS_CFLAGS += -DLUA_COMPAT_5_3
> > +HOST_LUAROCKS_CFLAGS += -DLUA_COMPAT_5_3
> >  endif
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200727/7083c2e1/attachment.html>
