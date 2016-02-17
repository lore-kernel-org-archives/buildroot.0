From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 Feb 2016 22:19:00 +0100
Subject: [Buildroot] [PATCH v2 1/1] libcapn : new package
In-Reply-To: <1455732246-27866-1-git-send-email-sagaert.johan@proximus.be>
References: <1455732246-27866-1-git-send-email-sagaert.johan@proximus.be>
Message-ID: <20160217221900.1ee0f081@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Johan,

Thanks for this patch! See some comments below.

On Wed, 17 Feb 2016 19:04:06 +0100, Sagaert Johan wrote:
> libcapn is a C Library to interact with the Apple Push Notification Service
> (APNs for short) using simple and intuitive API.
> With the library you can easily send push notifications to iOS and OS X (>= 10.8) devices.

The commit log should be wrapper to ~80 characters.

> The patches remove the jansson git submodule requirement
> and links against the jansson Builtroot package instead.

Buildroot.


> diff --git a/package/libcapn/0001-use-global-jansson-include-file.patch b/package/libcapn/0001-use-global-jansson-include-file.patch
> new file mode 100644
> index 0000000..8e89b7e
> --- /dev/null
> +++ b/package/libcapn/0001-use-global-jansson-include-file.patch
> @@ -0,0 +1,26 @@
> +From d696407e5fe6d14ac18f4b63532c4eaa80699fa3 Mon Sep 17 00:00:00 2001
> +From: Sagaert Johan <sagaert.johan@proximus.be>
> +Date: Wed, 17 Feb 2016 10:05:13 +0100
> +Subject: [PATCH 1/3] use global jansson include file
> +
> +Signed-off-by: Sagaert Johan <sagaert.johan@proximus.be>

I think patches 0001 and 0002 should be together. They really serve the
same purpose: linking with an external jansson library instead of the
bundled one.

> diff --git a/package/libcapn/0002-remove-the-jansson-git-submodule-requirements.patch b/package/libcapn/0002-remove-the-jansson-git-submodule-requirements.patch
> new file mode 100644
> index 0000000..7de9095
> --- /dev/null
> +++ b/package/libcapn/0002-remove-the-jansson-git-submodule-requirements.patch
> @@ -0,0 +1,54 @@
> +From e418621d70d05ca9b77de6a1d369ff01266a3347 Mon Sep 17 00:00:00 2001
> +From: Sagaert Johan <sagaert.johan@proximus.be>
> +Date: Wed, 17 Feb 2016 10:05:58 +0100
> +Subject: [PATCH 2/3] remove the jansson git submodule requirements
> +
> +Signed-off-by: Sagaert Johan <sagaert.johan@proximus.be>

I understand what you did, but unfortunately, you did it in a way that
cannot be accepted by the upstream project. Could you rework this to
make using an external jansson library an option? This way, your
patches can be submitted to the upstream libcapn project, and we can
get rid of them from Buildroot once they make a new release.

> diff --git a/package/libcapn/0003-remove-ld.so.conf.d-creation.patch b/package/libcapn/0003-remove-ld.so.conf.d-creation.patch
> new file mode 100644
> index 0000000..1605b37
> --- /dev/null
> +++ b/package/libcapn/0003-remove-ld.so.conf.d-creation.patch
> @@ -0,0 +1,29 @@
> +From e5d1accd8dca48639dea6f7c98501b1040652cea Mon Sep 17 00:00:00 2001
> +From: Sagaert Johan <sagaert.johan@proximus.be>
> +Date: Wed, 17 Feb 2016 10:12:58 +0100
> +Subject: [PATCH 3/3] remove ld.so.conf.d creation
> +
> +Signed-off-by: Sagaert Johan <sagaert.johan@proximus.be>

Same thing here, it should be made conditional.

> diff --git a/package/libcapn/Config.in b/package/libcapn/Config.in
> new file mode 100644
> index 0000000..5b25910
> --- /dev/null
> +++ b/package/libcapn/Config.in
> @@ -0,0 +1,13 @@
> +config BR2_PACKAGE_LIBCAPN
> +	bool "libcapn"
> +	select BR2_PACKAGE_OPENSSL
> +	select BR2_PACKAGE_JANSSON
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_6

If you have this dependency, you should have a Config.in comment.

> diff --git a/package/libcapn/libcapn.mk b/package/libcapn/libcapn.mk
> new file mode 100644
> index 0000000..df8e162
> --- /dev/null
> +++ b/package/libcapn/libcapn.mk
> @@ -0,0 +1,18 @@
> +################################################################################
> +#
> +# libcapn
> +#
> +################################################################################
> +
> +LIBCAPN_VERSION = 7a6dc662e9daa864f687
> +LIBCAPN_SITE = $(call github,adobkin,libcapn,$(LIBCAPN_VERSION))
> +LIBCAPNLICENSE = MIT

Typo.

Please add LIBCAPN_LICENSE_FILES as well.

> +LIBCAPN_DEPENDENCIES += jansson openssl

Use = instead of += here.

> +LIBCAPN_INSTALL_STAGING = YES
> +LIBCAPN_CONF_OPTS = -DCMAKE_BUILD_TYPE=Release \

This is already passed by the CMake package infrastructure, so it is
useless (and wrong when BR2_ENABLE_DEBUG is enabled).

> +  -DAPN_HAVE_GLIBC_STRERROR_R=OFF \
> +  -DAPN_HAVE_POSIX_STRERROR_R=OFF \
> +  -DAPN_HAVE_GLIBC_STRERROR_R__TRYRUN_OUTPUT=OFF \
> +  -DAPN_HAVE_POSIX_STRERROR_R__TRYRUN_OUTPUT=OFF 

I'm pretty sure those could be set to "ON" when glibc is used, but I
guess OFF is a sane default, and if it builds and works this way, fair
enough.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
