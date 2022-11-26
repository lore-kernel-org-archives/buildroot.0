Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64F25C4321E
	for <buildroot@archiver.kernel.org>; Sat, 26 Nov 2022 04:00:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CCFA641DC3;
	Sat, 26 Nov 2022 04:00:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CCFA641DC3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yPgQTgDf3zC1; Sat, 26 Nov 2022 04:00:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5950441DC4;
	Sat, 26 Nov 2022 04:00:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5950441DC4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0D9CC1BF27E
 for <buildroot@lists.busybox.net>; Sat, 26 Nov 2022 04:00:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E84C641DC4
 for <buildroot@lists.busybox.net>; Sat, 26 Nov 2022 04:00:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E84C641DC4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XccYmP-rdL9g for <buildroot@lists.busybox.net>;
 Sat, 26 Nov 2022 04:00:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9299741DC3
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9299741DC3
 for <buildroot@buildroot.org>; Sat, 26 Nov 2022 04:00:12 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id 6so5352769pgm.6
 for <buildroot@buildroot.org>; Fri, 25 Nov 2022 20:00:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wyW3I+YjeionSLapFXcJyI0iqQk2DUhJioKX3VVpRpc=;
 b=RCoqoGYmPPz0MxK7qwUARDi/i7i/wXtyHyfZ/HWLn4HFz6C31aclnM8QYJk3tmcgnJ
 N2NVvbxpQgkCRh0+Rw7cXdpXj5IA5bMw3uTGLWCtFz8CwQbXRClRMK8AVwtx2T7jTJeY
 nCCNUazL2vqCUdOVlaEvCRrsm79sUelVquXP3H95HgQ6wlozTUU95KuxXX0xTrihg51b
 Ml4DACuD1ts1aaMrbBrx9hNjkJnbjNvNG56ivHTA3ITGOqELNng4Tt2RUcufdhf1Sd3Q
 PsBZWC5LuKdeBswrCWWZtEJSKPFhscDCawt/cfzjCxErAJRQCc19R6wYBiQECh//YWVW
 wJ5g==
X-Gm-Message-State: ANoB5pljOpZwMs5AgtotJWyc3If78hSkdbEkp1iEEyVx4CHcEAT/H872
 0WjUclELuWQ6JLchlKHKXjCoSz+KEdbd5aKb0ySylHZ9
X-Google-Smtp-Source: AA0mqf6Ff8JJVCFqVmMRzrgcaP32wdGEW8m0woxTqbHM1dEz9bix8BEL97PF+aDpjm+fhRBC6M/6ck682fcZPF/gp8c=
X-Received: by 2002:a63:d143:0:b0:476:c8c5:ba85 with SMTP id
 c3-20020a63d143000000b00476c8c5ba85mr35810023pgj.182.1669435211645; Fri, 25
 Nov 2022 20:00:11 -0800 (PST)
MIME-Version: 1.0
References: <20221117140349.27692-1-ustcymgu@gmail.com>
 <Y3ncNLHK8OQhOo7d@waldemar-brodkorb.de>
 <CADE7KV2Y2G1fCp5XoXn=iyDf6iv8wvo1hiYmwm24xTZc1XKseg@mail.gmail.com>
In-Reply-To: <CADE7KV2Y2G1fCp5XoXn=iyDf6iv8wvo1hiYmwm24xTZc1XKseg@mail.gmail.com>
From: Charles Lohr <lohr85@gmail.com>
Date: Fri, 25 Nov 2022 19:59:59 -0800
Message-ID: <CAGu26P87eLSD=HG0e=0b2_ZnG4SnGebkbkaB-y94yennJKL1aQ@mail.gmail.com>
To: Yimin Gu <ustcymgu@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wyW3I+YjeionSLapFXcJyI0iqQk2DUhJioKX3VVpRpc=;
 b=fUjwWqSnyn5g8vZgM1cv26+9Aey8akssg6MqG370igyFWIvdTBudtsfPYqMsbs70cl
 GpZp8dGS5Mv8pmNQ0tSSSnMRt7E/qEXdoRi1NmmxkoDQirbKW47g0AD19LYJXqtljzfl
 Zc43yyyPUFs47L0GRcTjXItBIoNijortrWKbYhJjrRCA3zvpSRbCp95tV+HUJVqbogDQ
 7AcjPEvQXdbTJYBJ9lqyoHJQ/Bf+WrJM+VYbdy882IBjnlslEQe5jNUaz20BAqriDvsD
 7PGdTK3jdoa20BnZg9n1ZDPHCgWXkzEYf5p24coTMZRTlUgGkiDoWI1mHvk8mC5YiXaU
 IQgA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=fUjwWqSn
Subject: Re: [Buildroot] [PATCH 0/1] arch/riscv: RISC-V 32-bit NO MMU support
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
Cc: Romain Naour <romain.naour@gmail.com>, Mark Corbin <mark@dibsco.co.uk>,
 buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============7097482846624101126=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7097482846624101126==
Content-Type: multipart/alternative; boundary="000000000000c408a205ee57ac91"

--000000000000c408a205ee57ac91
Content-Type: text/plain; charset="UTF-8"

I've tested this a fair bit over the last several days and I really
appreciate the work.  Any hopes of getting this committed to mainline
buildroot?

On Sun, Nov 20, 2022 at 7:38 AM Yimin Gu <ustcymgu@gmail.com> wrote:

> Hi,
>
> On Sun, Nov 20, 2022 at 4:50 PM Waldemar Brodkorb <wbx@openadk.org> wrote:
> >
> > Hi,
> > Yimin Gu wrote,
> >
> > > The following patch adds support for 32-bit RISC-V No-MMU build.
> > > Currently for No-MMU RISC-V, only 64-bit is supported. There're no
> > > substancial changes in code but macros and compiling options. Uclibc,
> > > elf2flt, and the kernel need to be patched.
> > > This is based on damien-lemoal/buildroot which first added 64-bit
> No-MMU
> > > support, and my earlier porting attempt regymm/buildroot.
> > > As a lot of FPGA-based RISC-V cores are 32-bit and many of the low ones
> > > are without MMU, this can bring Linux to cores as light as RV32IMA.
> > > For this reason, only the minimum required extensions are enabled in
> the
> > > buildroot and kernel configurations.
> > >
> > > Yimin Gu (1):
> > >   arch/riscv: RISC-V 32-bit NO MMU support
> > >
> > >  arch/Config.in.riscv                          |    2 -
> > >  board/riscv/nommu/patches/linux-headers       |    1 +
> > >  ...imental-RISC-V-32-bit-No-MMU-support.patch | 1355 +++++++++++++++++
> > >  configs/qemu_riscv32_nommu_virt_defconfig     |   19 +
> > >  package/Makefile.in                           |   13 +-
> > >  ...ed-RISC-V-32-bit-compilation-support.patch |   74 +
> > >  .../uclibc/0001-RISC-V-32-bit-support.patch   |  145 ++
> > >  package/uclibc/Config.in                      |    2 +
> > >  8 files changed, 1607 insertions(+), 4 deletions(-)
> > >  create mode 120000 board/riscv/nommu/patches/linux-headers
> > >  create mode 100644
> board/riscv/nommu/patches/linux/5.19/0001-Experimental-RISC-V-32-bit-No-MMU-support.patch
> > >  create mode 100644 configs/qemu_riscv32_nommu_virt_defconfig
> > >  create mode 100644
> package/elf2flt/0006-Added-RISC-V-32-bit-compilation-support.patch
> > >  create mode 100644 package/uclibc/0001-RISC-V-32-bit-support.patch
> >
> > You can add a
> > Tested-By: Waldemar Brodkorb <wbx@openadk.org>
> >
> > One minor note, add a startup description for noMMU in
> > board/qemu/riscv32-virt/readme.txt.
> >
> > best regards
> >  Waldemar
>
> Thanks for the testing and note. I have sent the refined patch in a
> separate reply.
>
> best regards,
> Yimin Gu
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
>

--000000000000c408a205ee57ac91
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;ve tested this a fair bit over the last several days=
 and I really appreciate the work.=C2=A0 Any hopes of getting this committe=
d to mainline buildroot?<br></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Sun, Nov 20, 2022 at 7:38 AM Yimin Gu &lt;=
<a href=3D"mailto:ustcymgu@gmail.com">ustcymgu@gmail.com</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">Hi,<br>
<br>
On Sun, Nov 20, 2022 at 4:50 PM Waldemar Brodkorb &lt;<a href=3D"mailto:wbx=
@openadk.org" target=3D"_blank">wbx@openadk.org</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi,<br>
&gt; Yimin Gu wrote,<br>
&gt;<br>
&gt; &gt; The following patch adds support for 32-bit RISC-V No-MMU build.<=
br>
&gt; &gt; Currently for No-MMU RISC-V, only 64-bit is supported. There&#39;=
re no<br>
&gt; &gt; substancial changes in code but macros and compiling options. Ucl=
ibc,<br>
&gt; &gt; elf2flt, and the kernel need to be patched.<br>
&gt; &gt; This is based on damien-lemoal/buildroot which first added 64-bit=
 No-MMU<br>
&gt; &gt; support, and my earlier porting attempt regymm/buildroot.<br>
&gt; &gt; As a lot of FPGA-based RISC-V cores are 32-bit and many of the lo=
w ones<br>
&gt; &gt; are without MMU, this can bring Linux to cores as light as RV32IM=
A.<br>
&gt; &gt; For this reason, only the minimum required extensions are enabled=
 in the<br>
&gt; &gt; buildroot and kernel configurations.<br>
&gt; &gt;<br>
&gt; &gt; Yimin Gu (1):<br>
&gt; &gt;=C2=A0 =C2=A0arch/riscv: RISC-V 32-bit NO MMU support<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 arch/Config.in.riscv=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 2 -<br>
&gt; &gt;=C2=A0 board/riscv/nommu/patches/linux-headers=C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 =C2=A0 1 +<br>
&gt; &gt;=C2=A0 ...imental-RISC-V-32-bit-No-MMU-support.patch | 1355 ++++++=
+++++++++++<br>
&gt; &gt;=C2=A0 configs/qemu_riscv32_nommu_virt_defconfig=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A019 +<br>
&gt; &gt;=C2=A0 package/Makefile.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A013=
 +-<br>
&gt; &gt;=C2=A0 ...ed-RISC-V-32-bit-compilation-support.patch |=C2=A0 =C2=
=A074 +<br>
&gt; &gt;=C2=A0 .../uclibc/0001-RISC-V-32-bit-support.patch=C2=A0 =C2=A0|=
=C2=A0 145 ++<br>
&gt; &gt;=C2=A0 package/uclibc/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 2 +<br>
&gt; &gt;=C2=A0 8 files changed, 1607 insertions(+), 4 deletions(-)<br>
&gt; &gt;=C2=A0 create mode 120000 board/riscv/nommu/patches/linux-headers<=
br>
&gt; &gt;=C2=A0 create mode 100644 board/riscv/nommu/patches/linux/5.19/000=
1-Experimental-RISC-V-32-bit-No-MMU-support.patch<br>
&gt; &gt;=C2=A0 create mode 100644 configs/qemu_riscv32_nommu_virt_defconfi=
g<br>
&gt; &gt;=C2=A0 create mode 100644 package/elf2flt/0006-Added-RISC-V-32-bit=
-compilation-support.patch<br>
&gt; &gt;=C2=A0 create mode 100644 package/uclibc/0001-RISC-V-32-bit-suppor=
t.patch<br>
&gt;<br>
&gt; You can add a<br>
&gt; Tested-By: Waldemar Brodkorb &lt;<a href=3D"mailto:wbx@openadk.org" ta=
rget=3D"_blank">wbx@openadk.org</a>&gt;<br>
&gt;<br>
&gt; One minor note, add a startup description for noMMU in<br>
&gt; board/qemu/riscv32-virt/readme.txt.<br>
&gt;<br>
&gt; best regards<br>
&gt;=C2=A0 Waldemar<br>
<br>
Thanks for the testing and note. I have sent the refined patch in a<br>
separate reply.<br>
<br>
best regards,<br>
Yimin Gu<br>
_______________________________________________<br>
buildroot mailing list<br>
<a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@buil=
droot.org</a><br>
<a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listinfo/b=
uildroot</a><br>
</blockquote></div>

--000000000000c408a205ee57ac91--

--===============7097482846624101126==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7097482846624101126==--
