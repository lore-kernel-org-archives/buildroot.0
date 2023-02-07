Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 491C1C61DA4
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 01:07:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A92ED40993;
	Tue,  7 Feb 2023 01:07:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A92ED40993
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XdtfGmMwuNQF; Tue,  7 Feb 2023 01:07:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 183FF409AE;
	Tue,  7 Feb 2023 01:07:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 183FF409AE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A91901BF2BB
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 01:07:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 835D8404C1
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 01:07:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 835D8404C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HT5tJNqvCG9h for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 01:07:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E95140002
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7E95140002
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 01:07:24 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id w20so9688337pfn.4
 for <buildroot@buildroot.org>; Mon, 06 Feb 2023 17:07:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3XJ4hMutBrXgXOaOh1UPTmD4zo3i4JN6T8mm8+VGVNo=;
 b=rSz+452GqJIhGEUjElF4Q7f87b0NE49ZY5GcG6dSluGJKWBlwuGR9w9DRQEmbeZ7u6
 3ENn2fY9ToUZcFgWG1CR/TrT214Wa3tRbaexhqzZjq6Qvf4jPLKmeafNt0IFMSOLBR+S
 /r3WYUnpyFwAZQIRDkq1RPh4/QfyHJwFVQQHqvjN8QQNIeOUVrclS1zo0rhZbhb0OP95
 mLXwrezI/siD0zLdf0sc96PfitXE2747iHK4EKWsMtIoohn6xlkP7iZ9hpVZ9aYMdplo
 opSx87i3evVraq8F/4Q42l5QpcVuvc8XfBOw474WcRZk3o+d80CB3vaPlzH93bTHbV53
 7z8g==
X-Gm-Message-State: AO0yUKWXNZbgmu3n04geDNq17xEEUZWMg6V3y59PG6Tu4OxPP12nrK1G
 ZgwdNLduqiuOp864dXlpY62hlLELMPgIIr3HhO03dmn5YMA=
X-Google-Smtp-Source: AK7set+OmiypfKeuIz3bYzSwVVX2Q4jYTDX6ZgXfOMVGRDGSnHnaSkqJJgXDHNUD7Y/zKOv1lmTU6OVzLdfb2s+rN7A=
X-Received: by 2002:aa7:8eda:0:b0:590:3edc:d2ec with SMTP id
 b26-20020aa78eda000000b005903edcd2ecmr329165pfr.27.1675732043536; Mon, 06 Feb
 2023 17:07:23 -0800 (PST)
MIME-Version: 1.0
References: <CACHw65JD8PZgGCfcwPn=45NxHBpvEpEhpsFLfatSDXFGbyS+5A@mail.gmail.com>
In-Reply-To: <CACHw65JD8PZgGCfcwPn=45NxHBpvEpEhpsFLfatSDXFGbyS+5A@mail.gmail.com>
From: Ramon Crichlow <rcrichlow9000@gmail.com>
Date: Mon, 6 Feb 2023 19:07:12 -0600
Message-ID: <CACHw65KxKfKhQnJMkneoP2Di4Gst+e2ZjnGNV2wsRKb_jedwaA@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3XJ4hMutBrXgXOaOh1UPTmD4zo3i4JN6T8mm8+VGVNo=;
 b=cCDbp34o5afL4XRiC3PT612NJjvrDMcmsfBAq8ACbUrgRcPM48OJZN7i2t25uIe+Ci
 7xe47HI3vwyk5HZGtnZLte4u2cNWRO1ncJLrZktAiiRXRPoxKyWHkrkt3eqJxhfU9gC+
 QlSFLGp3NtzbR89bFXo1p+L4HaYzOIwo9+DJXtsSZM67J99La7Hx1CFfk7abLkdyLg0l
 BEiwgjp9HQL5mo7Ja7hFWSfcVrD4cYgXnj2tW1wukhxwPaiVaDUP7oflt2qYIHQQS/6m
 oAtOzq+dPOYvC6nJBSqZZRt07Nv+znm9oX8Y+ivNKDm2oVYo0eatWwjuTMSAxwr05UVA
 3vDQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=cCDbp34o
Subject: Re: [Buildroot] lsblk not getting built
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
Content-Type: multipart/mixed; boundary="===============0079925281059887349=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0079925281059887349==
Content-Type: multipart/alternative; boundary="000000000000319fc605f411c58e"

--000000000000319fc605f411c58e
Content-Type: text/plain; charset="UTF-8"

I didn't have BR2_PACKAGE_UTIL_LINUX_BINARIES selected.



On Mon, Feb 6, 2023 at 5:57 PM Ramon Crichlow <rcrichlow9000@gmail.com>
wrote:

> I modified package/util-linux/util-linux.mk and Config.in to match the
> changes here :
> https://patchwork.ozlabs.org/project/buildroot/patch/20160225171433.7e200dfc@free-electrons.com/
> Then I ran make menuconfig and enabled BR2_PACKAGE_UTIL_LINUX_LSBLK.
>
> No lsblk gets built or iinstalled.
>
>  --enable-lsblk does appear in the build log so the flag is being set
> correctly.
>
> I am using the stm32mp157-dk1 configuration.
>
> #uname -a
> Linux buildroot 5.13.0 #1 SMP PREEMPT Sun Feb 5 19:20:00 CST 2023 armv7l
> GNU/Linux
>
> Regards,
> Ramon
>

--000000000000319fc605f411c58e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I didn&#39;t have=C2=A0<span style=3D"color:rgb(0,0,0);whi=
te-space:pre-wrap">BR2_PACKAGE_UTIL_LINUX_BINARIES selected.  </span><div><=
br></div><div><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, Feb 6, 2023 at 5:57 PM Ramon Crichlow &lt;<=
a href=3D"mailto:rcrichlow9000@gmail.com">rcrichlow9000@gmail.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"ltr">I modified package/util-linux/<a href=3D"http://util-linux.mk" tar=
get=3D"_blank">util-linux.mk</a> and Config.in to match the changes here : =
<a href=3D"https://patchwork.ozlabs.org/project/buildroot/patch/20160225171=
433.7e200dfc@free-electrons.com/" target=3D"_blank">https://patchwork.ozlab=
s.org/project/buildroot/patch/20160225171433.7e200dfc@free-electrons.com/</=
a><div>Then I ran make menuconfig and enabled=C2=A0BR2_PACKAGE_UTIL_LINUX_L=
SBLK.</div><div><br></div><div>No lsblk gets built or iinstalled.</div><div=
><br></div><div>=C2=A0--enable-lsblk does appear in the build log so the fl=
ag is being set correctly.<br></div><div><br></div><div>I am using the stm3=
2mp157-dk1 configuration.<br></div><div><br></div><div>#uname -a</div><div>=
Linux buildroot 5.13.0 #1 SMP PREEMPT Sun Feb 5 19:20:00 CST 2023 armv7l GN=
U/Linux<br></div><div><div><br></div><div>Regards,</div></div><div>Ramon</d=
iv></div>
</blockquote></div>

--000000000000319fc605f411c58e--

--===============0079925281059887349==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0079925281059887349==--
