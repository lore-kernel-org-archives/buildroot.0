From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 20 Mar 2019 23:40:46 +0100
Subject: [Buildroot] [PATCH v2 2/4] package/libfuse3: new package
In-Reply-To: <20190315133033.5275-3-norbert.lange@andritz.com>
References: <20190315133033.5275-1-norbert.lange@andritz.com>
 <20190315133033.5275-3-norbert.lange@andritz.com>
Message-ID: <04be9648-2769-492e-cf2e-75fab808d896@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 15/03/2019 14:30, Norbert Lange wrote:
> Signed-off-by: Norbert Lange <norbert.lange@andritz.com>
> ---
>  package/Config.in                      |  1 +
>  package/libfuse3/Config.in             | 12 ++++++++
>  package/libfuse3/disable_fileops.patch | 23 +++++++++++++++
>  package/libfuse3/libfuse3.hash         |  8 ++++++
>  package/libfuse3/libfuse3.mk           | 40 ++++++++++++++++++++++++++
>  5 files changed, 84 insertions(+)
>  create mode 100644 package/libfuse3/Config.in
>  create mode 100644 package/libfuse3/disable_fileops.patch
>  create mode 100644 package/libfuse3/libfuse3.hash
>  create mode 100644 package/libfuse3/libfuse3.mk

[snip]
> diff --git a/package/libfuse3/disable_fileops.patch b/package/libfuse3/disable_fileops.patch
> new file mode 100644
> index 0000000000..bd3a8e2be3
> --- /dev/null
> +++ b/package/libfuse3/disable_fileops.patch
> @@ -0,0 +1,23 @@
> +diff -burN fuse-3.4.1.org/util/install_helper.sh fuse-3.4.1/util/install_helper.sh

 The patch should have a commit message and a signed-off-by.

 Also, since upstream is git, it should be git-formatted.

 Also, please send it upstream. Ideally, send it upstream first, wait a little
bit for feedback, and then when submitting to Buildroot, include the upstream
reference. If it is not yet merged, add something like

Upstream: https://github.com/libfuse/libfuse/pulls/385

If it was already accepted upstream, just do a git-format-patch -N of the
upstream commit (the commit hash will be the same as the upstream one).

> +--- fuse-3.4.1.org/util/install_helper.sh	2019-02-12 14:33:18.549507335 +0100
> ++++ fuse-3.4.1/util/install_helper.sh	2019-02-12 14:35:20.726772913 +0100
> +@@ -22,8 +22,8 @@
> +     DESTDIR="${DESTDIR%/}"
> + fi
> +
> +-chown root:root "${DESTDIR}${bindir}/fusermount3"
> +-chmod u+s "${DESTDIR}${bindir}/fusermount3"
> ++chown root:root "${DESTDIR}${bindir}/fusermount3" || :
> ++chmod u+s "${DESTDIR}${bindir}/fusermount3" || :
> +
> + install -D -m 644 "${MESON_SOURCE_ROOT}/util/fuse.conf" \
> + 	"${DESTDIR}${sysconfdir}/fuse.conf"
> +@@ -31,7 +31,7 @@
> +
> + if test ! -e "${DESTDIR}/dev/fuse"; then
> +     mkdir -p "${DESTDIR}/dev"
> +-    mknod "${DESTDIR}/dev/fuse" -m 0666 c 10 229
> ++    mknod "${DESTDIR}/dev/fuse" -m 0666 c 10 229 || :
> + fi
> +
> + install -D -m 644 "${MESON_SOURCE_ROOT}/util/udev.rules" \
> diff --git a/package/libfuse3/libfuse3.hash b/package/libfuse3/libfuse3.hash
> new file mode 100644
> index 0000000000..e9b9f8384c
> --- /dev/null
> +++ b/package/libfuse3/libfuse3.hash
> @@ -0,0 +1,8 @@
> +# Locally calculated after checking pgp signature
> +sha256  224dd4a598e23e114395a9717bc79638ab2b1e42c82ae8210aed9365aff325a3  fuse-3.4.2.tar.xz
> +
> +

 Just one empty line.

> +# Hash for license files:
> +sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  GPL2.txt
> +sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LGPL2.txt
> +sha256  b8832d9caaa075bbbd2aef24efa09f8b7ab66a832812d88c602da0c7b4397fad  LICENSE
> diff --git a/package/libfuse3/libfuse3.mk b/package/libfuse3/libfuse3.mk
> new file mode 100644
> index 0000000000..ff8d251a96
> --- /dev/null
> +++ b/package/libfuse3/libfuse3.mk
> @@ -0,0 +1,40 @@
> +################################################################################
> +#
> +# libfuse
> +#
> +################################################################################
> +
> +LIBFUSE3_VERSION = 3.4.2
> +LIBFUSE3_SOURCE = fuse-$(LIBFUSE3_VERSION).tar.xz
> +LIBFUSE3_SITE = https://github.com/libfuse/libfuse/releases/download/fuse-$(LIBFUSE3_VERSION)
> +LIBFUSE3_LICENSE = LGPL-2.1 (library), GPL-2.0 (rest)
> +LIBFUSE3_LICENSE_FILES = GPL2.txt LGPL2.txt LICENSE

 PLease keep the order of the license files the same as the licenses. I would
put LICENSE first, though.

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

 This looks ugly.

 Why doesn't the default make install not work? I think this was discussed
before, but the commit message gives me no enlightenment. If I already forget it
after a week, imagine what will happen in a few years when it becomes relevant
again...

> +	mkdir -p $(TARGET_DIR)/lib/udev/rules.d
> +	$(INSTALL) -m 0644 $(STAGING_DIR)/lib/udev/rules.d/*-fuse3.rules $(TARGET_DIR)/lib/udev/rules.d
> +endef
> +
> +define LIBFUSE3_INSTALL_TARGET_POST

 Give a better name, e.g. LIBFUSE3_INSTALL_TARGET_FUSERMOUNT_SYMLINK.

> +	ln -sf fusermount3 $(TARGET_DIR)/usr/bin/fusermount
> +endef
> +
> +LIBFUSE3_POST_INSTALL_TARGET_HOOKS += LIBFUSE3_INSTALL_TARGET_POST

 The reason to make this a post-install-hook is that you'd be able to use the
default install commands. If that is not possible, you can do it directly in the
install commands.

 Regards,
 Arnout

> +
> +define LIBFUSE3_DEVICES
> +	/dev/fuse  c  666  0  0  10  229  0  0  -
> +endef
> +
> +define LIBFUSE3_PERMISSIONS
> +	/usr/bin/fusermount3 f 4755 0 0 - - - - -
> +endef
> +
> +$(eval $(meson-package))
> 
