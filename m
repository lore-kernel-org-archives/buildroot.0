Return-Path: <SRS0=Fi0H=PA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7EC8C433EF
	for <buildroot@archiver.kernel.org>; Tue, 12 Oct 2021 09:00:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A7E961050
	for <buildroot@archiver.kernel.org>; Tue, 12 Oct 2021 09:00:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0A7E961050
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE62440640;
	Tue, 12 Oct 2021 09:00:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2UP-kjwkqXZi; Tue, 12 Oct 2021 09:00:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7E2B40628;
	Tue, 12 Oct 2021 09:00:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 003DE1BF955
 for <buildroot@lists.busybox.net>; Tue, 12 Oct 2021 09:00:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DE1F940628
 for <buildroot@lists.busybox.net>; Tue, 12 Oct 2021 09:00:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fgZTVFSPpzEY for <buildroot@lists.busybox.net>;
 Tue, 12 Oct 2021 09:00:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9918940627
 for <buildroot@buildroot.org>; Tue, 12 Oct 2021 09:00:39 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id g2so19856437ild.1
 for <buildroot@buildroot.org>; Tue, 12 Oct 2021 02:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kaJrSoD4eU51yONvvRSBZf7T16co4KoaXLRfoGt+owM=;
 b=MDaTZDJX0wAIiV19cWQckvDST5wa5hWDuoFaXeMYXGxb4OYTUMXmAPI+kNYBQVlLdr
 beCxCuB6Vwhx3NwkG6l3AADlfJHriYsI91X2hJ0qS6gvh7kJv4PMU9OBH0qgdvkcjTO/
 yBSX5KCgoWtGgvGkNoAhh+lB27TIhjHwEEnD1RVqsNqNcJldZbzNFIsc5P0jj0Wj8t+b
 fSbG+6wprwRj6r5R5seYKiteVox05SVkYm2gqugbsVD9sX2IjwV+jnUtkzWISt9oGdfa
 u2XjZbtOU3+Mql3I0lm7y7FxtLoEMC/pPrawG4e9X8t/o4F0uOYxNAM+RTOuGid4Lewe
 InbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kaJrSoD4eU51yONvvRSBZf7T16co4KoaXLRfoGt+owM=;
 b=U//jx4M05b6n4Weno5kr4/JQoqsRthvoiLUQg+/HUJfxOGTDjxF+Viz1fOmyRYWR9G
 WJT5voGB6G95c9yEHLxrhD5uvlj2AsWui1VI8gQboTCA0IL1R+nVI5q1ay05DCDmEtQ1
 H/3KBMAh1HiA25g6B17bOutrUphwTA2RxCl5VgQb0vEkxg5/PwRBvRn9LuiwyNc87SoO
 osSHpF5GI44x2Q0+wYN4/tPwmLAgD0v9y+k7tmDbXnmPBWF1b9gca+aM/5XPkC6wIzGf
 YFvyvGy2Ert5juWw/f2kCIJAbeWMJ4hiQbUI3EDC3HuADpNFq117DCmmUaOR0fnYvTy3
 QtpA==
X-Gm-Message-State: AOAM530Ec2t2hwaom/tjCja3Q0ivr/mk6VYsf8iDa+w/Wv2jxzDNpIav
 Ou+JIUlFBKr4DFHpdZ+URDv49OLZUWU/Cpg2DTmqqZBfsw==
X-Google-Smtp-Source: ABdhPJwYjDG6jZQJD02U9gZswteYz8txwYMtfhmOguWPw921zcRSwhq1HfKzTPVZEa6fd53jPkxRgX3LD9QHGzztLbE=
X-Received: by 2002:a05:6e02:1564:: with SMTP id
 k4mr23784369ilu.269.1634029238730; 
 Tue, 12 Oct 2021 02:00:38 -0700 (PDT)
MIME-Version: 1.0
References: <CA+eej5MzpM30U7sMqba5gKQ3dG5FznZqd6roacphLhx6J-9auA@mail.gmail.com>
 <f04ffb9e-04d5-0167-8ec2-957a3d1973e6@grenoble.cnrs.fr>
 <CA+eej5NPy3otW728B0+zrwJqVfJPEFhW_dYBKpKT=9XC9EdbOg@mail.gmail.com>
 <1819f3c3-52db-7e21-8d42-f5c2ae434f33@gmail.com>
 <CA+eej5ObHKKx4x=uOYRDF1npRR4kqnucWByTtNkbS40A+1y-GA@mail.gmail.com>
 <fe8b5e30-6cb7-161d-6e6e-cdddadcbbe01@gmail.com>
 <CA+eej5M-SbCseCpknXdMboR7Lz+A94BNHMBZd2WJkcbDD6pZAg@mail.gmail.com>
 <59c215b4-63e2-ba22-285f-0fb4032111b8@mind.be>
In-Reply-To: <59c215b4-63e2-ba22-285f-0fb4032111b8@mind.be>
From: =?UTF-8?Q?Esa=C3=AFe_Ledoux_NJONGSSI_KOUAM?= <kouamdoux@gmail.com>
Date: Tue, 12 Oct 2021 13:00:30 +0200
Message-ID: <CA+eej5M2CjZvH+cYL31OhspJCkN0isrbmJA9pUKHsnOzdbuegA@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============8666064875745875177=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8666064875745875177==
Content-Type: multipart/alternative; boundary="00000000000053c3c805ce241484"

--00000000000053c3c805ce241484
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

  > As Joachim asked, can you provide the output of

  >    pwd

> and

  >    findmnt

ledoux@kali:~/Documents/buildroot$ pwd
/home/ledoux/Documents/buildroot
ledoux@kali:~/Documents/buildroot$ findmnt
TARGET                         SOURCE      FSTYPE  OPTIONS
/                              /dev/sda10  ext4
 rw,relatime,errors=3Dremount-ro
=E2=94=9C=E2=94=80/sys                         sysfs       sysfs
rw,nosuid,nodev,noexec,relati
=E2=94=82 =E2=94=9C=E2=94=80/sys/kernel/security       securityfs  securit
rw,nosuid,nodev,noexec,relati
=E2=94=82 =E2=94=9C=E2=94=80/sys/fs/cgroup             cgroup2     cgroup2
rw,nosuid,nodev,noexec,relati
=E2=94=82 =E2=94=9C=E2=94=80/sys/fs/pstore             pstore      pstore
 rw,nosuid,nodev,noexec,relati
=E2=94=82 =E2=94=9C=E2=94=80/sys/firmware/efi/efivars  efivarfs    efivarf
rw,nosuid,nodev,noexec,relati
=E2=94=82 =E2=94=9C=E2=94=80/sys/fs/bpf                none        bpf
rw,nosuid,nodev,noexec,relati
=E2=94=82 =E2=94=9C=E2=94=80/sys/kernel/tracing        tracefs     tracefs
rw,nosuid,nodev,noexec,relati
=E2=94=82 =E2=94=9C=E2=94=80/sys/kernel/debug          debugfs     debugfs
rw,nosuid,nodev,noexec,relati
=E2=94=82 =E2=94=9C=E2=94=80/sys/kernel/config         configfs    configf
rw,nosuid,nodev,noexec,relati
=E2=94=82 =E2=94=94=E2=94=80/sys/fs/fuse/connections   fusectl     fusectl
rw,nosuid,nodev,noexec,relati
=E2=94=9C=E2=94=80/proc                        proc        proc
 rw,nosuid,nodev,noexec,relati
=E2=94=82 =E2=94=94=E2=94=80/proc/sys/fs/binfmt_misc   systemd-1   autofs
 rw,relatime,fd=3D29,pgrp=3D1,time
=E2=94=82   =E2=94=94=E2=94=80/proc/sys/fs/binfmt_misc binfmt_misc binfmt_
rw,nosuid,nodev,noexec,relati
=E2=94=9C=E2=94=80/dev                         udev        devtmpf
rw,nosuid,relatime,size=3D17018
=E2=94=82 =E2=94=9C=E2=94=80/dev/pts                   devpts      devpts
 rw,nosuid,noexec,relatime,gid
=E2=94=82 =E2=94=9C=E2=94=80/dev/shm                   tmpfs       tmpfs   =
rw,nosuid,nodev
=E2=94=82 =E2=94=9C=E2=94=80/dev/hugepages             hugetlbfs   hugetlb =
rw,relatime,pagesize=3D2M
=E2=94=82 =E2=94=94=E2=94=80/dev/mqueue                mqueue      mqueue
 rw,nosuid,nodev,noexec,relati
=E2=94=9C=E2=94=80/run                         tmpfs       tmpfs
rw,nosuid,nodev,noexec,relati
=E2=94=82 =E2=94=9C=E2=94=80/run/lock                  tmpfs       tmpfs
rw,nosuid,nodev,noexec,relati
=E2=94=82 =E2=94=9C=E2=94=80/run/rpc_pipefs            sunrpc      rpc_pip =
rw,relatime
=E2=94=82 =E2=94=94=E2=94=80/run/user/1000             tmpfs       tmpfs
rw,nosuid,nodev,relatime,size
=E2=94=82   =E2=94=94=E2=94=80/run/user/1000/doc       portal      fuse.po
rw,nosuid,nodev,relatime,user
=E2=94=9C=E2=94=80/tmp                         /dev/sda9   ext4    rw,relat=
ime
=E2=94=9C=E2=94=80/var                         /dev/sda7   ext4    rw,relat=
ime
=E2=94=9C=E2=94=80/home                        /dev/sda11  ext4    rw,relat=
ime
=E2=94=9C=E2=94=80/boot/efi                    /dev/sda2   vfat
 rw,relatime,fmask=3D0077,dmask=3D
=E2=94=94=E2=94=80/media/ledoux/Data           /dev/sda6   fuseblk
rw,nosuid,nodev,relatime,user



Le lun. 11 oct. 2021 =C3=A0 22:25, Arnout Vandecappelle <arnout@mind.be> a
=C3=A9crit :

>   Hi Esaie,
>
>   Please don't top-post, but reply inline like I do below. Note that this
> requires configuring your mailer to quote replies properly (i.e. put >
> markers
> in front of each line).
>
>
> On 11/10/2021 12:20, Esa=C3=AFe Ledoux NJONGSSI KOUAM wrote:
> > i have tried
> > git clone git://git.buildroot.net/buildroot <
> http://git.buildroot.net/buildroot>
> > make qemu_x86_64_defconfig
> > make
> >
> > i have type it on Documents folder that has ext4 file system
>
>   As Joachim asked, can you provide the output of
>
>      pwd
>
> and
>
>      findmnt
>
> so we can see if the filesystem really is ext4, or it has some weird moun=
t
> option, or anything else that could explain the issue?
>
>   You can also try:
>
>      touch foo
>      chmod 666 foo
>
> in the buildroot directory. If that gives an error, there is really
> something
> wrong with your OS.
>
>   Regards,
>   Arnout
>
> >
> >
> > still now i have the same error
> >
> > Le dim. 10 oct. 2021 =C3=A0 21:57, Joachim Wiberg <troglobit@gmail.com
> > <mailto:troglobit@gmail.com>> a =C3=A9crit :
> >
> >     Hi,
> >
> >     On 10/10/21 6:52 PM, Esa=C3=AFe Ledoux NJONGSSI KOUAM wrote:
> >      > no filesystem has been configured ...
> >      > I'm just trying the default configuration
> >
> >     This is fine.  I think you've got something really wrong with your
> >     Kali Linux host system.
> >
> >      > should i configure file system for my buildroot ??
> >
> >     No, we mean the file system you are using for building Buildroot on=
,
> >     in your Kali Linux install.  The rsync error looks as if your disk
> >     partition is a non-native Linux file system, like FAT, which does
> >     not support the operations rsync tries to perform.
> >
> >     How have you set up your Kali Linux?  Do you have the buildroot git
> >     sources checked out to your home directory or some other directory,
> >     perhaps shared with Windows?  If so, I'd definitely avoid that. You
> >     can check the filesystem of your build directory by comparing the
> >     output of
> >
> >         pwd
> >
> >     with the output from
> >
> >         findmnt
> >
> >     On my system I have ext4 in the FSTYPE column for my home directory=
,
> >     which is in the / TARGET.
> >
> >     I finished my install of Kali in my own VM.  It crashed badly befor=
e
> >     I gave it enough disk (40 GiB) and RAM (4 GiB).  That's another thi=
ng
> >     that might have messed up your build tree.
> >
> >      > the error persists even if i compile it as normal user
> >
> >     Well that's good to know, at least it's consistent.  Just beware
> >     that if you reuse the same source tree, having switched to another
> >     user, a lot of files may still have root as the owner, which may
> >     give you other problems.  Either `sudo chown -R user:user .` from
> >     inside the Buildroot source tree, or check out a new tree.
> >
> >     Best regards
> >       /Joachim
> >
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
> >
>

--00000000000053c3c805ce241484
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">=C2=A0 &gt; As Joachim asked, can you provide the output o=
f<br>
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
t@mind.be">arnout@mind.be</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">=C2=A0 Hi Esaie,<br>
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

--00000000000053c3c805ce241484--

--===============8666064875745875177==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8666064875745875177==--
