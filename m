Return-Path: <SRS0=enEc=PC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A51F3C433F5
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 09:35:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 09D9A6109F
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 09:35:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 09D9A6109F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8EEE5401BF;
	Thu, 14 Oct 2021 09:35:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4UKjMSz6R9NW; Thu, 14 Oct 2021 09:35:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E55814022D;
	Thu, 14 Oct 2021 09:35:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2ABAE1BF3D9
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 09:35:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1C45B4022D
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 09:35:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j0qi83E2hqY8 for <buildroot@lists.busybox.net>;
 Thu, 14 Oct 2021 09:35:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5EAFD401BF
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 09:35:19 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id k3so2773691ilu.2
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 02:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aRQSUjZLahxYLf21uWvW13Du8OwLKxeXSCxQM6r+mMw=;
 b=iXKDFolVbAj1kDpk3TkLvdx91SkZqqIIg/RH9NP4zcTFQu2z79/MXMqD5kdpAWpxo1
 MOTvngxb0tjAmtFaLEm60UAPWlTVJfaS+l49n9obF6iSWMmSV6Tdm7FV+asYXK0eX4TQ
 0esigZPTZgM8ZqdZzE10tH7F/Wjv+H7CE16vfipNbKVarzpk2jmsQ+mE/OvDzYDkIfzh
 +Jy5J3fsXkDPKcCYhC0Q+QO+QFB7V+7wDUVs8geCeAEmWkcU4p+uZAooPkHBhwkbFVbM
 DTvZbDBVMVtN8AT9WIu5REf4U/Alb4i4yQC0i5M90rIR6+0v2Zxqsr78cUtpBbrZbp/I
 Iepg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aRQSUjZLahxYLf21uWvW13Du8OwLKxeXSCxQM6r+mMw=;
 b=USkdth3SG5g5IeBepZuGvGP9FNIObhB40Tr7whEX2C4c1Rhjv2mMMWPvDP9sGmtxNt
 U9UDNU+eb1GsvjP3TkfVtNeyN0au7j91ISGEDLF9mKpU7+mepzybgk5EEG8JpyTaR65U
 MahfEVWRrlnGWscm/XEBJa0mjoNEyu4ugw2rMlOkIbORjM3Th7p9XUWMtIW2CjWFrXNj
 /WRWMQGGn5lKDSiLCld7Ue8hpwnFGGb7LsEqz0T9xQZnCDMrMAu+VGYYNdgQ4VXaigNS
 5IPgHBFXr5w9GSzPeqhC0SlH7vQ4WRz9Cnby0j1khVEhs06cI4g8QkZ3FYLkcPqNyD0m
 RRGg==
X-Gm-Message-State: AOAM532qEI8fdx0s9ioWXyytI6OBigWWMd9f60XSvuc8asxPrpM3nZfJ
 CZHh43l8P0Qpzj0jXFPeAUd8Q5z6UgcEh5KrVg==
X-Google-Smtp-Source: ABdhPJwc0EU28WlNjg4gDfJtojTVwRw9Pp8StYJnNF4mrQGKeFWxmyUINedbB5/Pqcl4+jELosLyZd8vMfOeCdnIVAM=
X-Received: by 2002:a05:6e02:178d:: with SMTP id
 y13mr1688997ilu.184.1634204118181; 
 Thu, 14 Oct 2021 02:35:18 -0700 (PDT)
MIME-Version: 1.0
References: <CA+eej5MzpM30U7sMqba5gKQ3dG5FznZqd6roacphLhx6J-9auA@mail.gmail.com>
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
 <CA+eej5Py5=BfZzMuZS8ARZ5K24xBjGTrpu0iANh7hX9AjK6NQA@mail.gmail.com>
 <20211013182644.6b10f575@gmx.net>
In-Reply-To: <20211013182644.6b10f575@gmx.net>
From: =?UTF-8?Q?Esa=C3=AFe_Ledoux_NJONGSSI_KOUAM?= <kouamdoux@gmail.com>
Date: Thu, 14 Oct 2021 13:35:06 +0200
Message-ID: <CA+eej5M-9OVMikj2YFdL7bDUWKRztiqJZqxk0UzEkYXvHaxh3Q@mail.gmail.com>
To: Peter Seiderer <ps.report@gmx.net>
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
Content-Type: multipart/mixed; boundary="===============3316224844061323630=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3316224844061323630==
Content-Type: multipart/alternative; boundary="000000000000f46b6005ce4ccbb7"

--000000000000f46b6005ce4ccbb7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

is it finish ??

Creating filesystem with 61440 1k blocks and 15360 inodes
Filesystem UUID: 721b9a0d-d383-4b06-9469-77944cffb7c6
Superblock backups stored on blocks:
8193, 24577, 40961, 57345

Allocating group tables: done
Writing inode tables: done
Copying files into the device: done
Writing superblocks and filesystem accounting information: done

ln -snf
/home/ledoux/Documents/buildroot/output/host/x86_64-buildroot-linux-uclibc/=
sysroot
/home/ledoux/Documents/buildroot/output/staging
>>>   Executing post-image script board/qemu/post-image.sh

:) :)=F0=9F=98=82=F0=9F=98=82=F0=9F=98=82

Le mer. 13 oct. 2021 =C3=A0 18:26, Peter Seiderer <ps.report@gmx.net> a =C3=
=A9crit :

> Hello Esa=C3=AFe,
>
> On Wed, 13 Oct 2021 12:38:11 +0200, Esa=C3=AFe Ledoux NJONGSSI KOUAM <
> kouamdoux@gmail.com> wrote:
>
> > so i should modify which mk file ??
> >
> > Le mer. 13 oct. 2021 =C3=A0 12:34, Esa=C3=AFe Ledoux NJONGSSI KOUAM <
> > kouamdoux@gmail.com> a =C3=A9crit :
> >
> > > > Can confirm the error with qemu_x86_64_defconfig, bumping the
> > > > kernel version from 5.10.7 to 5.10.72 (latest 5.10.x) solves
> > > > the problem here...
> > >
> > > i think i should modify some .mk file too even if i bumping this
> version
> > > to the latest kernel version file
>
> Three options:
>
> 1) At your build directory edit the '.config' file, exchange the followin=
g
> two
> lines:
>
>         BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"5.10.7"
>         BR2_LINUX_KERNEL_VERSION=3D"5.10.7"
>
> with:
>
>         BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"5.10.72"
>         BR2_LINUX_KERNEL_VERSION=3D"5.10.72"
>
> and run 'make'
>
>
> 2) At your build directory run 'make menuconfig', navigate to
>
>         Kernel --> Kernel version
> Now press return and edit the string 5.10.7 to 5.10.72, press return
> to confirm the '<Ok>', navigate to '<Exit>', navigate to '<Exit', confirm
> 'Do you wish to save your new configuration', and run 'make'
>
>
> 3) Edit configs/qemu_x86_64_defconfig, exchange the followig line:
>
>         BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"5.10.7"
> with
>         BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"5.10.72"
>
> Now run 'make qemu_x86_64_defconfig', run make
>
> 1) and 2) are equivalent, 3) makes your change permanent but needs
> the 'make qemu_x86_64_defconfig' to apply the change to your current
> build...
>
> Regards,
> Peter
>
>
> > >
> > > Le mar. 12 oct. 2021 =C3=A0 22:58, Arnout Vandecappelle <arnout@mind.=
be> a
> > > =C3=A9crit :
> > >
> > >>
> > >>
> > >> On 12/10/2021 22:52, Peter Seiderer wrote:
> > >> > Hello Esa=C3=AFe,
> > >> >
> > >> > On Tue, 12 Oct 2021 19:41:11 +0200, Esa=C3=AFe Ledoux NJONGSSI KOU=
AM <
> > >> kouamdoux@gmail.com> wrote:
> > >> >
> > >> >> Another problem occur ,
> > >> >> Linux 5-10 building generate compilation errors
> > >> >>
> > >> >> i have a lot of error :(
> > >> >>
> > >> >> arch/x86/entry/thunk_64.o: warning: objtool: missing symbol table
> > >> >> make[3]: *** [scripts/Makefile.build:360 :
> arch/x86/entry/thunk_64.o]
> > >> >> Erreur 1
> > >> >> make[3]: *** Suppression du fichier =C2=AB arch/x86/entry/thunk_6=
4.o =C2=BB
> > >> >> make[2]: *** [scripts/Makefile.build:496 : arch/x86/entry] Erreur=
 2
> > >> >>
> > >> >>    CC      arch/x86/mm/cpu_entry_area.o
> > >> >>    CC      arch/x86/mm/maccess.o
> > >> >>    CC      arch/x86/mm/pkeys.o
> > >> >>    CC      arch/x86/mm/kaslr.o
> > >> >>    CC      arch/x86/mm/pti.o
> > >> >>    AR      arch/x86/mm/built-in.a
> > >> >> make[1]: *** [Makefile:1805 : arch/x86] Erreur 2
> > >> >> make[1]: *** Attente des t=C3=A2ches non termin=C3=A9es....
> > >> >> make[1] : on quitte le r=C3=A9pertoire
> > >> >> =C2=AB /home/ledoux/Documents/buildroot/output/build/linux-5.10.7=
 =C2=BB
> > >> >> make: *** [package/pkg-generic.mk:294 :
> > >> >>
> > >>
> /home/ledoux/Documents/buildroot/output/build/linux-5.10.7/.stamp_built]
> > >> >> Erreur 2
> > >> >
> > >> > Can confirm the error with qemu_x86_64_defconfig, bumping the
> > >> > kernel version from 5.10.7 to 5.10.72 (latest 5.10.x) solves
> > >> > the problem here...
> > >>
> > >>   I head just confirmed the same thing :-)
> > >>
> > >>   Regards,
> > >>   Arnout
> > >>
> > >> >
> > >> > Regards,
> > >> > Peter
> > >> >
> > >> >>
> > >> >> definitely, I don't know what to do.
> > >> >> I'm afraid to solve this problem and run into others.
> > >> >>
> > >> >>
> > >> >>
> > >> >> Le mar. 12 oct. 2021 =C3=A0 15:01, Esa=C3=AFe Ledoux NJONGSSI KOU=
AM <
> > >> >> kouamdoux@gmail.com> a =C3=A9crit :
> > >> >>
> > >> >>> i have seen something , ...
> > >> >>> It is working very well , because the problem was rsync version =
,
> so i
> > >> >>> have take the better version
> > >> >>> https://github.com/WayneD/rsync/blob/master/INSTALL.md , ...
> > >> >>> thank you for all
> > >> >>>
> > >> >>> Le mar. 12 oct. 2021 =C3=A0 14:41, Esa=C3=AFe Ledoux NJONGSSI KO=
UAM <
> > >> >>> kouamdoux@gmail.com> a =C3=A9crit :
> > >> >>>
> > >> >>>>> in the buildroot directory. If that gives an error, there is
> really
> > >> >>>> something
> > >> >>>>> wrong with your OS.
> > >> >>>>
> > >> >>>> i'm trying to reinstall rsync , i hope that something will be
> fine
> > >> until
> > >> >>>> the end
> > >> >>>>
> > >> >>>> Le mar. 12 oct. 2021 =C3=A0 13:00, Esa=C3=AFe Ledoux NJONGSSI K=
OUAM <
> > >> >>>> kouamdoux@gmail.com> a =C3=A9crit :
> > >> >>>>
> > >> >>>>>    > As Joachim asked, can you provide the output of
> > >> >>>>>
> > >> >>>>>    >    pwd
> > >> >>>>>
> > >> >>>>>> and
> > >> >>>>>
> > >> >>>>>    >    findmnt
> > >> >>>>>
> > >> >>>>> ledoux@kali:~/Documents/buildroot$ pwd
> > >> >>>>> /home/ledoux/Documents/buildroot
> > >> >>>>> ledoux@kali:~/Documents/buildroot$ findmnt
> > >> >>>>> TARGET                         SOURCE      FSTYPE  OPTIONS
> > >> >>>>> /                              /dev/sda10  ext4
> > >> >>>>>   rw,relatime,errors=3Dremount-ro
> > >> >>>>> =E2=94=9C=E2=94=80/sys                         sysfs       sys=
fs
> > >> >>>>> rw,nosuid,nodev,noexec,relati
> > >> >>>>> =E2=94=82 =E2=94=9C=E2=94=80/sys/kernel/security       securit=
yfs  securit
> > >> >>>>> rw,nosuid,nodev,noexec,relati
> > >> >>>>> =E2=94=82 =E2=94=9C=E2=94=80/sys/fs/cgroup             cgroup2=
     cgroup2
> > >> >>>>> rw,nosuid,nodev,noexec,relati
> > >> >>>>> =E2=94=82 =E2=94=9C=E2=94=80/sys/fs/pstore             pstore =
     pstore
> > >> >>>>>   rw,nosuid,nodev,noexec,relati
> > >> >>>>> =E2=94=82 =E2=94=9C=E2=94=80/sys/firmware/efi/efivars  efivarf=
s    efivarf
> > >> >>>>> rw,nosuid,nodev,noexec,relati
> > >> >>>>> =E2=94=82 =E2=94=9C=E2=94=80/sys/fs/bpf                none   =
     bpf
> > >> >>>>> rw,nosuid,nodev,noexec,relati
> > >> >>>>> =E2=94=82 =E2=94=9C=E2=94=80/sys/kernel/tracing        tracefs=
     tracefs
> > >> >>>>> rw,nosuid,nodev,noexec,relati
> > >> >>>>> =E2=94=82 =E2=94=9C=E2=94=80/sys/kernel/debug          debugfs=
     debugfs
> > >> >>>>> rw,nosuid,nodev,noexec,relati
> > >> >>>>> =E2=94=82 =E2=94=9C=E2=94=80/sys/kernel/config         configf=
s    configf
> > >> >>>>> rw,nosuid,nodev,noexec,relati
> > >> >>>>> =E2=94=82 =E2=94=94=E2=94=80/sys/fs/fuse/connections   fusectl=
     fusectl
> > >> >>>>> rw,nosuid,nodev,noexec,relati
> > >> >>>>> =E2=94=9C=E2=94=80/proc                        proc        pro=
c
> > >> >>>>>   rw,nosuid,nodev,noexec,relati
> > >> >>>>> =E2=94=82 =E2=94=94=E2=94=80/proc/sys/fs/binfmt_misc   systemd=
-1   autofs
> > >> >>>>>   rw,relatime,fd=3D29,pgrp=3D1,time
> > >> >>>>> =E2=94=82   =E2=94=94=E2=94=80/proc/sys/fs/binfmt_misc binfmt_=
misc binfmt_
> > >> >>>>> rw,nosuid,nodev,noexec,relati
> > >> >>>>> =E2=94=9C=E2=94=80/dev                         udev        dev=
tmpf
> > >> >>>>> rw,nosuid,relatime,size=3D17018
> > >> >>>>> =E2=94=82 =E2=94=9C=E2=94=80/dev/pts                   devpts =
     devpts
> > >> >>>>>   rw,nosuid,noexec,relatime,gid
> > >> >>>>> =E2=94=82 =E2=94=9C=E2=94=80/dev/shm                   tmpfs  =
     tmpfs
>  rw,nosuid,nodev
> > >> >>>>> =E2=94=82 =E2=94=9C=E2=94=80/dev/hugepages             hugetlb=
fs   hugetlb
> > >> >>>>> rw,relatime,pagesize=3D2M
> > >> >>>>> =E2=94=82 =E2=94=94=E2=94=80/dev/mqueue                mqueue =
     mqueue
> > >> >>>>>   rw,nosuid,nodev,noexec,relati
> > >> >>>>> =E2=94=9C=E2=94=80/run                         tmpfs       tmp=
fs
> > >> >>>>> rw,nosuid,nodev,noexec,relati
> > >> >>>>> =E2=94=82 =E2=94=9C=E2=94=80/run/lock                  tmpfs  =
     tmpfs
> > >> >>>>> rw,nosuid,nodev,noexec,relati
> > >> >>>>> =E2=94=82 =E2=94=9C=E2=94=80/run/rpc_pipefs            sunrpc =
     rpc_pip rw,relatime
> > >> >>>>> =E2=94=82 =E2=94=94=E2=94=80/run/user/1000             tmpfs  =
     tmpfs
> > >> >>>>> rw,nosuid,nodev,relatime,size
> > >> >>>>> =E2=94=82   =E2=94=94=E2=94=80/run/user/1000/doc       portal =
     fuse.po
> > >> >>>>> rw,nosuid,nodev,relatime,user
> > >> >>>>> =E2=94=9C=E2=94=80/tmp                         /dev/sda9   ext=
4    rw,relatime
> > >> >>>>> =E2=94=9C=E2=94=80/var                         /dev/sda7   ext=
4    rw,relatime
> > >> >>>>> =E2=94=9C=E2=94=80/home                        /dev/sda11  ext=
4    rw,relatime
> > >> >>>>> =E2=94=9C=E2=94=80/boot/efi                    /dev/sda2   vfa=
t
> > >> >>>>>   rw,relatime,fmask=3D0077,dmask=3D
> > >> >>>>> =E2=94=94=E2=94=80/media/ledoux/Data           /dev/sda6   fus=
eblk
> > >> >>>>> rw,nosuid,nodev,relatime,user
> > >> >>>>>
> > >> >>>>>
> > >> >>>>>
> > >> >>>>> Le lun. 11 oct. 2021 =C3=A0 22:25, Arnout Vandecappelle <
> arnout@mind.be>
> > >> a
> > >> >>>>> =C3=A9crit :
> > >> >>>>>
> > >> >>>>>>    Hi Esaie,
> > >> >>>>>>
> > >> >>>>>>    Please don't top-post, but reply inline like I do below.
> Note
> > >> that
> > >> >>>>>> this
> > >> >>>>>> requires configuring your mailer to quote replies properly
> (i.e.
> > >> put >
> > >> >>>>>> markers
> > >> >>>>>> in front of each line).
> > >> >>>>>>
> > >> >>>>>>
> > >> >>>>>> On 11/10/2021 12:20, Esa=C3=AFe Ledoux NJONGSSI KOUAM wrote:
> > >> >>>>>>> i have tried
> > >> >>>>>>> git clone git://git.buildroot.net/buildroot <
> > >> >>>>>> http://git.buildroot.net/buildroot>
> > >> >>>>>>> make qemu_x86_64_defconfig
> > >> >>>>>>> make
> > >> >>>>>>>
> > >> >>>>>>> i have type it on Documents folder that has ext4 file system
> > >> >>>>>>
> > >> >>>>>>    As Joachim asked, can you provide the output of
> > >> >>>>>>
> > >> >>>>>>       pwd
> > >> >>>>>>
> > >> >>>>>> and
> > >> >>>>>>
> > >> >>>>>>       findmnt
> > >> >>>>>>
> > >> >>>>>> so we can see if the filesystem really is ext4, or it has
> some
> > >> weird
> > >> >>>>>> mount
> > >> >>>>>> option, or anything else that could explain the issue?
> > >> >>>>>>
> > >> >>>>>>    You can also try:
> > >> >>>>>>
> > >> >>>>>>       touch foo
> > >> >>>>>>       chmod 666 foo
> > >> >>>>>>
> > >> >>>>>> in the buildroot directory. If that gives an error, there is
> really
> > >> >>>>>> something
> > >> >>>>>> wrong with your OS.
> > >> >>>>>>
> > >> >>>>>>    Regards,
> > >> >>>>>>    Arnout
> > >> >>>>>>
> > >> >>>>>>>
> > >> >>>>>>>
> > >> >>>>>>> still now i have the same error
> > >> >>>>>>>
> > >> >>>>>>> Le dim. 10 oct. 2021 =C3=A0 21:57, Joachim Wiberg <
> troglobit@gmail.com
> > >> >>>>>>> <mailto:troglobit@gmail.com>> a =C3=A9crit :
> > >> >>>>>>>
> > >> >>>>>>>      Hi,
> > >> >>>>>>>
> > >> >>>>>>>      On 10/10/21 6:52 PM, Esa=C3=AFe Ledoux NJONGSSI KOUAM w=
rote:
> > >> >>>>>>>       > no filesystem has been configured ...
> > >> >>>>>>>       > I'm just trying the default configuration
> > >> >>>>>>>
> > >> >>>>>>>      This is fine.  I think you've got something really
> wrong
> > >> with your
> > >> >>>>>>>      Kali Linux host system.
> > >> >>>>>>>
> > >> >>>>>>>       > should i configure file system for my buildroot ??
> > >> >>>>>>>
> > >> >>>>>>>      No, we mean the file system you are using for building
> > >> Buildroot
> > >> >>>>>> on,
> > >> >>>>>>>      in your Kali Linux install.  The rsync error looks as
> if
> > >> your disk
> > >> >>>>>>>      partition is a non-native Linux file system, like FAT,
> which
> > >> does
> > >> >>>>>>>      not support the operations rsync tries to perform.
> > >> >>>>>>>
> > >> >>>>>>>      How have you set up your Kali Linux?  Do you have the
> > >> buildroot
> > >> >>>>>> git
> > >> >>>>>>>      sources checked out to your home directory or some
> other
> > >> >>>>>> directory,
> > >> >>>>>>>      perhaps shared with Windows?  If so, I'd definitely
> avoid
> > >> that.
> > >> >>>>>> You
> > >> >>>>>>>      can check the filesystem of your build directory by
> > >> comparing the
> > >> >>>>>>>      output of
> > >> >>>>>>>
> > >> >>>>>>>          pwd
> > >> >>>>>>>
> > >> >>>>>>>      with the output from
> > >> >>>>>>>
> > >> >>>>>>>          findmnt
> > >> >>>>>>>
> > >> >>>>>>>      On my system I have ext4 in the FSTYPE column for my
> home
> > >> >>>>>> directory,
> > >> >>>>>>>      which is in the / TARGET.
> > >> >>>>>>>
> > >> >>>>>>>      I finished my install of Kali in my own VM.  It crashed
> badly
> > >> >>>>>> before
> > >> >>>>>>>      I gave it enough disk (40 GiB) and RAM (4 GiB).  That's
> > >> another
> > >> >>>>>> thing
> > >> >>>>>>>      that might have messed up your build tree.
> > >> >>>>>>>
> > >> >>>>>>>       > the error persists even if i compile it as normal
> user
> > >> >>>>>>>
> > >> >>>>>>>      Well that's good to know, at least it's consistent.
> Just
> > >> beware
> > >> >>>>>>>      that if you reuse the same source tree, having switched
> to
> > >> another
> > >> >>>>>>>      user, a lot of files may still have root as the owner,
> which
> > >> may
> > >> >>>>>>>      give you other problems.  Either `sudo chown -R
> user:user .`
> > >> from
> > >> >>>>>>>      inside the Buildroot source tree, or check out a new
> tree.
> > >> >>>>>>>
> > >> >>>>>>>      Best regards
> > >> >>>>>>>        /Joachim
> > >> >>>>>>>
> > >> >>>>>>>
> > >> >>>>>>> _______________________________________________
> > >> >>>>>>> buildroot mailing list
> > >> >>>>>>> buildroot@buildroot.org
> > >> >>>>>>> https://lists.buildroot.org/mailman/listinfo/buildroot
> > >> >>>>>>>
> > >> >>>>>>
> > >> >>>>>
> > >> >
> > >>
> > >
>
>

--000000000000f46b6005ce4ccbb7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>is it finish ??</div><div><br></div><div>Creating fil=
esystem with 61440 1k blocks and 15360 inodes<br>Filesystem UUID: 721b9a0d-=
d383-4b06-9469-77944cffb7c6<br>Superblock backups stored on blocks: <br>	81=
93, 24577, 40961, 57345<br><br>Allocating group tables: done =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0<br>Writing inode tables: done =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>Copying =
files into the device: done<br>Writing superblocks and filesystem accountin=
g information: done<br><br>ln -snf /home/ledoux/Documents/buildroot/output/=
host/x86_64-buildroot-linux-uclibc/sysroot /home/ledoux/Documents/buildroot=
/output/staging<br>&gt;&gt;&gt; =C2=A0 Executing post-image script board/qe=
mu/post-image.sh</div><div><br></div><div>:) :)=F0=9F=98=82=F0=9F=98=82=F0=
=9F=98=82<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">Le=C2=A0mer. 13 oct. 2021 =C3=A0=C2=A018:26, Peter Seide=
rer &lt;<a href=3D"mailto:ps.report@gmx.net">ps.report@gmx.net</a>&gt; a =
=C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">Hello Esa=C3=AFe,<br>
<br>
On Wed, 13 Oct 2021 12:38:11 +0200, Esa=C3=AFe Ledoux NJONGSSI KOUAM &lt;<a=
 href=3D"mailto:kouamdoux@gmail.com" target=3D"_blank">kouamdoux@gmail.com<=
/a>&gt; wrote:<br>
<br>
&gt; so i should modify which mk file ??<br>
&gt; <br>
&gt; Le mer. 13 oct. 2021 =C3=A0 12:34, Esa=C3=AFe Ledoux NJONGSSI KOUAM &l=
t;<br>
&gt; <a href=3D"mailto:kouamdoux@gmail.com" target=3D"_blank">kouamdoux@gma=
il.com</a>&gt; a =C3=A9crit :=C2=A0 <br>
&gt; <br>
&gt; &gt; &gt; Can confirm the error with qemu_x86_64_defconfig, bumping th=
e<br>
&gt; &gt; &gt; kernel version from 5.10.7 to 5.10.72 (latest 5.10.x) solves=
<br>
&gt; &gt; &gt; the problem here...=C2=A0 <br>
&gt; &gt;<br>
&gt; &gt; i think i should modify some .mk file too even if i bumping this =
version<br>
&gt; &gt; to the latest kernel version file<br>
<br>
Three options:<br>
<br>
1) At your build directory edit the &#39;.config&#39; file, exchange the fo=
llowing two<br>
lines:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D&quot;5=
.10.7&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 BR2_LINUX_KERNEL_VERSION=3D&quot;5.10.7&quot;<b=
r>
<br>
with:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D&quot;5=
.10.72&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 BR2_LINUX_KERNEL_VERSION=3D&quot;5.10.72&quot;<=
br>
<br>
and run &#39;make&#39;<br>
<br>
<br>
2) At your build directory run &#39;make menuconfig&#39;, navigate to<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Kernel --&gt; Kernel version<br>
Now press return and edit the string 5.10.7 to 5.10.72, press return<br>
to confirm the &#39;&lt;Ok&gt;&#39;, navigate to &#39;&lt;Exit&gt;&#39;, na=
vigate to &#39;&lt;Exit&#39;, confirm<br>
&#39;Do you wish to save your new configuration&#39;, and run &#39;make&#39=
;<br>
<br>
<br>
3) Edit configs/qemu_x86_64_defconfig, exchange the followig line:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D&quot;5=
.10.7&quot;<br>
with<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D&quot;5=
.10.72&quot;<br>
<br>
Now run &#39;make qemu_x86_64_defconfig&#39;, run make<br>
<br>
1) and 2) are equivalent, 3) makes your change permanent but needs<br>
the &#39;make qemu_x86_64_defconfig&#39; to apply the change to your curren=
t<br>
build...<br>
<br>
Regards,<br>
Peter<br>
<br>
<br>
&gt; &gt;<br>
&gt; &gt; Le mar. 12 oct. 2021 =C3=A0 22:58, Arnout Vandecappelle &lt;<a hr=
ef=3D"mailto:arnout@mind.be" target=3D"_blank">arnout@mind.be</a>&gt; a<br>
&gt; &gt; =C3=A9crit :<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; On 12/10/2021 22:52, Peter Seiderer wrote:=C2=A0 <br>
&gt; &gt;&gt; &gt; Hello Esa=C3=AFe,<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; On Tue, 12 Oct 2021 19:41:11 +0200, Esa=C3=AFe Ledoux NJ=
ONGSSI KOUAM &lt;<br>
&gt; &gt;&gt; <a href=3D"mailto:kouamdoux@gmail.com" target=3D"_blank">koua=
mdoux@gmail.com</a>&gt; wrote:<br>
&gt; &gt;&gt; &gt;=C2=A0 <br>
&gt; &gt;&gt; &gt;&gt; Another problem occur ,<br>
&gt; &gt;&gt; &gt;&gt; Linux 5-10 building generate compilation errors<br>
&gt; &gt;&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt; i have a lot of error :(<br>
&gt; &gt;&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt; arch/x86/entry/thunk_64.o: warning: objtool: missing=
 symbol table<br>
&gt; &gt;&gt; &gt;&gt; make[3]: *** [scripts/Makefile.build:360 : arch/x86/=
entry/thunk_64.o]<br>
&gt; &gt;&gt; &gt;&gt; Erreur 1<br>
&gt; &gt;&gt; &gt;&gt; make[3]: *** Suppression du fichier =C2=AB arch/x86/=
entry/thunk_64.o =C2=BB<br>
&gt; &gt;&gt; &gt;&gt; make[2]: *** [scripts/Makefile.build:496 : arch/x86/=
entry] Erreur 2<br>
&gt; &gt;&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0 CC=C2=A0 =C2=A0 =C2=A0 arch/x86/mm/cpu_=
entry_area.o<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0 CC=C2=A0 =C2=A0 =C2=A0 arch/x86/mm/macc=
ess.o<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0 CC=C2=A0 =C2=A0 =C2=A0 arch/x86/mm/pkey=
s.o<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0 CC=C2=A0 =C2=A0 =C2=A0 arch/x86/mm/kasl=
r.o<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0 CC=C2=A0 =C2=A0 =C2=A0 arch/x86/mm/pti.=
o<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0 AR=C2=A0 =C2=A0 =C2=A0 arch/x86/mm/buil=
t-in.a<br>
&gt; &gt;&gt; &gt;&gt; make[1]: *** [Makefile:1805 : arch/x86] Erreur 2<br>
&gt; &gt;&gt; &gt;&gt; make[1]: *** Attente des t=C3=A2ches non termin=C3=
=A9es....<br>
&gt; &gt;&gt; &gt;&gt; make[1] : on quitte le r=C3=A9pertoire<br>
&gt; &gt;&gt; &gt;&gt; =C2=AB /home/ledoux/Documents/buildroot/output/build=
/linux-5.10.7 =C2=BB<br>
&gt; &gt;&gt; &gt;&gt; make: *** [package/<a href=3D"http://pkg-generic.mk:=
294" rel=3D"noreferrer" target=3D"_blank">pkg-generic.mk:294</a> :<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 <br>
&gt; &gt;&gt; /home/ledoux/Documents/buildroot/output/build/linux-5.10.7/.s=
tamp_built]=C2=A0 <br>
&gt; &gt;&gt; &gt;&gt; Erreur 2=C2=A0 <br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; Can confirm the error with qemu_x86_64_defconfig, bumpin=
g the<br>
&gt; &gt;&gt; &gt; kernel version from 5.10.7 to 5.10.72 (latest 5.10.x) so=
lves<br>
&gt; &gt;&gt; &gt; the problem here...=C2=A0 <br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;=C2=A0 =C2=A0I head just confirmed the same thing :-)<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;=C2=A0 =C2=A0Regards,<br>
&gt; &gt;&gt;=C2=A0 =C2=A0Arnout<br>
&gt; &gt;&gt;=C2=A0 <br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; Regards,<br>
&gt; &gt;&gt; &gt; Peter<br>
&gt; &gt;&gt; &gt;=C2=A0 <br>
&gt; &gt;&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt; definitely, I don&#39;t know what to do.<br>
&gt; &gt;&gt; &gt;&gt; I&#39;m afraid to solve this problem and run into ot=
hers.<br>
&gt; &gt;&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt; Le mar. 12 oct. 2021 =C3=A0 15:01, Esa=C3=AFe Ledoux=
 NJONGSSI KOUAM &lt;=C2=A0 <br>
&gt; &gt;&gt; &gt;&gt; <a href=3D"mailto:kouamdoux@gmail.com" target=3D"_bl=
ank">kouamdoux@gmail.com</a>&gt; a =C3=A9crit :=C2=A0 <br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 <br>
&gt; &gt;&gt; &gt;&gt;&gt; i have seen something , ...<br>
&gt; &gt;&gt; &gt;&gt;&gt; It is working very well , because the problem wa=
s rsync version , so i<br>
&gt; &gt;&gt; &gt;&gt;&gt; have take the better version<br>
&gt; &gt;&gt; &gt;&gt;&gt; <a href=3D"https://github.com/WayneD/rsync/blob/=
master/INSTALL.md" rel=3D"noreferrer" target=3D"_blank">https://github.com/=
WayneD/rsync/blob/master/INSTALL.md</a> , ...<br>
&gt; &gt;&gt; &gt;&gt;&gt; thank you for all<br>
&gt; &gt;&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt;&gt; Le mar. 12 oct. 2021 =C3=A0 14:41, Esa=C3=AFe Le=
doux NJONGSSI KOUAM &lt;=C2=A0 <br>
&gt; &gt;&gt; &gt;&gt;&gt; <a href=3D"mailto:kouamdoux@gmail.com" target=3D=
"_blank">kouamdoux@gmail.com</a>&gt; a =C3=A9crit :=C2=A0 <br>
&gt; &gt;&gt; &gt;&gt;&gt;=C2=A0 <br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt; in the buildroot directory. If that give=
s an error, there is really=C2=A0 <br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt; something=C2=A0 <br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt; wrong with your OS.=C2=A0 <br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt; i&#39;m trying to reinstall rsync , i hope t=
hat something will be fine=C2=A0 <br>
&gt; &gt;&gt; until=C2=A0 <br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt; the end<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt; Le mar. 12 oct. 2021 =C3=A0 13:00, Esa=C3=AF=
e Ledoux NJONGSSI KOUAM &lt;=C2=A0 <br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt; <a href=3D"mailto:kouamdoux@gmail.com" targe=
t=3D"_blank">kouamdoux@gmail.com</a>&gt; a =C3=A9crit :=C2=A0 <br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;=C2=A0 <br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 &gt; As Joachim asked, can =
you provide the output of=C2=A0 <br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 <br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 pwd=C2=A0=
 <br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 <br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt; and=C2=A0 <br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 <br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 findmnt=
=C2=A0 <br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt; ledoux@kali:~/Documents/buildroot$ pwd<b=
r>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt; /home/ledoux/Documents/buildroot<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt; ledoux@kali:~/Documents/buildroot$ findm=
nt<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt; TARGET=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SOURCE=C2=A0 =C2=A0=
 =C2=A0 FSTYPE=C2=A0 OPTIONS<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt; /=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /dev/sda=
10=C2=A0 ext4<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0rw,relatime,errors=3Dremount=
-ro<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt; =E2=94=9C=E2=94=80/sys=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sy=
sfs=C2=A0 =C2=A0 =C2=A0 =C2=A0sysfs<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt; rw,nosuid,nodev,noexec,relati<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt; =E2=94=82 =E2=94=9C=E2=94=80/sys/kernel/=
security=C2=A0 =C2=A0 =C2=A0 =C2=A0securityfs=C2=A0 securit<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt; rw,nosuid,nodev,noexec,relati<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt; =E2=94=82 =E2=94=9C=E2=94=80/sys/fs/cgro=
up=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cgroup2=C2=A0 =C2=A0 =C2=
=A0cgroup2<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt; rw,nosuid,nodev,noexec,relati<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt; =E2=94=82 =E2=94=9C=E2=94=80/sys/fs/psto=
re=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pstore=C2=A0 =C2=A0 =C2=
=A0 pstore<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0rw,nosuid,nodev,noexec,relat=
i<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt; =E2=94=82 =E2=94=9C=E2=94=80/sys/firmwar=
e/efi/efivars=C2=A0 efivarfs=C2=A0 =C2=A0 efivarf<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt; rw,nosuid,nodev,noexec,relati<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt; =E2=94=82 =E2=94=9C=E2=94=80/sys/fs/bpf=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 none=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 bpf<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt; rw,nosuid,nodev,noexec,relati<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt; =E2=94=82 =E2=94=9C=E2=94=80/sys/kernel/=
tracing=C2=A0 =C2=A0 =C2=A0 =C2=A0 tracefs=C2=A0 =C2=A0 =C2=A0tracefs<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt; rw,nosuid,nodev,noexec,relati<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt; =E2=94=82 =E2=94=9C=E2=94=80/sys/kernel/=
debug=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 debugfs=C2=A0 =C2=A0 =C2=A0debugfs<=
br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt; rw,nosuid,nodev,noexec,relati<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt; =E2=94=82 =E2=94=9C=E2=94=80/sys/kernel/=
config=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0configfs=C2=A0 =C2=A0 configf<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt; rw,nosuid,nodev,noexec,relati<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt; =E2=94=82 =E2=94=94=E2=94=80/sys/fs/fuse=
/connections=C2=A0 =C2=A0fusectl=C2=A0 =C2=A0 =C2=A0fusectl<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt; rw,nosuid,nodev,noexec,relati<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt; =E2=94=9C=E2=94=80/proc=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 proc=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 proc<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0rw,nosuid,nodev,noexec,relat=
i<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt; =E2=94=82 =E2=94=94=E2=94=80/proc/sys/fs=
/binfmt_misc=C2=A0 =C2=A0systemd-1=C2=A0 =C2=A0autofs<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0rw,relatime,fd=3D29,pgrp=3D1=
,time<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt; =E2=94=82=C2=A0 =C2=A0=E2=94=94=E2=94=80=
/proc/sys/fs/binfmt_misc binfmt_misc binfmt_<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt; rw,nosuid,nodev,noexec,relati<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt; =E2=94=9C=E2=94=80/dev=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ud=
ev=C2=A0 =C2=A0 =C2=A0 =C2=A0 devtmpf<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt; rw,nosuid,relatime,size=3D17018<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt; =E2=94=82 =E2=94=9C=E2=94=80/dev/pts=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0devpts=C2=
=A0 =C2=A0 =C2=A0 devpts<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0rw,nosuid,noexec,relatime,gi=
d<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt; =E2=94=82 =E2=94=9C=E2=94=80/dev/shm=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tmpfs=C2=
=A0 =C2=A0 =C2=A0 =C2=A0tmpfs=C2=A0 =C2=A0rw,nosuid,nodev<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt; =E2=94=82 =E2=94=9C=E2=94=80/dev/hugepag=
es=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hugetlbfs=C2=A0 =C2=A0hug=
etlb<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt; rw,relatime,pagesize=3D2M<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt; =E2=94=82 =E2=94=94=E2=94=80/dev/mqueue=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mqueue=C2=A0 =C2=A0=
 =C2=A0 mqueue<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0rw,nosuid,nodev,noexec,relat=
i<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt; =E2=94=9C=E2=94=80/run=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tm=
pfs=C2=A0 =C2=A0 =C2=A0 =C2=A0tmpfs<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt; rw,nosuid,nodev,noexec,relati<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt; =E2=94=82 =E2=94=9C=E2=94=80/run/lock=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tmpfs=C2=A0 =C2=
=A0 =C2=A0 =C2=A0tmpfs<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt; rw,nosuid,nodev,noexec,relati<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt; =E2=94=82 =E2=94=9C=E2=94=80/run/rpc_pip=
efs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sunrpc=C2=A0 =C2=A0 =C2=A0 rpc=
_pip rw,relatime<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt; =E2=94=82 =E2=94=94=E2=94=80/run/user/10=
00=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tmpfs=C2=A0 =C2=A0 =C2=A0=
 =C2=A0tmpfs<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt; rw,nosuid,nodev,relatime,size<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt; =E2=94=82=C2=A0 =C2=A0=E2=94=94=E2=94=80=
/run/user/1000/doc=C2=A0 =C2=A0 =C2=A0 =C2=A0portal=C2=A0 =C2=A0 =C2=A0 fus=
e.po<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt; rw,nosuid,nodev,relatime,user<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt; =E2=94=9C=E2=94=80/tmp=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/d=
ev/sda9=C2=A0 =C2=A0ext4=C2=A0 =C2=A0 rw,relatime<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt; =E2=94=9C=E2=94=80/var=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/d=
ev/sda7=C2=A0 =C2=A0ext4=C2=A0 =C2=A0 rw,relatime<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt; =E2=94=9C=E2=94=80/home=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /dev/sda=
11=C2=A0 ext4=C2=A0 =C2=A0 rw,relatime<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt; =E2=94=9C=E2=94=80/boot/efi=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /dev/sda2=C2=A0 =
=C2=A0vfat<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0rw,relatime,fmask=3D0077,dma=
sk=3D<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt; =E2=94=94=E2=94=80/media/ledoux/Data=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/dev/sda6=C2=A0 =C2=A0fuseblk<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt; rw,nosuid,nodev,relatime,user<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt; Le lun. 11 oct. 2021 =C3=A0 22:25, Arnou=
t Vandecappelle &lt;<a href=3D"mailto:arnout@mind.be" target=3D"_blank">arn=
out@mind.be</a>&gt;=C2=A0 <br>
&gt; &gt;&gt; a=C2=A0 <br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt; =C3=A9crit :<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 <br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 Hi Esaie,<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 Please don&#39;t top-po=
st, but reply inline like I do below. Note=C2=A0 <br>
&gt; &gt;&gt; that=C2=A0 <br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt; this<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt; requires configuring your mailer to =
quote replies properly (i.e.=C2=A0 <br>
&gt; &gt;&gt; put &gt;=C2=A0 <br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt; markers<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt; in front of each line).<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt; On 11/10/2021 12:20, Esa=C3=AFe Ledo=
ux NJONGSSI KOUAM wrote:=C2=A0 <br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt; i have tried<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt; git clone git://<a href=3D"http:=
//git.buildroot.net/buildroot" rel=3D"noreferrer" target=3D"_blank">git.bui=
ldroot.net/buildroot</a> &lt;<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt; <a href=3D"http://git.buildroot.net/=
buildroot" rel=3D"noreferrer" target=3D"_blank">http://git.buildroot.net/bu=
ildroot</a>&gt;<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt; make qemu_x86_64_defconfig<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt; make<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt; i have type it on Documents fold=
er that has ext4 file system=C2=A0 <br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 As Joachim asked, can y=
ou provide the output of<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0pwd<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt; and<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0findmnt<br=
>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt; so we can see if the filesystem real=
ly is ext4, or it has some=C2=A0 <br>
&gt; &gt;&gt; weird=C2=A0 <br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt; mount<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt; option, or anything else that could =
explain the issue?<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 You can also try:<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0touch foo<=
br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0chmod 666 =
foo<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt; in the buildroot directory. If that =
gives an error, there is really<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt; something<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt; wrong with your OS.<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 Regards,<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 Arnout<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 <br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt; still now i have the same error<=
br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt; Le dim. 10 oct. 2021 =C3=A0 21:5=
7, Joachim Wiberg &lt;<a href=3D"mailto:troglobit@gmail.com" target=3D"_bla=
nk">troglobit@gmail.com</a><br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt; &lt;mailto:<a href=3D"mailto:tro=
globit@gmail.com" target=3D"_blank">troglobit@gmail.com</a>&gt;&gt; a =C3=
=A9crit :<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 Hi,<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 On 10/10/21 =
6:52 PM, Esa=C3=AFe Ledoux NJONGSSI KOUAM wrote:=C2=A0 <br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; n=
o filesystem has been configured ...<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; I=
&#39;m just trying the default configuration=C2=A0 <br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 This is fine=
.=C2=A0 I think you&#39;ve got something really wrong=C2=A0 <br>
&gt; &gt;&gt; with your=C2=A0 <br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 Kali Linux h=
ost system.<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 <br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; s=
hould i configure file system for my buildroot ??=C2=A0 <br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 No, we mean =
the file system you are using for building=C2=A0 <br>
&gt; &gt;&gt; Buildroot=C2=A0 <br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt; on,=C2=A0 <br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 in your Kali=
 Linux install.=C2=A0 The rsync error looks as if=C2=A0 <br>
&gt; &gt;&gt; your disk=C2=A0 <br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 partition is=
 a non-native Linux file system, like FAT, which=C2=A0 <br>
&gt; &gt;&gt; does=C2=A0 <br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 not support =
the operations rsync tries to perform.<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 How have you=
 set up your Kali Linux?=C2=A0 Do you have the=C2=A0 <br>
&gt; &gt;&gt; buildroot=C2=A0 <br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt; git=C2=A0 <br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 sources chec=
ked out to your home directory or some other=C2=A0 <br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt; directory,=C2=A0 <br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 perhaps shar=
ed with Windows?=C2=A0 If so, I&#39;d definitely avoid=C2=A0 <br>
&gt; &gt;&gt; that.=C2=A0 <br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt; You=C2=A0 <br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 can check th=
e filesystem of your build directory by=C2=A0 <br>
&gt; &gt;&gt; comparing the=C2=A0 <br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 output of<br=
>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pwd<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 with the out=
put from<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 findmnt<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 On my system=
 I have ext4 in the FSTYPE column for my home=C2=A0 <br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt; directory,=C2=A0 <br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 which is in =
the / TARGET.<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 I finished m=
y install of Kali in my own VM.=C2=A0 It crashed badly=C2=A0 <br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt; before=C2=A0 <br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 I gave it en=
ough disk (40 GiB) and RAM (4 GiB).=C2=A0 That&#39;s=C2=A0 <br>
&gt; &gt;&gt; another=C2=A0 <br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt; thing=C2=A0 <br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 that might h=
ave messed up your build tree.<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 <br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; t=
he error persists even if i compile it as normal user=C2=A0 <br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 Well that&#3=
9;s good to know, at least it&#39;s consistent.=C2=A0 Just=C2=A0 <br>
&gt; &gt;&gt; beware=C2=A0 <br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 that if you =
reuse the same source tree, having switched to=C2=A0 <br>
&gt; &gt;&gt; another=C2=A0 <br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 user, a lot =
of files may still have root as the owner, which=C2=A0 <br>
&gt; &gt;&gt; may=C2=A0 <br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 give you oth=
er problems.=C2=A0 Either `sudo chown -R user:user .`=C2=A0 <br>
&gt; &gt;&gt; from=C2=A0 <br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 inside the B=
uildroot source tree, or check out a new tree.<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 Best regards=
<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 /Joac=
him<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt; ________________________________=
_______________<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt; buildroot mailing list<br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt; <a href=3D"mailto:buildroot@buil=
droot.org" target=3D"_blank">buildroot@buildroot.org</a><br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt; <a href=3D"https://lists.buildro=
ot.org/mailman/listinfo/buildroot" rel=3D"noreferrer" target=3D"_blank">htt=
ps://lists.buildroot.org/mailman/listinfo/buildroot</a><br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 <br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 <br>
&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 <br>
&gt; &gt;&gt; &gt;=C2=A0 <br>
&gt; &gt;&gt;=C2=A0 <br>
&gt; &gt;=C2=A0 <br>
<br>
</blockquote></div>

--000000000000f46b6005ce4ccbb7--


--===============3316224844061323630==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3316224844061323630==--


