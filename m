From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Jul 2015 10:22:53 +0200
Subject: [Buildroot] [PATCH 2/2] Remmina: new package
In-Reply-To: <1438071328-12502-2-git-send-email-fancp2007@gmail.com>
References: <1438071328-12502-1-git-send-email-fancp2007@gmail.com>
 <1438071328-12502-2-git-send-email-fancp2007@gmail.com>
Message-ID: <20150728102253.713de783@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Scott Fan,

On Tue, 28 Jul 2015 16:15:28 +0800, Scott Fan wrote:
> Remmina is a remote desktop client written in GTK+.
> Currently RDP, VNC, NX, XDMCP and SSH are supported.
> 
> http://remmina.sourceforge.net/
> 
> Signed-off-by: Scott Fan <fancp2007@gmail.com>

Thanks for this contribution. See some comments below.

> diff --git a/package/remmina/0001-libintl-underlink.patch b/package/remmina/0001-libintl-underlink.patch
> new file mode 100644
> index 0000000..6afba38
> --- /dev/null
> +++ b/package/remmina/0001-libintl-underlink.patch
> @@ -0,0 +1,11 @@

All patches should have a description + Signed-off-by. See
http://buildroot.org/downloads/manual/manual.html#_format_and_licensing_of_the_package_patches.

> +--- ./remmina/CMakeLists.txt.orig
> ++++ ./remmina/CMakeLists.txt
> +@@ -91,7 +91,7 @@
> + add_executable(remmina ${REMMINA_SRCS})
> + 
> + include_directories(${GTK_INCLUDE_DIRS})
> +-target_link_libraries(remmina ${GTK_LIBRARIES})
> ++target_link_libraries(remmina ${GTK_LIBRARIES} -lintl)

This is not good: libintl may not exist. If you're using glibc, then
the gettext functions are provided by the C library itself.

> diff --git a/package/remmina/Config.in b/package/remmina/Config.in
> new file mode 100644
> index 0000000..168f898
> --- /dev/null
> +++ b/package/remmina/Config.in
> @@ -0,0 +1,17 @@
> +config BR2_PACKAGE_REMMINA
> +	bool "Remmina"

lowercase

> +	depends on BR2_PACKAGE_LIBGTK3
> +	select BR2_PACKAGE_LIBGCRYPT
> +	select BR2_PACKAGE_LIBSSH
> +	select BR2_PACKAGE_LIBVNCSERVER

libvncserver depends on BR2_USE_MMU, so you need to propagate this
dependency. Though I admit this dependency is already inherited by the
libgtk3 dependency.

> +	select BR2_PACKAGE_FREERDP

Depends on wchar, !static libs and threads. For example, libgtk3 does
not have the !static libs dependency.

> +	select BR2_PACKAGE_GETTEXT

This looks suspicious. Look at
http://buildroot.org/downloads/manual/manual.html#_gettext_integration_and_interaction_with_packages.


> +	help
> +	  Remmina is a remote desktop client written in GTK+, aiming to be useful for 
> +	  system administrators and travellers, who need to work with lots of remote 
> +	  computers in front of either large monitors or tiny netbooks. 
> +
> +	  Remmina supports multiple network protocols in an integrated and consistent 
> +	  user interface. Currently RDP, VNC, NX, XDMCP and SSH are supported.

Lines too long, please wrap at 72 characters.

> +	  http://remmina.sourceforge.net/
> diff --git a/package/remmina/remmina.mk b/package/remmina/remmina.mk
> new file mode 100644
> index 0000000..0a03f3d
> --- /dev/null
> +++ b/package/remmina/remmina.mk
> @@ -0,0 +1,19 @@
> +################################################################################
> +#
> +# Remmina

lowercase

> +#
> +################################################################################
> +
> +REMMINA_VERSION = v1.1.2
> +REMMINA_SITE = $(call github,FreeRDP,Remmina,$(REMMINA_VERSION))
> +REMMINA_DEPENDENCIES = libgtk3 libgcrypt libssh libvncserver freerdp gettext
> +REMMINA_LICENSE = GPLv2

The license is GPLv2+ with OpenSSL exception

> +REMMINA_LICENSE_FILES = LICENSE

Should also contain COPYING and LICENSE.OpenSSL

> +
> +REMMINA_CONF_OPTS = \
> +	-DWITH_AVAHI=OFF \
> +	-DWITH_APPINDICATOR=OFF \
> +	-DWITH_TELEPATHY=OFF \
> +	-DWITH_GNOMEKEYRING=OFF
> +
> +$(eval $(cmake-package))

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
