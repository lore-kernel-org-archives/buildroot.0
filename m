From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 05 Feb 2019 21:12:21 +0200
Subject: [Buildroot] [PATCH v2 1/1] libglib2: bump to 2.58.3
In-Reply-To: <20190205185623.15717-1-aduskett@gmail.com>
References: <20190205185623.15717-1-aduskett@gmail.com>
Message-ID: <87y36u9hii.fsf@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Adam,

On Tue, Feb 05 2019, aduskett at gmail.com wrote:
> From: Adam Duskett <Aduskett@gmail.com>
>
> In addition:
>  - Update second patch
>  - Remove third and fifth patches (already in version)

Are you sure? I don't see any patches removed in this patch.

>  - Add a new patch to fix a missing header

Which patch?

>  - Add LIBGLIB2_GTK_DOC_HOOK so autoreconf do not fail on the following
>    error:
>      automake: error: cannot open < gtk-doc.make: No such file or directory
>
>  - Add a new patch: package/libglib2/0005-use-tooldir-in-pc-file.patch
>    This patch fixes the previous autobuild errors by modifying the glib-2.0.pc
>    file and adding a tooldir variable, of which the glib_genmarshal,
>    gobject_query, and glib_mkenums of which will be prefixed. Then a
>    post_staging_install_hook sed's the path to point towards
>    $(STAGING_DIR)/usr/bin

Why not prefix the patch file name with 0003?

baruch

> All tests passed with the packages: AT, libsoup, and dbus-glib selected:
> br-arm-full [1/6]: OK
> br-arm-cortex-a9-glibc [2/6]: OK
> br-arm-cortex-m4-full [3/6]: SKIPPED
> br-x86-64-musl [4/6]: OK
> br-arm-full-static [5/6]: OK
> armv5-ctng-linux-gnueabi [6/6]: OK
>
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
> Changes v1 -> v2:
>   - Instead of removing ${bindir}, add ${tooldir} and sed the location
>     in a post_staging_install_hook (Arnout)
>   - Add a more verbose commit message (Arnout)
>
>  package/libglib2/0002-disable-tests.patch     |  8 ++--
>  .../0005-use-tooldir-in-pc-file.patch         | 37 +++++++++++++++++++
>  package/libglib2/libglib2.hash                |  4 +-
>  package/libglib2/libglib2.mk                  | 17 ++++++++-
>  4 files changed, 60 insertions(+), 6 deletions(-)
>  create mode 100644 package/libglib2/0005-use-tooldir-in-pc-file.patch
>
> diff --git a/package/libglib2/0002-disable-tests.patch b/package/libglib2/0002-disable-tests.patch
> index 523ebb35ac..e03dc2fee2 100644
> --- a/package/libglib2/0002-disable-tests.patch
> +++ b/package/libglib2/0002-disable-tests.patch
> @@ -8,6 +8,8 @@ gets mixed with distro python leading to build failures.
>  
>  Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
>  Signed-off-by: Adam Duskett <aduskett@codeblue.com>
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Update for version 2.58.1]
>  ---
>   Makefile.am      | 2 +-
>   gio/Makefile.am  | 2 +-
> @@ -22,9 +24,9 @@ index 008ad58..007332d 100644
>   
>   ACLOCAL_AMFLAGS = -I m4macros ${ACLOCAL_FLAGS}
>   
> --SUBDIRS = . m4macros glib gmodule gthread gobject gio po docs tests
> -+SUBDIRS = . m4macros glib gmodule gthread gobject gio po docs
> - DIST_SUBDIRS = $(SUBDIRS) build win32
> +-SUBDIRS = . m4macros glib gmodule gthread gobject gio po docs tests subprojects
> ++SUBDIRS = . m4macros glib gmodule gthread gobject gio po docs subprojects
> + DIST_SUBDIRS = $(SUBDIRS) build
>   
>   bin_SCRIPTS = glib-gettextize
>  diff --git a/gio/Makefile.am b/gio/Makefile.am
> diff --git a/package/libglib2/0005-use-tooldir-in-pc-file.patch b/package/libglib2/0005-use-tooldir-in-pc-file.patch
> new file mode 100644
> index 0000000000..4272ba364a
> --- /dev/null
> +++ b/package/libglib2/0005-use-tooldir-in-pc-file.patch
> @@ -0,0 +1,37 @@
> +From 9170a9030683972677b2a04fea7f7f79f28dc349 Mon Sep 17 00:00:00 2001
> +From: Adam Duskett <aduskett@gmail.com>
> +Date: Tue, 5 Feb 2019 18:20:54 +0000
> +Subject: [PATCH] use tooldir in pc file
> +
> +Newer versions of pkg-config will not respect --variable.and instead will
> +try to point to the host directory structure.
> +
> +Instead, add a tools_prefix to the glib-2.0.pc.in file
> +and then sed the location in the .mk file to point to $(STAGING_DIR)/usr/bin
> +
> +Signed-off-by: Adam Duskett <aduskett@gmail.com>
> +---
> + glib-2.0.pc.in | 7 ++++---
> + 1 file changed, 4 insertions(+), 3 deletions(-)
> +
> +diff --git a/glib-2.0.pc.in b/glib-2.0.pc.in
> +index 3c5ea81..f4cfd4c 100644
> +--- a/glib-2.0.pc.in
> ++++ b/glib-2.0.pc.in
> +@@ -4,9 +4,10 @@ libdir=@libdir@
> + includedir=@includedir@
> + 
> + bindir=@bindir@
> +-glib_genmarshal=${bindir}/glib-genmarshal
> +-gobject_query=${bindir}/gobject-query
> +-glib_mkenums=${bindir}/glib-mkenums
> ++toolsdir=@bindir@
> ++glib_genmarshal=${toolsdir}/glib-genmarshal
> ++gobject_query=${toolsdir}/gobject-query
> ++glib_mkenums=${toolsdir}/glib-mkenums
> + 
> + Name: GLib
> + Description: C Utility Library
> +-- 
> +2.19.1
> +
> diff --git a/package/libglib2/libglib2.hash b/package/libglib2/libglib2.hash
> index 57403a2154..7aa4c6cc02 100644
> --- a/package/libglib2/libglib2.hash
> +++ b/package/libglib2/libglib2.hash
> @@ -1,4 +1,4 @@
> -# https://download.gnome.org/sources/glib/2.56/glib-2.56.3.sha256sum
> -sha256  a9a4c5b4c81b6c75bc140bdf5e32120ef3ce841b7413214ecf5f987acec74cb2  glib-2.56.3.tar.xz
> +# http://ftp.gnome.org/pub/gnome/sources/glib/2.58/glib-2.58.3.sha256sum
> +sha256  8f43c31767e88a25da72b52a40f3301fefc49a665b56dc10ee7cc9565cbe7481  glib-2.58.3.tar.xz
>  # License files, locally calculated
>  sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
> diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
> index f602c371f5..b4b918bf50 100644
> --- a/package/libglib2/libglib2.mk
> +++ b/package/libglib2/libglib2.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBGLIB2_VERSION_MAJOR = 2.56
> +LIBGLIB2_VERSION_MAJOR = 2.58
>  LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).3
>  LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.xz
>  LIBGLIB2_SITE = http://ftp.gnome.org/pub/gnome/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
> @@ -13,6 +13,15 @@ LIBGLIB2_LICENSE_FILES = COPYING
>  # 0002-disable-tests.patch
>  LIBGLIB2_AUTORECONF = YES
>  
> +# Copy what is done in autogen.sh when gtk-doc is not available
> +define LIBGLIB2_GTK_DOC_HOOK
> +	echo "EXTRA_DIST=" > $(@D)/gtk-doc.make
> +	echo "CLEANFILES=" >> $(@D)/gtk-doc.make
> +endef
> +
> +LIBGLIB2_PRE_CONFIGURE_HOOKS += LIBGLIB2_GTK_DOC_HOOK
> +HOST_LIBGLIB2_PRE_CONFIGURE_HOOKS += LIBGLIB2_GTK_DOC_HOOK
> +
>  LIBGLIB2_INSTALL_STAGING = YES
>  LIBGLIB2_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) LDFLAGS=-L$(STAGING_DIR)/usr/lib install
>  
> @@ -154,6 +163,12 @@ endef
>  
>  LIBGLIB2_POST_INSTALL_TARGET_HOOKS += LIBGLIB2_REMOVE_DEV_FILES
>  
> +define LIBGLIB2_FIX_PC_FILE
> +$(SED) "s at toolsdir=.*@toolsdir=$(STAGING_DIR)/usr/bin at g" \
> +	$(STAGING_DIR)/usr/lib/pkgconfig/glib-2.0.pc
> +endef
> +LIBGLIB2_POST_INSTALL_STAGING_HOOKS += LIBGLIB2_FIX_PC_FILE
> +
>  # Remove schema sources/DTDs, we use staging ones to compile them.
>  # Do so at target finalization since other packages install additional
>  # ones and we want to deal with it in a single place.


-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
