Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8204AC32771
	for <buildroot@archiver.kernel.org>; Thu, 22 Sep 2022 03:11:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2910418E0;
	Thu, 22 Sep 2022 03:11:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2910418E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6GYuHoqHnjj7; Thu, 22 Sep 2022 03:11:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B6E1B418CC;
	Thu, 22 Sep 2022 03:11:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B6E1B418CC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E20151BF397
 for <buildroot@lists.busybox.net>; Thu, 22 Sep 2022 03:10:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BB8B48301F
 for <buildroot@lists.busybox.net>; Thu, 22 Sep 2022 03:10:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB8B48301F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y6MdSf3WVM8W for <buildroot@lists.busybox.net>;
 Thu, 22 Sep 2022 03:10:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D1FD830AB
Received: from mail-vs1-xe31.google.com (mail-vs1-xe31.google.com
 [IPv6:2607:f8b0:4864:20::e31])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9D1FD830AB
 for <buildroot@buildroot.org>; Thu, 22 Sep 2022 03:10:29 +0000 (UTC)
Received: by mail-vs1-xe31.google.com with SMTP id p4so8888398vsa.9
 for <buildroot@buildroot.org>; Wed, 21 Sep 2022 20:10:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=WhcpY8o+63xm8yYWEL00me2Qr7SKz79OSFLPK60merg=;
 b=1XCKy1LNBpJ5b83DBrRByCUz129orpOivNuv0HZpjHVwmCApOPj14YmfLlBnqjvhJ1
 FEM9oAp7MPR8qYbPX2D2RXPcHzjg4P6rAo8CMOMxRbyDT1p7sKr9Xov5Fs+N4DYpid/p
 ZUaaA+hXCvzcWJ1ecv7lvmxMjkEE7+Uku5+z49v4qaMK1/i/kjLgSS0mRySIwOGsI0g/
 6S0eLKyH5a3wp0O+DwDq8U1GE4bGAKExwt7pMfRNel7r6ThOmBMV/GzFYf/DOrtmsyyb
 K6HNDvtobcmQCEc0d639n4ayxtbMwVT7cXbeTeb3H7kDZiqzhsAteszMQc8TqYn6wKbq
 wuEw==
X-Gm-Message-State: ACrzQf0s3/1Z6ndc/oK03+OePXPq70XsJyUMvRK71qpsfzoGyF36ogwM
 BUY5BvreJy+8TjMsgkX4jqSZt0PIBspShpyXPI9l+8GSsdU=
X-Google-Smtp-Source: AMsMyM7eVho9908+5pIuOA2JjGEFio7fWL1Su9gXf+jD5kfgBn3q8GNBg9L/4F8r/87FWReaIZuLIf2Xb3DHMIJRfNU=
X-Received: by 2002:a05:6102:3f55:b0:390:c753:3565 with SMTP id
 l21-20020a0561023f5500b00390c7533565mr432104vsv.13.1663816228266; Wed, 21 Sep
 2022 20:10:28 -0700 (PDT)
MIME-Version: 1.0
References: <CABRndgyUttoHU1dUOacMsbKFWTBvUn+Fr99WmQ57EC0CoX4JCA@mail.gmail.com>
 <5762dfb5-832f-a075-3be9-7d32cb82b661@mind.be>
In-Reply-To: <5762dfb5-832f-a075-3be9-7d32cb82b661@mind.be>
From: Zvi Vered <veredz72@gmail.com>
Date: Thu, 22 Sep 2022 06:10:16 +0300
Message-ID: <CABRndgzJO7ct_r4p8MQRA3G7YNzgWaxPPCtR6Sok55kxXpdsJQ@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=WhcpY8o+63xm8yYWEL00me2Qr7SKz79OSFLPK60merg=;
 b=Gd2M2t9ZBfEDAUyHWqUF4lBB2bi2BvnhLw3ubMysmi5GjZ6iffSryAgd6OuvLA7p2z
 /GMq5ETAVi1svYRjDnToGoe72ZfGnIVfckaTz6KUMh+AI5gA93wPvObNkH5IGXD6Dcad
 bCiQ/qdnQQs/XFmqnHntnk8qiMpDjaG361pQuKxHXWhzndDO7B7n+CzFlfnPaNEQuchk
 E+ab0VCNPiN3qetv256czBJtLq2GRZ7mY3udcDElZ33fX6h86h/0JKH6JDTaT3eKVD2M
 QN8bWaV6C4egZRCE/38BNC9fP0bHfdtGjvR+ynH+F0gyrJMZGfrdVqhvlNEcx7VeUwQE
 DnhA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Gd2M2t9Z
Subject: Re: [Buildroot] 2022.02.1: read-only file system
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
Cc: buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============9207863794319053497=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============9207863794319053497==
Content-Type: multipart/alternative; boundary="00000000000041e73605e93b67e5"

--00000000000041e73605e93b67e5
Content-Type: text/plain; charset="UTF-8"

Hi Arnout,

Thank you very much !

Best regards,
Zvika

On Sat, Sep 17, 2022 at 11:05 PM Arnout Vandecappelle <arnout@mind.be>
wrote:

>
>
> On 11/09/2022 19:58, Zvi Vered wrote:
> > Hello,
> >
> > I'm using buildroot 2022.02.1 under x86 embedded SBC.
> > The root file system is located on the on-board disk.
> > The boot argument contains 'ro' (checked with /proc/cmdline after login)
> but the
> > disk is not read-only.
>
>   There is a buildroot config option BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW
> which
> defaults to enabled. It will remount the rootfs to read-write as part of
> processing /etc/fstab. So you should probably turn that option off. Note
> that if
> you use systemd, you'll need to do a clean rebuild before the option is
> taken
> into account.
>
>
> > When I used the same boot args with busybox, it worked fine.
> > Of course with busybox I had to tailor all other mandatory files and
> directories.
> >
> > I need read-only rootfs to defend this embedded system in case of
> power-down /
> > cold reset.
>
>   Perhaps you're better off then to use an actual readonly filesystem,
> like
> erofs or squashfs? You have to make sure the corresponding kernel options
> are
> enabled, of course.
>
>   Regards,
>   Arnout
>
> >
> > Beyond the default configuration, the rootfs also contains ntp client,
> httpd,
> > pci tools.
> >
> > Thank you,
> > Zvika
> >
> >
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
>

--00000000000041e73605e93b67e5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Arnout,<div><br></div><div>Thank you very much !</div><=
div><br></div><div>Best regards,</div><div>Zvika=C2=A0</div></div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Sep 17,=
 2022 at 11:05 PM Arnout Vandecappelle &lt;<a href=3D"mailto:arnout@mind.be=
">arnout@mind.be</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex"><br>
<br>
On 11/09/2022 19:58, Zvi Vered wrote:<br>
&gt; Hello,<br>
&gt; <br>
&gt; I&#39;m using buildroot 2022.02.1 under x86 embedded SBC.<br>
&gt; The root file system is located on the on-board disk.<br>
&gt; The boot argument contains &#39;ro&#39; (checked with /proc/cmdline af=
ter login) but the <br>
&gt; disk is not read-only.<br>
<br>
=C2=A0 There is a buildroot config option BR2_TARGET_GENERIC_REMOUNT_ROOTFS=
_RW which <br>
defaults to enabled. It will remount the rootfs to read-write as part of <b=
r>
processing /etc/fstab. So you should probably turn that option off. Note th=
at if <br>
you use systemd, you&#39;ll need to do a clean rebuild before the option is=
 taken <br>
into account.<br>
<br>
<br>
&gt; When I used the same boot args with busybox, it worked fine.<br>
&gt; Of course with busybox I had to tailor all other mandatory files and d=
irectories.<br>
&gt; <br>
&gt; I need read-only rootfs to defend this embedded system in case of powe=
r-down / <br>
&gt; cold reset.<br>
<br>
=C2=A0 Perhaps you&#39;re better off then to use an actual readonly filesys=
tem, like <br>
erofs or squashfs? You have to make sure the corresponding kernel options a=
re <br>
enabled, of course.<br>
<br>
=C2=A0 Regards,<br>
=C2=A0 Arnout<br>
<br>
&gt; <br>
&gt; Beyond the default configuration, the rootfs also contains ntp client,=
 httpd, <br>
&gt; pci tools.<br>
&gt; <br>
&gt; Thank you,<br>
&gt; Zvika<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; _______________________________________________<br>
&gt; buildroot mailing list<br>
&gt; <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot=
@buildroot.org</a><br>
&gt; <a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=
=3D"noreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listi=
nfo/buildroot</a><br>
</blockquote></div>

--00000000000041e73605e93b67e5--

--===============9207863794319053497==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============9207863794319053497==--
