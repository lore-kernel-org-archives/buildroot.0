Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1039FC83F3E
	for <buildroot@archiver.kernel.org>; Tue,  5 Sep 2023 16:48:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 62AAB4091A;
	Tue,  5 Sep 2023 16:48:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 62AAB4091A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PLvdAkFUPXXk; Tue,  5 Sep 2023 16:48:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63AE040918;
	Tue,  5 Sep 2023 16:48:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63AE040918
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CD0DE1BF3DF
 for <buildroot@lists.busybox.net>; Tue,  5 Sep 2023 16:48:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B39466112F
 for <buildroot@lists.busybox.net>; Tue,  5 Sep 2023 16:48:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B39466112F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FLrV1bftnTab for <buildroot@lists.busybox.net>;
 Tue,  5 Sep 2023 16:48:01 +0000 (UTC)
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [IPv6:2001:4860:4864:20::2d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 042F86112E
 for <buildroot@buildroot.org>; Tue,  5 Sep 2023 16:48:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 042F86112E
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-1c26bb27feeso2119012fac.0
 for <buildroot@buildroot.org>; Tue, 05 Sep 2023 09:48:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693932480; x=1694537280;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MOdKgDPRu7K0p8Tc+vvqdZVZg2SA3plYl3HoaTYdE8Q=;
 b=mCsEe3nLOI7JsDYTlSlYw2ZcVrlTg8cx7vkKgCBdbK7j/ODXPkjqo97RRkDYbdwk6d
 s7J76oyJJ/mjGD5LcLnU090qNDuJEjHpDhUNPn0XunPu0K2A6XuHx/Ekqd7wOzABTFBj
 wATWsmnZ9N0TtEyBjRd3ODfxDWQm8SUt1OqemGsAdxgWm95VntloGaHL/vw9g2NB5XDK
 yKmhJVu4akkj/1nJ6RMr1RLfYDBrnK000H1V33Unb9gHmy9gRmNrDUUsho1OHE1t89Gn
 isD3djUEvo2l+5eddpgherlzd7bmDaK1b6J5T9nSDfCFFxi8G+tMtIiKe21gcV653fCL
 wKaQ==
X-Gm-Message-State: AOJu0YxAMs5q6XKQZdFVwI+hJ6YDp2lpcS2fdyRxV95KbPKZZC1sKXpv
 S2DZFEyRReoxhy3zUIxcajcmGIdHQD0MJIc6kbStqEm2130=
X-Google-Smtp-Source: AGHT+IFSslx3X/ctfLiYAXZud1eB21XRDweWm4ChXi8UkIWdmEqmVIQN3ZlHE33diSfrN0GDq3LL8E+5hIKm7UB5S6c=
X-Received: by 2002:a05:6870:2185:b0:1bb:8d8f:9c6e with SMTP id
 l5-20020a056870218500b001bb8d8f9c6emr16520503oae.10.1693932479834; Tue, 05
 Sep 2023 09:47:59 -0700 (PDT)
MIME-Version: 1.0
References: <CADYjeStAix3iUX8WUMnNK0onAXeoN391idwxda0JndNNJf=-kA@mail.gmail.com>
In-Reply-To: <CADYjeStAix3iUX8WUMnNK0onAXeoN391idwxda0JndNNJf=-kA@mail.gmail.com>
From: Sourabh Hegde <hrsourabh011@gmail.com>
Date: Tue, 5 Sep 2023 18:47:48 +0200
Message-ID: <CADYjeStioh-jKD5gs-_xPWY4VuEZ+nvTGZRk74sNGSyM=tYo8g@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693932480; x=1694537280; darn=buildroot.org;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MOdKgDPRu7K0p8Tc+vvqdZVZg2SA3plYl3HoaTYdE8Q=;
 b=PPwOucBOM/nIm4oB3Br10bGY/f3FVjhSlanKKX/NwPz/hiedUlUZogMj2oUKXXso3z
 n4nzRzqPkOOztNJD1FJ+vceiNokraJHufX4ZWgtZJR7ottElSanV3jGI0UkqZ1DrK07W
 2H/+C1jbnlRrK51gVfv+wdlsg1aBAAYrz4mryH8rIkQTDlCnTpCtsicS1V2MinduLKNL
 KDm5KiKbn9JNWHIJgjACiiY5FCMeYAIna9h7V6GpPE23WIKi7y3NClopLMbPfqinAyrj
 NZiNUXA8lZQW4QdK1SxUVmK+R6o3FJ7Dev7FUygsM7OeKuuOrvMHXfV/A1n8Ztrw/CRN
 Vnmg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=PPwOucBO
Subject: Re: [Buildroot] How to enable imxvideoconvert_g2d in Buildroot?
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
Content-Type: multipart/mixed; boundary="===============6382799099289368598=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6382799099289368598==
Content-Type: multipart/alternative; boundary="000000000000bbf66506049f638b"

--000000000000bbf66506049f638b
Content-Type: text/plain; charset="UTF-8"

Hello,

Can any one please let me know how to achieve this?
I have enabled BR2_PACKAGE_GST1_IMX2_G2D, BR2_PACKAGE_IMX_GPU_G2D but,
couldn't find any imxvideoconvert_g2d option... Is there any option in
GStreamer for this?

On Fri, 1 Sept 2023 at 11:29, Sourabh Hegde <hrsourabh011@gmail.com> wrote:

> Hello,
>
> I am trying to enable the "imxvideoconvert_g2d" element of gstreamer in
> Buildroot. But I couldn't find any imxvideoconvert_g2d option under
> gstreamer. Can anyone please let me know how to enable this option in
> Buildroot? I am using Buildroot 2022 version.
>
> Thanks in advance.
>

--000000000000bbf66506049f638b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<div><br></div><div>Can any one please let me know h=
ow to achieve this?<br>I have enabled=C2=A0BR2_PACKAGE_GST1_IMX2_G2D,=C2=A0=
BR2_PACKAGE_IMX_GPU_G2D but, couldn&#39;t find any imxvideoconvert_g2d opti=
on... Is there any option in GStreamer for this?</div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, 1 Sept 2023 =
at 11:29, Sourabh Hegde &lt;<a href=3D"mailto:hrsourabh011@gmail.com">hrsou=
rabh011@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex"><div dir=3D"ltr">Hello,<div><br></div><div>I am trying to =
enable the &quot;imxvideoconvert_g2d&quot; element of gstreamer in Buildroo=
t. But I couldn&#39;t find any imxvideoconvert_g2d option under gstreamer. =
Can anyone please let me=C2=A0know how to enable=C2=A0this option in Buildr=
oot? I am using Buildroot 2022 version.</div><div><br></div><div>Thanks in =
advance.</div></div>
</blockquote></div>

--000000000000bbf66506049f638b--

--===============6382799099289368598==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6382799099289368598==--
