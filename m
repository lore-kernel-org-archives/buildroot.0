From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 10 Apr 2019 12:13:47 +0200
Subject: [Buildroot] [PATCH 2/2] package/libglib2: bump to version 2.60.0
In-Reply-To: <20190409175919.25833-2-aduskett@gmail.com>
References: <20190409175919.25833-1-aduskett@gmail.com>
 <20190409175919.25833-2-aduskett@gmail.com>
Message-ID: <3b47551f-d3e0-f36a-8933-72d40aebfedc@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Adam,

On 09/04/2019 19:59, aduskett at gmail.com wrote:
> From: Adam Duskett <Aduskett@gmail.com>
> 
> Changes include:
>   - Moving to the meson build system, as autoconf is no longer supported.
>   - Add 0002-Add-bool-option-for-tests.patch to allow disabling building tests.
>   - Add 0003-make-cpp-optional.patch because c++ is not needed.
>   - Add 0005-Add-Wno-format-nonliteral-to-compiler-arguments.patch to prevent
>     a false error when compiling against older gcc versions.
>     (https://gitlab.gnome.org/GNOME/glib/issues/1744)

 What is the upstream status of patch 0001?

 Is patch 0004 still needed? I would expect this to have changed with meson.

 Not very important, but it would make sense to renumber the patches so that the
older ones are first, i.e. 0004 -> 0002.

[snip]
> +From ee5ed1385bd6c36123ff970a8fff89a811798421 Mon Sep 17 00:00:00 2001
> +From: Adam Duskett <Aduskett@gmail.com>
> +Date: Tue, 9 Apr 2019 12:59:36 -0400
> +Subject: [PATCH] make cpp optional
> +
> +C++ isn't actually necessary to build libglib2. The fuzzing folder only has
> +c files in it, and there is only a single test that is written in c++.
> +
> +Check if a C++ compiler exists, and if it does, then add the cxx-test.cpp file
> +to tests/meson.build.
> +
> +Also change cxx.find_library to cc.find_library in fuzzing/meson.build
> +
> +Signed-off-by: Adam Duskett <Aduskett@gmail.com>

 Did you send this one upstream? If not, why not?

[snip]
> diff --git a/package/libglib2/0005-Add-Wno-format-nonliteral-to-compiler-arguments.patch b/package/libglib2/0005-Add-Wno-format-nonliteral-to-compiler-arguments.patch
> new file mode 100644
> index 0000000000..ca81b5263a
> --- /dev/null
> +++ b/package/libglib2/0005-Add-Wno-format-nonliteral-to-compiler-arguments.patch
> @@ -0,0 +1,28 @@
> +From 9e0f11a4981737f98bac93a22b6f2ff1a3887b63 Mon Sep 17 00:00:00 2001
> +From: Adam Duskett <Aduskett@gmail.com>
> +Date: Tue, 9 Apr 2019 13:03:51 -0400
> +Subject: [PATCH] Add '-Wno-format-nonliteral' to compiler arguments.
> +
> +This warning is a false positive on older versions of gcc.
> +See https://gitlab.gnome.org/GNOME/glib/issues/1744 for more details.
> +
> +Signed-off-by: Adam Duskett <Aduskett@gmail.com>

 So what's the upstream status of this one?

> +---
> + meson.build | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/meson.build b/meson.build
> +index 3c615b7..7cae4e8 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -363,6 +363,7 @@ if cc.get_id() == 'gcc' or cc.get_id() == 'clang'
> +     '-Wno-cast-function-type',
> +     # Due to function casts through (void*) we cannot support -Wpedantic:
> +     # https://wiki.gnome.org/Projects/GLib/CompilerRequirements#Function_pointer_conversions.
> ++    '-Wno-format-nonliteral',

 Small nit: this should go before the comment just above it.

> +     '-Wno-pedantic',
> +     '-Werror=declaration-after-statement',
> +     '-Werror=format=2',
> +-- 
> +2.20.1
> +
[snip]
>  ifeq ($(BR2_PACKAGE_ELFUTILS),y)
> -LIBGLIB2_CONF_OPTS += --enable-libelf
>  LIBGLIB2_DEPENDENCIES += elfutils
> -else
> -LIBGLIB2_CONF_OPTS += --disable-libelf

 So there is no longer a way to turn this off explicitly? That's unfortunate...


 But basically looks good to me. Well, I didn't look into the details of all the
patches.

 Regards,
 Arnout

>  endif
>  
>  ifeq ($(BR2_PACKAGE_LIBICONV),y)
> -LIBGLIB2_CONF_OPTS += --with-libiconv=gnu
> +LIBGLIB2_CONF_OPTS += -Diconv=gnu
>  LIBGLIB2_DEPENDENCIES += libiconv
>  endif
>  
>  ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
> -LIBGLIB2_CONF_OPTS += --enable-selinux
> +LIBGLIB2_CONF_OPTS += -Dselinux=enabled
>  LIBGLIB2_DEPENDENCIES += libselinux
>  else
> -LIBGLIB2_CONF_OPTS += --disable-selinux
> +LIBGLIB2_CONF_OPTS += -Dselinux=disabled
>  endif
>  
>  # Purge gdb-related files
> @@ -181,7 +109,7 @@ endef
>  LIBGLIB2_TARGET_FINALIZE_HOOKS += LIBGLIB2_REMOVE_TARGET_SCHEMAS
>  LIBGLIB2_TARGET_FINALIZE_HOOKS += LIBGLIB2_COMPILE_SCHEMAS
>  
> -$(eval $(autotools-package))
> -$(eval $(host-autotools-package))
> +$(eval $(meson-package))
> +$(eval $(host-meson-package))
>  
>  LIBGLIB2_HOST_BINARY = $(HOST_DIR)/bin/glib-genmarshal
> 
