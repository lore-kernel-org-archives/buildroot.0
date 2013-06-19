From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 19 Jun 2013 23:34:00 +0200
Subject: [Buildroot] [PATCH 09/12] luaposix: New package
In-Reply-To: <1369054604-26139-9-git-send-email-shmuelzon@gmail.com> (Assaf
 Inbal's message of "Mon, 20 May 2013 15:56:41 +0300")
References: <1369054604-26139-1-git-send-email-shmuelzon@gmail.com>
 <1369054604-26139-9-git-send-email-shmuelzon@gmail.com>
Message-ID: <877ghppyyf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Assaf" == Assaf Inbal <shmuelzon@gmail.com> writes:

 Assaf> Luaposix is a Lua frontend to posix functions.
 Assaf> Signed-off-by: Assaf Inbal <shmuelzon@gmail.com>
 Assaf> ---
 Assaf>  package/Config.in                                         |  1 +
 Assaf>  package/luaposix/Config.in                                | 10 ++++++++++
 Assaf>  .../luaposix/luaposix-remove-cross-compile-check.patch    | 13 +++++++++++++
 Assaf>  package/luaposix/luaposix.mk                              | 15 +++++++++++++++
 Assaf>  4 files changed, 39 insertions(+)
 Assaf>  create mode 100644 package/luaposix/Config.in
 Assaf>  create mode 100644 package/luaposix/luaposix-remove-cross-compile-check.patch
 Assaf>  create mode 100644 package/luaposix/luaposix.mk

 Assaf> diff --git a/package/Config.in b/package/Config.in
 Assaf> index 3351f21..9c615b5 100644
 Assaf> --- a/package/Config.in
 Assaf> +++ b/package/Config.in
 Assaf> @@ -314,6 +314,7 @@ source "package/luacrypto/Config.in"
 Assaf>  source "package/luaexpat/Config.in"
 Assaf>  source "package/luaexpatutils/Config.in"
 Assaf>  source "package/luafilesystem/Config.in"
 Assaf> +source "package/luaposix/Config.in"
 Assaf>  source "package/luasocket/Config.in"
 Assaf>  source "package/lua-ev/Config.in"
 Assaf>  source "package/lua-msgpack-native/Config.in"
 Assaf> diff --git a/package/luaposix/Config.in b/package/luaposix/Config.in
 Assaf> new file mode 100644
 Assaf> index 0000000..a4bad8d
 Assaf> --- /dev/null
 Assaf> +++ b/package/luaposix/Config.in
 Assaf> @@ -0,0 +1,10 @@
 Assaf> +config BR2_PACKAGE_LUAPOSIX
 Assaf> +	bool "luaposix"
 Assaf> +	help
 Assaf> +	  luaposix is a POSIX binding, including curses, for Lua 5.1 and 5.2;
 Assaf> +	  Like most libraries it simply binds to C APIs on the underlying
 Assaf> +	  system, so it won't work on a non-POSIX system. However, it does try
 Assaf> +	  to detect the level of POSIX conformance of the underlying system and
 Assaf> +	  bind only available APIs
 Assaf> +
 Assaf> +	  https://github.com/rrthomas/luaposix
 Assaf> diff --git a/package/luaposix/luaposix-remove-cross-compile-check.patch b/package/luaposix/luaposix-remove-cross-compile-check.patch
 Assaf> new file mode 100644
 Assaf> index 0000000..37dc2db
 Assaf> --- /dev/null
 Assaf> +++ b/package/luaposix/luaposix-remove-cross-compile-check.patch
 Assaf> @@ -0,0 +1,13 @@

Description and signed-off-by missing. configure is a generated file,
you should normally fixup configure.ac and set LUAPOSIX_AUTORECONF = YES
to regenerate it instead.


 Assaf> +--- a/configure	2012-06-05 21:50:55.000000000 +0300
 Assaf> ++++ b/configure	2012-07-16 14:41:15.000000000 +0300
 Assaf> +@@ -14654,10 +14654,6 @@
 Assaf> +   LUA_OLD_CPPFLAGS="$CPPFLAGS"
 Assaf> +   CPPFLAGS="$CPPFLAGS $LUA_INCLUDE"
 Assaf> +   if test "$cross_compiling" = yes; then :
 Assaf> +-  { { $as_echo "$as_me:${as_lineno-$LINENO}: error: in \`$ac_pwd':" >&5
 Assaf> +-$as_echo "$as_me: error: in \`$ac_pwd':" >&2;}
 Assaf> +-as_fn_error $? "cannot run test program while cross compiling
 Assaf> +-See \`config.log' for more details" "$LINENO" 5; }
 Assaf> + else
 Assaf> +   cat confdefs.h - <<_ACEOF >conftest.$ac_ext
 Assaf> + /* end confdefs.h.  */
 Assaf> diff --git a/package/luaposix/luaposix.mk b/package/luaposix/luaposix.mk
 Assaf> new file mode 100644
 Assaf> index 0000000..db55df0
 Assaf> --- /dev/null
 Assaf> +++ b/package/luaposix/luaposix.mk
 Assaf> @@ -0,0 +1,15 @@
 Assaf> +#############################################################
 Assaf> +#
 Assaf> +# luaposix
 Assaf> +#
 Assaf> +#############################################################

The ###### file headers should be 80 chars.

 Assaf> +
 Assaf> +LUAPOSIX_VERSION = 5.1.20
 Assaf> +LUAPOSIX_SITE = https://github.com/downloads/luaposix/luaposix
 Assaf> +LUAPOSIX_LICENSE = MIT
 Assaf> +LUAPOSIX_LICENSE_FILES = COPYRIGHT

I think you mean COPYING here.

 Assaf> +LUAPOSIX_DEPENDENCIES = lua host-lua luabitop


luabitop should go as Fran?ois mentioned.

 Assaf> +LUAPOSIX_CONF_ENV = LD_LIBRARY_PATH="$(HOST_DIR)/usr/lib"

Please explain why this is needed with a comment.

 Assaf> +LUAPOSIX_CONF_OPT = --libdir="/usr/lib/lua" --datarootdir="/usr/share/lua"
 Assaf> +
 Assaf> +$(eval $(autotools-package))

Care to resend with these issues fixed? Thanks.

-- 
Bye, Peter Korsgaard
