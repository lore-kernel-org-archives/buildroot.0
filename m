Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1493C05027
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 05:11:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3864F400D2;
	Mon,  6 Feb 2023 05:11:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3864F400D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9pGGqvu_RkjF; Mon,  6 Feb 2023 05:11:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4CF67400D7;
	Mon,  6 Feb 2023 05:11:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4CF67400D7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 643AA1BF35E
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 05:11:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 38F5D813AD
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 05:11:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 38F5D813AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WxRUK0OpxRTP for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 05:11:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1FF2E813AA
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1FF2E813AA
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 05:11:17 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id ud5so30930738ejc.4
 for <buildroot@buildroot.org>; Sun, 05 Feb 2023 21:11:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=g22OXPnhI3RladBuQHv1doxylxOo8f/+W4XEqXy2w6g=;
 b=CTIaSy0Exd6P/fEAG5e3g2mEi/GWvj4iRJqGPqtdhiXNRF8I1qCsZ1qP4qw8QccTc/
 nBbI7YlegVpByCjLMn9ihHSW+l/OOhq8PHLIPzSb7BfPRms1raxnYAArgvFGaIcQjwKX
 Cdr2BuAdSn1i413gwKtXMqVWT9uodXBrwCMC4mXLux8noVhrqaGS6YYo0Y7+YnCgmVKk
 S1oCd0dxVdCvOTDbjgeD/33nwRK5OlDbCsKLgXRe4rmZBdc8CdgDSqqFbEu6EG4orNX9
 /H8t3UnFfqaR/XlPq2DpHGPNLCkvn+KTRuPeJ9pnWwcsM2b+FFlpnKkPzHphl++1+s0t
 YWXw==
X-Gm-Message-State: AO0yUKVO1hU0dyLGGBFvYCrOWuuKxwjoTP219k86dkPLQsaBjhbov8OA
 cM3rPBy1GvxCOJ7FuAQhruqZXHWKeRmQ2k02JRM=
X-Google-Smtp-Source: AK7set+tPHCgVcRqkDPUYj0RPmyMvA/KxQmLxcbx+n9VwkvMf8DV8PnCXya90tp22Js54bHPEUuKHg==
X-Received: by 2002:a17:906:c30b:b0:878:7cf3:a9e7 with SMTP id
 s11-20020a170906c30b00b008787cf3a9e7mr19957672ejz.65.1675660276079; 
 Sun, 05 Feb 2023 21:11:16 -0800 (PST)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com.
 [209.85.218.43]) by smtp.gmail.com with ESMTPSA id
 y14-20020a17090668ce00b0087329ff591esm4944370ejr.132.2023.02.05.21.11.15
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Feb 2023 21:11:15 -0800 (PST)
Received: by mail-ej1-f43.google.com with SMTP id hr39so1316631ejc.7
 for <buildroot@buildroot.org>; Sun, 05 Feb 2023 21:11:15 -0800 (PST)
X-Received: by 2002:a17:906:8da:b0:88b:1344:9709 with SMTP id
 o26-20020a17090608da00b0088b13449709mr5527812eje.162.1675660275080; Sun, 05
 Feb 2023 21:11:15 -0800 (PST)
MIME-Version: 1.0
References: <20230202132650.1537778-1-christian@paral.in>
 <20230205153552.GS2960@scaer>
In-Reply-To: <20230205153552.GS2960@scaer>
Date: Sun, 5 Feb 2023 21:11:06 -0800
X-Gmail-Original-Message-ID: <CA+h8R2pdn2d5CbpqTY0Z5VPUCtUbrvZVDT1ZCT3ZWAzYutrS-A@mail.gmail.com>
Message-ID: <CA+h8R2pdn2d5CbpqTY0Z5VPUCtUbrvZVDT1ZCT3ZWAzYutrS-A@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paral.in; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=g22OXPnhI3RladBuQHv1doxylxOo8f/+W4XEqXy2w6g=;
 b=BYIh2hKciVR2VyIcsaRRxSFJGtnYfiXIf861iMM9HhLxb3Vfqq7L15tkycwTAdXoYZ
 K6BgWFqBEoSNgiU99Rq+5Jiyuh0JOqrKW65KfA6TFH1VYW2VKuBphl6lggjZiEftQie+
 FSTKO5IGGHy74Ul+CA+ZVyA41nJY/0lWyi7LmY7h/iC9b8fXspNkXJvZ5PZvxy49e/B5
 IwZHFA+Bw6tjuwQ3t0FzaANGBQh4AEpvuJkBlHja/z9n7GQEl5SUEtoTP8nXWaeDK8T8
 aNbeN5GZq/67Ja1H7FwxYtaR5iSbI52zrvbf06htBBndTnpTK9+CD+SOqqf2MW7MC6tq
 J4RA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=paral.in header.i=@paral.in
 header.a=rsa-sha256 header.s=google header.b=BYIh2hKc
Subject: Re: [Buildroot] [PATCH v1 1/1] package/balena-engine: bump to
 version 20.10.26
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============3049124404623134020=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3049124404623134020==
Content-Type: multipart/alternative; boundary="00000000000075e33e05f4010f20"

--00000000000075e33e05f4010f20
Content-Type: text/plain; charset="UTF-8"

Yann,

On Sun, Feb 5, 2023, 7:36 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:

> Christian, All,
>
> On 2023-02-02 05:26 -0800, Christian Stewart via buildroot spake thusly:
> > This update requires a workaround for the non-standard vendor/ structure
> in the
> > balena-engine repository, which has an invalid vendor/modules.txt file.
> >
> > Removing the vendor/modules.txt file fixes the build error.
> >
> > Reference:
> https://github.com/moby/moby/issues/44618#issuecomment-1343565705
> >
> > The go download post-process script uses go mod init to create the
> go.mod file
>
> That's not correct. The download go-post-process script does not run
> that command at all.
>

My mistake, I had a commit in my working branch that adds go mod init if
the go.mod doesn't exist.

Thanks,
Christian


>

--00000000000075e33e05f4010f20
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Yann,<br><br><div class=3D"gmail_quote"><div dir=3D"=
ltr" class=3D"gmail_attr">On Sun, Feb 5, 2023, 7:36 AM Yann E. MORIN &lt;<a=
 href=3D"mailto:yann.morin.1998@free.fr">yann.morin.1998@free.fr</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">Christian, All,<br>
<br>
On 2023-02-02 05:26 -0800, Christian Stewart via buildroot spake thusly:<br=
>
&gt; This update requires a workaround for the non-standard vendor/ structu=
re in the<br>
&gt; balena-engine repository, which has an invalid vendor/modules.txt file=
.<br>
&gt; <br>
&gt; Removing the vendor/modules.txt file fixes the build error.<br>
&gt; <br>
&gt; Reference: <a href=3D"https://github.com/moby/moby/issues/44618#issuec=
omment-1343565705" rel=3D"noreferrer noreferrer" target=3D"_blank">https://=
github.com/moby/moby/issues/44618#issuecomment-1343565705</a><br>
&gt; <br>
&gt; The go download post-process script uses go mod init to create the go.=
mod file<br>
<br>
That&#39;s not correct. The download go-post-process script does not run<br=
>
that command at all.<br></blockquote></div></div><div dir=3D"auto"><br></di=
v><div dir=3D"auto">My mistake, I had a commit in my working branch that ad=
ds go mod init if the go.mod doesn&#39;t exist.</div><div dir=3D"auto"><br>=
</div><div dir=3D"auto">Thanks,</div><div dir=3D"auto">Christian</div><div =
dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex"><br>
</blockquote></div></div></div>

--00000000000075e33e05f4010f20--

--===============3049124404623134020==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3049124404623134020==--
