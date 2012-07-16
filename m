From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 Jul 2012 17:39:58 +0200
Subject: [Buildroot] [PATCH 1/5] lua : fix autobuild.buildroot
In-Reply-To: <1342446352-31231-1-git-send-email-francois.perrad@gadz.org>
References: <1342446352-31231-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <20120716173958.39ab39b3@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 16 Jul 2012 15:45:48 +0200,
Francois Perrad <fperrad@gmail.com> a ?crit :

> BR2_PACKAGE_LUA_SHARED_LIBRARY is an option for install, not for build
> ---
>  package/lua/lua.mk |    5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/package/lua/lua.mk b/package/lua/lua.mk
> index baa459c..2fc838b 100644
> --- a/package/lua/lua.mk
> +++ b/package/lua/lua.mk
> @@ -8,10 +8,7 @@ LUA_VERSION = 5.1.5
>  LUA_SITE = http://www.lua.org/ftp
>  LUA_INSTALL_STAGING = YES
>  
> -ifeq ($(BR2_PACKAGE_LUA_SHARED_LIBRARY),y)
> -	LUA_MYCFLAGS += -fPIC
> -endif
> -
> +LUA_MYCFLAGS += -fPIC
>  LUA_MYLIBS += -ldl
>  
>  ifeq ($(BR2_PACKAGE_LUA_INTERPRETER_READLINE),y)

If Lua is not build as a shared library, there is no point in building
the object files with the -fPIC argument, so the existing code seems to
make sense to me. The BR2_PACKAGE_LUA_SHARED_LIBRARY affects both the
build time (we don't build with -fPIC) and the install time (we install
the shared libraries).

But I'm confused: during the Libre Software Meeting, didn't we discussed
that the BR2_PACKAGE_LUA_SHARED_LIBRARY option should go away, and that
the BR2_PACKAGE_LUA option should unconditionally install the shared
libraries, and then there would be sub-options for the interpreter and
compiler?

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
