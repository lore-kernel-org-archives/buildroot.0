From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 06 Jul 2015 15:59:51 +0200
Subject: [Buildroot] [PATCH 2/2] rtl8188eu: new package
In-Reply-To: <20150706151750.456bbb6c@free-electrons.com>
References: <1436188175-7912-1-git-send-email-luca@lucaceresoli.net>	<1436188175-7912-2-git-send-email-luca@lucaceresoli.net>
 <20150706151750.456bbb6c@free-electrons.com>
Message-ID: <559A89D7.5010400@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

Thomas Petazzoni wrote:
> Luca,
>
> On Mon,  6 Jul 2015 15:09:35 +0200, Luca Ceresoli wrote:
>
>> diff --git a/package/rtl8188eu/Config.in b/package/rtl8188eu/Config.in
>> new file mode 100644
>> index 0000000..3228c67
>> --- /dev/null
>> +++ b/package/rtl8188eu/Config.in
>> @@ -0,0 +1,18 @@
>> +config BR2_PACKAGE_RTL8188EU
>> +	bool "rtl8188eu"
>> +	depends on BR2_LINUX_KERNEL && !BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS
>
> Even though my understanding of firmware loading is not very deep, I
> believe this is wrong. Since quite some time, the kernel has been able
> to load firmware by itself, without the help of a userspace helper
> program.

Unless I'm wrong, this feature is only available since 3.7
(abb139e75c2: "firmware: teach the kernel to load firmware files
directly from the filesystem").

But your suggestion is applicable for versions 3.7 to 3.11.

So I should drop the dependency on
!BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS and clearly point out in
the help text that you must set up some firmware loading mechanism, and
let users discover on their own how they should achieve that.

Overall, the available choices for firmware loading are:
  - the kernel-only mechanism (3.7+ only)
  - /dev management by mdev ot udev
  - static /dev management + BR2_ROOTFS_MDEV_FIRMWARE_LOADING (patch 1
    of this series).

Should we add a section to the manual about this? We have a few words 
under "/dev management", but they do not encompass the kernel-only
loading.

BTW, my use case here is a 2.6.30 kernel, which has no devtmpfs and no
kernel-only firmware loading. So I must use static /dev management, and
still install mdev as a hotplug helper for firmware loading.

-- 
Luca
