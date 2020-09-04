From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 4 Sep 2020 23:58:46 +0200
Subject: [Buildroot] [PATCH 1/1] package/weston: bump to version 9.0.0
In-Reply-To: <20200904192329.1819802-1-james.hilliard1@gmail.com>
References: <20200904192329.1819802-1-james.hilliard1@gmail.com>
Message-ID: <20200904215846.GR14354@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

James, All,

On 2020-09-04 13:23 -0600, James Hilliard spake thusly:
> Drop patches that are now upstream.
> 
> Pipewire now requires renderer-gl, only enable pipewire when
> renderer-gl is also enabled.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...include-sys-mman.h-in-os-compatibili.patch | 39 -----------
>  ...-the-seal-logic-behind-HAVE_MEMFD_CR.patch | 67 -------------------
>  package/weston/weston.hash                    | 10 +--
>  package/weston/weston.mk                      | 18 ++---
>  4 files changed, 14 insertions(+), 120 deletions(-)
>  delete mode 100644 package/weston/0001-unconditionally-include-sys-mman.h-in-os-compatibili.patch
>  delete mode 100644 package/weston/0002-shared-guard-all-the-seal-logic-behind-HAVE_MEMFD_CR.patch
> 
> diff --git a/package/weston/0001-unconditionally-include-sys-mman.h-in-os-compatibili.patch b/package/weston/0001-unconditionally-include-sys-mman.h-in-os-compatibili.patch
> deleted file mode 100644
> index 33b1353fba..0000000000
> --- a/package/weston/0001-unconditionally-include-sys-mman.h-in-os-compatibili.patch
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -From 7b36f171d09354a2d3a48db0ae2d34d66aa4f1ae Mon Sep 17 00:00:00 2001
> -From: James Hilliard <james.hilliard1@gmail.com>
> -Date: Sat, 1 Feb 2020 20:02:29 -0700
> -Subject: [PATCH] unconditionally include sys/mman.h in os-compatibility.c
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=UTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -Fixes:
> -../shared/os-compatibility.c:273:25: error: ?PROT_READ? undeclared (first use in this function); did you mean ?LOCK_READ??
> -  map = mmap(NULL, size, PROT_READ | PROT_WRITE, MAP_SHARED, file->fd, 0);
> -                         ^~~~~~~~~
> -                         LOCK_READ
> -
> -Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> -[james.hilliard1 at gmail.com: backport from upstream commit
> -7b36f171d09354a2d3a48db0ae2d34d66aa4f1ae]
> ----
> - shared/os-compatibility.c | 3 ---
> - 1 file changed, 3 deletions(-)
> -
> -diff --git a/shared/os-compatibility.c b/shared/os-compatibility.c
> -index 5e1ce479..041c929f 100644
> ---- a/shared/os-compatibility.c
> -+++ b/shared/os-compatibility.c
> -@@ -34,10 +34,7 @@
> - #include <string.h>
> - #include <stdlib.h>
> - #include <libweston/zalloc.h>
> --
> --#ifdef HAVE_MEMFD_CREATE
> - #include <sys/mman.h>
> --#endif
> - 
> - #include "os-compatibility.h"
> - 
> --- 
> -2.20.1
> -
> diff --git a/package/weston/0002-shared-guard-all-the-seal-logic-behind-HAVE_MEMFD_CR.patch b/package/weston/0002-shared-guard-all-the-seal-logic-behind-HAVE_MEMFD_CR.patch
> deleted file mode 100644
> index c403ede4be..0000000000
> --- a/package/weston/0002-shared-guard-all-the-seal-logic-behind-HAVE_MEMFD_CR.patch
> +++ /dev/null
> @@ -1,67 +0,0 @@
> -From f0d3a6149158f682230ae9a1e69289431974f635 Mon Sep 17 00:00:00 2001
> -From: Sebastian Wick <sebastian@sebastianwick.net>
> -Date: Wed, 5 Feb 2020 10:27:23 +0100
> -Subject: [PATCH] shared: guard all the seal logic behind HAVE_MEMFD_CREATE
> -
> -The initial version of os_ro_anonymous_file missed two guards around the
> -seal logic which leads to a compilation error on older systems.
> -
> -Also make the check for a read-only file symmetric in
> -os_ro_anonymous_file_get_fd and os_ro_anonymous_file_put_fd.
> -
> -Signed-off-by: Sebastian Wick <sebastian@sebastianwick.net>
> -[james.hilliard1 at gmail.com: backport from upstream commit
> -f0d3a6149158f682230ae9a1e69289431974f635]
> -Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ----
> - shared/os-compatibility.c | 15 +++++++++------
> - 1 file changed, 9 insertions(+), 6 deletions(-)
> -
> -diff --git a/shared/os-compatibility.c b/shared/os-compatibility.c
> -index 041c929f..2e12b7cc 100644
> ---- a/shared/os-compatibility.c
> -+++ b/shared/os-compatibility.c
> -@@ -340,6 +340,7 @@ os_ro_anonymous_file_get_fd(struct ro_anonymous_file *file,
> - 	void *src, *dst;
> - 	int seals, fd;
> - 
> -+#ifdef HAVE_MEMFD_CREATE
> - 	seals = fcntl(file->fd, F_GET_SEALS);
> - 
> - 	/* file was sealed for read-only and we don't have to support MAP_SHARED
> -@@ -348,6 +349,7 @@ os_ro_anonymous_file_get_fd(struct ro_anonymous_file *file,
> - 	if (seals != -1 && mapmode == RO_ANONYMOUS_FILE_MAPMODE_PRIVATE &&
> - 	    (seals & READONLY_SEALS) == READONLY_SEALS)
> - 		return file->fd;
> -+#endif
> - 
> - 	/* for all other cases we create a new anonymous file that can be mapped
> - 	 * with MAP_SHARED and copy the contents to it and return that instead
> -@@ -388,17 +390,18 @@ os_ro_anonymous_file_get_fd(struct ro_anonymous_file *file,
> - int
> - os_ro_anonymous_file_put_fd(int fd)
> - {
> -+#ifdef HAVE_MEMFD_CREATE
> - 	int seals = fcntl(fd, F_GET_SEALS);
> - 	if (seals == -1 && errno != EINVAL)
> - 		return -1;
> - 
> --	/* If the fd cannot be sealed seals is -1 at this point
> --	 * or the file can be sealed but has not been sealed for writing.
> --	 * In both cases we created a new anonymous file that we have to
> --	 * close.
> -+	/* The only case in which we do NOT have to close the file is when the file
> -+	 * was sealed for read-only
> - 	 */
> --	if (seals == -1 || !(seals & F_SEAL_WRITE))
> --		close(fd);
> -+	if (seals != -1 && (seals & READONLY_SEALS) == READONLY_SEALS)
> -+		return 0;
> -+#endif
> - 
> -+	close(fd);
> - 	return 0;
> - }
> --- 
> -2.20.1
> -
> diff --git a/package/weston/weston.hash b/package/weston/weston.hash
> index 07695fda83..5a6b38686a 100644
> --- a/package/weston/weston.hash
> +++ b/package/weston/weston.hash
> @@ -1,6 +1,6 @@
> -# From https://lists.freedesktop.org/archives/wayland-devel/2020-January/041147.html
> -md5 53e4810d852df0601d01fd986a5b22b3  weston-8.0.0.tar.xz
> -sha1 80200a9c677d34c2de52230be444bd03ecd84229  weston-8.0.0.tar.xz
> -sha256 7518b49b2eaa1c3091f24671bdcc124fd49fc8f1af51161927afa4329c027848  weston-8.0.0.tar.xz
> -sha512 74853b0c9cabbabe942a2d057b65e4e97b48dc5f4df6d7b9ffc10ec52bc787009b12b900be6b426551902b920b7308baa967b7489761641dc9c31cf90440950c  weston-8.0.0.tar.xz
> +# From https://lists.freedesktop.org/archives/wayland-devel/2020-September/041595.html
> +md5  b406da0fe9139fd39653238fde22a6cf  weston-9.0.0.tar.xz
> +sha1  90b9540a0bd6d6f7a465817f1c696d4d393183c9  weston-9.0.0.tar.xz
> +sha256  5cf5d6ce192e0eb15c1fc861a436bf21b5bb3b91dbdabbdebe83e1f83aa098fe  weston-9.0.0.tar.xz
> +sha512  ccc263f8279b7b23e5c593b4a8a023de2c3dc178b1b8d6593599171770bcfe97608de9fcb77aa1cab39255451d289d323e51c317dae190c7641282e085b84f90  weston-9.0.0.tar.xz
>  sha256  fdb65868f65d0fbdb05c2d3b779e10ce9969fa0c4b9262ba4f260e87086ab860  COPYING
> diff --git a/package/weston/weston.mk b/package/weston/weston.mk
> index 541c6ba024..a20f16ab46 100644
> --- a/package/weston/weston.mk
> +++ b/package/weston/weston.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -WESTON_VERSION = 8.0.0
> +WESTON_VERSION = 9.0.0
>  WESTON_SITE = http://wayland.freedesktop.org/releases
>  WESTON_SOURCE = weston-$(WESTON_VERSION).tar.xz
>  WESTON_LICENSE = MIT
> @@ -56,9 +56,16 @@ endif
>  ifeq ($(BR2_PACKAGE_HAS_LIBEGL_WAYLAND)$(BR2_PACKAGE_HAS_LIBGLES),yy)
>  WESTON_CONF_OPTS += -Drenderer-gl=true
>  WESTON_DEPENDENCIES += libegl libgles
> +ifeq ($(BR2_PACKAGE_PIPEWIRE)$(BR2_PACKAGE_WESTON_DRM),yy)
> +WESTON_CONF_OPTS += -Dpipewire=true
> +WESTON_DEPENDENCIES += pipewire
> +else
> +WESTON_CONF_OPTS += -Dpipewire=false
> +endif
>  else
>  WESTON_CONF_OPTS += \
> -	-Drenderer-gl=false
> +	-Drenderer-gl=false \
> +	-Dpipewire=false
>  endif
>  
>  ifeq ($(BR2_PACKAGE_WESTON_RDP),y)
> @@ -125,13 +132,6 @@ else
>  WESTON_CONF_OPTS += -Dtest-junit-xml=false
>  endif
>  
> -ifeq ($(BR2_PACKAGE_PIPEWIRE)$(BR2_PACKAGE_WESTON_DRM),yy)
> -WESTON_CONF_OPTS += -Dpipewire=true
> -WESTON_DEPENDENCIES += pipewire
> -else
> -WESTON_CONF_OPTS += -Dpipewire=false
> -endif
> -
>  ifeq ($(BR2_PACKAGE_WESTON_DEMO_CLIENTS),y)
>  WESTON_CONF_OPTS += -Ddemo-clients=true
>  WESTON_DEPENDENCIES += pango
> -- 
> 2.25.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
