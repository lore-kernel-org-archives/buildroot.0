From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed, 22 Jul 2015 12:17:22 +0200
Subject: [Buildroot] [PATCH 2/2] rtl8188eu: new package
In-Reply-To: <20150721225724.401300ef@free-electrons.com>
References: <1436188175-7912-1-git-send-email-luca@lucaceresoli.net>
 <1436188175-7912-2-git-send-email-luca@lucaceresoli.net>
 <20150718233012.5293b49f@free-electrons.com>
 <55AE72C8.10405@lucaceresoli.net>
 <20150721225724.401300ef@free-electrons.com>
Message-ID: <55AF6DB2.4090301@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Il 21/07/2015 22:57, Thomas Petazzoni ha scritto:
> Luca,
>
> On Tue, 21 Jul 2015 18:26:48 +0200, Luca Ceresoli wrote:
>
>>> Can you respin a new version? In the mean time, I'll mark this one as
>>> "Changes Requested" in patchwork.
>>
>> It's on my todo list.

BTW, I think the rtl8188eu can go on its own way, without waiting for
the discussion about /dev management, right?

>>
>> However, I still haven't understood your opinion about using mdev
>> without devtmpfs (it's for firmware loading in this case)...
>
> I think it's OK to support this case. People using kernels older than
> 2.6.32 are stuck with static /dev and may have to load firmwares.

Another use case is to have dynamic /dev management on kernels
<2.6.32, even without any firmware loading need. mdev is reportedly
working without devtmpfs. I haven't tested it seriously, but it might
be very interesting for the poor souls.

>
> Now, I'm wondering if we should simply make the "mdev" /dev management
> option work with both static /dev *and* devtmpfs, or if we should have
> something like "mdev with static /dev" and "mdev with devtmpfs".
>
> Do you have some proposals?

Idea 1:
   - just add a new entry to "/dev management":
       ( ) Static using device table
       ( ) Static using device table + mdev   <- New option
       (X) Dynamic using devtmpfs only
       ( ) Dynamic using {devtmpfs +} mdev    {} = new wording only
       ( ) Dynamic using {devtmpfs +} eudev   {} = new wording only

Idea 2:
   - Add a new bool named "Use devtmpfs"
     - y (default) -> enable devtmpfs in the kernel config
     - n           -> use the static device table
   - Change "/dev management" to "dynamic /dev management":
       ( ) none
       (X) mdev
       ( ) eudev

Idea 2 enables 2 new behaviours: "static + mdev" and "static + eudev".
Does the latter make any sense? I've never used eudev, I have no idea.

Idea 2 is somewhat more flexible, and closer to the implementation.
This probably means also farther away from the user...

Idea 1 involves less changes and no legacy burden. Besides, it shows an
option for each use case. This allows to document each of the five
options in menuconfig, with hints to use cases, without the need to
switch to the manual for a use-case to kconfig-options-to-enable map.

Theoretically we might also make optional the firmware loading feature
of mdev, but I really don't think it's worth the effort.

-- 
Luca
