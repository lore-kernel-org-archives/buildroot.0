From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed, 9 Sep 2015 14:29:36 +0200
Subject: [Buildroot] [RFC 3/6] system: add mdev-only /dev management
 (without devtmpfs)
In-Reply-To: <55EFF9FF.1020402@mind.be>
References: <1441747734-18730-1-git-send-email-luca@lucaceresoli.net>
 <1441747734-18730-4-git-send-email-luca@lucaceresoli.net>
 <55EFF9FF.1020402@mind.be>
Message-ID: <55F02630.5050500@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout,

Arnout Vandecappelle wrote:
> On 08-09-15 23:28, Luca Ceresoli wrote:
>> +++ b/package/busybox/inittab
>> @@ -16,6 +16,7 @@
>>   # Startup the system
>>   null::sysinit:/bin/mount -t proc proc /proc
>>   null::sysinit:/bin/mount -t sysfs sysfs /sys
>> +#null::sysinit:/sbin/activate-mdev
>
>   Excuse my stupidity, but wouldn't it be enough to add the following here:
>
> null::sysinit:/bin/mount -t tmpfs mdev /dev
>
> and keep on using S10mdev? That is less invasive, and it should work since it's
> more or less the same as what is done in the cpio/initramfs case.

Good idea, with a couple caveats.

The first problem is we'd have an empty /dev since the mount until the
execution of S10mdev. This prevents busybox init from executing all
lines in inittab after the mount, since they would try to open
/dev/null. Symptom: "can't open /dev/null: No such file or directory".
The fix should be simply:

-null::sysinit:/bin/mkdir -p /dev/pts
-null::sysinit:/bin/mkdir -p /dev/shm
-null::sysinit:/bin/mount -a
-null::sysinit:/bin/hostname -F /etc/hostname
+::sysinit:/bin/mkdir -p /dev/pts
+::sysinit:/bin/mkdir -p /dev/shm
+::sysinit:/bin/mount -a
+::sysinit:/bin/hostname -F /etc/hostname

Lines up to the /dev mount might be changed as well to have a more
uniform style, but it's not strictly needed.

I'll check if sysvinit init has any issues.

But ehen, if any user has an S05something that uses /dev, it would
break. In order to reduce the risk to nearly zero, we might move
S10mdev to S00mdev, so it runs (most likely) as the first script.

This would slightly change the current behaviour for all cases, and
start S01logging after mdev, not before. I tested it quickly and it
looks like it works. Can you think of any problem with moving S10mdev
to S00mdev?

-- 
Luca
