From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 28 Nov 2014 22:41:17 +0100
Subject: [Buildroot] [PATCH] btrfs-progs: fix static build
In-Reply-To: <2de1279dcd485fe0a9dda147272221766bb7e187.1417159092.git.baruch@tkos.co.il>
References: <2de1279dcd485fe0a9dda147272221766bb7e187.1417159092.git.baruch@tkos.co.il>
Message-ID: <20141128224117.7a3f2f95@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Fri, 28 Nov 2014 09:18:12 +0200, Baruch Siach wrote:

> diff --git a/package/btrfs-progs/btrfs-progs.mk b/package/btrfs-progs/btrfs-progs.mk
> index d16fa0d9aa6f..7122df1b0e76 100644
> --- a/package/btrfs-progs/btrfs-progs.mk
> +++ b/package/btrfs-progs/btrfs-progs.mk
> @@ -17,6 +17,10 @@ BTRFS_PROGS_LICENSE_FILES = COPYING
>  ifeq ($(BR2_PREFER_STATIC_LIB),y)
>  BTRFS_PROGS_MAKE_TARGET = static
>  BTRFS_PROGS_MAKE_INSTALL_TARGET = install-static
> +ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
> +# Add -lintl for libuuid
> +BTRFS_PROGS_MAKE_FLAGS += lib_LIBS="-luuid -lblkid -lm -lz -llzo2 -L. -lintl"
> +endif

This is really ugly and not maintainable, we are doing this all over
the place to solve static linking issues, and it's going to be a
never-ending story. If the package doesn't use pkg-config, can't we at
least use it here, like:

	lib_LIBS="$(shell pkg-config ...)"

 ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
