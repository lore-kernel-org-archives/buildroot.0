From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Mon, 10 Apr 2017 14:22:36 +0200
Subject: [Buildroot] [PATCH v5 2/2] systemd: select util-linux/fsck and
	e2fsprogs/e2fsck
In-Reply-To: <2133795248.18260521.1491826188846.JavaMail.zimbra@datacom.ind.br>
References: <1491794596-8454-1-git-send-email-casantos@datacom.ind.br>
 <1491794596-8454-3-git-send-email-casantos@datacom.ind.br>
 <CAGduivxv5seLe6Oz7j+DBjA3kX=b5ksKfTPbStTYezhrKqo7Yg@mail.gmail.com>
 <f30c9756-7b98-ec8c-90dd-612d31d81491@mind.be>
 <CAGduivzjdtVRrKJbfD3TZpoNDX=rEUP_d42dErCid-eg1UQySw@mail.gmail.com>
 <3d2149da-e02b-974c-bc4c-904db7bf02ef@mind.be>
 <2133795248.18260521.1491826188846.JavaMail.zimbra@datacom.ind.br>
Message-ID: <CAGduivwfXJ48p+wLgGSO=aMZ9mZHFBP6d_o3-pyPwiuup_n-ug@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Apr 10, 2017 at 2:09 PM, Carlos Santos <casantos@datacom.ind.br> wrote:
>> From: "Arnout Vandecappelle" <arnout@mind.be>
>> To: "Maxime Hadjinlian" <maxime.hadjinlian@gmail.com>
>> Cc: "Carlos Santos" <casantos@datacom.ind.br>, "buildroot" <buildroot@buildroot.org>, "Thomas Petazzoni"
>> <thomas.petazzoni@free-electrons.com>, "Joergen Pihlflyckt" <Jorgen.Pihlflyckt@ajeco.fi>
>> Sent: Monday, April 10, 2017 8:44:45 AM
>> Subject: Re: [PATCH v5 2/2] systemd: select util-linux/fsck and e2fsprogs/e2fsck
>
>> On 10-04-17 13:30, Maxime Hadjinlian wrote:
>>> Hi Arnout,
>>>
>>> On Mon, Apr 10, 2017 at 1:13 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>>>>  Hi Maxime,
>>>>
>>>> On 10-04-17 13:02, Maxime Hadjinlian wrote:
>>>>> Hi all, Carlos
>>>>>
> ---8<---
>>>>> I haven't tested it but this looks good to me.
>>>>>
>>>>> Reviewed-by: "Maxime Hadjinlian <maxime.hadjinlian@gmail.com>"
>>>>
>>>>  Do you agree with me that selecting e2fsprogs shouldn't be necessary, because
>>>> you actually only need them when you mount an ext2 filesystem (which isn't
>>>> necessarily the case)?
>>>>
>>>>  I'm not sure what happens exactly when you have util-linux fsck but no e2fsck
>>>> and you try to mount an ext2 filesystem...
>>> It would error out I think.
>>
>> So, what does it do when you have a ubifs for which no fsck exists?
>>
>> Since I guess you and/or Carlos have a systemd-based Buildroot-built system
>> available, you could perhaps add a squashfs to your /etc/fstab and see what
>> happens? Or remove e2fsck and see what happens?
If you remove e2fsck (which is how I found out about this issue), the
fsck at .service will fail and an error message will be displayed in the
boot process. That's all that's going to happen. But then, your FS is
never checked which can be more problematic.
I assume the same thing happens with other filesystems because fsck.FS
won't exist.

This won't forbid you to boot, just display an error message.
>
> I don't have a real system using systemd but I can run some tests on
> a vurtual machine using QEMU later today.
>
>>>
>>> You are absolutely right, I only saw my own usecase but this only
>>> works with an extX filesystem, if you want another fs, you need to
>>> select the right tool for the job.
>>> Then, how do we know what the user want ? There is the obivous ext
>>> filesystem option, but you can always select this, and another
>>> filesystem images and use them in different scenario or something.
>>> So, should that be a choice menu and we let the user decide ? Or do we
>>> just put a comment in the documentation or the help message of systemd
>>> and let the user do the correct choice ?
>>>
>>> I would go for the choice, with a default to extX as I think it's
>>> easier and is pretty safe to assume lot of people are using that
>>> theses filessytems now.
>>
>> I disagree, many people use ubifs, some use initramfs, squashfs, xfs, btrfs or
>> zfs. I have made Buildroot-based systems for all of these (none of them with
>> systemd of course, I've never used systemd with Buildroot, but all of them
>> *could* have used systemd).
Sure, everything's possible. I don't really know what is the most
common usecase of buildroot user in the end. It's not like we make
statistics (which could be a good idea by the way)
>
> I agree that selecting e2fsprogs does not make much sense. ext[234]
> would be a natural choice for a desktop system with a hard disk but
> Buildroot is mostly used on  embedded systems on which flash-friendly
> filesystems like ubifs are preferable.
I am mostly using eMMC where ext4 makes a lot of sense. But indeed,
you don't want to use that on a NAND/NOR.
Anyway, the default choice is just a detail, it's not that important.
>
> --
> Carlos Santos (Casantos) - DATACOM, P&D
> ?The greatest triumph that modern PR can offer is the transcendent
> success of having your words and actions judged by your reputation,
> rather than the other way about.? ? Christopher Hitchens
