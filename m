From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 10 Mar 2019 16:35:41 +0100
Subject: [Buildroot] [PATCH 1/2] package/libfuse3: new package
In-Reply-To: <20190306163054.5918-1-norbert.lange@andritz.com>
References: <20190306163054.5918-1-norbert.lange@andritz.com>
Message-ID: <bfd874ad-06a2-9cf6-7783-d66979a953e0@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 06/03/2019 17:30, Norbert Lange wrote:
> Signed-off-by: Norbert Lange <norbert.lange@andritz.com>
> ---
>  package/Config.in                      |  1 +
>  package/libfuse3/Config.in             | 12 ++++++++++
>  package/libfuse3/disable_fileops.patch | 32 ++++++++++++++++++++++++++
>  package/libfuse3/libfuse3.hash         |  7 ++++++
>  package/libfuse3/libfuse3.mk           | 30 ++++++++++++++++++++++++

 Please add yourself to DEVELOPERS as well.

>  5 files changed, 82 insertions(+)
>  create mode 100644 package/libfuse3/Config.in
>  create mode 100644 package/libfuse3/disable_fileops.patch
>  create mode 100644 package/libfuse3/libfuse3.hash
>  create mode 100644 package/libfuse3/libfuse3.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 969f94c911..155c760df1 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1229,6 +1229,7 @@ menu "Filesystem"
>  	source "package/libconfig/Config.in"
>  	source "package/libconfuse/Config.in"
>  	source "package/libfuse/Config.in"
> +	source "package/libfuse3/Config.in"
>  	source "package/liblockfile/Config.in"
>  	source "package/libnfs/Config.in"
>  	source "package/libsysfs/Config.in"
> diff --git a/package/libfuse3/Config.in b/package/libfuse3/Config.in
> new file mode 100644
> index 0000000000..d349fcd67f
> --- /dev/null
> +++ b/package/libfuse3/Config.in
> @@ -0,0 +1,12 @@
> +config BR2_PACKAGE_LIBFUSE3
> +	bool "libfuse3"
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_USE_MMU # fork()
> +	help
> +	  FUSE 3 (Filesystem in UserSpacE)
> +
> +	  https://github.com/libfuse/libfuse

 It would be interesting to check if we could get away with just treating this
as a version bump instead of a new package. Do you have any idea how much the
API has changed since 2.9? There are quite a few reverse dependencies though so
it could be a bit tricky...

> +
> +comment "libfuse3 needs a toolchain w/ threads"
> +	depends on BR2_USE_MMU
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS
> diff --git a/package/libfuse3/disable_fileops.patch b/package/libfuse3/disable_fileops.patch
> new file mode 100644
> index 0000000000..b0373bc43a
> --- /dev/null
> +++ b/package/libfuse3/disable_fileops.patch
> @@ -0,0 +1,32 @@
> +diff -burN fuse-3.4.1.org/util/install_helper.sh fuse-3.4.1/util/install_helper.sh
> +--- fuse-3.4.1.org/util/install_helper.sh	2019-02-12 14:33:18.549507335 +0100
> ++++ fuse-3.4.1/util/install_helper.sh	2019-02-12 14:35:20.726772913 +0100
> +@@ -22,8 +22,8 @@
> +     DESTDIR="${DESTDIR%/}"
> + fi
> + 
> +-chown root:root "${DESTDIR}${bindir}/fusermount3"
> +-chmod u+s "${DESTDIR}${bindir}/fusermount3"
> ++#chown root:root "${DESTDIR}${bindir}/fusermount3"
> ++#chmod u+s "${DESTDIR}${bindir}/fusermount3"

 It would be nice to find an upstreamable way to do this. Maybe just putting
'|| true' behind it is enough?

> + 
> + install -D -m 644 "${MESON_SOURCE_ROOT}/util/fuse.conf" \
> + 	"${DESTDIR}${sysconfdir}/fuse.conf"
> +@@ -31,7 +31,7 @@
> + 
> + if test ! -e "${DESTDIR}/dev/fuse"; then
> +     mkdir -p "${DESTDIR}/dev"
> +-    mknod "${DESTDIR}/dev/fuse" -m 0666 c 10 229
> ++#    mknod "${DESTDIR}/dev/fuse" -m 0666 c 10 229
> + fi
> + 
> + install -D -m 644 "${MESON_SOURCE_ROOT}/util/udev.rules" \
> +@@ -42,7 +42,7 @@
> + 
> + 
> + if test -x /usr/sbin/update-rc.d && test -z "${DESTDIR}"; then
> +-    /usr/sbin/update-rc.d fuse3 start 34 S . start 41 0 6 . || /bin/true
> ++    : # /usr/sbin/update-rc.d fuse3 start 34 S . start 41 0 6 . || /bin/true

 This shouldn't be needed at all, because DESTDIR is set this piece of code will
never be executed.

> + else
> +     echo "== FURTHER ACTION REQUIRED =="
> +     echo "Make sure that your init system will start the ${sysconfdir}/init.d/fuse3 init script"
> diff --git a/package/libfuse3/libfuse3.hash b/package/libfuse3/libfuse3.hash
> new file mode 100644
> index 0000000000..d0fd037428
> --- /dev/null
> +++ b/package/libfuse3/libfuse3.hash
> @@ -0,0 +1,7 @@
> +# Locally calculated after checking pgp signature
> +sha256  88302a8fa56e7871066652495b05faf14b36dca9f1b740e9fb00da0785e60485  fuse-3.4.1.tar.xz
> +
> +# Hash for license files:
> +sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  GPL2.txt
> +sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LGPL2.txt
> +sha256  b8832d9caaa075bbbd2aef24efa09f8b7ab66a832812d88c602da0c7b4397fad  LICENSE
> diff --git a/package/libfuse3/libfuse3.mk b/package/libfuse3/libfuse3.mk
> new file mode 100644
> index 0000000000..eecdb248d3
> --- /dev/null
> +++ b/package/libfuse3/libfuse3.mk
> @@ -0,0 +1,30 @@
> +################################################################################
> +#
> +# libfuse
> +#
> +################################################################################
> +
> +LIBFUSE3_VERSION = 3.4.1

3.4.2 is out.

> +LIBFUSE3_SOURCE = fuse-$(LIBFUSE3_VERSION).tar.xz
> +LIBFUSE3_SITE = https://github.com/libfuse/libfuse/releases/download/fuse-$(LIBFUSE3_VERSION)
> +LIBFUSE3_LICENSE = GPL-2.0, LGPL-2.1

 We normally clarify this like LGPL-2.1 (library), GPL-2.0 (rest)

> +LIBFUSE3_LICENSE_FILES = GPL2.txt LGPL2.txt LICENSE
> +LIBFUSE3_INSTALL_STAGING = YES
> +LIBFUSE3_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBICONV),libiconv)
> +LIBFUSE3_CONF_OPTS = \
> +	-Dexamples=false \
> +	-Dutils=true \
> +	-Dudevrulesdir=/lib/udev/rules.d
> +
> +define LIBFUSE3_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 0755 $(STAGING_DIR)/usr/bin/fusermount3 $(TARGET_DIR)/usr/bin/
> +	$(if $(filter y,$(BR2_STATIC_LIBS)),,cp -dpf $(STAGING_DIR)/usr/lib/libfuse3.so* $(TARGET_DIR)/usr/lib/)
> +	mkdir -p $(TARGET_DIR)/lib/udev/rules.d
> +	$(INSTALL) -m 0644 $(STAGING_DIR)/lib/udev/rules.d/*-fuse3.rules $(TARGET_DIR)/lib/udev/rules.d

 Is there any reason not to use the normal install for target as well?

 Regards,
 Arnout

> +endef
> +
> +define LIBFUSE3_PERMISSIONS
> +	/usr/bin/fusermount3 f 4755 0 0 - - - - -
> +endef
> +
> +$(eval $(meson-package))
> 
