Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EE99C25B79
	for <buildroot@archiver.kernel.org>; Thu, 16 May 2024 09:07:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1E78941C7D;
	Thu, 16 May 2024 09:07:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6FenhifxrkpP; Thu, 16 May 2024 09:07:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4F7F540B75
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4F7F540B75;
	Thu, 16 May 2024 09:07:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 18EEA1BF82C
 for <buildroot@lists.busybox.net>; Thu, 16 May 2024 09:07:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 11F2340844
 for <buildroot@lists.busybox.net>; Thu, 16 May 2024 09:07:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d72TPWLFvbsZ for <buildroot@lists.busybox.net>;
 Thu, 16 May 2024 09:07:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2656540811
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2656540811
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2656540811
 for <buildroot@buildroot.org>; Thu, 16 May 2024 09:07:01 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-572af0b12b8so2977336a12.2
 for <buildroot@buildroot.org>; Thu, 16 May 2024 02:07:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715850420; x=1716455220;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AnwlOJLGgFouYgrHbemTvtYxphp5QkZED5W0cNMWFMM=;
 b=w/dcTRlmLjailDgpSJ0ggz3OzzHpw8nebE9O4JDevwjyJoVt6yvx9IzUDwTvEiki7l
 Vh1c9s2IcLzk2o8T+e8U8+NECSzqvboCbdNBTQQvMBtF+lCt1xj01prbQDKePubIA4VR
 sSDig9ORrXi7cBQ1OplEhwjfRV4Gi4DY6Wafa2KMN5Rkrk+SkwoxPFju+BkmwiCLJCgj
 kH+8uLedcgcZTkkO44R+4cyeeRmHwNHZpX+emM2/kIvObHmGyS5kjADDkBJeeuG1xs75
 rOrSxJAZehYc4kjbT/sEGm0pNNiO0mL/WFDmhnLk/nZk3AAt4DVMc/nk9tM1Hga6dDW5
 ZNDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPevAmGKtt4C74/cbVDWNKUWdODyURUs9jrdRLmJXSXdByoSHQIckCHkHifatz9ZX9Kgu1vMFSWZDK6TCwdAdkhRh7m5pHNQ==
X-Gm-Message-State: AOJu0YwxcfxG1PWh4YtrHM8NOkGHQTlXUuyJW9u59isu232Yd1HBnxua
 7ZhsP2w1jlCkdbKPYbpSyRB0Kc4Im+c+S/8k1PRJ+nLKJcbLEXkn45Sv/3vVvHMVP5a4yntI5sf
 7cbk=
X-Google-Smtp-Source: AGHT+IEFRu8e1wFgWWh3Syw6QkPTP5bznwb2Tsh3iHUoKcy/jwQ6HOuf+wHmjsVgw0KjHU9EeCP+Gg==
X-Received: by 2002:a17:907:76d3:b0:a59:c7d7:8b0f with SMTP id
 a640c23a62f3a-a5a2d57a717mr1111685966b.29.1715850419426; 
 Thu, 16 May 2024 02:06:59 -0700 (PDT)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com.
 [209.85.208.54]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a44f9581fsm755395866b.196.2024.05.16.02.06.58
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 May 2024 02:06:58 -0700 (PDT)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-574bf7ab218so3279369a12.1
 for <buildroot@buildroot.org>; Thu, 16 May 2024 02:06:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWZi385vTyEARDrqjHHiJzMBdvqmHcaVziDGQZSeJKTC0orGQzpP2wScqSukkw0oHcX45x3JHKsINInCiwAe6E4pKmYaKZnUA==
X-Received: by 2002:a17:907:6e8d:b0:a59:aa68:9992 with SMTP id
 a640c23a62f3a-a5a2d57ab93mr1602717166b.18.1715850418191; Thu, 16 May 2024
 02:06:58 -0700 (PDT)
MIME-Version: 1.0
References: <20240307015107.2908128-1-christian@aperture.us>
 <20240514102318.1cdeba18@windsurf>
 <CA+h8R2peXHHtzBXdg-uW7bptT8mmGY+kgzbvPNFW9MQy3xOJhQ@mail.gmail.com>
 <CA+h8R2rgJ1AKsqBCAFkf8xRaf+8EmnMmh9uKj+nwq_WphWECbQ@mail.gmail.com>
 <c13030fe-4308-415b-8717-e1c0af3d68fc@smile.fr>
In-Reply-To: <c13030fe-4308-415b-8717-e1c0af3d68fc@smile.fr>
Date: Thu, 16 May 2024 02:06:48 -0700
X-Gmail-Original-Message-ID: <CA+h8R2rO4Vmwk_VTCBc061x1FgQwQ9jXCMePw74=hc5ezquLhg@mail.gmail.com>
Message-ID: <CA+h8R2rO4Vmwk_VTCBc061x1FgQwQ9jXCMePw74=hc5ezquLhg@mail.gmail.com>
To: Romain Naour <romain.naour@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1715850420; x=1716455220; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=AnwlOJLGgFouYgrHbemTvtYxphp5QkZED5W0cNMWFMM=;
 b=IEUJXck2zCdrgDrMw+NQfB+zjDgKEdzhVeP/DAMOom9G88wxUjZwwbOovO268daVld
 AwYeV8ntYxixPRMddKnZ66gZw5slHGNOYoQ4kBkbaKlQ8wXNaReA2QVZVYDMtKRraw5t
 U/h9/8pdkTCiNcTKQ/8tqWfYBo0rAVFMLGIDzYbZ38UZeCmeblxMeDWM8WRkF3Jc1Yzo
 zMY8H4vBGKMUGFvQf2qZduq/v9pJ/tpm0kal2+Z3m9duUG0SyG7nquOu04HcM5Zhdnkg
 8tF/mMTGgTErKyMvTnZ350AWKvW3Y5xd2X3syDoLzFP6/g371wWGvYxFhOI11ur8FJgI
 2ovg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=IEUJXck2
Subject: Re: [Buildroot] [PATCH v1 1/3] package/go-bootstrap-stage2: bump
 version to go1.19.13
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
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Christian Stewart via buildroot <buildroot@buildroot.org>,
 Anisse Astier <anisse@astier.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: multipart/mixed; boundary="===============7322876926198890673=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7322876926198890673==
Content-Type: multipart/alternative; boundary="000000000000aa0e7606188e8ef3"

--000000000000aa0e7606188e8ef3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Romain,

On Thu, May 16, 2024, 12:07=E2=80=AFAM Romain Naour <romain.naour@smile.fr>=
 wrote:

> Hello Christian, All,
>
> Le 15/05/2024 =C3=A0 01:38, Christian Stewart via buildroot a =C3=A9crit =
:
> Anyway, go should not try to use git to retrieve some info since we are
> not in
> the go repository.
>
> I applied the same patch "fix go-bootstrap when parent dir contains inval=
id
> .git" from [1] to go-bootstrap-stage3
>
> [1]
>
> https://gitlab.com/buildroot.org/buildroot/-/commit/bc8e70a08ba083d978c82=
8e31442a7645c9099d7
>
> And the build succeed on gitlab-ci:
> https://gitlab.com/kubu93/buildroot/-/jobs/6860670292
>
> Best regards,
> Romain
>

Ah yes, a year ago (July 2023) I encountered this issue, added the patch to
buildroot, sent the patch upstream:
https://go-review.googlesource.com/c/go/+/513835#message-3e06cf20e68b78655f=
d3aa2af4a192e45bb29e63
- had review comments on that CL, but never got around to updating /
resubmitting it :(

Good to know that worked!

Best regards,
Christian Stewart

--000000000000aa0e7606188e8ef3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Romain,<br><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Thu, May 16, 2024, 12:07=E2=80=AFAM Romain=
 Naour &lt;<a href=3D"mailto:romain.naour@smile.fr">romain.naour@smile.fr</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hello Christian, All,=
<br>
<br>
Le 15/05/2024 =C3=A0 01:38, Christian Stewart via buildroot a =C3=A9crit=C2=
=A0:<br>
Anyway, go should not try to use git to retrieve some info since we are not=
 in<br>
the go repository.<br>
<br>
I applied the same patch &quot;fix go-bootstrap when parent dir contains in=
valid<br>
.git&quot; from [1] to go-bootstrap-stage3<br>
<br>
[1]<br>
<a href=3D"https://gitlab.com/buildroot.org/buildroot/-/commit/bc8e70a08ba0=
83d978c828e31442a7645c9099d7" rel=3D"noreferrer noreferrer" target=3D"_blan=
k">https://gitlab.com/buildroot.org/buildroot/-/commit/bc8e70a08ba083d978c8=
28e31442a7645c9099d7</a><br>
<br>
And the build succeed on gitlab-ci:<br>
<a href=3D"https://gitlab.com/kubu93/buildroot/-/jobs/6860670292" rel=3D"no=
referrer noreferrer" target=3D"_blank">https://gitlab.com/kubu93/buildroot/=
-/jobs/6860670292</a><br>
<br>
Best regards,<br>
Romain<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"=
auto">Ah yes, a year ago (July 2023) I encountered this issue, added the pa=
tch to buildroot, sent the patch upstream:=C2=A0<a href=3D"https://go-revie=
w.googlesource.com/c/go/+/513835#message-3e06cf20e68b78655fd3aa2af4a192e45b=
b29e63">https://go-review.googlesource.com/c/go/+/513835#message-3e06cf20e6=
8b78655fd3aa2af4a192e45bb29e63</a> - had review comments on that CL, but ne=
ver got around to updating / resubmitting it :(</div><div dir=3D"auto"><br>=
</div><div dir=3D"auto">Good to know that worked!</div><div dir=3D"auto"><b=
r></div><div dir=3D"auto">Best regards,</div><div dir=3D"auto">Christian St=
ewart</div></div>

--000000000000aa0e7606188e8ef3--

--===============7322876926198890673==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7322876926198890673==--
