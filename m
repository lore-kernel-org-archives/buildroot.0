From: Andrey Skvortsov <andrej.skvortzov@gmail.com>
Date: Tue, 28 Mar 2017 12:39:41 +0300
Subject: [Buildroot]  Issue performing switch_root to a UBIFS partition
In-Reply-To: <CCAGm1_kuF8Dqo7ctHRF7Og3smXcsgKby1vwH0yM9HM8a1Mw1nww@mail.gmail.com>
Message-ID: <20170328093941.yui6vunw5waaqtqr@skv.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>On Mon, Mar 27, 2017 at 5:16 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>>
>> On 27-03-17 14:59, Yegor Yefremov wrote:
>>> getpid()                                = 915
>>
>>  PID must be 1.

Yegor, are you sure, that exec switch_root is executed from script,
that has PID 1?
Because it has to be 1. Otherwise you'll get busybox usage message.
See https://git.busybox.net/busybox/tree/util-linux/switch_root.c?h=1_26_stable#n111

Please check this by running 'echo $$' before you make 'mount --move' calls'


>Forgot to mention that in the script representation
>>  :-) Of
>> course, here it's due to the strace... To avoid, you could use
>>  "strace -fp 1 &"
>> but I'm not sure how that would behave across the exec.
>
>This doesn't work.
>
>>> write(2, "BusyBox v1.26.2 (2017-03-24 16:3"..., 41BusyBox v1.26.2
>>> (2017-03-24 16:39:44 CET)) =
>>> write(2, " multi-call binary.\n", 20 multi-call binary.
>>> )   = 20
>>> write(2, "\nUsage: ", 8
>>> Usage: )                = 8
>>
>>  Did this Usage: part also come out when running without strace?
>>  It's very weird
>> that the rest of the usage output is not appearing. Or perhaps
>>  that's because
>> you get a kernel panic immediately afterwards because PID 1 exits?
>
>This is what I get, if I invoke switch_root without moving /dev, /sys
>and /proc and without strace:
>
># exec /sbin/switch_root /newroot/ /sbin/init
>BusyBox v1.26.2 (2017-03-24 16:39:44 CET) multi-call bina
>Welcome to Buildroot
>
>The whole stuff is very strange. Have you tried it yourself with
>recent BR and kernel?


>>> can't open /dev/ttyO0: No such file or directory
>>
>>  Still no explanation where this comes from...

The reason for that is /dev is mounted already on /newroot/dev, but
switch_root failed and Busybox prints its usage message to standard output, but
/dev/console (/dev/ttyO0) doesn't exist anymore at the old location.
So there is corresponding message about non-existed /dev/ttyO0.

As you see there is no such message, if /dev is not mounted to the new location.

-- 
Best regards,
Andrey Skvortsov
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170328/2b0b5c4d/attachment.asc>
