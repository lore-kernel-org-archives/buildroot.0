From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 9 Apr 2021 15:07:55 +0200
Subject: [Buildroot] - Question: How to change safely /var/log --> /tmp
 in buildroot
In-Reply-To: <5b302df4-b83b-f46b-28cd-235c2779e851@inbox.ru>
References: <c2d6ee0a-995c-b403-b21c-2dd642104c6b@gmail.com>
 <e7b52c9d-e255-21c8-26f2-8637e15868a6@inbox.ru>
 <02af48b6-e128-6b75-5f38-220ff4b6ed67@gmail.com>
 <5b302df4-b83b-f46b-28cd-235c2779e851@inbox.ru>
Message-ID: <fbf51b52-48f5-1457-6564-af445519d837@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 08/04/2021 17:08, Maxim Kochetkov via buildroot wrote:
> 1. You can implement your own skeleton (based on your current skeleton)
> 2. You can modify your target rootfs by rootfs-overlay (BR2_ROOTFS_OVERLAY)
> 3. You can modify your target rootfs by BR2_ROOTFS_POST_BUILD_SCRIPT
> 
> The easiest way is 2.

> I would recommend you to create your own skeleton.

 I would say option 2 is better. With your own skeleton, you have to make sure
that you don't forget anything, it's more complicated if you want to change
something (e.g. switch to systemd, or upgrade buildroot), and there's always a
possibility that some other package still messes with your changes. With an
overlay, you know exactly what happens.

> 
> 08.04.2021 17:39, Marko Stanisic ?????:
>> Thank you for the fast response,
>>
>> is it possible to overwrite that behaviour by introducing an overlay
>> filesystem and
>>
>> ???? (1) create a "relative" symlink /var/log --> ../tmp/LOG", and afterwards

 You don't need that, just create an empty /var/log directory in the overlay,
and then mount mmcblk0p9 on /var/log.

>>
>> ???? (2) mount /tmp/LOG --> /mmcblk0p9
>>
>> I already? testet it manually on the board, but still not sure how to
>> implement (2) :
>>
>> ??? 2.1) postimage.sh (which i use to create the images)
>>
>> ???? 2.2) or as an init script in init.d

 Put a custom /etc/fstab in your overlay (assuming you're using sysvinit or
busybox init). The default inittab mounts everything from fstab.


 For a more complete system, you may need to do an mkfs and/or fsck on the
partition. In that case, an init script will be needed, and that init script can
just as well do the mounting. E.g. you may want to make it failsafe by doing:

- fsck; if it fails with errors, goto format.
- mount; if it fails, goto format, else exit
- format: mkfs and mount, exit if successful
- failsafe: if all else fails, mount a tmpfs on it.


 Regards,
 Arnout

>>
>>
>> (3) take your solution and chnage behaviour in skeleton-init-sysv or
>> skeleton-init-openrc package
>> if that is possible
>>
>>
>> Thanks again for everyy support!!!
>>
>>
>>
>> On 08/04/2021 16:32, Maxim Kochetkov wrote:
>>> Hi, Marko
>>>
>>> 08.04.2021 16:41, Marko Stanisic ?????:
>>>> Hello,
>>>>
>>>> I have no clue how? the symlink? /var/log --> ../tmp is statically defined.
>>>> (in buildroot)
>>>>
>>>
>>>
>>> This link is created by skeleton-init-sysv or skeleton-init-openrc package
>>>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
