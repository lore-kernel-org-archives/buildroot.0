From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Sun, 8 Dec 2019 16:11:27 +0100
Subject: [Buildroot] [PATCH] lua-lyaml: new package
In-Reply-To: <20190918181955.2299-1-francois.perrad@gadz.org>
References: <20190918181955.2299-1-francois.perrad@gadz.org>
Message-ID: <CAB0FRsvQOBvZLVEaoQQshwTLxBVsj+_exFiUOj5y8ZroUUNLTQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ping

Le mer. 18 sept. 2019 ? 20:20, Francois Perrad <fperrad@gmail.com> a ?crit :

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  .gitlab-ci.yml                                |  2 ++
>  package/Config.in                             |  1 +
>  package/lua-lyaml/Config.in                   |  9 +++++
>  package/lua-lyaml/lua-lyaml.hash              |  3 ++
>  package/lua-lyaml/lua-lyaml.mk                | 33 +++++++++++++++++++
>  .../testing/tests/package/test_lua_lyaml.py   | 27 +++++++++++++++
>  6 files changed, 75 insertions(+)
>  create mode 100644 package/lua-lyaml/Config.in
>  create mode 100644 package/lua-lyaml/lua-lyaml.hash
>  create mode 100644 package/lua-lyaml/lua-lyaml.mk
>  create mode 100644 support/testing/tests/package/test_lua_lyaml.py
>
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 5d42d2a60..2abb1a3b9 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -381,6 +381,8 @@ tests.package.test_lua_curl.TestLuaLuacURL: { extends:
> .runtime_test }
>  tests.package.test_lua_curl.TestLuajitLuacURL: { extends: .runtime_test }
>  tests.package.test_lua_http.TestLuaHttp: { extends: .runtime_test }
>  tests.package.test_lua_http.TestLuajitHttp: { extends: .runtime_test }
> +tests.package.test_lua_lyaml.TestLuaLuaLyaml: { extends: .runtime_test }
> +tests.package.test_lua_lyaml.TestLuajitLuaLyaml: { extends: .runtime_test
> }
>  tests.package.test_lua_utf8.TestLuaUtf8: { extends: .runtime_test }
>  tests.package.test_lua_utf8.TestLuajitUtf8: { extends: .runtime_test }
>  tests.package.test_luaexpat.TestLuaLuaExpat: { extends: .runtime_test }
> diff --git a/package/Config.in b/package/Config.in
> index 710ed12be..d9ed0b601 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -630,6 +630,7 @@ menu "Lua libraries/modules"
>         source "package/lua-iconv/Config.in"
>         source "package/lua-lpeg-patterns/Config.in"
>         source "package/lua-lunitx/Config.in"
> +       source "package/lua-lyaml/Config.in"
>         source "package/lua-markdown/Config.in"
>         source "package/lua-messagepack/Config.in"
>         source "package/lua-msgpack-native/Config.in"
> diff --git a/package/lua-lyaml/Config.in b/package/lua-lyaml/Config.in
> new file mode 100644
> index 000000000..ef2d3823d
> --- /dev/null
> +++ b/package/lua-lyaml/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_LUA_LYAML
> +       bool "lua-lyaml"
> +       select BR2_PACKAGE_LIBYAML
> +       help
> +         This is a Lua binding for the fast libYAML C library for
> +         converting between `%YAML 1.1` and Lua tables, with a
> +         flexible Lua language API to load and save YAML documents.
> +
> +         http://github.com/gvvaughan/lyaml
> diff --git a/package/lua-lyaml/lua-lyaml.hash
> b/package/lua-lyaml/lua-lyaml.hash
> new file mode 100644
> index 000000000..dd1978385
> --- /dev/null
> +++ b/package/lua-lyaml/lua-lyaml.hash
> @@ -0,0 +1,3 @@
> +# locally computed
> +sha256 f4015ba47a389fc4fe0656cbcb8a216239275ec53309a0df79b0733c843e7bba
> lua-lyaml-6.2.4.tar.gz
> +sha256 c7ec2f52d258088437cddeeee38cfc97d60d464c8801aa77decefb993400ec6e
> LICENSE
> diff --git a/package/lua-lyaml/lua-lyaml.mk b/package/lua-lyaml/
> lua-lyaml.mk
> new file mode 100644
> index 000000000..c88a438d5
> --- /dev/null
> +++ b/package/lua-lyaml/lua-lyaml.mk
> @@ -0,0 +1,33 @@
>
> +################################################################################
> +#
> +# lua-lyaml
> +#
>
> +################################################################################
> +
> +LUA_LYAML_VERSION = 6.2.4
> +LUA_LYAML_NAME_UPSTREAM = lyaml
> +LUA_LYAML_SITE = $(call
> github,gvvaughan,$(LUA_LYAML_NAME_UPSTREAM),v$(LUA_LYAML_VERSION))
> +LUA_LYAML_LICENSE = MIT
> +LUA_LYAML_LICENSE_FILES = LICENSE
> +LUA_LYAML_DEPENDENCIES = libyaml luainterpreter host-lua
> +
> +define LUA_LYAML_BUILD_CMDS
> +       (cd $(@D); \
> +               $(LUA_RUN) build-aux/luke \
> +               version="'$(LUA_LYAML_VERSION)'" \
> +               CC="$(TARGET_CC)" \
> +               CFLAGS="$(TARGET_CFLAGS)" \
> +               LUA_INCDIR=$(STAGING_DIR)/usr/include \
> +               YAML_DIR=$(STAGING_DIR)/usr \
> +       )
> +endef
> +
> +define LUA_LYAML_INSTALL_TARGET_CMDS
> +       (cd $(@D); \
> +               $(LUA_RUN) build-aux/luke install \
> +
>  INST_LIBDIR="$(TARGET_DIR)/usr/lib/lua/$(LUAINTERPRETER_ABIVER)" \
> +
>  INST_LUADIR="$(TARGET_DIR)/usr/share/lua/$(LUAINTERPRETER_ABIVER)" \
> +       )
> +endef
> +
> +$(eval $(generic-package))
> diff --git a/support/testing/tests/package/test_lua_lyaml.py
> b/support/testing/tests/package/test_lua_lyaml.py
> new file mode 100644
> index 000000000..ece3c675a
> --- /dev/null
> +++ b/support/testing/tests/package/test_lua_lyaml.py
> @@ -0,0 +1,27 @@
> +from tests.package.test_lua import TestLuaBase
> +
> +
> +class TestLuaLuaLyaml(TestLuaBase):
> +    config = TestLuaBase.config + \
> +        """
> +        BR2_PACKAGE_LUA=y
> +        BR2_PACKAGE_LUA_LYAML=y
> +        """
> +
> +    def test_run(self):
> +        self.login()
> +        self.module_test("yaml")
> +        self.module_test("lyaml")
> +
> +
> +class TestLuajitLuaLyaml(TestLuaBase):
> +    config = TestLuaBase.config + \
> +        """
> +        BR2_PACKAGE_LUAJIT=y
> +        BR2_PACKAGE_LUA_LYAML=y
> +        """
> +
> +    def test_run(self):
> +        self.login()
> +        self.module_test("yaml")
> +        self.module_test("lyaml")
> --
> 2.20.1
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20191208/b7b559c7/attachment.html>
