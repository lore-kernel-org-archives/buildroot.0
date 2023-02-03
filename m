Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1DC5C61DA4
	for <buildroot@archiver.kernel.org>; Fri,  3 Feb 2023 07:38:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C1BC404B6;
	Fri,  3 Feb 2023 07:38:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C1BC404B6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9mbJqm9kmnyF; Fri,  3 Feb 2023 07:38:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 503D84067F;
	Fri,  3 Feb 2023 07:38:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 503D84067F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 30D221BF3A8
 for <buildroot@lists.busybox.net>; Fri,  3 Feb 2023 07:38:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 07CE24115B
 for <buildroot@lists.busybox.net>; Fri,  3 Feb 2023 07:38:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 07CE24115B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n5IQ68BokjvW for <buildroot@lists.busybox.net>;
 Fri,  3 Feb 2023 07:38:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 917F041151
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 917F041151
 for <buildroot@buildroot.org>; Fri,  3 Feb 2023 07:38:07 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id mf7so12962359ejc.6
 for <buildroot@buildroot.org>; Thu, 02 Feb 2023 23:38:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4ABfZBr3z2vqT07LSHMxb6zy8XTAOUqiVKXDAs7Ys5U=;
 b=E47Z0ReviyQSW1xmm76SSN1LianXt1gkb2rUoxyCS8N85yxu4PdwY5ewECZudOtWkP
 T53iUumRe0CijfP+H+4FinYII+7z79/y+rYLwNe64ih1zP+e7BdOW0rhbWF3NPzXTbwr
 a87Efl4qdpE39peO6yC86c0oSVQw90fS7tw2OLQpDLQkVuXEJ0yAsyg1a24o90eLFWEZ
 KOYZ0nb6B9If26fXJb0ITjfQHhAmL3Pgxw0uEc1r9ryMY5HWlt6gyi245947KreGrjHA
 my0r1/iX0WQD/SluOC1h3TMTplm24L3m7rDg3v7kNL4NaTj83a9Rpbb6Q9sUtoARIxzy
 /MlQ==
X-Gm-Message-State: AO0yUKXhBeiwU73bdh+R2miBBb1cW/8N6wKULzafHcSNmoIN6cDJavj5
 +/nyNd33VaO5bjTzyX9Rzg/4dThhbBy0JjlqJmI=
X-Google-Smtp-Source: AK7set9zUeu/c2WbmtLuYgwktMBfmO9yiJZ3Xl2rX2qIzXJa0FywwEX4f6UME7XzbDVe74bwpAD1jA==
X-Received: by 2002:a17:907:8745:b0:882:82b3:58bc with SMTP id
 qo5-20020a170907874500b0088282b358bcmr10460557ejc.65.1675409885458; 
 Thu, 02 Feb 2023 23:38:05 -0800 (PST)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com.
 [209.85.218.49]) by smtp.gmail.com with ESMTPSA id
 j17-20020a1709064b5100b00878130e170bsm968009ejv.131.2023.02.02.23.38.04
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Feb 2023 23:38:04 -0800 (PST)
Received: by mail-ej1-f49.google.com with SMTP id m2so12937378ejb.8
 for <buildroot@buildroot.org>; Thu, 02 Feb 2023 23:38:04 -0800 (PST)
X-Received: by 2002:a17:906:8da:b0:88b:1344:9709 with SMTP id
 o26-20020a17090608da00b0088b13449709mr2922901eje.162.1675409884469; Thu, 02
 Feb 2023 23:38:04 -0800 (PST)
MIME-Version: 1.0
References: <20230202133453.1747150-1-christian@paral.in>
 <87o7qb2onc.fsf@dell.be.48ers.dk>
In-Reply-To: <87o7qb2onc.fsf@dell.be.48ers.dk>
Date: Thu, 2 Feb 2023 23:37:55 -0800
X-Gmail-Original-Message-ID: <CA+h8R2pFZ+rS4ftSxLVM-EPS=N2ViSiGw_VQ=Sb=VN_jArbC8g@mail.gmail.com>
Message-ID: <CA+h8R2pFZ+rS4ftSxLVM-EPS=N2ViSiGw_VQ=Sb=VN_jArbC8g@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paral.in; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4ABfZBr3z2vqT07LSHMxb6zy8XTAOUqiVKXDAs7Ys5U=;
 b=Cf1f2JMKeGI43GD3JYKwdFDOFeHeApN4SkAtHswCdVdjlcWDxMDb5pPHVKXT8NSgnt
 LQ5HrgnODGb235HJvdZTwtg/5cz9A82KWrc9pgkxZMCOEfORr06sBtB09WRoq8gjX5b3
 4FtaddpH82O2gX1xhfLwzCI7yif7pC0Eg72509i7YB/QMZ4gVdtxqQyH/BhRPtcX2zpO
 lSO+odLvxQOxoscWwk80IRxyDZyl52zGLqdbuMtKpjYDbpiszFp/MMteO0RWagmsbKaH
 W+ofHQe3CZ9c3RkScHGwGpbyu4Q9D8eM0Ev7joYSBxtKca0jX1mDst9APdSg2H99gSJB
 S/+g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=paral.in header.i=@paral.in
 header.a=rsa-sha256 header.s=google header.b=Cf1f2JMK
Subject: Re: [Buildroot] [PATCH v1 1/1] package/containerd: bump to version
 1.6.16
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============3260864632273248976=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3260864632273248976==
Content-Type: multipart/alternative; boundary="000000000000045e9905f3c6c334"

--000000000000045e9905f3c6c334
Content-Type: text/plain; charset="UTF-8"

Hi Peter,

I also sent a v2 of this series which adds the containerd.service for
systemd.

Thanks & best,
Christian

On Thu, Feb 2, 2023, 11:28 PM Peter Korsgaard <peter@korsgaard.com> wrote:

> >>>>> "Christian" == Christian Stewart <christian@paral.in> writes:
>
>  > Bugfixes and improvements.
>  > https://github.com/containerd/containerd/releases/tag/v1.6.16
>
>  > Signed-off-by: Christian Stewart <christian@paral.in>
>
> Committed, thanks.
>
> --
> Bye, Peter Korsgaard

--000000000000045e9905f3c6c334
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi Peter,<div dir=3D"auto"><br></div><div dir=3D"auto">I =
also sent a v2 of this series which adds the containerd.service for systemd=
.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Thanks &amp; best,</di=
v><div dir=3D"auto">Christian<br><br><div class=3D"gmail_quote" dir=3D"auto=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Feb 2, 2023, 11:28 PM Peter=
 Korsgaard &lt;<a href=3D"mailto:peter@korsgaard.com">peter@korsgaard.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">&gt;&gt;&gt;&gt;&gt; =
&quot;Christian&quot; =3D=3D Christian Stewart &lt;<a href=3D"mailto:christ=
ian@paral.in" target=3D"_blank" rel=3D"noreferrer">christian@paral.in</a>&g=
t; writes:<br>
<br>
=C2=A0&gt; Bugfixes and improvements.<br>
=C2=A0&gt; <a href=3D"https://github.com/containerd/containerd/releases/tag=
/v1.6.16" rel=3D"noreferrer noreferrer" target=3D"_blank">https://github.co=
m/containerd/containerd/releases/tag/v1.6.16</a><br>
<br>
=C2=A0&gt; Signed-off-by: Christian Stewart &lt;<a href=3D"mailto:christian=
@paral.in" target=3D"_blank" rel=3D"noreferrer">christian@paral.in</a>&gt;<=
br>
<br>
Committed, thanks.<br>
<br>
-- <br>
Bye, Peter Korsgaard</blockquote></div></div></div>

--000000000000045e9905f3c6c334--

--===============3260864632273248976==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3260864632273248976==--
