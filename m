From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Jul 2015 15:17:50 +0200
Subject: [Buildroot] [PATCH 2/2] rtl8188eu: new package
In-Reply-To: <1436188175-7912-2-git-send-email-luca@lucaceresoli.net>
References: <1436188175-7912-1-git-send-email-luca@lucaceresoli.net>
 <1436188175-7912-2-git-send-email-luca@lucaceresoli.net>
Message-ID: <20150706151750.456bbb6c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Luca,

On Mon,  6 Jul 2015 15:09:35 +0200, Luca Ceresoli wrote:

> diff --git a/package/rtl8188eu/Config.in b/package/rtl8188eu/Config.in
> new file mode 100644
> index 0000000..3228c67
> --- /dev/null
> +++ b/package/rtl8188eu/Config.in
> @@ -0,0 +1,18 @@
> +config BR2_PACKAGE_RTL8188EU
> +	bool "rtl8188eu"
> +	depends on BR2_LINUX_KERNEL && !BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS

Even though my understanding of firmware loading is not very deep, I
believe this is wrong. Since quite some time, the kernel has been able
to load firmware by itself, without the help of a userspace helper
program.

See
http://lxr.free-electrons.com/source/drivers/base/firmware_class.c#L1089.
It first tries to load the firmware through a userspace helper. But if
that doesn't work, it falls back to fw_get_filesystem_firmware(), which
makes the kernel directly load the firmware itself.

See also:

config FW_LOADER_USER_HELPER_FALLBACK
        bool "Fallback user-helper invocation for firmware loading"
        depends on FW_LOADER
        select FW_LOADER_USER_HELPER
        help
          This option enables / disables the invocation of user-helper
          (e.g. udev) for loading firmware files as a fallback after the
          direct file loading in kernel fails.  The user-mode helper is
          no longer required unless you have a special firmware file that
          resides in a non-standard path. Moreover, the udev support has
          been deprecated upstream.

          If you are unsure about this, say N here.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
