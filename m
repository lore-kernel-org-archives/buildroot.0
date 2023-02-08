Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99048C05027
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 16:31:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4DF2240C34;
	Wed,  8 Feb 2023 16:31:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4DF2240C34
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3isAmuwE3BHY; Wed,  8 Feb 2023 16:31:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 71B3440C2C;
	Wed,  8 Feb 2023 16:31:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 71B3440C2C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 40A0C1BF286
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 16:31:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 16F8D402DC
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 16:31:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 16F8D402DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4BVBpkzkL6rX for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 16:31:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CCECD40334
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CCECD40334
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 16:31:05 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id s8so10904123pgg.11
 for <buildroot@buildroot.org>; Wed, 08 Feb 2023 08:31:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fTw1LmOvQPlCBHUIzXWIRcsJO/652Kn8nYCCFIf80Dk=;
 b=UwmaCsjXauyTK1dRcncn5SMct2xZ+bk0hwETdfbIV7+9vbAk5BH/m+H/p7KeRYH4qC
 0fkTHZhHhAZhP9C0NDa+8sEqjs6K3srxRemDahYzV+6KikwEvuPcdRBcEreQ+kXbYk0X
 PS5JavljUrWJrjbJsu+YQVyL9fGsbdA02JEa8+3XaLXgbj2zQW+w3RvpjZe2YwRduUd1
 7TUJ9o7oZLT75kvNjX7s3ySTtQdf0KkjfzvYKX0cxEVbFU7jNXSsCgi4NY+gJaxpRY+1
 mdUAhuxN2qaOy7TQWMqWgW15YPw9bpPDGfy+aumobaSruCnJcEDvZEld35/LKl7lsEZF
 8E7Q==
X-Gm-Message-State: AO0yUKVkQGX/C/YtknShmIzVnFDZhoK7UhaUpS4DFTlq1bwLNjQ6aAka
 ohbSF2WoNgr2D07IeOp1vgsHSzsjYMZTyQRuadiFoq7S9s0=
X-Google-Smtp-Source: AK7set+sMM5LgIal1OIDd4IWSBgtc/nl+1QaaEmqLNor9n1LTh/Qxcm/DisO4NZNOQndZRFjyJqkPqker1Ik11ksJsc=
X-Received: by 2002:a63:af44:0:b0:4ad:30aa:8e6a with SMTP id
 s4-20020a63af44000000b004ad30aa8e6amr1705790pgo.40.1675873864985; Wed, 08 Feb
 2023 08:31:04 -0800 (PST)
MIME-Version: 1.0
References: <CACHw65JhmQX27SkN0jSMAD-P=UuwOizZc+sG+WatprbH_PFFyQ@mail.gmail.com>
 <1349e0d6ec9b6276a76371b29260432890ad680e.camel@dopsi.ch>
In-Reply-To: <1349e0d6ec9b6276a76371b29260432890ad680e.camel@dopsi.ch>
From: Ramon Crichlow <rcrichlow9000@gmail.com>
Date: Wed, 8 Feb 2023 10:30:53 -0600
Message-ID: <CACHw65JiUCgar+twWeUDOEEUw-emA6Kfk291kOD8yzakx0LQSA@mail.gmail.com>
To: Simon Doppler <dopsi@dopsi.ch>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fTw1LmOvQPlCBHUIzXWIRcsJO/652Kn8nYCCFIf80Dk=;
 b=dn6+2R6ezlvQco9iiUKMlpbolm/ESBxxAhAZKCkr84eCN+OshWnFN9B4Yj2BCCDh7o
 tPFpjRhYFljvSrJOmVgF6WH07LlRhStUy1Y+4cQMuSVwijnbMRzj7SyC+L4yeJrRql6m
 WMCWyHMWaPmzpsvLKkrfPgpPMUPlR7OXs8qn5BnsSqZfezo9MbuB4lavpp6wbWswY2q3
 nx3EEEp3emm8IFqS6KH8a11LkQG6XykSQ/2oQn3Q1v4odYMDeB4Zktze6t6gtK4ldmnp
 AUXfGJmfUpEXdpONrzW3V4ZanlT5IZmyzqQuAqyUWmiml90u/YMZghnkqkEVee/vL16S
 fYeg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=dn6+2R6e
Subject: Re: [Buildroot] stm32mp1 kernel won't boot on custom board
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
Content-Type: multipart/mixed; boundary="===============6695855367644771136=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6695855367644771136==
Content-Type: multipart/alternative; boundary="00000000000069324a05f432ca8d"

--00000000000069324a05f432ca8d
Content-Type: text/plain; charset="UTF-8"

The cd-gpios property of sdmmc@58005000  was different in the custom board
dts and the dk1 dts.
Modifying the dk1  uboot dts and the kernel dts (stm32mp15xx-dkx.dtsi)
allowed me to boot the custom board with the latest kernel.
The kernel wasn't getting the card detect signal so wasn't able to mount
the sd card.

Regards,
Ramon

On Mon, Jan 30, 2023 at 8:54 AM Simon Doppler <dopsi@dopsi.ch> wrote:

> Hello Ramon,
>
> On Sat, 2023-01-28 at 14:52 -0600, Ra C wrote:
> > I have a custom stm32mp157a board which runs OK with a modified 5.4
> kernel.
> > I want to migrate to the latest stm supported kernel.
> > I built a stm32mp157a_dk1 target using the BR2_EXTERNAL feature
> described here:
> > https://github.com/bootlin/buildroot-external-st which builds a 5.15
> kernel.
> >
> > Using the same dtb , the 5.15 kernel fails to mount the root device (a
> micro sd card on SDMMC1)
> > and gets stuck in a loop looking for a device matching the PARTUUID
> in class_find_device().  The
> > only devices listed are loop and ram.
> >
> > The probe function in drivers/mmc/host/mmci.c, which gets called in the
> working kernel prior to
> > mounting the root device does not get called with the 5.15 kernel.
> >
> > I don't understand why this is happening given that the same device tree
> is used in both cases and
> > not sure where next to look.
>
> Since the DTB is the same, are all the required drivers present (not as
> modules)? I didn't check
> which drivers exactly are built in with the configs ST provides. I would
> especially check for the
> CONFIG_MMC* values and whether the required filesystem support is built in.
>
> Best,
>
> Simon
>

--00000000000069324a05f432ca8d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The cd-gpios property of=C2=A0sdmmc@58005000=C2=A0 was dif=
ferent in the custom board dts and the dk1 dts.=C2=A0=C2=A0<div>Modifying t=
he dk1=C2=A0=C2=A0uboot dts and the kernel dts (stm32mp15xx-dkx.dtsi) allow=
ed me to boot the custom board with the latest kernel.=C2=A0=C2=A0<div>The =
kernel wasn&#39;t getting the card detect signal so wasn&#39;t able to moun=
t the sd card.</div><div><br></div><div>Regards,=C2=A0</div><div>Ramon</div=
></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Mon, Jan 30, 2023 at 8:54 AM Simon Doppler &lt;<a href=3D"mailto:=
dopsi@dopsi.ch">dopsi@dopsi.ch</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">Hello Ramon,<br>
<br>
On Sat, 2023-01-28 at 14:52 -0600, Ra C wrote:<br>
&gt; I have a custom stm32mp157a board which runs OK with a modified 5.4 ke=
rnel.<br>
&gt; I want to migrate to the latest stm supported kernel.<br>
&gt; I built a stm32mp157a_dk1 target using the BR2_EXTERNAL feature descri=
bed here:<br>
&gt; <a href=3D"https://github.com/bootlin/buildroot-external-st" rel=3D"no=
referrer" target=3D"_blank">https://github.com/bootlin/buildroot-external-s=
t</a> which builds a 5.15 kernel.<br>
&gt; <br>
&gt; Using the same dtb , the 5.15 kernel fails to mount the root device (a=
 micro sd card on SDMMC1)<br>
&gt; and gets stuck in a loop looking for a device matching the PARTUUID in=
=C2=A0class_find_device().=C2=A0 The<br>
&gt; only devices listed are loop and ram.<br>
&gt; <br>
&gt; The probe function in drivers/mmc/host/mmci.c, which gets called in th=
e working kernel prior to<br>
&gt; mounting the root device does not get called with the 5.15 kernel.<br>
&gt; <br>
&gt; I don&#39;t understand why this is happening given that the same devic=
e tree is used in both cases and<br>
&gt; not sure where next to look.<br>
<br>
Since the DTB is the same, are all the required drivers present (not as mod=
ules)? I didn&#39;t check<br>
which drivers exactly are built in with the configs ST provides. I would es=
pecially check for the<br>
CONFIG_MMC* values and whether the required filesystem support is built in.=
<br>
<br>
Best,<br>
<br>
Simon<br>
</blockquote></div>

--00000000000069324a05f432ca8d--

--===============6695855367644771136==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6695855367644771136==--
