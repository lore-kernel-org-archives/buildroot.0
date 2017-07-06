From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Wed, 5 Jul 2017 17:17:22 -0700
Subject: [Buildroot] [PATCH] fs/cpio/init: remout / as read-only as a
 first step
In-Reply-To: <7ec73871-5122-7b03-46ed-082ba7d76dcc@mind.be>
References: <20170704190104.24703-1-andrew.smirnov@gmail.com>
 <87r2xvynm0.fsf@dell.be.48ers.dk>
 <CAHQ1cqF1GHw0_E3rxuPqZMpLoWBhy=3ieCmTUOyz-7x551p0KQ@mail.gmail.com>
 <7ec73871-5122-7b03-46ed-082ba7d76dcc@mind.be>
Message-ID: <CAHQ1cqG909gytGpyG0qcDqJVvWWAPETVe1u1qRcDZC3iBk5w+w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jul 5, 2017 at 3:18 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
> On 05-07-17 22:52, Andrey Smirnov wrote:
>> On Wed, Jul 5, 2017 at 7:17 AM, Peter Korsgaard <peter@korsgaard.com> wrote:
>>>>>>>> "Andrey" == Andrey Smirnov <andrew.smirnov@gmail.com> writes:
>>>
>>>  > When /init is present on root file system kernel does not take into
>>>  > accout kernel arguments such as "ro" and does not remount root as
>>>  > read-only. So prior to this commit the system would continue booting
>>>  > with "rw" root filesystem until corresponding line in /etc/fstab to
>>>  > remount it as "ro" was processed.
>>>
>>>  > Change the code to immediately remount / as read-only and rely on
>>>  > /etc/fstab processing to remount it as "rw" if that is what's selected
>>>  > in Buildroot configuration.
>>>
>>>  > Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
>>>
>>> I see what you're getting at, but this doesn't actually work (with
>>> busybox mount at least):
>>>
>>> NET: Registered protocol family 17
>>> Freeing unused kernel memory: 2528K
>>> This architecture does not have kernel memory protection.
>>> mount: can't read '/proc/mounts': No such file or directory
>>> Starting logging: OK
>>> Initializing random number generator... done.
>>>
>>> The reason is that mount had to read the current mount flags (either
>>> directly in /proc/mounts or through /etc/mtab depending on busybox
>>> config, but we symlink /etc/mtab to /proc/mounts) to be able to remount,
>>> and as /proc is not mounted in an initramfs this doesn't work.
>>>
>>
>> Hmm, fascinating. I think the reason why I didn't see this and why it
>> worked for me is because systemd selects BR2_PACKAGE_UTIL_LINUX_MOUNT
>> and my system is using it instead of what busybox provides.
>>
>>> We could conceptually mount /proc in /init as well, but then things gets
>>> confusing when /sbin/init does it again.
>>>
>>> I don't see any clean way of doing this without adding quite some
>>> complexity, and I think your usecase (systemd in initramfs that you want
>>> ro) is so special that I would suggest you just use a custom /init in
>>> your rootfs overlay.
>>>
>>
>> What about either of the following:
>>
>> - Adding that line and silencing errors, so that on on systems with
>> busybox's mount it would be effectively a no-op and systems that use
>> util-linux it would achieve desired results?
>>
>> - Making BR2_TARGET_ROOTFS_CPIO select BR2_PACKAGE_UTIL_LINUX_MOUNT?
>>
>> - Optionally adding that line if BR2_PACKAGE_UTIL_LINUX_MOUNT?
>
>  All of this is fairly complicated for something that is really a corner case.
>
>
>> - Adding a note to fs/cpio/Config.in that root filesystem will become
>> read-only only after corresponding line in /etc/fstab is processed
>> successfully?
>
>  The thing is, depending on various circumstances, the kernel may start the
> rootfs either rw or ro. It's pretty complicated. It's not even specific for
> cpio/initramfs (except that in that case it always starts rw so it's in fact
> simpler).
>
>  You *might* add a comment like that in the BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW
> option, but even that is a bit too much detail I think.
>
>
>> I am more than happy to alter the patch to accommodate for either of
>> the above or just drop it and keep this change private to my buildroot
>> customization layer.
>
>  Yes, just put your version of /init in your fs-overlay and Bob's your uncle.
>

OK sounds good. Disregard this patch then.

Thanks,
Andrey Smirnov
