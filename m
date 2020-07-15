From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 15 Jul 2020 08:40:27 -0500
Subject: [Buildroot] [PATCH 3/9] package/libselinux: bump to 20200710
In-Reply-To: <20200715130740.775804-4-antoine.tenart@bootlin.com>
References: <20200715130740.775804-1-antoine.tenart@bootlin.com>
 <20200715130740.775804-4-antoine.tenart@bootlin.com>
Message-ID: <CANQCQpZ6BjPTQ-tS1fji4NQJUgcZjtqjn5OvVY=zoRfe_MnHjA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Antoine,

On Wed, Jul 15, 2020 at 8:11 AM Antoine Tenart
<antoine.tenart@bootlin.com> wrote:
>
> Refresh patch 0002-Do-not-use-PYCEXT-and-rely-on-the-installed-file-nam.patch
> for 3.1; and remove patch 0003-fix-building-against-musl-and-uclibc-libraries.patch
> that is now upstream.
>
> Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>

I've reviewed the complete series, thanks for sending it!

Reviewed-by: Matthew Weber <matthew.weber@rockwellcollins.com>

> ---
>  ...T-and-rely-on-the-installed-file-nam.patch | 17 +++++-----
>  ...ng-against-musl-and-uclibc-libraries.patch | 32 -------------------
>  package/libselinux/libselinux.hash            |  2 +-
>  package/libselinux/libselinux.mk              |  4 +--
>  4 files changed, 12 insertions(+), 43 deletions(-)
>  delete mode 100644 package/libselinux/0003-fix-building-against-musl-and-uclibc-libraries.patch
>
> diff --git a/package/libselinux/0002-Do-not-use-PYCEXT-and-rely-on-the-installed-file-nam.patch b/package/libselinux/0002-Do-not-use-PYCEXT-and-rely-on-the-installed-file-nam.patch
> index ed0519710527..cbd98a61ad51 100644
> --- a/package/libselinux/0002-Do-not-use-PYCEXT-and-rely-on-the-installed-file-nam.patch
> +++ b/package/libselinux/0002-Do-not-use-PYCEXT-and-rely-on-the-installed-file-nam.patch
> @@ -1,4 +1,4 @@
> -From 0d4da8093bc2ef92b7c6f7fd1f4804f6ebc6cb56 Mon Sep 17 00:00:00 2001
> +From c26495025ab1a2597e5433b67a3bf793d3ce1e08 Mon Sep 17 00:00:00 2001
>  From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
>  Date: Fri, 25 Oct 2019 13:37:14 +0200
>  Subject: [PATCH] Do not use PYCEXT, and rely on the installed file name
> @@ -15,29 +15,30 @@ To address this and keep things simple, this patch just changes the ln
>  invocation to rely on the name of the _selinux*.so Python module that
>  was installed.
>
> -[Upstream: https://github.com/SELinuxProject/selinux/pull/184]
> +Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
> +[Refreshed for 3.1]
>  Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
>  [Refreshed for 3.0]
>  Signed-off-by: Adam Duskett <Aduskett@gmail.com>
>  ---
> - libselinux/src/Makefile | 3 +--
> + src/Makefile | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>
>  diff --git a/src/Makefile b/src/Makefile
> -index 4b6a4d4..7b14ef1 100644
> +index 190016e2af34..7ee22fd35da3 100644
>  --- a/src/Makefile
>  +++ b/src/Makefile
>  @@ -15,7 +15,6 @@ INCLUDEDIR ?= $(PREFIX)/include
>   PYINC ?= $(shell $(PKG_CONFIG) --cflags $(PYPREFIX))
>   PYLIBS ?= $(shell $(PKG_CONFIG) --libs $(PYPREFIX))
>   PYTHONLIBDIR ?= $(shell $(PYTHON) -c "from distutils.sysconfig import *; print(get_python_lib(plat_specific=1, prefix='$(PREFIX)'))")
> --PYCEXT ?= $(shell $(PYTHON) -c 'import imp;print([s for s,m,t in imp.get_suffixes() if t == imp.C_EXTENSION][0])')
> +-PYCEXT ?= $(shell $(PYTHON) -c 'import importlib.machinery;print(importlib.machinery.EXTENSION_SUFFIXES[0])')
>   RUBYINC ?= $(shell $(RUBY) -e 'puts "-I" + RbConfig::CONFIG["rubyarchhdrdir"] + " -I" + RbConfig::CONFIG["rubyhdrdir"]')
>   RUBYLIBS ?= $(shell $(RUBY) -e 'puts "-L" + RbConfig::CONFIG["libdir"] + " -L" + RbConfig::CONFIG["archlibdir"] + " " + RbConfig::CONFIG["LIBRUBYARG_SHARED"]')
>   RUBYINSTALL ?= $(shell $(RUBY) -e 'puts RbConfig::CONFIG["vendorarchdir"]')
> -@@ -175,7 +174,7 @@ install: all
> +@@ -176,7 +175,7 @@ install: all
>   install-pywrap: pywrap
> -       $(PYTHON) setup.py install --prefix=$(PREFIX) `test -n "$(DESTDIR)" && echo --root $(DESTDIR)`
> +       $(PYTHON) setup.py install --prefix=$(PREFIX) `test -n "$(DESTDIR)" && echo --root $(DESTDIR)` $(PYTHON_SETUP_ARGS)
>         install -m 644 $(SWIGPYOUT) $(DESTDIR)$(PYTHONLIBDIR)/selinux/__init__.py
>  -      ln -sf --relative $(DESTDIR)$(PYTHONLIBDIR)/selinux/_selinux$(PYCEXT) $(DESTDIR)$(PYTHONLIBDIR)/_selinux$(PYCEXT)
>  +      ln -sf --relative $(DESTDIR)$(PYTHONLIBDIR)/selinux/_selinux*.so $(DESTDIR)$(PYTHONLIBDIR)/
> @@ -45,5 +46,5 @@ index 4b6a4d4..7b14ef1 100644
>   install-rubywrap: rubywrap
>         test -d $(DESTDIR)$(RUBYINSTALL) || install -m 755 -d $(DESTDIR)$(RUBYINSTALL)
>  --
> -2.23.0
> +2.26.2
>
> diff --git a/package/libselinux/0003-fix-building-against-musl-and-uclibc-libraries.patch b/package/libselinux/0003-fix-building-against-musl-and-uclibc-libraries.patch
> deleted file mode 100644
> index 1880c8f69269..000000000000
> --- a/package/libselinux/0003-fix-building-against-musl-and-uclibc-libraries.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -From 0f6cd4ef20639ac3b3e26af8f743ee03b5d6f8a4 Mon Sep 17 00:00:00 2001
> -From: Adam Duskett <Aduskett@gmail.com>
> -Date: Wed, 11 Dec 2019 14:00:16 -0800
> -Subject: [PATCH] Fix building against musl and uClibc libc libraries.
> -
> -Currently, the src/Makefile provides the FTS_LDLIBS when building against musl
> -or uClibc. However, this is missing from utils/Makefile, which causes linking
> -to fail.
> -
> -Add the FTS_LDLIBS variable to the LDLIBS variable in utils/Makefile to fix
> -compiling against uClibc and musl.
> -
> -Signed-off-by: Adam Duskett <aduskett@gmail.com>
> -
> ----
> - libselinux/utils/Makefile | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/utils/Makefile b/utils/Makefile
> -index 36150638..a5632b7c 100644
> ---- a/utils/Makefile
> -+++ b/utils/Makefile
> -@@ -45,7 +45,7 @@ endif
> -
> - override CFLAGS += -I../include -D_GNU_SOURCE $(DISABLE_FLAGS) $(PCRE_CFLAGS)
> - override LDFLAGS += -L../src
> --override LDLIBS += -lselinux
> -+override LDLIBS += -lselinux $(FTS_LDLIBS)
> - PCRE_LDLIBS ?= -lpcre
> -
> - ifeq ($(ANDROID_HOST),y)
> -
> diff --git a/package/libselinux/libselinux.hash b/package/libselinux/libselinux.hash
> index d1b421048381..1101b4050133 100644
> --- a/package/libselinux/libselinux.hash
> +++ b/package/libselinux/libselinux.hash
> @@ -1,5 +1,5 @@
>  # From: https://github.com/SELinuxProject/selinux/wiki/Releases
> -sha256 2ea2b30f671dae9d6b1391cbe8fb2ce5d36a3ee4fb1cd3c32f0d933c31b82433 libselinux-3.0.tar.gz
> +sha256 ea5dcbb4d859e3f999c26a13c630da2f16dff9462e3cc8cb7b458ac157d112e7 libselinux-3.1.tar.gz
>
>  # Hash for license file
>  sha256 86657b4c0fe868d7cbd977cb04c63b6c667e08fa51595a7bc846ad4bed8fc364 LICENSE
> diff --git a/package/libselinux/libselinux.mk b/package/libselinux/libselinux.mk
> index d0e7b66241f0..f7397141d588 100644
> --- a/package/libselinux/libselinux.mk
> +++ b/package/libselinux/libselinux.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>
> -LIBSELINUX_VERSION = 3.0
> -LIBSELINUX_SITE = https://github.com/SELinuxProject/selinux/releases/download/20191204
> +LIBSELINUX_VERSION = 3.1
> +LIBSELINUX_SITE = https://github.com/SELinuxProject/selinux/releases/download/20200710
>  LIBSELINUX_LICENSE = Public Domain
>  LIBSELINUX_LICENSE_FILES = LICENSE
>
> --
> 2.26.2
>
