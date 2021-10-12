Return-Path: <SRS0=Fi0H=PA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 442CCC433FE
	for <buildroot@archiver.kernel.org>; Tue, 12 Oct 2021 13:36:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A950360F3A
	for <buildroot@archiver.kernel.org>; Tue, 12 Oct 2021 13:36:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A950360F3A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A6FD6066C;
	Tue, 12 Oct 2021 13:36:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id INVmyzFDeYiN; Tue, 12 Oct 2021 13:36:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F16A60724;
	Tue, 12 Oct 2021 13:36:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7626C1BF5B3
 for <buildroot@lists.busybox.net>; Tue, 12 Oct 2021 13:36:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 70ECA40344
 for <buildroot@lists.busybox.net>; Tue, 12 Oct 2021 13:36:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ieOqVI1zMdw7 for <buildroot@lists.busybox.net>;
 Tue, 12 Oct 2021 13:36:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DE6124015E
 for <buildroot@buildroot.org>; Tue, 12 Oct 2021 13:36:35 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id 5so23697032iov.9
 for <buildroot@buildroot.org>; Tue, 12 Oct 2021 06:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7tsFDY5kuCtHlXfX0LHW2RgD6afGswcItZc0RLCTpW4=;
 b=YQ0lCeht8VRsT1hW4LwjmrB/YTNVfwmaNCUvCkGcqoxLsVOgygDe+5/RSklhewAheS
 p3rhaOsTPwBbD70GO9Pc8Vpm16coXSCm4MCpZ3wCY/EP69U/FRwkpEU7F35Le6gOCPUt
 V1GlDAIC6K7v5CPnn7V5TJBqCLf7TffN82P93tZtV7S0ZuOUNtiZx2baH1MB8K5SHKIB
 348UTgvnA28lrypQ0bXt5YkGbgKyj3ohhkEKL8pKNlB3qheAwyF976HMXz8rhEfSjZXi
 bWL5h8PRaxK9im3qX1e4BfTmRBtu9rYgkaG4QoeMIF6xcAyn+J8p6filLEIgpXnpmdYF
 f61Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7tsFDY5kuCtHlXfX0LHW2RgD6afGswcItZc0RLCTpW4=;
 b=C/aes6ayCmGM9e8UpYyxcFamdaWyxu7jsmaZZi2275xz0ex66IquvJ02UecKUFcPn/
 2o8Q1SKplRY22S6iIaaAeIFQ2QrKXpNUuOhRu2MPWI8382K6BYNuO1wRaa+VGjKI64jn
 gCh7YlYQdJt7PA/7S1nMRgTyYCUfWOH1jGO8CBf+p4oNvAChBwBeLp2nx+VPf0TCxV9q
 RZnasia1azpj6cs86S+lav4KG/bMZkem0aIYmtfo5gc4aIGXkDtXUSraeDrARIQ8vlZG
 OihIhzw0/TmwIinJB/oGTQ70oUokgxx8ixP2nNkn0m0TeUQdPOiKveF0lXBbXOSjziHs
 zpUw==
X-Gm-Message-State: AOAM530yu5xZ77YjQ8dR+YVB6BCB4L/GABgzoA74ymT97c17/aZzegv+
 NlkmQGU9xM58KDbAwqpXO7lpE6N2AZeuazAL6jw4zevsWw==
X-Google-Smtp-Source: ABdhPJwmjk7tya3cvdvvq0IPujgpBpNDtLqAoj0oKyAul4okkdbLNh7BLUGuQUX7SXc8b1BsU5v1F/5gyHIS/VPXY/8=
X-Received: by 2002:a5d:844b:: with SMTP id w11mr24683333ior.209.1634045795087; 
 Tue, 12 Oct 2021 06:36:35 -0700 (PDT)
MIME-Version: 1.0
References: <CA+eej5MzpM30U7sMqba5gKQ3dG5FznZqd6roacphLhx6J-9auA@mail.gmail.com>
 <f04ffb9e-04d5-0167-8ec2-957a3d1973e6@grenoble.cnrs.fr>
 <CA+eej5NPy3otW728B0+zrwJqVfJPEFhW_dYBKpKT=9XC9EdbOg@mail.gmail.com>
 <1819f3c3-52db-7e21-8d42-f5c2ae434f33@gmail.com>
 <CA+eej5ObHKKx4x=uOYRDF1npRR4kqnucWByTtNkbS40A+1y-GA@mail.gmail.com>
 <fe8b5e30-6cb7-161d-6e6e-cdddadcbbe01@gmail.com>
 <CA+eej5M-SbCseCpknXdMboR7Lz+A94BNHMBZd2WJkcbDD6pZAg@mail.gmail.com>
 <59c215b4-63e2-ba22-285f-0fb4032111b8@mind.be>
 <CA+eej5M2CjZvH+cYL31OhspJCkN0isrbmJA9pUKHsnOzdbuegA@mail.gmail.com>
In-Reply-To: <CA+eej5M2CjZvH+cYL31OhspJCkN0isrbmJA9pUKHsnOzdbuegA@mail.gmail.com>
From: =?UTF-8?Q?Esa=C3=AFe_Ledoux_NJONGSSI_KOUAM?= <kouamdoux@gmail.com>
Date: Tue, 12 Oct 2021 14:41:25 +0200
Message-ID: <CA+eej5Niy_Qkag54jkV39WgcCLy2t11=S-gY+UndMtjOMqNWpQ@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Subject: Re: [Buildroot] error when i build buidroot
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Joachim Wiberg <troglobit@gmail.com>, Edgar Bonet <bonet@grenoble.cnrs.fr>,
 buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============4137833153614634051=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4137833153614634051==
Content-Type: multipart/alternative; boundary="00000000000029b97605ce27efe3"

--00000000000029b97605ce27efe3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> in the buildroot directory. If that gives an error, there is really
something
> wrong with your OS.

i'm trying to reinstall rsync , i hope that something will be fine until
the end

Le mar. 12 oct. 2021 =C3=A0 13:00, Esa=C3=AFe Ledoux NJONGSSI KOUAM <
kouamdoux@gmail.com> a =C3=A9crit :

>   > As Joachim asked, can you provide the output of
>
>   >    pwd
>
> > and
>
>   >    findmnt
>
> ledoux@kali:~/Documents/buildroot$ pwd
> /home/ledoux/Documents/buildroot
> ledoux@kali:~/Documents/buildroot$ findmnt
> TARGET                         SOURCE      FSTYPE  OPTIONS
> /                              /dev/sda10  ext4
>  rw,relatime,errors=3Dremount-ro
> =E2=94=9C=E2=94=80/sys                         sysfs       sysfs
> rw,nosuid,nodev,noexec,relati
> =E2=94=82 =E2=94=9C=E2=94=80/sys/kernel/security       securityfs  securi=
t
> rw,nosuid,nodev,noexec,relati
> =E2=94=82 =E2=94=9C=E2=94=80/sys/fs/cgroup             cgroup2     cgroup=
2
> rw,nosuid,nodev,noexec,relati
> =E2=94=82 =E2=94=9C=E2=94=80/sys/fs/pstore             pstore      pstore
>  rw,nosuid,nodev,noexec,relati
> =E2=94=82 =E2=94=9C=E2=94=80/sys/firmware/efi/efivars  efivarfs    efivar=
f
> rw,nosuid,nodev,noexec,relati
> =E2=94=82 =E2=94=9C=E2=94=80/sys/fs/bpf                none        bpf
> rw,nosuid,nodev,noexec,relati
> =E2=94=82 =E2=94=9C=E2=94=80/sys/kernel/tracing        tracefs     tracef=
s
> rw,nosuid,nodev,noexec,relati
> =E2=94=82 =E2=94=9C=E2=94=80/sys/kernel/debug          debugfs     debugf=
s
> rw,nosuid,nodev,noexec,relati
> =E2=94=82 =E2=94=9C=E2=94=80/sys/kernel/config         configfs    config=
f
> rw,nosuid,nodev,noexec,relati
> =E2=94=82 =E2=94=94=E2=94=80/sys/fs/fuse/connections   fusectl     fusect=
l
> rw,nosuid,nodev,noexec,relati
> =E2=94=9C=E2=94=80/proc                        proc        proc
>  rw,nosuid,nodev,noexec,relati
> =E2=94=82 =E2=94=94=E2=94=80/proc/sys/fs/binfmt_misc   systemd-1   autofs
>  rw,relatime,fd=3D29,pgrp=3D1,time
> =E2=94=82   =E2=94=94=E2=94=80/proc/sys/fs/binfmt_misc binfmt_misc binfmt=
_
> rw,nosuid,nodev,noexec,relati
> =E2=94=9C=E2=94=80/dev                         udev        devtmpf
> rw,nosuid,relatime,size=3D17018
> =E2=94=82 =E2=94=9C=E2=94=80/dev/pts                   devpts      devpts
>  rw,nosuid,noexec,relatime,gid
> =E2=94=82 =E2=94=9C=E2=94=80/dev/shm                   tmpfs       tmpfs =
  rw,nosuid,nodev
> =E2=94=82 =E2=94=9C=E2=94=80/dev/hugepages             hugetlbfs   hugetl=
b rw,relatime,pagesize=3D2M
> =E2=94=82 =E2=94=94=E2=94=80/dev/mqueue                mqueue      mqueue
>  rw,nosuid,nodev,noexec,relati
> =E2=94=9C=E2=94=80/run                         tmpfs       tmpfs
> rw,nosuid,nodev,noexec,relati
> =E2=94=82 =E2=94=9C=E2=94=80/run/lock                  tmpfs       tmpfs
> rw,nosuid,nodev,noexec,relati
> =E2=94=82 =E2=94=9C=E2=94=80/run/rpc_pipefs            sunrpc      rpc_pi=
p rw,relatime
> =E2=94=82 =E2=94=94=E2=94=80/run/user/1000             tmpfs       tmpfs
> rw,nosuid,nodev,relatime,size
> =E2=94=82   =E2=94=94=E2=94=80/run/user/1000/doc       portal      fuse.p=
o
> rw,nosuid,nodev,relatime,user
> =E2=94=9C=E2=94=80/tmp                         /dev/sda9   ext4    rw,rel=
atime
> =E2=94=9C=E2=94=80/var                         /dev/sda7   ext4    rw,rel=
atime
> =E2=94=9C=E2=94=80/home                        /dev/sda11  ext4    rw,rel=
atime
> =E2=94=9C=E2=94=80/boot/efi                    /dev/sda2   vfat
>  rw,relatime,fmask=3D0077,dmask=3D
> =E2=94=94=E2=94=80/media/ledoux/Data           /dev/sda6   fuseblk
> rw,nosuid,nodev,relatime,user
>
>
>
> Le lun. 11 oct. 2021 =C3=A0 22:25, Arnout Vandecappelle <arnout@mind.be> =
a
> =C3=A9crit :
>
>>   Hi Esaie,
>>
>>   Please don't top-post, but reply inline like I do below. Note that thi=
s
>> requires configuring your mailer to quote replies properly (i.e. put >
>> markers
>> in front of each line).
>>
>>
>> On 11/10/2021 12:20, Esa=C3=AFe Ledoux NJONGSSI KOUAM wrote:
>> > i have tried
>> > git clone git://git.buildroot.net/buildroot <
>> http://git.buildroot.net/buildroot>
>> > make qemu_x86_64_defconfig
>> > make
>> >
>> > i have type it on Documents folder that has ext4 file system
>>
>>   As Joachim asked, can you provide the output of
>>
>>      pwd
>>
>> and
>>
>>      findmnt
>>
>> so we can see if the filesystem really is ext4, or it has some weird
>> mount
>> option, or anything else that could explain the issue?
>>
>>   You can also try:
>>
>>      touch foo
>>      chmod 666 foo
>>
>> in the buildroot directory. If that gives an error, there is really
>> something
>> wrong with your OS.
>>
>>   Regards,
>>   Arnout
>>
>> >
>> >
>> > still now i have the same error
>> >
>> > Le dim. 10 oct. 2021 =C3=A0 21:57, Joachim Wiberg <troglobit@gmail.com
>> > <mailto:troglobit@gmail.com>> a =C3=A9crit :
>> >
>> >     Hi,
>> >
>> >     On 10/10/21 6:52 PM, Esa=C3=AFe Ledoux NJONGSSI KOUAM wrote:
>> >      > no filesystem has been configured ...
>> >      > I'm just trying the default configuration
>> >
>> >     This is fine.  I think you've got something really wrong with your
>> >     Kali Linux host system.
>> >
>> >      > should i configure file system for my buildroot ??
>> >
>> >     No, we mean the file system you are using for building Buildroot o=
n,
>> >     in your Kali Linux install.  The rsync error looks as if your disk
>> >     partition is a non-native Linux file system, like FAT, which does
>> >     not support the operations rsync tries to perform.
>> >
>> >     How have you set up your Kali Linux?  Do you have the buildroot gi=
t
>> >     sources checked out to your home directory or some other directory=
,
>> >     perhaps shared with Windows?  If so, I'd definitely avoid that. Yo=
u
>> >     can check the filesystem of your build directory by comparing the
>> >     output of
>> >
>> >         pwd
>> >
>> >     with the output from
>> >
>> >         findmnt
>> >
>> >     On my system I have ext4 in the FSTYPE column for my home director=
y,
>> >     which is in the / TARGET.
>> >
>> >     I finished my install of Kali in my own VM.  It crashed badly befo=
re
>> >     I gave it enough disk (40 GiB) and RAM (4 GiB).  That's another
>> thing
>> >     that might have messed up your build tree.
>> >
>> >      > the error persists even if i compile it as normal user
>> >
>> >     Well that's good to know, at least it's consistent.  Just beware
>> >     that if you reuse the same source tree, having switched to another
>> >     user, a lot of files may still have root as the owner, which may
>> >     give you other problems.  Either `sudo chown -R user:user .` from
>> >     inside the Buildroot source tree, or check out a new tree.
>> >
>> >     Best regards
>> >       /Joachim
>> >
>> >
>> > _______________________________________________
>> > buildroot mailing list
>> > buildroot@buildroot.org
>> > https://lists.buildroot.org/mailman/listinfo/buildroot
>> >
>>
>

--00000000000029b97605ce27efe3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">&gt; in the buildroot directory. If that gives an error, t=
here is really something <br><div>&gt; wrong with your OS.</div><div><br></=
div><div>i&#39;m trying to reinstall rsync , i hope that something will be =
fine until the end<br></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">Le=C2=A0mar. 12 oct. 2021 =C3=A0=C2=A013:00, =
Esa=C3=AFe Ledoux NJONGSSI KOUAM &lt;<a href=3D"mailto:kouamdoux@gmail.com"=
>kouamdoux@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"ltr">=C2=A0 &gt; As Joachim as=
ked, can you provide the output of<br>
<br>=C2=A0 &gt; =C2=A0=C2=A0 pwd<br>
<br>
&gt; and<br>
<br><div>=C2=A0 &gt; =C2=A0=C2=A0 findmnt</div><div><br></div><div>ledoux@k=
ali:~/Documents/buildroot$ pwd</div>/home/ledoux/Documents/buildroot<br>led=
oux@kali:~/Documents/buildroot$ findmnt<br>TARGET =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SOURCE =C2=A0 =
=C2=A0 =C2=A0FSTYPE =C2=A0OPTIONS<br>/ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/dev/s=
da10 =C2=A0ext4 =C2=A0 =C2=A0rw,relatime,errors=3Dremount-ro<br>=E2=94=9C=
=E2=94=80/sys =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 sysfs =C2=A0 =C2=A0 =C2=A0 sysfs =C2=A0 rw,nosuid,=
nodev,noexec,relati<br>=E2=94=82 =E2=94=9C=E2=94=80/sys/kernel/security =C2=
=A0 =C2=A0 =C2=A0 securityfs =C2=A0securit rw,nosuid,nodev,noexec,relati<br=
>=E2=94=82 =E2=94=9C=E2=94=80/sys/fs/cgroup =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 cgroup2 =C2=A0 =C2=A0 cgroup2 rw,nosuid,nodev,noexec,relati<br>=
=E2=94=82 =E2=94=9C=E2=94=80/sys/fs/pstore =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 pstore =C2=A0 =C2=A0 =C2=A0pstore =C2=A0rw,nosuid,nodev,noexec,r=
elati<br>=E2=94=82 =E2=94=9C=E2=94=80/sys/firmware/efi/efivars =C2=A0efivar=
fs =C2=A0 =C2=A0efivarf rw,nosuid,nodev,noexec,relati<br>=E2=94=82 =E2=94=
=9C=E2=94=80/sys/fs/bpf =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0none =C2=A0 =C2=A0 =C2=A0 =C2=A0bpf =C2=A0 =C2=A0 rw,nosuid,nodev,noe=
xec,relati<br>=E2=94=82 =E2=94=9C=E2=94=80/sys/kernel/tracing =C2=A0 =C2=A0=
 =C2=A0 =C2=A0tracefs =C2=A0 =C2=A0 tracefs rw,nosuid,nodev,noexec,relati<b=
r>=E2=94=82 =E2=94=9C=E2=94=80/sys/kernel/debug =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0debugfs =C2=A0 =C2=A0 debugfs rw,nosuid,nodev,noexec,relati<br>=E2=
=94=82 =E2=94=9C=E2=94=80/sys/kernel/config =C2=A0 =C2=A0 =C2=A0 =C2=A0 con=
figfs =C2=A0 =C2=A0configf rw,nosuid,nodev,noexec,relati<br>=E2=94=82 =E2=
=94=94=E2=94=80/sys/fs/fuse/connections =C2=A0 fusectl =C2=A0 =C2=A0 fusect=
l rw,nosuid,nodev,noexec,relati<br>=E2=94=9C=E2=94=80/proc =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0proc =
=C2=A0 =C2=A0 =C2=A0 =C2=A0proc =C2=A0 =C2=A0rw,nosuid,nodev,noexec,relati<=
br>=E2=94=82 =E2=94=94=E2=94=80/proc/sys/fs/binfmt_misc =C2=A0 systemd-1 =
=C2=A0 autofs =C2=A0rw,relatime,fd=3D29,pgrp=3D1,time<br>=E2=94=82 =C2=A0 =
=E2=94=94=E2=94=80/proc/sys/fs/binfmt_misc binfmt_misc binfmt_ rw,nosuid,no=
dev,noexec,relati<br>=E2=94=9C=E2=94=80/dev =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 udev =C2=A0 =C2=A0 =C2=
=A0 =C2=A0devtmpf rw,nosuid,relatime,size=3D17018<br>=E2=94=82 =E2=94=9C=E2=
=94=80/dev/pts =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 devpts =C2=A0 =C2=A0 =C2=A0devpts =C2=A0rw,nosuid,noexec,relatime,gid<b=
r>=E2=94=82 =E2=94=9C=E2=94=80/dev/shm =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 tmpfs =C2=A0 =C2=A0 =C2=A0 tmpfs =C2=A0 rw,nosu=
id,nodev<br>=E2=94=82 =E2=94=9C=E2=94=80/dev/hugepages =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 hugetlbfs =C2=A0 hugetlb rw,relatime,pagesize=3D2M<br=
>=E2=94=82 =E2=94=94=E2=94=80/dev/mqueue =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0mqueue =C2=A0 =C2=A0 =C2=A0mqueue =C2=A0rw,nosuid,node=
v,noexec,relati<br>=E2=94=9C=E2=94=80/run =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tmpfs =C2=A0 =C2=A0 =
=C2=A0 tmpfs =C2=A0 rw,nosuid,nodev,noexec,relati<br>=E2=94=82 =E2=94=9C=E2=
=94=80/run/lock =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0tmpfs =C2=A0 =C2=A0 =C2=A0 tmpfs =C2=A0 rw,nosuid,nodev,noexec,relati<br=
>=E2=94=82 =E2=94=9C=E2=94=80/run/rpc_pipefs =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0sunrpc =C2=A0 =C2=A0 =C2=A0rpc_pip rw,relatime<br>=E2=94=82 =
=E2=94=94=E2=94=80/run/user/1000 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
tmpfs =C2=A0 =C2=A0 =C2=A0 tmpfs =C2=A0 rw,nosuid,nodev,relatime,size<br>=
=E2=94=82 =C2=A0 =E2=94=94=E2=94=80/run/user/1000/doc =C2=A0 =C2=A0 =C2=A0 =
portal =C2=A0 =C2=A0 =C2=A0fuse.po rw,nosuid,nodev,relatime,user<br>=E2=94=
=9C=E2=94=80/tmp =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /dev/sda9 =C2=A0 ext4 =C2=A0 =C2=A0rw,relatime<=
br>=E2=94=9C=E2=94=80/var =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /dev/sda7 =C2=A0 ext4 =C2=A0 =C2=A0rw,re=
latime<br>=E2=94=9C=E2=94=80/home =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/dev/sda11 =C2=A0ext4 =C2=A0 =C2=
=A0rw,relatime<br>=E2=94=9C=E2=94=80/boot/efi =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/dev/sda2 =C2=A0 vfat =C2=A0 =C2=
=A0rw,relatime,fmask=3D0077,dmask=3D<br><div>=E2=94=94=E2=94=80/media/ledou=
x/Data =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /dev/sda6 =C2=A0 fuseblk rw,nosui=
d,nodev,relatime,user</div><div><br></div><div><br></div></div><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0lun. 11 oc=
t. 2021 =C3=A0=C2=A022:25, Arnout Vandecappelle &lt;<a href=3D"mailto:arnou=
t@mind.be" target=3D"_blank">arnout@mind.be</a>&gt; a =C3=A9crit=C2=A0:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">=C2=A0 Hi Esaie,<br=
>
<br>
=C2=A0 Please don&#39;t top-post, but reply inline like I do below. Note th=
at this <br>
requires configuring your mailer to quote replies properly (i.e. put &gt; m=
arkers <br>
in front of each line).<br>
<br>
<br>
On 11/10/2021 12:20, Esa=C3=AFe Ledoux NJONGSSI KOUAM wrote:<br>
&gt; i have tried<br>
&gt; git clone git://<a href=3D"http://git.buildroot.net/buildroot" rel=3D"=
noreferrer" target=3D"_blank">git.buildroot.net/buildroot</a> &lt;<a href=
=3D"http://git.buildroot.net/buildroot" rel=3D"noreferrer" target=3D"_blank=
">http://git.buildroot.net/buildroot</a>&gt;<br>
&gt; make qemu_x86_64_defconfig<br>
&gt; make<br>
&gt; <br>
&gt; i have type it on Documents folder that has ext4 file system<br>
<br>
=C2=A0 As Joachim asked, can you provide the output of<br>
<br>
=C2=A0 =C2=A0 =C2=A0pwd<br>
<br>
and<br>
<br>
=C2=A0 =C2=A0 =C2=A0findmnt<br>
<br>
so we can see if the filesystem really is ext4, or it has some weird mount =
<br>
option, or anything else that could explain the issue?<br>
<br>
=C2=A0 You can also try:<br>
<br>
=C2=A0 =C2=A0 =C2=A0touch foo<br>
=C2=A0 =C2=A0 =C2=A0chmod 666 foo<br>
<br>
in the buildroot directory. If that gives an error, there is really somethi=
ng <br>
wrong with your OS.<br>
<br>
=C2=A0 Regards,<br>
=C2=A0 Arnout<br>
<br>
&gt; <br>
&gt; <br>
&gt; still now i have the same error<br>
&gt; <br>
&gt; Le=C2=A0dim. 10 oct. 2021 =C3=A0=C2=A021:57, Joachim Wiberg &lt;<a hre=
f=3D"mailto:troglobit@gmail.com" target=3D"_blank">troglobit@gmail.com</a> =
<br>
&gt; &lt;mailto:<a href=3D"mailto:troglobit@gmail.com" target=3D"_blank">tr=
oglobit@gmail.com</a>&gt;&gt; a =C3=A9crit=C2=A0:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Hi,<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On 10/10/21 6:52 PM, Esa=C3=AFe Ledoux NJONGSSI KOU=
AM wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; no filesystem has been configured ...<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; I&#39;m just trying the default configuration=
<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0This is fine.=C2=A0 I think you&#39;ve got somethin=
g really wrong with your<br>
&gt;=C2=A0 =C2=A0 =C2=A0Kali Linux host system.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; should i configure file system for my buildro=
ot ??<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0No, we mean the file system you are using for build=
ing Buildroot on,<br>
&gt;=C2=A0 =C2=A0 =C2=A0in your Kali Linux install.=C2=A0 The rsync error l=
ooks as if your disk<br>
&gt;=C2=A0 =C2=A0 =C2=A0partition is a non-native Linux file system, like F=
AT, which does<br>
&gt;=C2=A0 =C2=A0 =C2=A0not support the operations rsync tries to perform.<=
br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0How have you set up your Kali Linux?=C2=A0 Do you h=
ave the buildroot git<br>
&gt;=C2=A0 =C2=A0 =C2=A0sources checked out to your home directory or some =
other directory,<br>
&gt;=C2=A0 =C2=A0 =C2=A0perhaps shared with Windows?=C2=A0 If so, I&#39;d d=
efinitely avoid that. You<br>
&gt;=C2=A0 =C2=A0 =C2=A0can check the filesystem of your build directory by=
 comparing the<br>
&gt;=C2=A0 =C2=A0 =C2=A0output of<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pwd<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0with the output from<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0findmnt<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On my system I have ext4 in the FSTYPE column for m=
y home directory,<br>
&gt;=C2=A0 =C2=A0 =C2=A0which is in the / TARGET.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0I finished my install of Kali in my own VM.=C2=A0 I=
t crashed badly before<br>
&gt;=C2=A0 =C2=A0 =C2=A0I gave it enough disk (40 GiB) and RAM (4 GiB).=C2=
=A0 That&#39;s another thing<br>
&gt;=C2=A0 =C2=A0 =C2=A0that might have messed up your build tree.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; the error persists even if i compile it as no=
rmal user<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Well that&#39;s good to know, at least it&#39;s con=
sistent.=C2=A0 Just beware<br>
&gt;=C2=A0 =C2=A0 =C2=A0that if you reuse the same source tree, having swit=
ched to another<br>
&gt;=C2=A0 =C2=A0 =C2=A0user, a lot of files may still have root as the own=
er, which may<br>
&gt;=C2=A0 =C2=A0 =C2=A0give you other problems.=C2=A0 Either `sudo chown -=
R user:user .` from<br>
&gt;=C2=A0 =C2=A0 =C2=A0inside the Buildroot source tree, or check out a ne=
w tree.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Best regards<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/Joachim<br>
&gt; <br>
&gt; <br>
&gt; _______________________________________________<br>
&gt; buildroot mailing list<br>
&gt; <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot=
@buildroot.org</a><br>
&gt; <a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=
=3D"noreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listi=
nfo/buildroot</a><br>
&gt; <br>
</blockquote></div>
</blockquote></div>

--00000000000029b97605ce27efe3--

--===============4137833153614634051==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4137833153614634051==--
