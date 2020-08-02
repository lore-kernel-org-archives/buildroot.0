From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 2 Aug 2020 22:30:59 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/waffle: bump version to 1.6.1
In-Reply-To: <20200802112106.956286-1-bernd.kuhls@t-online.de>
References: <20200802112106.956286-1-bernd.kuhls@t-online.de>
Message-ID: <f0c73d76-5f58-a0e7-2d50-abaeb74c1ff1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernd,

Le 02/08/2020 ? 13:21, Bernd Kuhls a ?crit?:
> Release notes for v1.6.1:
> https://lists.freedesktop.org/archives/mesa-announce/2020-March/000575.html
> 
> Reformatted hashes, removed patch 0001 which was applied upstream.
> 
> Switched _SITE to gitlab according to release notes for v1.6.0:
> https://lists.freedesktop.org/archives/mesa-announce/2019-June/000520.html
> 
> Added -Dwaffle_has_nacl=OFF to CONF_OPTS to disable nacl support, this
> avoids adding a dependency to C++ as src/waffle/nacl/nacl_container.cpp
> is the only C++ file relevant for linux contained in the source code:
> https://gitlab.freedesktop.org/mesa/waffle/-/commit/6ca943584e593aec2bd4f9c66d91859e63e02d61#9a2aa4db38d3115ed60da621e012c0efc0172aae_27_26
> 
> Added support for mesa3d surfaceless egl:
> https://gitlab.freedesktop.org/mesa/waffle/commit/7318f22c4761035c03e99420edf3e92f07e06c9c
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Reviewed-by: Romain Naour <romain.naour@gmail.com>

Since v1.6.0, waffle provide bash-completion scripts, we could add
bash-completion package in waffle dependencies if enabled:

https://gitlab.freedesktop.org/mesa/waffle/-/blob/maint-1.6/CMakeLists.txt#L189

Best regards,
Romain


> ---
> v2: bump to v1.6.1
>     disabled nacl support (Romain)
>     added support for mesa3d surfaceless egl (Romain)
> 
>  ...ags-from-.pc-files-to-waffle-cflags.patch} |  0
>  ...ads-Use-PTHREAD_MUTEX_RECURSIVE-by-d.patch | 54 -------------------
>  package/waffle/waffle.hash                    |  4 +-
>  package/waffle/waffle.mk                      | 15 ++++--
>  4 files changed, 14 insertions(+), 59 deletions(-)
>  rename package/waffle/{0002-cmake-forward-cflags-from-.pc-files-to-waffle-cflags.patch => 0001-cmake-forward-cflags-from-.pc-files-to-waffle-cflags.patch} (100%)
>  delete mode 100644 package/waffle/0001-third_party-threads-Use-PTHREAD_MUTEX_RECURSIVE-by-d.patch
> 
> diff --git a/package/waffle/0002-cmake-forward-cflags-from-.pc-files-to-waffle-cflags.patch b/package/waffle/0001-cmake-forward-cflags-from-.pc-files-to-waffle-cflags.patch
> similarity index 100%
> rename from package/waffle/0002-cmake-forward-cflags-from-.pc-files-to-waffle-cflags.patch
> rename to package/waffle/0001-cmake-forward-cflags-from-.pc-files-to-waffle-cflags.patch
> diff --git a/package/waffle/0001-third_party-threads-Use-PTHREAD_MUTEX_RECURSIVE-by-d.patch b/package/waffle/0001-third_party-threads-Use-PTHREAD_MUTEX_RECURSIVE-by-d.patch
> deleted file mode 100644
> index ef54953e34..0000000000
> --- a/package/waffle/0001-third_party-threads-Use-PTHREAD_MUTEX_RECURSIVE-by-d.patch
> +++ /dev/null
> @@ -1,54 +0,0 @@
> -From 117456752cf9ac1f24d3cfd917ad34f670c244b8 Mon Sep 17 00:00:00 2001
> -From: Emil Velikov <emil.l.velikov@gmail.com>
> -Date: Thu, 19 Mar 2015 22:26:11 +0000
> -Subject: [PATCH] third_party/threads: Use PTHREAD_MUTEX_RECURSIVE by default
> -
> -PTHREAD_MUTEX_RECURSIVE_NP was used for compatibility with old glibc.
> -Although due to the_GNU_SOURCES define the portable,
> -PTHREAD_MUTEX_RECURSIVE will be available for Linuxes since at least
> -1998. Simplify things giving us compatibility with musl which
> -apparently does not provide the non-portable define.
> -
> -Inspired by almost identical commit in mesa aead7fe2e2b(c11/threads: Use
> -PTHREAD_MUTEX_RECURSIVE by default) by Felix Janda.
> -
> -Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
> -Reviewed-by: Chad Versace <chad.versace@intel.com>
> -(Romain: cherry picked from commit 3b9b8f5f6d1b99af43e95ec0868404e552a85b73)
> -Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ----
> - third_party/threads/threads_posix.c | 10 ++++------
> - 1 file changed, 4 insertions(+), 6 deletions(-)
> -
> -diff --git a/third_party/threads/threads_posix.c b/third_party/threads/threads_posix.c
> -index 5835e43..e122bf9 100644
> ---- a/third_party/threads/threads_posix.c
> -+++ b/third_party/threads/threads_posix.c
> -@@ -26,6 +26,9 @@
> -  * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
> -  * DEALINGS IN THE SOFTWARE.
> -  */
> -+
> -+#define _GNU_SOURCE
> -+
> - #include <stdlib.h>
> - #ifndef assert
> - #include <assert.h>
> -@@ -150,13 +153,8 @@ int mtx_init(mtx_t *mtx, int type)
> -       && type != (mtx_try|mtx_recursive))
> -         return thrd_error;
> -     pthread_mutexattr_init(&attr);
> --    if ((type & mtx_recursive) != 0) {
> --#if defined(__linux__) || defined(__linux)
> --        pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_RECURSIVE_NP);
> --#else
> -+    if ((type & mtx_recursive) != 0)
> -         pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_RECURSIVE);
> --#endif
> --    }
> -     pthread_mutex_init(mtx, &attr);
> -     pthread_mutexattr_destroy(&attr);
> -     return thrd_success;
> --- 
> -2.14.3
> -
> diff --git a/package/waffle/waffle.hash b/package/waffle/waffle.hash
> index f496927e32..84821312c1 100644
> --- a/package/waffle/waffle.hash
> +++ b/package/waffle/waffle.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256 d662f6743f688dc5ea4b7d29f558eb54bd8f57350080f04a006693d22e5d1d5b  waffle-1.5.2.tar.gz
> -sha256 630844d1911c8a1b7b888a1de9097c4860b7e381362fd5aa64141d58ab7ecc9b  LICENSE.txt
> +sha256  234e65bdd2dd8f7d3bc8e9ad1a7cc80fce78a1deed3a04fe7f1d2c2edac0cd8a  waffle-v1.6.1.tar.bz2
> +sha256  630844d1911c8a1b7b888a1de9097c4860b7e381362fd5aa64141d58ab7ecc9b  LICENSE.txt
> diff --git a/package/waffle/waffle.mk b/package/waffle/waffle.mk
> index 280e295cb3..3b28bb2998 100644
> --- a/package/waffle/waffle.mk
> +++ b/package/waffle/waffle.mk
> @@ -4,8 +4,9 @@
>  #
>  ################################################################################
>  
> -WAFFLE_VERSION = 1.5.2
> -WAFFLE_SITE = $(call github,waffle-gl,waffle,v$(WAFFLE_VERSION))
> +WAFFLE_VERSION = 1.6.1
> +WAFFLE_SOURCE = waffle-v$(WAFFLE_VERSION).tar.bz2
> +WAFFLE_SITE = https://gitlab.freedesktop.org/mesa/waffle/-/archive/v$(WAFFLE_VERSION)
>  WAFFLE_INSTALL_STAGING = YES
>  WAFFLE_LICENSE = BSD-2-Clause
>  WAFFLE_LICENSE_FILES = LICENSE.txt
> @@ -15,7 +16,8 @@ WAFFLE_DEPENDENCIES = host-pkgconf
>  WAFFLE_CONF_OPTS = -Dwaffle_build_tests=OFF \
>  	-Dwaffle_build_examples=OFF \
>  	-Dwaffle_build_manpages=OFF \
> -	-Dwaffle_build_htmldocs=OFF
> +	-Dwaffle_build_htmldocs=OFF \
> +	-Dwaffle_has_nacl=OFF
>  
>  ifeq ($(BR2_PACKAGE_WAFFLE_SUPPORTS_WAYLAND),y)
>  WAFFLE_DEPENDENCIES += libegl wayland
> @@ -45,4 +47,11 @@ else
>  WAFFLE_CONF_OPTS += -Dwaffle_has_gbm=OFF
>  endif
>  
> +ifeq ($(BR2_PACKAGE_MESA3D)$(BR2_PACKAGE_MESA3D_OPENGL_EGL),yy)
> +WAFFLE_DEPENDENCIES += mesa3d
> +WAFFLE_CONF_OPTS += -Dwaffle_has_surfaceless_egl=ON
> +else
> +WAFFLE_CONF_OPTS += -Dwaffle_has_surfaceless_egl=OFF
> +endif
> +
>  $(eval $(cmake-package))
> 
