From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Jul 2016 23:48:16 +0200
Subject: [Buildroot] [PATCH v11 1/2] package/btrfs-progs: install to
 staging directory
In-Reply-To: <1469394628-19412-1-git-send-email-christian@paral.in>
References: <1469394628-19412-1-git-send-email-christian@paral.in>
Message-ID: <20160724234816.63c8bff9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 24 Jul 2016 14:10:27 -0700, Christian Stewart wrote:

> diff --git a/package/btrfs-progs/btrfs-progs.mk b/package/btrfs-progs/btrfs-progs.mk
> index 2c3dc50..8d50eb4 100644
> --- a/package/btrfs-progs/btrfs-progs.mk
> +++ b/package/btrfs-progs/btrfs-progs.mk
> @@ -11,6 +11,7 @@ BTRFS_PROGS_DEPENDENCIES = host-pkgconf e2fsprogs lzo util-linux zlib
>  BTRFS_PROGS_CONF_OPTS = --disable-backtrace
>  BTRFS_PROGS_LICENSE = GPLv2
>  BTRFS_PROGS_LICENSE_FILES = COPYING
> +BTRFS_PROGS_INSTALL_STAGING = YES
>  
>  # Doesn't autodetect static-only and tries to build both
>  ifeq ($(BR2_STATIC_LIBS),y)

Unfortunately, this breaks the build in a BR2_STATIC_LIBS=y
configuration. So I've tried adding:

BTRFS_PROGS_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) install-static

in the existing ifeq ($(BR2_STATIC_LIBS),y). It fixes the build but it
isn't correct: it only installs the programs, and not the headers and
the static library.

So it seems like a btrfs-progs patch is needed to make this whole thing
work properly :-/

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
