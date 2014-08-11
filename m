From: Mike Williams <mike@mikebwilliams.com>
Date: Mon, 11 Aug 2014 14:44:35 -0400
Subject: [Buildroot] [PATCH 5/6] systemd: add hook to fix /run, /var
In-Reply-To: <53BC68D5.4070600@mind.be>
References: <1404406659-31109-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1404406659-31109-6-git-send-email-eric.le.bihan.dev@free.fr>
 <53BACE48.2070603@mind.be> <20140708130546.GA25364@rmm-p1267483>
 <53BC68D5.4070600@mind.be>
Message-ID: <CANPyyuMk-e_pWphO21Z2RMHp_-Xp-V7v4dc1CmJ_S4ZPMqYF3A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

Using the latest buildroot from git with systemd 215, timesyncd fails
to start with status 226/NAMESPACE. It appears to be due to
PrivateTmp=yes in the service file, and /var/tmp being a symlink. See
other bug reports for details:
https://bugzilla.redhat.com/show_bug.cgi?id=835131

Manually applying the steps in this patch to the target tree fixes the
problem and allows timesyncd to start properly.

Thanks,
Mike


On Tue, Jul 8, 2014 at 5:55 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 08/07/14 15:05, Eric Le Bihan wrote:
>> Hi!
>> On Mon, Jul 07, 2014 at 06:43:52PM +0200, Arnout Vandecappelle wrote:
>>> On 03/07/14 18:57, Eric Le Bihan wrote:
>>>> Add a post installation hook to fix target runtime data directories
>>>> /var/{lock,run,tmp} and /run. Theses directories will be populated by
>>>> systemd according to the configuration files from /usr/lib/tmpfiles.d.
>>>
>>>  I don't understand why this is needed, or how this can work...
>>>
>>>  Currently, /run, /var/run, /var/lock, and /var/tmp are all symlinks to /tmp
>>> where a tmpfs is mounted. I would expect that this is OK for systemd.
>>>
>>>  With this change, /run no longer links to /tmp, but it becomes a directory on
>>> the rootfs. So unless systemd mounts a tmpfs on /run, this won't work at all.
>>> And on my Debian sid system which uses systemd, I see that /run is mounted in
>>> /init in the initramfs, so before systemd is started. We don't do that in
>>> buildroot, so how can this work?
>>
>> When started, systemd will mount /run as tmpfs. Search for mount_table in
>> src/core/mount-setup.c in the source tree to see all the mount operations
>> performed.
>
>  It will not mount /run if it already is a mountpoint (after dereffing
> symlinks). At least, that's what it looks like to me. So in our case, /run ->
> /tmp and tmp being a tmpfs, it should be OK the way it is now.
>
>  But indeed, making /run a real directory doesn't break anything, because
> systemd will mount a tmpfs on it. However, do we really want two separate
> tmpfses, one for /run and a different one for /tmp?
>
>
>> Once running, systemd will start the service systemd-tmpfiles [1], which is in
>> charge of populating the volatile and temporary files and directories,
>> according to configuration files [2] located in /usr/lib/tmpfiles.d/.
>>
>> The link from /run to /var/run is mentioned in var.conf:
>>
>>   L /var/run - - - - ../run
>>
>> /var/tmp is handled from tmp.conf:
>>
>>   d /tmp 1777 root root 10d
>>   d /var/tmp 1777 root root 30d
>>
>> /var/lock is handled from legacy.conf
>>
>>   L /var/lock - - - - ../run/lock
>>
>> And I've just noticed etc.conf will handle the creation of the symlink for
>> /etc/resolv.conf, so I can simplify my post installation hook :-)
>>
>>   L /etc/resolv.conf - - - - ../run/systemd/resolve/resolv.conf
>
>  Er, no: /etc may be readonly, so systemd-tmpfiles can't create the symlink.
>
>>
>> We can see that for /var/run and /var/tmp, the types 'd' and 'L' are used,
>> which means that if the directories/symlinks exist (created by the target
>> skeleton), systemd-tmpfiles will not touch them. /var/run not being a symlink
>> to /run made systemd-networkd not work properly on my system.
>
>  OK, so the fact that /var/run is a symlink to /tmp and /run is also a symlink
> to /tmp is not enough?
>
>
>  Conclusions:
>
> - This patch does seem to work after all.
>
> - I personally don't like how it messes with the skeleton.
>
> - I don't really like having two tmpfses (one for /tmp and a different one for
> /run) either.
>
> - Maybe it's better to make part of these changes in the default skeleton
> instead. E.g., changing the symlink of /var/run to point to /run instead of /tmp
> would be fine. Making /run a directory would not be OK, so if that is really
> necessary for systemd, then a fixup like this is needed.
>
>
>
>  Regards,
>  Arnout
>
>
>>
>> Best regards,
>> ELB
>>
>> [1] http://www.freedesktop.org/software/systemd/man/systemd-tmpfiles.html
>> [2] http://www.freedesktop.org/software/systemd/man/tmpfiles.d.html
>>
>>
>
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
