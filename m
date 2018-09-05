From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 5 Sep 2018 16:30:38 +0300
Subject: [Buildroot] [PATCH v2 1/1] encfs: new package
In-Reply-To: <1535957893-20219-1-git-send-email-yairba@tkos.co.il>
References: <1535957893-20219-1-git-send-email-yairba@tkos.co.il>
Message-ID: <20180905133038.ap35penf4lvuklly@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yair,

On Mon, Sep 03, 2018 at 09:58:13AM +0300, Yair Ben Avraham wrote:
> EncFS: an Encrypted Filesystem for FUSE.
> 
> Signed-off-by: Yair Ben Avraham <yairba@tkos.co.il>

[...]

> diff --git a/package/encfs/encfs.hash b/package/encfs/encfs.hash
> new file mode 100644
> index 0000000..2375a0b
> --- /dev/null
> +++ b/package/encfs/encfs.hash
> @@ -0,0 +1,9 @@
> +# Locally calculated after checking pgp signature
> +# https://github.com/vgough/encfs/releases/download/v1.9.5/encfs-1.9.5.tar.gz.asc
> +# with primary key fingerprint: FFF3 E014 44FE D7C3 16A3  545A 895F 5BC1 23A0 2740
> +sha256	4709f05395ccbad6c0a5b40a4619d60aafe3473b1a79bafb3aa700b1f756fd63	encfs-1.9.5.tar.gz
> +
> +# Hash for license files:
> +sha256	fdba14f0ecddd3e6d31a76177045d99df90070e6377967fdbfbc616166e0dcce	COPYING
> +sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	COPYING.GPL
> +sha256	da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768	COPYING.LGPL
> diff --git a/package/encfs/encfs.mk b/package/encfs/encfs.mk
> new file mode 100644
> index 0000000..fafe6f9
> --- /dev/null
> +++ b/package/encfs/encfs.mk
> @@ -0,0 +1,24 @@
> +################################################################################
> +#
> +# encfs
> +#
> +################################################################################
> +
> +ENCFS_VERSION = 1.9.5
> +ENCFS_SOURCE = encfs-$(ENCFS_VERSION).tar.gz

This is the default, so not needed.

> +ENCFS_SITE = https://github.com/vgough/encfs/releases/download/v$(ENCFS_VERSION)
> +ENCFS_LICENSE = LGPL (libencfs), GPL, MIT (easylogging++)

We use SPDX license identifiers. These identifiers denote the license version, 
and whether "any later version" applies. So in this case:

  ENCFS_LICENSE = LGPL-3.0+ (libencfs), GPL-2.0+, MIT (easylogging++)

> +ENCFS_LICENSE_FILES = COPYING COPYING.GPL COPYING.LGPL
> +ENCFS_DEPENDENCIES = \
> +	libfuse openssl libglib2 $(if $(BR2_PACKAGE_LIBICONV),libiconv)
> +
> +# The CMAKE_RUNTIME_OUTPUT_DIRECTORY variable is needed to avoid the error
> +# message during linking the CXX executables:
> +# arm-buildroot-linux-uclibcgnueabihf/bin/ld: cannot open output file encfs: Is a directory
> +ENCFS_CONF_OPTS += \
> +        -DCMAKE_USE_INTERNAL_TINYXML=OFF \

Isn't tinyxml2 a mandatory dependency? INSTALL.md indicates that it is.

If tinyxml2 is indeed a mandatory dependency you should add it as an optional 
dependency, so that the Buildroot tinyxml2 package is used when 
BR2_PACKAGE_TINYXML2 is enabled. Otherwise, the bundled library is used, and 
you should add its license (zlib) to ENCFS_LICENSE.

> +        -DFUSE_INCLUDE_DIR=$(STAGING_DIR)/libfuse* \

Are you sure this is correct? There are no libfuse* files or directories under 
$(STAGING_DIR). Maybe '-DFUSE_INCLUDE_DIR=$(STAGING_DIR)/usr/include' ?

> +        -DBUILD_UNIT_TESTS=0 \
> +        -DCMAKE_RUNTIME_OUTPUT_DIRECTORY=$(BUILD_DIR)/usr/bin
> +
> +$(eval $(cmake-package))

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
