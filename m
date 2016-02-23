From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Feb 2016 23:03:23 +0100
Subject: [Buildroot] [Buildroot PATCH Selinux v10 06/11]
 policycoreutils: new package
In-Reply-To: <1455603506-26138-6-git-send-email-niranjan.reddy@rockwellcollins.com>
References: <1455603506-26138-1-git-send-email-niranjan.reddy@rockwellcollins.com>
 <1455603506-26138-6-git-send-email-niranjan.reddy@rockwellcollins.com>
Message-ID: <20160223230323.5f752d36@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Niranjan Reddy,

On Tue, 16 Feb 2016 11:48:21 +0530, Niranjan Reddy wrote:

> diff --git a/package/policycoreutils/0001-Add-DESTDIR-to-all-paths-that-use-an-absolute-path.patch b/package/policycoreutils/0001-Add-DESTDIR-to-all-paths-that-use-an-absolute-path.patch
> new file mode 100644
> index 0000000..a25bd33
> --- /dev/null
> +++ b/package/policycoreutils/0001-Add-DESTDIR-to-all-paths-that-use-an-absolute-path.patch
> @@ -0,0 +1,275 @@
> +From 92d7cc3539f8bfc68b2f2bf688375647abf73ee7 Mon Sep 17 00:00:00 2001
> +From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
> +Date: Fri, 10 Jul 2015 11:44:08 -0500
> +Subject: [PATCH 1/3] Add DESTDIR to all paths that use an absolute path

This patch is not only adding DESTDIR, but also PREFIX to a number of
places. I'm fine with having both aspects in the same patch since it's
really related, but it should be indicated in the patch description.

Also, we prefer to have patches formated without the 1/3, 2/3 and 3/3
sequence number, so please use "git format-patch -N" when you generate
patches that apply to packages in Buildroot.

> diff --git a/package/policycoreutils/policycoreutils.mk b/package/policycoreutils/policycoreutils.mk
> new file mode 100644
> index 0000000..eeb8c5d
> --- /dev/null
> +++ b/package/policycoreutils/policycoreutils.mk
> @@ -0,0 +1,110 @@
> +################################################################################
> +#
> +# policycoreutils
> +#
> +################################################################################
> +
> +POLICYCOREUTILS_VERSION = 2.1.14
> +POLICYCOREUTILS_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20130423
> +POLICYCOREUTILS_LICENSE = GPLv2
> +POLICYCOREUTILS_LICENSE_FILES = COPYING
> +
> +# gettext for load_policy.c use of libintl_* functions
> +POLICYCOREUTILS_DEPENDENCIES = libsemanage libcap-ng $(if $(BR2_NEEDS_GETTEXT),gettext)
> +
> +ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
> +POLICYCOREUTILS_DEPENDENCIES += linux-pam
> +POLICYCOREUTILS_MAKE_OPTS += NAMESPACE_PRIV=y
> +define POLICYCOREUTILS_INSTALL_TARGET_LINUX_PAM_CONFS

This variable is not used anywhere.

> +	$(INSTALL) -D -m 0644 $(@D)/newrole/newrole-lspp.pamd $(TARGET_DIR)/etc/pam.d/newrole
> +	$(INSTALL) -D -m 0644 $(@D)/run_init/run_init.pamd $(TARGET_DIR)/etc/pam.d/run_init
> +endef
> +endif
> +
> +ifeq ($(BR2_PACKAGE_AUDIT),y)
> +POLICYCOREUTILS_DEPENDENCIES += audit
> +POLICYCOREUTILS_MAKE_OPTS += AUDIT_LOG_PRIV=y
> +endif
> +
> +# Enable LSPP_PRIV if both audit and linux pam are enabled
> +ifeq ($(BR2_PACKAGE_LINUX_PAM)$(BR2_PACKAGE_AUDIT),yy)
> +POLICYCOREUTILS_MAKE_OPTS += LSPP_PRIV=y
> +endif
> +
> +# Undefining _FILE_OFFSET_BITS here because of a "bug" with glibc fts.h
> +# large file support.
> +# See https://bugzilla.redhat.com/show_bug.cgi?id=574992 for more information
> +POLICYCOREUTILS_MAKE_OPTS += \
> +	CC="$(TARGET_CC)" \
> +	CFLAGS="$(TARGET_CFLAGS) -U_FILE_OFFSET_BITS" \
> +	LDFLAGS="$(TARGET_LDFLAGS) $(if $(BR2_NEEDS_GETTEXT),-lintl)" \

So you're passing some LDFLAGS here...

> +	ARCH="$(BR2_ARCH)" \
> +	LDFLAGS="-Wl,-rpath,$(HOST_DIR)/usr/lib"

... and overriding them immediately afterwards. And with something
completely bogus: it is completely broken to build *target* binaries
with an rpath pointing to $(HOST_DIR)/usr/lib. It doesn't make any
sense, so I'm not sure how this ended up here.

> +HOST_POLICYCOREUTILS_DEPENDENCIES = host-libsemanage host-dbus-glib host-sepolgen host-setools
> +
> +# Undefining _FILE_OFFSET_BITS here because of a "bug" with glibc fts.h
> +# large file support.
> +# See https://bugzilla.redhat.com/show_bug.cgi?id=574992 for more information
> +HOST_POLICYCOREUTILS_MAKE_OPTS = \
> +	CC="$(HOSTCC)" \
> +	CFLAGS="$(HOST_CFLAGS) -U_FILE_OFFSET_BITS" \
> +	PYTHON="$(HOST_DIR)/usr/bin/python" \
> +	PYTHON_INSTALL_ARGS="$(HOST_PKG_PYTHON_DISTUTILS_INSTALL_OPTS)" \
> +	ARCH="$(HOSTARCH)" \
> +	LDFLAGS="-Wl,-rpath,$(HOST_DIR)/usr/lib"

Please pass

	LDFLAGS="$(HOST_LDFLAGS)"

which already contains the -Wl,rpath,... dance.

Thanks!

Other than that, this patch looks good. Can you fix the remaining
issues, and send an updated version?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
