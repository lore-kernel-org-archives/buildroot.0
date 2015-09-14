From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 14 Sep 2015 15:47:42 +0200
Subject: [Buildroot] [RFC 3/6] system: add mdev-only /dev management
 (without devtmpfs)
In-Reply-To: <20150909155427.53f9c8b5@free-electrons.com>
References: <1441747734-18730-1-git-send-email-luca@lucaceresoli.net>
 <1441747734-18730-4-git-send-email-luca@lucaceresoli.net>
 <55EFF9FF.1020402@mind.be> <55F02630.5050500@lucaceresoli.net>
 <20150909155427.53f9c8b5@free-electrons.com>
Message-ID: <55F6CFFE.3000407@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

Thomas Petazzoni wrote:
> Dear Luca Ceresoli,
>
> On Wed, 9 Sep 2015 14:29:36 +0200, Luca Ceresoli wrote:
>
>> The first problem is we'd have an empty /dev since the mount until the
>> execution of S10mdev. This prevents busybox init from executing all
>> lines in inittab after the mount, since they would try to open
>> /dev/null. Symptom: "can't open /dev/null: No such file or directory".
>> The fix should be simply:
>>
>> -null::sysinit:/bin/mkdir -p /dev/pts
>> -null::sysinit:/bin/mkdir -p /dev/shm
>> -null::sysinit:/bin/mount -a
>> -null::sysinit:/bin/hostname -F /etc/hostname
>> +::sysinit:/bin/mkdir -p /dev/pts
>> +::sysinit:/bin/mkdir -p /dev/shm
>> +::sysinit:/bin/mount -a
>> +::sysinit:/bin/hostname -F /etc/hostname
>>
>> Lines up to the /dev mount might be changed as well to have a more
>> uniform style, but it's not strictly needed.
>
> It actually looks better to me to *not* redirect the output of those
> commands to /dev/null. I don't know why we are doing this, but it means
> that if any of those commands wants to display something, it is
> redirected to oblivion. Not good. So it looks better to continue using
> the stdout/stderr set up by the kernel for the init process.

Aha! And removing the "null" prefix uncovered this error while booting
a static /dev system:

   mkdir: can't create directory '/dev/shm': Read-only file system

Which comes from the line

   ::sysinit:/bin/mkdir -p /dev/shm

Yeah, time to get rid of these "null" redirects, and fix the lack of
/dev/shm in the static device table! Will do in v2.

>
> BTW, does this means that in the minimal static device table, we only
> need /dev/console? That's the only device that is opened by the kernel
> directly, I believe /dev/null was only needed for those lines.
>
>> But ehen, if any user has an S05something that uses /dev, it would
>> break. In order to reduce the risk to nearly zero, we might move
>> S10mdev to S00mdev, so it runs (most likely) as the first script.
>>
>> This would slightly change the current behaviour for all cases, and
>> start S01logging after mdev, not before. I tested it quickly and it
>> looks like it works. Can you think of any problem with moving S10mdev
>> to S00mdev?
>
> In principle, it seems better to me if the devices are all set up
> before starting anything else, so if it works, I'm all for S00mdev. The
> only question is whether mdev logs things to syslog, and if so what
> happens to those messages that are emitted before syslog is started.

At a quick code inspection it looks like mdev does not use syslog.
I'll do some testing.

-- 
Luca
