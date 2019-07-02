From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Tue, 2 Jul 2019 20:51:12 +0200
Subject: [Buildroot] [PATCH] package/luasyslog: bump to version 2.2.0
 (fork)
In-Reply-To: <0be65c26-a7c1-bc02-1d92-5d3e6970f6a1@mind.be>
References: <20190630182440.2841-1-francois.perrad@gadz.org>
 <0be65c26-a7c1-bc02-1d92-5d3e6970f6a1@mind.be>
Message-ID: <CAB0FRsuRMET=h9xuRBpXPeT5tRh+RxwLbzgtXnKFzUt88gMw+w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le lun. 1 juil. 2019 ? 22:30, Arnout Vandecappelle <arnout@mind.be> a
?crit :

>  Hi Francois,
>
> On 30/06/2019 20:24, Francois Perrad wrote:
> > this fork has a good support for Lua 5.3
>
>  If I understand correctly, this fork *could* still use the luarocks
> infrastructure, but then luarocks would just call autogen so you need all
> the
> autotools dependencies, so it's easier to use an autotools package
> directly.
>
>
No, the BR luarocks infrastructure supports only rocks using the builtin
build type, but not rock using autotools.


>
> > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> > ---
> >  package/luasyslog/0001-compat-Lua-5.3.patch   | 52 -------------------
> >  .../luasyslog/0001-remove-AX_LUA_LIBS.patch   | 27 ++++++++++
> >  package/luasyslog/Config.in                   |  4 +-
> >  package/luasyslog/luasyslog.hash              |  6 +--
> >  package/luasyslog/luasyslog.mk                |  9 ++--
> >  .../testing/tests/package/test_luasyslog.py   |  2 +
> >  6 files changed, 40 insertions(+), 60 deletions(-)
> >  delete mode 100644 package/luasyslog/0001-compat-Lua-5.3.patch
> >  create mode 100644 package/luasyslog/0001-remove-AX_LUA_LIBS.patch
> >
> [snip]
> > diff --git a/package/luasyslog/0001-remove-AX_LUA_LIBS.patch
> b/package/luasyslog/0001-remove-AX_LUA_LIBS.patch
> > new file mode 100644
> > index 000000000..23569ff5b
> > --- /dev/null
> > +++ b/package/luasyslog/0001-remove-AX_LUA_LIBS.patch
> > @@ -0,0 +1,27 @@
> > +From 84296c5eae651b45ebfa233199b7ddc009a5dad3 Mon Sep 17 00:00:00 2001
> > +From: Francois Perrad <francois.perrad@gadz.org>
> > +Date: Fri, 21 Jun 2019 14:58:54 +0200
> > +Subject: [PATCH] remove AX_LUA_LIBS
> > +
> > +AX_LUA_LIBS fails with LuaJIT
>
>  Why does it fail? Because LuaJIT doesn't install that autoconf macro?
>
>  Why can we just remove it?
>
> > +
> > +Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> > +---
> > + configure.ac | 1 -
> > + 1 file changed, 1 deletion(-)
> > +
> > +diff --git a/configure.ac b/configure.ac
> > +index 9ac6c95..d7fc518 100644
> > +--- a/configure.ac
> > ++++ b/configure.ac
> > +@@ -32,7 +32,6 @@ AC_PATH_PROG([LUAROCKS], [luarocks], [:])
> > + AX_PROG_LUA([5.1],[6.0])
> > +
> > + dnl Check for libraries
> > +-AX_LUA_LIBS
> > +
> > + dnl Check for functions
> > + AC_HEADER_STDC
> > +--
> > +2.20.1
> > +
> > diff --git a/package/luasyslog/Config.in b/package/luasyslog/Config.in
> > index 814e7ad37..ca098cb4f 100644
> > --- a/package/luasyslog/Config.in
> > +++ b/package/luasyslog/Config.in
> > @@ -2,6 +2,6 @@ config BR2_PACKAGE_LUASYSLOG
> >       bool "luasyslog"
> >       select BR2_PACKAGE_LUALOGGING # runtime
> >       help
> > -       Syslog logging for Lua.
> > +       syslog appender for LuaLogging.
>
>  Why does the description change?
>
>
This new description is used by the fork.


> >
> > -       http://lua.net-core.org/sputnik.lua?p=Telesto:About
> > +       https://github.com/ntd/luasyslog
> > diff --git a/package/luasyslog/luasyslog.hash
> b/package/luasyslog/luasyslog.hash
> > index 02a0d838a..bcb6a7e02 100644
> > --- a/package/luasyslog/luasyslog.hash
> > +++ b/package/luasyslog/luasyslog.hash
> > @@ -1,3 +1,3 @@
> > -# computed by luarocks/buildroot
> > -sha256
> e807a614b77108ca25aeed061faf73b7ef00708f5bfebb9e4f03d27f3d453e7b
> luasyslog-1.0.0-2.src.rock
> > -sha256
> c1ed5cbf3fc02836d3fc5d2354818a5c151c1cd75fcc0bf240dbf8d2b36a3c1d
> luasyslog-1.0.0/COPYING
> > +# Locally computed
> > +sha256
> 7f7dad64117407f2484ff5b53e90804f923a99fcbde5872e54f6aba53f482da0
> luasyslog-2.2.0.tar.gz
> > +sha256
> 833457938f5155e65dabda12a5c9d4b6fd7fb92dd7ead584c1c30cfb0c84adf4  COPYING
> > diff --git a/package/luasyslog/luasyslog.mk b/package/luasyslog/
> luasyslog.mk
> > index 1d88b6056..aa57f9425 100644
> > --- a/package/luasyslog/luasyslog.mk
> > +++ b/package/luasyslog/luasyslog.mk
> > @@ -4,8 +4,11 @@
> >  #
> >
> ################################################################################
> >
> > -LUASYSLOG_VERSION = 1.0.0-2
> > +LUASYSLOG_VERSION = 2.2.0
> > +LUASYSLOG_SITE = $(call github,ntd,luasyslog,$(LUASYSLOG_VERSION))
> > +LUASUSLOG_DEPENDENCIES = luainterpreter
> >  LUASYSLOG_LICENSE = MIT
> > -LUASYSLOG_LICENSE_FILES = $(LUASYSLOG_SUBDIR)/COPYING
> > +LUASYSLOG_LICENSE_FILES = COPYING
> > +LUASYSLOG_AUTORECONF = YES
>
>  Please add a comment why we reconf: sources from git + patch 0001.
>
>
There is no configure script shipped in the tarball, so AUTORECONF is
needed.


> >
> > -$(eval $(luarocks-package))
> > +$(eval $(autotools-package))
> > diff --git a/support/testing/tests/package/test_luasyslog.py
> b/support/testing/tests/package/test_luasyslog.py
> > index 4eb5402d0..158b95cb0 100644
> > --- a/support/testing/tests/package/test_luasyslog.py
> > +++ b/support/testing/tests/package/test_luasyslog.py
> > @@ -10,6 +10,7 @@ class TestLuaLuasyslog(TestLuaBase):
> >
> >      def test_run(self):
> >          self.login()
> > +        self.module_test("lsyslog")
>
>  Please explain why this is added.
>
>
lsyslog is the native part of luasyslog, so the part which needs to be
tested.
logging.syslog is the Lua part of luasyslog.
In the previous version, lsyslog was indirectly loaded by logging.syslog,
but not in this version.


>
>  Regards,
>  Arnout
>
> >          self.module_test("logging.syslog")
> >
> >
> > @@ -22,4 +23,5 @@ class TestLuajitLuasyslog(TestLuaBase):
> >
> >      def test_run(self):
> >          self.login()
> > +        self.module_test("lsyslog")
> >          self.module_test("logging.syslog")
> >
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190702/ee60f871/attachment.html>
