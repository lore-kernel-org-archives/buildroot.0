Return-Path: <SRS0=94yL=PB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B31AC433F5
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 11:33:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9298661056
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 11:33:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9298661056
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4FE1D40247;
	Wed, 13 Oct 2021 11:33:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OAFtDyDILwMd; Wed, 13 Oct 2021 11:33:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 35B5C404B5;
	Wed, 13 Oct 2021 11:33:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 243671BF3F9
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 11:33:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0F178404B5
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 11:33:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EoTUrbteZtxx for <buildroot@lists.busybox.net>;
 Wed, 13 Oct 2021 11:33:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 02EF940247
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 11:33:20 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id q205so2477834iod.8
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 04:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=K7B+ZGORAsYWAD31rQyItXHYlfiR+/tod9PXtUM/qm8=;
 b=CmMHGZx5cm04JXEJNixV+opi4YkbVSOyB2rMYyY/bzKZvBPJDiytugGVXDrvtgo0sw
 pjCtqQT6SIiALDIlHC6fmmfRgRe8UFMwjWsf176aFZV1NfFA2ZeA+WmombpwPlfwcfjA
 BuBd8ofmMNxOoKcPZrnRPxO4i7JDGB5B0rWr0B4j4XIgZiFgUPR0hMbSHwNfoBKMlLtZ
 8Gt8YRtWB14CC0OeTOcL9fXxNZjNnO++flFiEw9Qyhi9OyPnxmWIP17rxWE7adb1lBOs
 OBqLnF+0vhs7mNXDnpE2c1TbqqCom1DDfZBzZNX/wjBZt8LoWpnODVm44TWY5fvvwcLp
 8xWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K7B+ZGORAsYWAD31rQyItXHYlfiR+/tod9PXtUM/qm8=;
 b=Qoh/nBkwMof7DPFrxt+Q2GjG2YVHf1w3IrqlXKm4scAvmWJweof3h7FYA36Lzkolev
 N7MeEZz5gw0YjcBbqyKUWFZoJGGB2FzfkVQAQrRybpsSLo1JtdfxZ8JLKQgy9u77kiAU
 PZcuamqQt0j/1/3oUfpY6AFB5eRVjlQ2zOEUh0lK4IgdTwhhEN1oiGMbIm2lzfio8Owg
 Gh5PQY4vOw7nBQiUlIo+gF9RLvE/YD5Bva2te3H7ztHRrEvtmGVCudz/CwdnwL+5Un7+
 bjq8gC2y+JsoCLEht7eRB8TaafpO08hnXYGviXBEeV1XX8BZWwIMF46NLq5hrsdL/MAq
 fmsQ==
X-Gm-Message-State: AOAM530kqzaAP/onUXenf2Qn8LKJbmj2MM5EF9wfATf+ZRYTs/OmGhrZ
 HedYm5XAAhYjfCujwS3mtx+XxXtzR7CHv5EH6w==
X-Google-Smtp-Source: ABdhPJyZVyokeSyLPaed+fLubVFXc0kFZ0aJHrN7f40dlaUo8EqZ8/IOEwtVnMEeKSuL6v1XPT2xA0nU89l/Kzp0OoM=
X-Received: by 2002:a02:2b08:: with SMTP id h8mr28476922jaa.137.1634124800114; 
 Wed, 13 Oct 2021 04:33:20 -0700 (PDT)
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
 <CA+eej5Niy_Qkag54jkV39WgcCLy2t11=S-gY+UndMtjOMqNWpQ@mail.gmail.com>
 <CA+eej5NNTNONO_GX1T=DhRyvbQJzxNhJMrRi-T4Ue-bexYRR3w@mail.gmail.com>
 <CA+eej5NKcWV6n_sM19Px+NP4EoqSDmUqw2W3DdTDGGKQRSqZ5Q@mail.gmail.com>
 <20211012225224.23525d4f@gmx.net>
 <b1aa1e5e-18b1-11b6-0f8d-14982d25ad3b@mind.be>
 <CA+eej5OCBy1brQFnRMQjMqu8DrPtrTgVPRpTT8hKxXTwz5uvNQ@mail.gmail.com>
In-Reply-To: <CA+eej5OCBy1brQFnRMQjMqu8DrPtrTgVPRpTT8hKxXTwz5uvNQ@mail.gmail.com>
From: =?UTF-8?Q?Esa=C3=AFe_Ledoux_NJONGSSI_KOUAM?= <kouamdoux@gmail.com>
Date: Wed, 13 Oct 2021 12:38:11 +0200
Message-ID: <CA+eej5Py5=BfZzMuZS8ARZ5K24xBjGTrpu0iANh7hX9AjK6NQA@mail.gmail.com>
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
Cc: Joachim Wiberg <troglobit@gmail.com>, Peter Seiderer <ps.report@gmx.net>,
 Edgar Bonet <bonet@grenoble.cnrs.fr>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============2944543786144010070=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2944543786144010070==
Content-Type: multipart/alternative; boundary="0000000000003ac26005ce3a544f"

--0000000000003ac26005ce3a544f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

so i should modify which mk file ??

Le mer. 13 oct. 2021 =C3=A0 12:34, Esa=C3=AFe Ledoux NJONGSSI KOUAM <
kouamdoux@gmail.com> a =C3=A9crit :

> > Can confirm the error with qemu_x86_64_defconfig, bumping the
> > kernel version from 5.10.7 to 5.10.72 (latest 5.10.x) solves
> > the problem here...
>
> i think i should modify some .mk file too even if i bumping this version
> to the latest kernel version file
>
> Le mar. 12 oct. 2021 =C3=A0 22:58, Arnout Vandecappelle <arnout@mind.be> =
a
> =C3=A9crit :
>
>>
>>
>> On 12/10/2021 22:52, Peter Seiderer wrote:
>> > Hello Esa=C3=AFe,
>> >
>> > On Tue, 12 Oct 2021 19:41:11 +0200, Esa=C3=AFe Ledoux NJONGSSI KOUAM <
>> kouamdoux@gmail.com> wrote:
>> >
>> >> Another problem occur ,
>> >> Linux 5-10 building generate compilation errors
>> >>
>> >> i have a lot of error :(
>> >>
>> >> arch/x86/entry/thunk_64.o: warning: objtool: missing symbol table
>> >> make[3]: *** [scripts/Makefile.build:360 : arch/x86/entry/thunk_64.o]
>> >> Erreur 1
>> >> make[3]: *** Suppression du fichier =C2=AB arch/x86/entry/thunk_64.o =
=C2=BB
>> >> make[2]: *** [scripts/Makefile.build:496 : arch/x86/entry] Erreur 2
>> >>
>> >>    CC      arch/x86/mm/cpu_entry_area.o
>> >>    CC      arch/x86/mm/maccess.o
>> >>    CC      arch/x86/mm/pkeys.o
>> >>    CC      arch/x86/mm/kaslr.o
>> >>    CC      arch/x86/mm/pti.o
>> >>    AR      arch/x86/mm/built-in.a
>> >> make[1]: *** [Makefile:1805 : arch/x86] Erreur 2
>> >> make[1]: *** Attente des t=C3=A2ches non termin=C3=A9es....
>> >> make[1] : on quitte le r=C3=A9pertoire
>> >> =C2=AB /home/ledoux/Documents/buildroot/output/build/linux-5.10.7 =C2=
=BB
>> >> make: *** [package/pkg-generic.mk:294 :
>> >>
>> /home/ledoux/Documents/buildroot/output/build/linux-5.10.7/.stamp_built]
>> >> Erreur 2
>> >
>> > Can confirm the error with qemu_x86_64_defconfig, bumping the
>> > kernel version from 5.10.7 to 5.10.72 (latest 5.10.x) solves
>> > the problem here...
>>
>>   I head just confirmed the same thing :-)
>>
>>   Regards,
>>   Arnout
>>
>> >
>> > Regards,
>> > Peter
>> >
>> >>
>> >> definitely, I don't know what to do.
>> >> I'm afraid to solve this problem and run into others.
>> >>
>> >>
>> >>
>> >> Le mar. 12 oct. 2021 =C3=A0 15:01, Esa=C3=AFe Ledoux NJONGSSI KOUAM <
>> >> kouamdoux@gmail.com> a =C3=A9crit :
>> >>
>> >>> i have seen something , ...
>> >>> It is working very well , because the problem was rsync version , so=
 i
>> >>> have take the better version
>> >>> https://github.com/WayneD/rsync/blob/master/INSTALL.md , ...
>> >>> thank you for all
>> >>>
>> >>> Le mar. 12 oct. 2021 =C3=A0 14:41, Esa=C3=AFe Ledoux NJONGSSI KOUAM =
<
>> >>> kouamdoux@gmail.com> a =C3=A9crit :
>> >>>
>> >>>>> in the buildroot directory. If that gives an error, there is reall=
y
>> >>>> something
>> >>>>> wrong with your OS.
>> >>>>
>> >>>> i'm trying to reinstall rsync , i hope that something will be fine
>> until
>> >>>> the end
>> >>>>
>> >>>> Le mar. 12 oct. 2021 =C3=A0 13:00, Esa=C3=AFe Ledoux NJONGSSI KOUAM=
 <
>> >>>> kouamdoux@gmail.com> a =C3=A9crit :
>> >>>>
>> >>>>>    > As Joachim asked, can you provide the output of
>> >>>>>
>> >>>>>    >    pwd
>> >>>>>
>> >>>>>> and
>> >>>>>
>> >>>>>    >    findmnt
>> >>>>>
>> >>>>> ledoux@kali:~/Documents/buildroot$ pwd
>> >>>>> /home/ledoux/Documents/buildroot
>> >>>>> ledoux@kali:~/Documents/buildroot$ findmnt
>> >>>>> TARGET                         SOURCE      FSTYPE  OPTIONS
>> >>>>> /                              /dev/sda10  ext4
>> >>>>>   rw,relatime,errors=3Dremount-ro
>> >>>>> =E2=94=9C=E2=94=80/sys                         sysfs       sysfs
>> >>>>> rw,nosuid,nodev,noexec,relati
>> >>>>> =E2=94=82 =E2=94=9C=E2=94=80/sys/kernel/security       securityfs =
 securit
>> >>>>> rw,nosuid,nodev,noexec,relati
>> >>>>> =E2=94=82 =E2=94=9C=E2=94=80/sys/fs/cgroup             cgroup2    =
 cgroup2
>> >>>>> rw,nosuid,nodev,noexec,relati
>> >>>>> =E2=94=82 =E2=94=9C=E2=94=80/sys/fs/pstore             pstore     =
 pstore
>> >>>>>   rw,nosuid,nodev,noexec,relati
>> >>>>> =E2=94=82 =E2=94=9C=E2=94=80/sys/firmware/efi/efivars  efivarfs   =
 efivarf
>> >>>>> rw,nosuid,nodev,noexec,relati
>> >>>>> =E2=94=82 =E2=94=9C=E2=94=80/sys/fs/bpf                none       =
 bpf
>> >>>>> rw,nosuid,nodev,noexec,relati
>> >>>>> =E2=94=82 =E2=94=9C=E2=94=80/sys/kernel/tracing        tracefs    =
 tracefs
>> >>>>> rw,nosuid,nodev,noexec,relati
>> >>>>> =E2=94=82 =E2=94=9C=E2=94=80/sys/kernel/debug          debugfs    =
 debugfs
>> >>>>> rw,nosuid,nodev,noexec,relati
>> >>>>> =E2=94=82 =E2=94=9C=E2=94=80/sys/kernel/config         configfs   =
 configf
>> >>>>> rw,nosuid,nodev,noexec,relati
>> >>>>> =E2=94=82 =E2=94=94=E2=94=80/sys/fs/fuse/connections   fusectl    =
 fusectl
>> >>>>> rw,nosuid,nodev,noexec,relati
>> >>>>> =E2=94=9C=E2=94=80/proc                        proc        proc
>> >>>>>   rw,nosuid,nodev,noexec,relati
>> >>>>> =E2=94=82 =E2=94=94=E2=94=80/proc/sys/fs/binfmt_misc   systemd-1  =
 autofs
>> >>>>>   rw,relatime,fd=3D29,pgrp=3D1,time
>> >>>>> =E2=94=82   =E2=94=94=E2=94=80/proc/sys/fs/binfmt_misc binfmt_misc=
 binfmt_
>> >>>>> rw,nosuid,nodev,noexec,relati
>> >>>>> =E2=94=9C=E2=94=80/dev                         udev        devtmpf
>> >>>>> rw,nosuid,relatime,size=3D17018
>> >>>>> =E2=94=82 =E2=94=9C=E2=94=80/dev/pts                   devpts     =
 devpts
>> >>>>>   rw,nosuid,noexec,relatime,gid
>> >>>>> =E2=94=82 =E2=94=9C=E2=94=80/dev/shm                   tmpfs      =
 tmpfs   rw,nosuid,nodev
>> >>>>> =E2=94=82 =E2=94=9C=E2=94=80/dev/hugepages             hugetlbfs  =
 hugetlb
>> >>>>> rw,relatime,pagesize=3D2M
>> >>>>> =E2=94=82 =E2=94=94=E2=94=80/dev/mqueue                mqueue     =
 mqueue
>> >>>>>   rw,nosuid,nodev,noexec,relati
>> >>>>> =E2=94=9C=E2=94=80/run                         tmpfs       tmpfs
>> >>>>> rw,nosuid,nodev,noexec,relati
>> >>>>> =E2=94=82 =E2=94=9C=E2=94=80/run/lock                  tmpfs      =
 tmpfs
>> >>>>> rw,nosuid,nodev,noexec,relati
>> >>>>> =E2=94=82 =E2=94=9C=E2=94=80/run/rpc_pipefs            sunrpc     =
 rpc_pip rw,relatime
>> >>>>> =E2=94=82 =E2=94=94=E2=94=80/run/user/1000             tmpfs      =
 tmpfs
>> >>>>> rw,nosuid,nodev,relatime,size
>> >>>>> =E2=94=82   =E2=94=94=E2=94=80/run/user/1000/doc       portal     =
 fuse.po
>> >>>>> rw,nosuid,nodev,relatime,user
>> >>>>> =E2=94=9C=E2=94=80/tmp                         /dev/sda9   ext4   =
 rw,relatime
>> >>>>> =E2=94=9C=E2=94=80/var                         /dev/sda7   ext4   =
 rw,relatime
>> >>>>> =E2=94=9C=E2=94=80/home                        /dev/sda11  ext4   =
 rw,relatime
>> >>>>> =E2=94=9C=E2=94=80/boot/efi                    /dev/sda2   vfat
>> >>>>>   rw,relatime,fmask=3D0077,dmask=3D
>> >>>>> =E2=94=94=E2=94=80/media/ledoux/Data           /dev/sda6   fuseblk
>> >>>>> rw,nosuid,nodev,relatime,user
>> >>>>>
>> >>>>>
>> >>>>>
>> >>>>> Le lun. 11 oct. 2021 =C3=A0 22:25, Arnout Vandecappelle <arnout@mi=
nd.be>
>> a
>> >>>>> =C3=A9crit :
>> >>>>>
>> >>>>>>    Hi Esaie,
>> >>>>>>
>> >>>>>>    Please don't top-post, but reply inline like I do below. Note
>> that
>> >>>>>> this
>> >>>>>> requires configuring your mailer to quote replies properly (i.e.
>> put >
>> >>>>>> markers
>> >>>>>> in front of each line).
>> >>>>>>
>> >>>>>>
>> >>>>>> On 11/10/2021 12:20, Esa=C3=AFe Ledoux NJONGSSI KOUAM wrote:
>> >>>>>>> i have tried
>> >>>>>>> git clone git://git.buildroot.net/buildroot <
>> >>>>>> http://git.buildroot.net/buildroot>
>> >>>>>>> make qemu_x86_64_defconfig
>> >>>>>>> make
>> >>>>>>>
>> >>>>>>> i have type it on Documents folder that has ext4 file system
>> >>>>>>
>> >>>>>>    As Joachim asked, can you provide the output of
>> >>>>>>
>> >>>>>>       pwd
>> >>>>>>
>> >>>>>> and
>> >>>>>>
>> >>>>>>       findmnt
>> >>>>>>
>> >>>>>> so we can see if the filesystem really is ext4, or it has some
>> weird
>> >>>>>> mount
>> >>>>>> option, or anything else that could explain the issue?
>> >>>>>>
>> >>>>>>    You can also try:
>> >>>>>>
>> >>>>>>       touch foo
>> >>>>>>       chmod 666 foo
>> >>>>>>
>> >>>>>> in the buildroot directory. If that gives an error, there is real=
ly
>> >>>>>> something
>> >>>>>> wrong with your OS.
>> >>>>>>
>> >>>>>>    Regards,
>> >>>>>>    Arnout
>> >>>>>>
>> >>>>>>>
>> >>>>>>>
>> >>>>>>> still now i have the same error
>> >>>>>>>
>> >>>>>>> Le dim. 10 oct. 2021 =C3=A0 21:57, Joachim Wiberg <troglobit@gma=
il.com
>> >>>>>>> <mailto:troglobit@gmail.com>> a =C3=A9crit :
>> >>>>>>>
>> >>>>>>>      Hi,
>> >>>>>>>
>> >>>>>>>      On 10/10/21 6:52 PM, Esa=C3=AFe Ledoux NJONGSSI KOUAM wrote=
:
>> >>>>>>>       > no filesystem has been configured ...
>> >>>>>>>       > I'm just trying the default configuration
>> >>>>>>>
>> >>>>>>>      This is fine.  I think you've got something really wrong
>> with your
>> >>>>>>>      Kali Linux host system.
>> >>>>>>>
>> >>>>>>>       > should i configure file system for my buildroot ??
>> >>>>>>>
>> >>>>>>>      No, we mean the file system you are using for building
>> Buildroot
>> >>>>>> on,
>> >>>>>>>      in your Kali Linux install.  The rsync error looks as if
>> your disk
>> >>>>>>>      partition is a non-native Linux file system, like FAT, whic=
h
>> does
>> >>>>>>>      not support the operations rsync tries to perform.
>> >>>>>>>
>> >>>>>>>      How have you set up your Kali Linux?  Do you have the
>> buildroot
>> >>>>>> git
>> >>>>>>>      sources checked out to your home directory or some other
>> >>>>>> directory,
>> >>>>>>>      perhaps shared with Windows?  If so, I'd definitely avoid
>> that.
>> >>>>>> You
>> >>>>>>>      can check the filesystem of your build directory by
>> comparing the
>> >>>>>>>      output of
>> >>>>>>>
>> >>>>>>>          pwd
>> >>>>>>>
>> >>>>>>>      with the output from
>> >>>>>>>
>> >>>>>>>          findmnt
>> >>>>>>>
>> >>>>>>>      On my system I have ext4 in the FSTYPE column for my home
>> >>>>>> directory,
>> >>>>>>>      which is in the / TARGET.
>> >>>>>>>
>> >>>>>>>      I finished my install of Kali in my own VM.  It crashed bad=
ly
>> >>>>>> before
>> >>>>>>>      I gave it enough disk (40 GiB) and RAM (4 GiB).  That's
>> another
>> >>>>>> thing
>> >>>>>>>      that might have messed up your build tree.
>> >>>>>>>
>> >>>>>>>       > the error persists even if i compile it as normal user
>> >>>>>>>
>> >>>>>>>      Well that's good to know, at least it's consistent.  Just
>> beware
>> >>>>>>>      that if you reuse the same source tree, having switched to
>> another
>> >>>>>>>      user, a lot of files may still have root as the owner, whic=
h
>> may
>> >>>>>>>      give you other problems.  Either `sudo chown -R user:user .=
`
>> from
>> >>>>>>>      inside the Buildroot source tree, or check out a new tree.
>> >>>>>>>
>> >>>>>>>      Best regards
>> >>>>>>>        /Joachim
>> >>>>>>>
>> >>>>>>>
>> >>>>>>> _______________________________________________
>> >>>>>>> buildroot mailing list
>> >>>>>>> buildroot@buildroot.org
>> >>>>>>> https://lists.buildroot.org/mailman/listinfo/buildroot
>> >>>>>>>
>> >>>>>>
>> >>>>>
>> >
>>
>

--0000000000003ac26005ce3a544f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>so i should modify which mk file ??</div></div><br><d=
iv class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mer.=
 13 oct. 2021 =C3=A0=C2=A012:34, Esa=C3=AFe Ledoux NJONGSSI KOUAM &lt;<a hr=
ef=3D"mailto:kouamdoux@gmail.com">kouamdoux@gmail.com</a>&gt; a =C3=A9crit=
=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"ltr">&gt; Can confirm the error with qemu_x86_64_defconfig, bumping the=
<br>
&gt; kernel version from 5.10.7 to 5.10.72 (latest 5.10.x) solves<br><div>
&gt; the problem here...</div><div><br></div><div>i think i should modify s=
ome .mk file too even if i bumping this version to the latest kernel versio=
n file<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">Le=C2=A0mar. 12 oct. 2021 =C3=A0=C2=A022:58, Arnout Vandeca=
ppelle &lt;<a href=3D"mailto:arnout@mind.be" target=3D"_blank">arnout@mind.=
be</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex"><br>
<br>
On 12/10/2021 22:52, Peter Seiderer wrote:<br>
&gt; Hello Esa=C3=AFe,<br>
&gt; <br>
&gt; On Tue, 12 Oct 2021 19:41:11 +0200, Esa=C3=AFe Ledoux NJONGSSI KOUAM &=
lt;<a href=3D"mailto:kouamdoux@gmail.com" target=3D"_blank">kouamdoux@gmail=
.com</a>&gt; wrote:<br>
&gt; <br>
&gt;&gt; Another problem occur ,<br>
&gt;&gt; Linux 5-10 building generate compilation errors<br>
&gt;&gt;<br>
&gt;&gt; i have a lot of error :(<br>
&gt;&gt;<br>
&gt;&gt; arch/x86/entry/thunk_64.o: warning: objtool: missing symbol table<=
br>
&gt;&gt; make[3]: *** [scripts/Makefile.build:360 : arch/x86/entry/thunk_64=
.o]<br>
&gt;&gt; Erreur 1<br>
&gt;&gt; make[3]: *** Suppression du fichier =C2=AB arch/x86/entry/thunk_64=
.o =C2=BB<br>
&gt;&gt; make[2]: *** [scripts/Makefile.build:496 : arch/x86/entry] Erreur =
2<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 CC=C2=A0 =C2=A0 =C2=A0 arch/x86/mm/cpu_entry_area.o<b=
r>
&gt;&gt;=C2=A0 =C2=A0 CC=C2=A0 =C2=A0 =C2=A0 arch/x86/mm/maccess.o<br>
&gt;&gt;=C2=A0 =C2=A0 CC=C2=A0 =C2=A0 =C2=A0 arch/x86/mm/pkeys.o<br>
&gt;&gt;=C2=A0 =C2=A0 CC=C2=A0 =C2=A0 =C2=A0 arch/x86/mm/kaslr.o<br>
&gt;&gt;=C2=A0 =C2=A0 CC=C2=A0 =C2=A0 =C2=A0 arch/x86/mm/pti.o<br>
&gt;&gt;=C2=A0 =C2=A0 AR=C2=A0 =C2=A0 =C2=A0 arch/x86/mm/built-in.a<br>
&gt;&gt; make[1]: *** [Makefile:1805 : arch/x86] Erreur 2<br>
&gt;&gt; make[1]: *** Attente des t=C3=A2ches non termin=C3=A9es....<br>
&gt;&gt; make[1] : on quitte le r=C3=A9pertoire<br>
&gt;&gt; =C2=AB /home/ledoux/Documents/buildroot/output/build/linux-5.10.7 =
=C2=BB<br>
&gt;&gt; make: *** [package/<a href=3D"http://pkg-generic.mk:294" rel=3D"no=
referrer" target=3D"_blank">pkg-generic.mk:294</a> :<br>
&gt;&gt; /home/ledoux/Documents/buildroot/output/build/linux-5.10.7/.stamp_=
built]<br>
&gt;&gt; Erreur 2<br>
&gt; <br>
&gt; Can confirm the error with qemu_x86_64_defconfig, bumping the<br>
&gt; kernel version from 5.10.7 to 5.10.72 (latest 5.10.x) solves<br>
&gt; the problem here...<br>
<br>
=C2=A0 I head just confirmed the same thing :-)<br>
<br>
=C2=A0 Regards,<br>
=C2=A0 Arnout<br>
<br>
&gt; <br>
&gt; Regards,<br>
&gt; Peter<br>
&gt; <br>
&gt;&gt;<br>
&gt;&gt; definitely, I don&#39;t know what to do.<br>
&gt;&gt; I&#39;m afraid to solve this problem and run into others.<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Le mar. 12 oct. 2021 =C3=A0 15:01, Esa=C3=AFe Ledoux NJONGSSI KOUA=
M &lt;<br>
&gt;&gt; <a href=3D"mailto:kouamdoux@gmail.com" target=3D"_blank">kouamdoux=
@gmail.com</a>&gt; a =C3=A9crit :<br>
&gt;&gt;<br>
&gt;&gt;&gt; i have seen something , ...<br>
&gt;&gt;&gt; It is working very well , because the problem was rsync versio=
n , so i<br>
&gt;&gt;&gt; have take the better version<br>
&gt;&gt;&gt; <a href=3D"https://github.com/WayneD/rsync/blob/master/INSTALL=
.md" rel=3D"noreferrer" target=3D"_blank">https://github.com/WayneD/rsync/b=
lob/master/INSTALL.md</a> , ...<br>
&gt;&gt;&gt; thank you for all<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Le mar. 12 oct. 2021 =C3=A0 14:41, Esa=C3=AFe Ledoux NJONGSSI =
KOUAM &lt;<br>
&gt;&gt;&gt; <a href=3D"mailto:kouamdoux@gmail.com" target=3D"_blank">kouam=
doux@gmail.com</a>&gt; a =C3=A9crit :<br>
&gt;&gt;&gt;=C2=A0 =C2=A0<br>
&gt;&gt;&gt;&gt;&gt; in the buildroot directory. If that gives an error, th=
ere is really<br>
&gt;&gt;&gt;&gt; something<br>
&gt;&gt;&gt;&gt;&gt; wrong with your OS.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; i&#39;m trying to reinstall rsync , i hope that something =
will be fine until<br>
&gt;&gt;&gt;&gt; the end<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Le mar. 12 oct. 2021 =C3=A0 13:00, Esa=C3=AFe Ledoux NJONG=
SSI KOUAM &lt;<br>
&gt;&gt;&gt;&gt; <a href=3D"mailto:kouamdoux@gmail.com" target=3D"_blank">k=
ouamdoux@gmail.com</a>&gt; a =C3=A9crit :<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 &gt; As Joachim asked, can you provide th=
e output of<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 pwd<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0<br>
&gt;&gt;&gt;&gt;&gt;&gt; and<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 findmnt<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; ledoux@kali:~/Documents/buildroot$ pwd<br>
&gt;&gt;&gt;&gt;&gt; /home/ledoux/Documents/buildroot<br>
&gt;&gt;&gt;&gt;&gt; ledoux@kali:~/Documents/buildroot$ findmnt<br>
&gt;&gt;&gt;&gt;&gt; TARGET=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SOURCE=C2=A0 =C2=A0 =C2=A0 FSTYPE=
=C2=A0 OPTIONS<br>
&gt;&gt;&gt;&gt;&gt; /=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /dev/sda10=C2=A0 ext4<=
br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0rw,relatime,errors=3Dremount-ro<br>
&gt;&gt;&gt;&gt;&gt; =E2=94=9C=E2=94=80/sys=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sysfs=C2=A0 =C2=
=A0 =C2=A0 =C2=A0sysfs<br>
&gt;&gt;&gt;&gt;&gt; rw,nosuid,nodev,noexec,relati<br>
&gt;&gt;&gt;&gt;&gt; =E2=94=82 =E2=94=9C=E2=94=80/sys/kernel/security=C2=A0=
 =C2=A0 =C2=A0 =C2=A0securityfs=C2=A0 securit<br>
&gt;&gt;&gt;&gt;&gt; rw,nosuid,nodev,noexec,relati<br>
&gt;&gt;&gt;&gt;&gt; =E2=94=82 =E2=94=9C=E2=94=80/sys/fs/cgroup=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cgroup2=C2=A0 =C2=A0 =C2=A0cgroup2<br=
>
&gt;&gt;&gt;&gt;&gt; rw,nosuid,nodev,noexec,relati<br>
&gt;&gt;&gt;&gt;&gt; =E2=94=82 =E2=94=9C=E2=94=80/sys/fs/pstore=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pstore=C2=A0 =C2=A0 =C2=A0 pstore<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0rw,nosuid,nodev,noexec,relati<br>
&gt;&gt;&gt;&gt;&gt; =E2=94=82 =E2=94=9C=E2=94=80/sys/firmware/efi/efivars=
=C2=A0 efivarfs=C2=A0 =C2=A0 efivarf<br>
&gt;&gt;&gt;&gt;&gt; rw,nosuid,nodev,noexec,relati<br>
&gt;&gt;&gt;&gt;&gt; =E2=94=82 =E2=94=9C=E2=94=80/sys/fs/bpf=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 none=C2=A0 =C2=A0 =C2=A0 =C2=A0 b=
pf<br>
&gt;&gt;&gt;&gt;&gt; rw,nosuid,nodev,noexec,relati<br>
&gt;&gt;&gt;&gt;&gt; =E2=94=82 =E2=94=9C=E2=94=80/sys/kernel/tracing=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 tracefs=C2=A0 =C2=A0 =C2=A0tracefs<br>
&gt;&gt;&gt;&gt;&gt; rw,nosuid,nodev,noexec,relati<br>
&gt;&gt;&gt;&gt;&gt; =E2=94=82 =E2=94=9C=E2=94=80/sys/kernel/debug=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 debugfs=C2=A0 =C2=A0 =C2=A0debugfs<br>
&gt;&gt;&gt;&gt;&gt; rw,nosuid,nodev,noexec,relati<br>
&gt;&gt;&gt;&gt;&gt; =E2=94=82 =E2=94=9C=E2=94=80/sys/kernel/config=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0configfs=C2=A0 =C2=A0 configf<br>
&gt;&gt;&gt;&gt;&gt; rw,nosuid,nodev,noexec,relati<br>
&gt;&gt;&gt;&gt;&gt; =E2=94=82 =E2=94=94=E2=94=80/sys/fs/fuse/connections=
=C2=A0 =C2=A0fusectl=C2=A0 =C2=A0 =C2=A0fusectl<br>
&gt;&gt;&gt;&gt;&gt; rw,nosuid,nodev,noexec,relati<br>
&gt;&gt;&gt;&gt;&gt; =E2=94=9C=E2=94=80/proc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 proc=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 proc<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0rw,nosuid,nodev,noexec,relati<br>
&gt;&gt;&gt;&gt;&gt; =E2=94=82 =E2=94=94=E2=94=80/proc/sys/fs/binfmt_misc=
=C2=A0 =C2=A0systemd-1=C2=A0 =C2=A0autofs<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0rw,relatime,fd=3D29,pgrp=3D1,time<br>
&gt;&gt;&gt;&gt;&gt; =E2=94=82=C2=A0 =C2=A0=E2=94=94=E2=94=80/proc/sys/fs/b=
infmt_misc binfmt_misc binfmt_<br>
&gt;&gt;&gt;&gt;&gt; rw,nosuid,nodev,noexec,relati<br>
&gt;&gt;&gt;&gt;&gt; =E2=94=9C=E2=94=80/dev=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0udev=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 devtmpf<br>
&gt;&gt;&gt;&gt;&gt; rw,nosuid,relatime,size=3D17018<br>
&gt;&gt;&gt;&gt;&gt; =E2=94=82 =E2=94=9C=E2=94=80/dev/pts=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0devpts=C2=A0 =C2=A0 =C2=
=A0 devpts<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0rw,nosuid,noexec,relatime,gid<br>
&gt;&gt;&gt;&gt;&gt; =E2=94=82 =E2=94=9C=E2=94=80/dev/shm=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tmpfs=C2=A0 =C2=A0 =C2=
=A0 =C2=A0tmpfs=C2=A0 =C2=A0rw,nosuid,nodev<br>
&gt;&gt;&gt;&gt;&gt; =E2=94=82 =E2=94=9C=E2=94=80/dev/hugepages=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hugetlbfs=C2=A0 =C2=A0hugetlb<br>
&gt;&gt;&gt;&gt;&gt; rw,relatime,pagesize=3D2M<br>
&gt;&gt;&gt;&gt;&gt; =E2=94=82 =E2=94=94=E2=94=80/dev/mqueue=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mqueue=C2=A0 =C2=A0 =C2=A0 mqueue=
<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0rw,nosuid,nodev,noexec,relati<br>
&gt;&gt;&gt;&gt;&gt; =E2=94=9C=E2=94=80/run=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tmpfs=C2=A0 =C2=
=A0 =C2=A0 =C2=A0tmpfs<br>
&gt;&gt;&gt;&gt;&gt; rw,nosuid,nodev,noexec,relati<br>
&gt;&gt;&gt;&gt;&gt; =E2=94=82 =E2=94=9C=E2=94=80/run/lock=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tmpfs=C2=A0 =C2=A0 =C2=A0 =C2=
=A0tmpfs<br>
&gt;&gt;&gt;&gt;&gt; rw,nosuid,nodev,noexec,relati<br>
&gt;&gt;&gt;&gt;&gt; =E2=94=82 =E2=94=9C=E2=94=80/run/rpc_pipefs=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sunrpc=C2=A0 =C2=A0 =C2=A0 rpc_pip rw,relat=
ime<br>
&gt;&gt;&gt;&gt;&gt; =E2=94=82 =E2=94=94=E2=94=80/run/user/1000=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tmpfs=C2=A0 =C2=A0 =C2=A0 =C2=A0tmpfs=
<br>
&gt;&gt;&gt;&gt;&gt; rw,nosuid,nodev,relatime,size<br>
&gt;&gt;&gt;&gt;&gt; =E2=94=82=C2=A0 =C2=A0=E2=94=94=E2=94=80/run/user/1000=
/doc=C2=A0 =C2=A0 =C2=A0 =C2=A0portal=C2=A0 =C2=A0 =C2=A0 fuse.po<br>
&gt;&gt;&gt;&gt;&gt; rw,nosuid,nodev,relatime,user<br>
&gt;&gt;&gt;&gt;&gt; =E2=94=9C=E2=94=80/tmp=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/dev/sda9=C2=A0 =
=C2=A0ext4=C2=A0 =C2=A0 rw,relatime<br>
&gt;&gt;&gt;&gt;&gt; =E2=94=9C=E2=94=80/var=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/dev/sda7=C2=A0 =
=C2=A0ext4=C2=A0 =C2=A0 rw,relatime<br>
&gt;&gt;&gt;&gt;&gt; =E2=94=9C=E2=94=80/home=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /dev/sda11=C2=A0 ext4=
=C2=A0 =C2=A0 rw,relatime<br>
&gt;&gt;&gt;&gt;&gt; =E2=94=9C=E2=94=80/boot/efi=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /dev/sda2=C2=A0 =C2=A0vfat<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0rw,relatime,fmask=3D0077,dmask=3D<br>
&gt;&gt;&gt;&gt;&gt; =E2=94=94=E2=94=80/media/ledoux/Data=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0/dev/sda6=C2=A0 =C2=A0fuseblk<br>
&gt;&gt;&gt;&gt;&gt; rw,nosuid,nodev,relatime,user<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; Le lun. 11 oct. 2021 =C3=A0 22:25, Arnout Vandecappell=
e &lt;<a href=3D"mailto:arnout@mind.be" target=3D"_blank">arnout@mind.be</a=
>&gt; a<br>
&gt;&gt;&gt;&gt;&gt; =C3=A9crit :<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0<br>
&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 Hi Esaie,<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 Please don&#39;t top-post, but reply =
inline like I do below. Note that<br>
&gt;&gt;&gt;&gt;&gt;&gt; this<br>
&gt;&gt;&gt;&gt;&gt;&gt; requires configuring your mailer to quote replies =
properly (i.e. put &gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; markers<br>
&gt;&gt;&gt;&gt;&gt;&gt; in front of each line).<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; On 11/10/2021 12:20, Esa=C3=AFe Ledoux NJONGSSI KO=
UAM wrote:<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; i have tried<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; git clone git://<a href=3D"http://git.buildroo=
t.net/buildroot" rel=3D"noreferrer" target=3D"_blank">git.buildroot.net/bui=
ldroot</a> &lt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; <a href=3D"http://git.buildroot.net/buildroot" rel=
=3D"noreferrer" target=3D"_blank">http://git.buildroot.net/buildroot</a>&gt=
;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; make qemu_x86_64_defconfig<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; make<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; i have type it on Documents folder that has ex=
t4 file system<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 As Joachim asked, can you provide the=
 output of<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0pwd<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; and<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0findmnt<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; so we can see if the filesystem really is ext4, or=
 it has some weird<br>
&gt;&gt;&gt;&gt;&gt;&gt; mount<br>
&gt;&gt;&gt;&gt;&gt;&gt; option, or anything else that could explain the is=
sue?<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 You can also try:<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0touch foo<br>
&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0chmod 666 foo<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; in the buildroot directory. If that gives an error=
, there is really<br>
&gt;&gt;&gt;&gt;&gt;&gt; something<br>
&gt;&gt;&gt;&gt;&gt;&gt; wrong with your OS.<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 Regards,<br>
&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 Arnout<br>
&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; still now i have the same error<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; Le dim. 10 oct. 2021 =C3=A0 21:57, Joachim Wib=
erg &lt;<a href=3D"mailto:troglobit@gmail.com" target=3D"_blank">troglobit@=
gmail.com</a><br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; &lt;mailto:<a href=3D"mailto:troglobit@gmail.c=
om" target=3D"_blank">troglobit@gmail.com</a>&gt;&gt; a =C3=A9crit :<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 Hi,<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 On 10/10/21 6:52 PM, Esa=
=C3=AFe Ledoux NJONGSSI KOUAM wrote:<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; no filesystem h=
as been configured ...<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; I&#39;m just tr=
ying the default configuration<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 This is fine.=C2=A0 I thin=
k you&#39;ve got something really wrong with your<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 Kali Linux host system.<br=
>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; should i config=
ure file system for my buildroot ??<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 No, we mean the file syste=
m you are using for building Buildroot<br>
&gt;&gt;&gt;&gt;&gt;&gt; on,<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 in your Kali Linux install=
.=C2=A0 The rsync error looks as if your disk<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 partition is a non-native =
Linux file system, like FAT, which does<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 not support the operations=
 rsync tries to perform.<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 How have you set up your K=
ali Linux?=C2=A0 Do you have the buildroot<br>
&gt;&gt;&gt;&gt;&gt;&gt; git<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 sources checked out to you=
r home directory or some other<br>
&gt;&gt;&gt;&gt;&gt;&gt; directory,<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 perhaps shared with Window=
s?=C2=A0 If so, I&#39;d definitely avoid that.<br>
&gt;&gt;&gt;&gt;&gt;&gt; You<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 can check the filesystem o=
f your build directory by comparing the<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 output of<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pwd<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 with the output from<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 findmnt<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 On my system I have ext4 i=
n the FSTYPE column for my home<br>
&gt;&gt;&gt;&gt;&gt;&gt; directory,<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 which is in the / TARGET.<=
br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 I finished my install of K=
ali in my own VM.=C2=A0 It crashed badly<br>
&gt;&gt;&gt;&gt;&gt;&gt; before<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 I gave it enough disk (40 =
GiB) and RAM (4 GiB).=C2=A0 That&#39;s another<br>
&gt;&gt;&gt;&gt;&gt;&gt; thing<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 that might have messed up =
your build tree.<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; the error persi=
sts even if i compile it as normal user<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 Well that&#39;s good to kn=
ow, at least it&#39;s consistent.=C2=A0 Just beware<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 that if you reuse the same=
 source tree, having switched to another<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 user, a lot of files may s=
till have root as the owner, which may<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 give you other problems.=
=C2=A0 Either `sudo chown -R user:user .` from<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 inside the Buildroot sourc=
e tree, or check out a new tree.<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 Best regards<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 /Joachim<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; ______________________________________________=
_<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; buildroot mailing list<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <a href=3D"mailto:buildroot@buildroot.org" tar=
get=3D"_blank">buildroot@buildroot.org</a><br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <a href=3D"https://lists.buildroot.org/mailman=
/listinfo/buildroot" rel=3D"noreferrer" target=3D"_blank">https://lists.bui=
ldroot.org/mailman/listinfo/buildroot</a><br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0<br>
&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0<br>
&gt; <br>
</blockquote></div>
</blockquote></div>

--0000000000003ac26005ce3a544f--

--===============2944543786144010070==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2944543786144010070==--
