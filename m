From: =?ISO-8859-1?Q?Fran=E7ois_Perrad?= <francois.perrad@gadz.org>
Date: Mon, 20 May 2013 18:09:49 +0200
Subject: [Buildroot] [PATCH 09/12] luaposix: New package
In-Reply-To: <1369054604-26139-9-git-send-email-shmuelzon@gmail.com>
References: <1369054604-26139-1-git-send-email-shmuelzon@gmail.com>
 <1369054604-26139-9-git-send-email-shmuelzon@gmail.com>
Message-ID: <CAB0FRsv0eAX-fgTSkvj=nvyPM0jp-L_g59qyz2dX_farjE=8mw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2013/5/20 Assaf Inbal <shmuelzon@gmail.com>

> Luaposix is a Lua frontend to posix functions.
>
> Signed-off-by: Assaf Inbal <shmuelzon@gmail.com>
> ---
>  package/Config.in                                         |  1 +
>  package/luaposix/Config.in                                | 10 ++++++++++
>  .../luaposix/luaposix-remove-cross-compile-check.patch    | 13
> +++++++++++++
>  package/luaposix/luaposix.mk                              | 15
> +++++++++++++++
>  4 files changed, 39 insertions(+)
>  create mode 100644 package/luaposix/Config.in
>  create mode 100644
> package/luaposix/luaposix-remove-cross-compile-check.patch
>  create mode 100644 package/luaposix/luaposix.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 3351f21..9c615b5 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -314,6 +314,7 @@ source "package/luacrypto/Config.in"
>  source "package/luaexpat/Config.in"
>  source "package/luaexpatutils/Config.in"
>  source "package/luafilesystem/Config.in"
> +source "package/luaposix/Config.in"
>  source "package/luasocket/Config.in"
>  source "package/lua-ev/Config.in"
>  source "package/lua-msgpack-native/Config.in"
> diff --git a/package/luaposix/Config.in b/package/luaposix/Config.in
> new file mode 100644
> index 0000000..a4bad8d
> --- /dev/null
> +++ b/package/luaposix/Config.in
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_LUAPOSIX
> +       bool "luaposix"
> +       help
> +         luaposix is a POSIX binding, including curses, for Lua 5.1 and
> 5.2;
> +         Like most libraries it simply binds to C APIs on the underlying
> +         system, so it won't work on a non-POSIX system. However, it does
> try
> +         to detect the level of POSIX conformance of the underlying
> system and
> +         bind only available APIs
> +
> +         https://github.com/rrthomas/luaposix
> diff --git a/package/luaposix/luaposix-remove-cross-compile-check.patch
> b/package/luaposix/luaposix-remove-cross-compile-check.patch
> new file mode 100644
> index 0000000..37dc2db
> --- /dev/null
> +++ b/package/luaposix/luaposix-remove-cross-compile-check.patch
> @@ -0,0 +1,13 @@
> +--- a/configure        2012-06-05 21:50:55.000000000 +0300
> ++++ b/configure        2012-07-16 14:41:15.000000000 +0300
> +@@ -14654,10 +14654,6 @@
> +   LUA_OLD_CPPFLAGS="$CPPFLAGS"
> +   CPPFLAGS="$CPPFLAGS $LUA_INCLUDE"
> +   if test "$cross_compiling" = yes; then :
> +-  { { $as_echo "$as_me:${as_lineno-$LINENO}: error: in \`$ac_pwd':" >&5
> +-$as_echo "$as_me: error: in \`$ac_pwd':" >&2;}
> +-as_fn_error $? "cannot run test program while cross compiling
> +-See \`config.log' for more details" "$LINENO" 5; }
> + else
> +   cat confdefs.h - <<_ACEOF >conftest.$ac_ext
> + /* end confdefs.h.  */
> diff --git a/package/luaposix/luaposix.mk b/package/luaposix/luaposix.mk
> new file mode 100644
> index 0000000..db55df0
> --- /dev/null
> +++ b/package/luaposix/luaposix.mk
> @@ -0,0 +1,15 @@
> +#############################################################
> +#
> +# luaposix
> +#
> +#############################################################
> +
> +LUAPOSIX_VERSION = 5.1.20
> +LUAPOSIX_SITE = https://github.com/downloads/luaposix/luaposix
> +LUAPOSIX_LICENSE = MIT
> +LUAPOSIX_LICENSE_FILES = COPYRIGHT
> +LUAPOSIX_DEPENDENCIES = lua host-lua luabitop
>

luabitop is not a built dependency.

Fran?ois


> +LUAPOSIX_CONF_ENV = LD_LIBRARY_PATH="$(HOST_DIR)/usr/lib"
> +LUAPOSIX_CONF_OPT = --libdir="/usr/lib/lua" --datarootdir="/usr/share/lua"
> +
> +$(eval $(autotools-package))
> --
> 1.8.1.2
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130520/625948c4/attachment.html>
