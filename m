From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Apr 2014 22:52:50 +0200
Subject: [Buildroot] [PATCH v5 7/8] libglew: new package
In-Reply-To: <1396588694-6377-8-git-send-email-bernd.kuhls@t-online.de>
References: <1396588694-6377-1-git-send-email-bernd.kuhls@t-online.de>
 <1396588694-6377-8-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20140417225250.15ff2dd1@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Fri,  4 Apr 2014 07:18:13 +0200, Bernd Kuhls wrote:

> diff --git a/package/libglew/Config.in b/package/libglew/Config.in
> new file mode 100644
> index 0000000..fdb2b91
> --- /dev/null
> +++ b/package/libglew/Config.in
> @@ -0,0 +1,19 @@
> +config BR2_PACKAGE_LIBGLEW
> +	bool "libglew"
> +	depends on BR2_PACKAGE_XSERVER_XORG_SERVER

A dependency on BR2_PACKAGE_XORG7 looks more appropriate. We
technically speaking don't depend on the X.org server, only on the
client libraries I believe.

> +	depends on BR2_PACKAGE_MESA3D_DRIVER

Why is this needed, and not only BR2_PACKAGE_MESA3D ? Also, it seems
like libglew only makes sense in a context where mesa3d has GLX
support, no?

Do you plan to include packages that depend on libglew? What are those
packages? I'm just trying to get the big picture, and see how libglew
fits in it.

> diff --git a/package/libglew/libglew-0001-lib64.patch b/package/libglew/libglew-0001-lib64.patch
> new file mode 100644
> index 0000000..b961aec
> --- /dev/null
> +++ b/package/libglew/libglew-0001-lib64.patch

All patches need a description + Signed-off-by, but...

> @@ -0,0 +1,14 @@
> +diff -uNr glew-1.10.0.org/config/Makefile.linux glew-1.10.0/config/Makefile.linux
> +--- glew-1.10.0.org/config/Makefile.linux	2013-07-22 16:11:22.000000000 +0200
> ++++ glew-1.10.0/config/Makefile.linux	2014-03-30 22:01:04.403574030 +0200
> +@@ -10,8 +10,8 @@
> +   ARCH64 = true
> + endif
> + ifeq (${ARCH64},true)
> +-  LDFLAGS.EXTRA = -L/usr/X11R6/lib64 -L/usr/lib64
> +-  LIBDIR = $(GLEW_DEST)/lib64
> ++  LDFLAGS.EXTRA = -L/usr/X11R6/lib -L/usr/lib
> ++  LIBDIR = $(GLEW_DEST)/lib

Since you're overriding LDFLAGS.EXTRA from libglew.mk, why don't you do
the same with LIBDIR ? It would avoid having to patch the package.

> + else
> +   LDFLAGS.EXTRA = -L/usr/X11R6/lib -L/usr/lib
> +   LIBDIR = $(GLEW_DEST)/lib
> diff --git a/package/libglew/libglew.mk b/package/libglew/libglew.mk
> new file mode 100644
> index 0000000..e9c08d7
> --- /dev/null
> +++ b/package/libglew/libglew.mk
> @@ -0,0 +1,40 @@
> +################################################################################
> +#
> +# libglew
> +#
> +################################################################################
> +
> +LIBGLEW_VERSION = 1.10.0
> +LIBGLEW_SOURCE = glew-$(LIBGLEW_VERSION).tgz
> +LIBGLEW_SITE = http://sourceforge.net/projects/glew/files/glew/$(LIBGLEW_VERSION)
> +LIBGLEW_LICENSE = MIT

LIBGLEW_LICENSE_FILES = LICENSE.txt

> +LIBGLEW_INSTALL_STAGING = YES
> +LIBGLEW_DEPENDENCIES = \
> +	mesa3d \
> +	xlib_libX11 \
> +	xlib_libXext \
> +	xlib_libXi \
> +	xlib_libXmu
> +
> +define LIBGLEW_BUILD_CMDS
> +    $(TARGET_MAKE_ENV) \
> +    $(MAKE) -C $(@D) \
> +    GLEW_DEST="/usr" CC="$(TARGET_CC)" RANLIB="$(TARGET_RANLIB)" AR="$(TARGET_AR)" LD="$(TARGET_CC)" \
> +    POPT="$(TARGET_CFLAGS)" LDFLAGS.EXTRA="$(TARGET_LDFLAGS)"

We usually intend with one more tab the next lines of a given command.
Also, you should use $(TARGET_CONFIGURE_OPTS) here as well:

	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
		GLEW_DEST="/usr" $(TARGET_CONFIGURE_OPTS) \
		POPT="$(TARGET_CFLAGS)" LDFLAGS.EXTRA="$(TARGET_LDFLAGS)"

> +endef
> +
> +define LIBGLEW_INSTALL_STAGING_CMDS
> +    $(TARGET_MAKE_ENV) \
> +    $(TARGET_CONFIGURE_OPTS) \
> +    $(MAKE) -C $(@D) \
> +    GLEW_DEST="$(STAGING_DIR)/usr" install

	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
		GLEW_DEST="$(STAGING_DIR)/usr" $(TARGET_CONFIGURE_OPTS) \
		install

> +endef
> +
> +define LIBGLEW_INSTALL_TARGET_CMDS
> +    $(TARGET_MAKE_ENV) \
> +    $(TARGET_CONFIGURE_OPTS) \
> +    $(MAKE) -C $(@D) \
> +    GLEW_DEST="$(TARGET_DIR)/usr" install

	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
		GLEW_DEST="$(TARGET_DIR)/usr" $(TARGET_CONFIGURE_OPTS) \
		install

> +endef
> +
> +$(eval $(generic-package))

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
