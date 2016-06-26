From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jun 2016 23:04:42 +0200
Subject: [Buildroot] [4/8 v5] libsemanage: bump to version 2.5
In-Reply-To: <1466971401-29360-5-git-send-email-Aduskett@gmail.com>
References: <1466971401-29360-1-git-send-email-Aduskett@gmail.com>
 <1466971401-29360-5-git-send-email-Aduskett@gmail.com>
Message-ID: <20160626230442.109e7b5c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 26 Jun 2016 16:03:17 -0400, Adam Duskett wrote:
> In addition to bumping the version to 2.5, added a check in the make
> file to see if BR2_PACKAGE_POLICYCOREUTILS is selected. If it is
> host-audit is added as a dependency.

Please don't do this. The policycoreutils package doesn't exist in
Buildroot, so BR2_PACKAGE_POLICYCOREUTILS doesn't exist. For this
reason, your patch cannot be merged.

> (Note that policycoreutils is not yet available, but is being worked on
> by another contributor.)

Please either take over the submission of the policycoreutils package
(I doubt the other contributor will continue to work on it), or drop
the policycoreutils-related part of this patch.

> -LIBSEMANAGE_VERSION = 2.1.10
> -LIBSEMANAGE_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20130423
> +LIBSEMANAGE_VERSION = 2.5
> +LIBSEMANAGE_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20160223
>  LIBSEMANAGE_LICENSE = LGPLv2.1+
>  LIBSEMANAGE_LICENSE_FILES = COPYING
> -LIBSEMANAGE_DEPENDENCIES = host-bison host-flex libselinux ustr bzip2
> +LIBSEMANAGE_DEPENDENCIES = host-bison host-flex audit libselinux ustr bzip2

So audit is now a mandatory dependency ?

>  LIBSEMANAGE_INSTALL_STAGING = YES
>  
>  LIBSEMANAGE_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS)
> @@ -27,8 +27,13 @@ define LIBSEMANAGE_INSTALL_TARGET_CMDS
>  	$(MAKE) -C $(@D) $(LIBSEMANAGE_MAKE_OPTS) DESTDIR=$(TARGET_DIR) install
>  endef
>  
> -HOST_LIBSEMANAGE_DEPENDENCIES = host-bison host-libsepol host-libselinux \
> +HOST_LIBSEMANAGE_DEPENDENCIES = host-bison host-audit host-libsepol host-libselinux \
>  				host-ustr host-bzip2 host-swig
> +
> +ifeq ($(BR2_PACKAGE_POLICYCOREUTILS),y)
> +HOST_LIBSEMANAGE_DEPENDENCIES += host-audit

This is useless. You are already adding host-audit as a mandatory
dependency of host-libsemanage two lines before.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
