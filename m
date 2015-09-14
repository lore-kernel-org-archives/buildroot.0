From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 14 Sep 2015 18:05:52 +0200
Subject: [Buildroot] [RFC 3/6] system: add mdev-only /dev management
 (without devtmpfs)
In-Reply-To: <20150909132929.5c01433e@free-electrons.com>
References: <1441747734-18730-1-git-send-email-luca@lucaceresoli.net>
 <1441747734-18730-4-git-send-email-luca@lucaceresoli.net>
 <20150909132929.5c01433e@free-electrons.com>
Message-ID: <55F6F060.2060901@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

Thomas Petazzoni wrote:
> Luca,
>
> On Tue,  8 Sep 2015 23:28:51 +0200, Luca Ceresoli wrote:
>> There are a few reasons for an embedded Linux system not to use devtmpfs,
>> but still want to have dynamic /dev management. The most notable is to use
>> a kernel < 2.6.32, which have no devtmpfs support.
>>
>> For such corner cases, we introduce the ability to use busybox mdev for
>> /dev management even without devtmpfs.
>>
>> First, we need the BR2_ROOTFS_STATIC_DEVICE_TABLE just like the static
>> /dev management, in order to have the very basic devices such as /dev/null
>> and /dev/console until mdev is enabled.
>
> As said in another e-mail, this is not really true: we just need a very
> simple, two devices long, hard-coded device table. There is no need to
> allow the user to customize it. It would in fact be potentially
> misleading because the user who would add more devices in this static
> device table would not see them on the target: they would be
> "overridden" by the tmpfs mounted in /dev.

Yup, I did that in patch 4.

But now I removed that patch, and replaced with a different
implementation based on Arnout's suggestion of using BUSYBOX_DEVICES.

>
>> But doing this in S10mdev, which already does something similar, would be a
>> bit complex because when S10mdev runs /dev/shm and /dev/pts are already
>> mounted. We might unmount, recreate and mount them again, but devices in
>> them might be already in use. Or we could leave the "old" alone, and mount
>> them again in the newly created /dev. Both solutions are dirty and
>> potentially problematic.
>>
>> Instead we hook in inittab (both busybox and sysvinit) and do the same
>> incantations there, right after mounting /sys (needed for mdev) but before
>> any other actions on /dev, such as creating and mounting /dev/shm and
>> /dev/pts. We also skip installing S10mdev: it would do the same things
>> twice. In order to keep the inittab files concise and maintainable, this
>> taks is delegated to a helper script, /sbin/activate-mdev.
>
> taks -> task

Sure.

>
> One thing I dislike a bit is that there is quite a bit overlap between
> S10mdev and activate-mdev. As Arnout suggested, can you just mount a
> tmpfs in /dev in the inittab in the "mdev without devtmpfs" case, and
> then keep the normal S10mdev script?

v2 will do things this way.

>
>> diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
>> index 6e302f4..f95ff52 100644
>> --- a/package/busybox/busybox.mk
>> +++ b/package/busybox/busybox.mk
>> @@ -55,11 +55,18 @@ define BUSYBOX_PERMISSIONS
>>   endef
>>
>>   # If mdev will be used for device creation enable it and copy S10mdev to /etc/init.d
>> +ifeq ($(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV)$(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV_ONLY),y)
>>   ifeq ($(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV),y)
>>   define BUSYBOX_INSTALL_MDEV_SCRIPT
>>   	$(INSTALL) -D -m 0755 package/busybox/S10mdev \
>>   		$(TARGET_DIR)/etc/init.d/S10mdev
>>   endef
>> +else
>> +define BUSYBOX_INSTALL_MDEV_SCRIPT
>> +	$(INSTALL) -D -m 0755 package/busybox/activate-mdev \
>> +		$(TARGET_DIR)/sbin/activate-mdev
>> +endef
>> +endif
>
> Any reason to enclose the internal condition inside a bigger condition?
>
> (Of course, this becomes moot if we can use S10mdev in both cases)

Indeed, I removed entirely that script in the next iteration.

>
>> diff --git a/package/skeleton/skeleton.mk b/package/skeleton/skeleton.mk
>> index 48e7085..975e2a5 100644
>> --- a/package/skeleton/skeleton.mk
>> +++ b/package/skeleton/skeleton.mk
>> @@ -141,6 +141,7 @@ TARGET_FINALIZE_HOOKS += SKELETON_SYSTEM_GETTY
>>   endif
>>
>>   ifeq ($(BR2_INIT_BUSYBOX)$(BR2_INIT_SYSV),y)
>> +
>
> Not really related to the change.

I just wanted to highlight the two main blocks inside that ifeq:
[un]commenting read-write mount and [un]commenting the mdev line. The
code there is lengthy and not very readable IMHO. But ok, removed that.

>> diff --git a/system/Config.in b/system/Config.in
>> index 5bf5048..a10de1e 100644
>> --- a/system/Config.in
>> +++ b/system/Config.in
>> @@ -106,6 +106,10 @@ choice
>>   config BR2_ROOTFS_DEVICE_CREATION_STATIC
>>   	bool "Static using device table"
>>
>> +config BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV_ONLY
>> +	bool "Dynamic using mdev only"
>> +	select BR2_PACKAGE_BUSYBOX
>> +
>>   config BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS
>>   	bool "Dynamic using devtmpfs only"
>>
>> @@ -144,7 +148,7 @@ config BR2_ROOTFS_DEVICE_TABLE
>>   config BR2_ROOTFS_STATIC_DEVICE_TABLE
>>   	string "Path to the device tables"
>>   	default "system/device_table_dev.txt"
>> -	depends on BR2_ROOTFS_DEVICE_CREATION_STATIC
>> +	depends on BR2_ROOTFS_DEVICE_CREATION_STATIC || BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV_ONLY
>
> As suggested above, we probably don't want to show this option in the
> BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV_ONLY case.

That's not present in v2.

-- 
Luca
