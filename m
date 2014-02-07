From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 07 Feb 2014 20:14:54 +0100
Subject: [Buildroot] [PATCH v7 1/4] eudev: new package.
In-Reply-To: <1391779295-19140-2-git-send-email-eric.le.bihan.dev@free.fr>
References: <1391779295-19140-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1391779295-19140-2-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <0104e701-c831-4366-8ae7-0c993afe377a@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

hi Eric,

Eric Le Bihan <eric.le.bihan.dev@free.fr> schreef:
>eudev is a userspace device management daemon. It is a standalone
>version, independent from systemd. It is a fork maintained by Gentoo.
>
>Features:
>
> - No extra configuration options are available: Gudev is build if
>   libglib2 is selected.
> - No dependency on hwdata as the package uses its own hardware
>   database (as does systemd).
>
>eudev 1.3 is in sync with systemd v207.
>
>Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
...
>diff --git a/package/eudev/Config.in b/package/eudev/Config.in
>new file mode 100644
>index 0000000..94d94e0
>--- /dev/null
>+++ b/package/eudev/Config.in
>@@ -0,0 +1,37 @@
>+config BR2_PACKAGE_EUDEV
>+	bool "eudev"
>+	depends on !BR2_avr32 # no epoll_create1
>+	depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV
>+	depends on BR2_LARGEFILE # util-linux
>+	depends on BR2_USE_WCHAR # util-linux
>+	depends on !BR2_PREFER_STATIC_LIB # kmod
>+	select BR2_PACKAGE_UTIL_LINUX
>+	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
>+	select BR2_PACKAGE_KMOD
>+	help
>+	  Userspace device daemon. This is a standalone version,
>+	  independent of systemd. It is a fork maintained by Gentoo.
>+
>+	  eudev requires a Linux kernel >= 2.6.34: it relies on devtmpfs
>+	  and inotify.
>+
>+	  http://github.com/gentoo/eudev/
>+
>+if BR2_PACKAGE_EUDEV
>+
>+config BR2_PACKAGE_EUDEV_RULES_GEN
>+	bool "enable rules generator"
>+	help
>+	  Enable persistent rules generator
>+
>+endif
>+
>+comment "eudev needs eudev /dev management"
>+	depends on !BR2_avr32
>+	depends on BR2_USE_MMU
>+	depends on !BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV
>+
>+comment "eudev needs a toolchain w/ largefile, wchar, dynamic library"
>+	depends on !BR2_avr32
>+	depends on BR2_USE_MMU
>+	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR || BR2_PREFER_STATIC_LIB

I don't see the mmu option on the main symbol, so either that or the comment dependencies are not correct..

Best regards,
Thomas
