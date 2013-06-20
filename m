From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 20 Jun 2013 07:57:57 +0200
Subject: [Buildroot] [PATCH 09/12] luaposix: New package
In-Reply-To: <CADwac6CSHFb=EGawg0x-QPhWpPoeZXtmzN9XtX-u23zittoCqQ@mail.gmail.com>
References: <1369054604-26139-1-git-send-email-shmuelzon@gmail.com>
 <1369054604-26139-9-git-send-email-shmuelzon@gmail.com>
 <877ghppyyf.fsf@dell.be.48ers.dk>
 <CADwac6CSHFb=EGawg0x-QPhWpPoeZXtmzN9XtX-u23zittoCqQ@mail.gmail.com>
Message-ID: <51C299E5.4020009@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20/06/13 06:45, Assaf Inbal wrote:
[snip]
> diff --git a/package/luaposix/luaposix-remove-lua-header-check.patch b/package/luaposix/luaposix-remove-lua-header-check.patch
> new file mode 100644
> index 0000000..7909b91
> --- /dev/null
> +++ b/package/luaposix/luaposix-remove-lua-header-check.patch
> @@ -0,0 +1,16 @@
> +Checking the Lua version inside the headers requires compiling a small
> +C program. However, autoconf will raise an error when attempting to do so
> +while cross-compiling. Hence, this specific test is removed.
> +
> +Signed-off-by: Assaf Inbal<shmuelzon@gmail.com>
> +--- a/configure.ac	2013-06-20 07:23:27.943091833 +0300
> ++++ b/configure.ac	2013-06-20 07:23:30.644441710 +0300
> +@@ -105,7 +105,7 @@
> +
> + dnl Lua 5.1 or 5.2
> + AX_PROG_LUA(501, 503)
> + AX_LUA_HEADERS
> +-AX_LUA_HEADERS_VERSION(501, 503)
> ++#AX_LUA_HEADERS_VERSION(501, 503)
> + AC_SUBST(LUA)
> + AC_SUBST(LUA_INCLUDE)
> diff --git a/package/luaposix/luaposix.mk b/package/luaposix/luaposix.mk
> new file mode 100644
> index 0000000..84570e6
> --- /dev/null
> +++ b/package/luaposix/luaposix.mk
> @@ -0,0 +1,18 @@
> +################################################################################
> +#
> +# luaposix
> +#
> +################################################################################
> +
> +LUAPOSIX_VERSION = 5.1.20
> +LUAPOSIX_SITE =https://github.com/downloads/luaposix/luaposix
> +LUAPOSIX_LICENSE = MIT
> +LUAPOSIX_LICENSE_FILES = COPYING
> +LUAPOSIX_DEPENDENCIES = lua host-lua
> +# Luaposix attempts to run Lua as a part of the configure proccess, it needs to
> +# find the location of liblua.so in order for the binary to execute

  Actually, then host-lua should be fixed to use an rpath. I'm surprised 
it doesn't, because what's the point of having host-lua when you can't 
execute it?


  Regards,
  Arnout

> +LUAPOSIX_CONF_ENV = LD_LIBRARY_PATH="$(HOST_DIR)/usr/lib"
> +LUAPOSIX_CONF_OPT = --libdir="/usr/lib/lua" --datarootdir="/usr/share/lua"
> +LUAPOSIX_AUTORECONF = YES
> +
> +$(eval $(autotools-package))
> -- 1.7.9.5


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
