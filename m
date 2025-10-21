Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 065C8CCD184
	for <buildroot@archiver.kernel.org>; Tue, 21 Oct 2025 16:52:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F09B81DFC;
	Tue, 21 Oct 2025 16:52:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fxdloX_dLZ8x; Tue, 21 Oct 2025 16:52:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 08F1881DED
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 08F1881DED;
	Tue, 21 Oct 2025 16:52:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 53192277
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 16:52:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 44BF760656
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 16:52:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xNG9kWojgMrO for <buildroot@buildroot.org>;
 Tue, 21 Oct 2025 16:52:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12a; helo=mail-lf1-x12a.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3E40160671
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E40160671
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3E40160671
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 16:52:44 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-57e8e67aa3eso110947e87.1
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 09:52:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761065562; x=1761670362;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MPnh7Ce1dmmrEnbnb0TI2/GnYPLj6BJV0cUzcNr69q4=;
 b=dChYDMxDZs1Ca4SgGxkFtShO5i9zE2uvBWAZjBqUmCuWJTpMLKS8RxDedT7/rCw+4k
 0lQCzYMQXi/30ZrqjodAF/UzBuaZZit6lkMHOYNBC5kfYxdGYrkuQS6mxT9zEUP00bnO
 aLebEyIEugTzV/4erPqze+iG40S7zSvpcHik/9WJVq6vOB2BHVq9x4xbEZ2wd2l8mC9Y
 E5NTk9EQAZkeUk5/PRUFQ0mifaqVu7ps8iv4Od/69aQmb4WABneJk/R+3Qigb95fSN2o
 VbtKa9xlgxGFDy9QkGWBeumo5RT4A6a56XZQzDlpcxMhpI18hJvuy/9HZNBGCuFy2q1d
 1WiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrcxrtHfknSvlSy1uggkxuNtbRJsbpS53wklar5JQW/4EOFI7TYDHPlnAoH7jGKdpAJc4AovGBQvg=@buildroot.org
X-Gm-Message-State: AOJu0YxSukOQ9Wz/8kFA+hfth6H6QU8SHftcff7w5jlUPN2WzUh8b3vx
 IKAMOzQ9aEtB7OvQjWD6fwPCvh0sjz+0nP9bIKkRm28mhqp0ljHWrUg24+3TlN8++8R6zaFg2oa
 J1v9L6MghvA==
X-Gm-Gg: ASbGncvtYIdJDxnS6UR3TLoLceotJDmu/eQpYQm9G6grBXE8JO+HvYY1XeCL/gnOnUq
 PQlf9LgwoGXeVCo99lm8lhFGansUvD8KScDEG3StloIDCrrT3KEu4iPROwYulExm/C+EUN4TAU0
 dUfHfKY1JJys+mcK4FNXJX4/r135v04C66TFs/SqaB3WUMz20K2ariZ/QDOVjXMgs6HAb+UdoVX
 8mTG3x4uO+mOzzrK5vFP90Y0yCgm0kFl0mCfyhOi0H85Cwq3YPZadF3sMkMD/dURGgknet4y1hm
 1KolOoXkSqlM53Dh8Ea+RSgAM85/DUJN+vEm16hAIXDDYrghuzB7mxJt48gu4g7ncrUUGbe1FR2
 /QuSr10wI0XsVecFR/ch6Bn/J56oPqPUt0YiypeSjAAzCVb8cgmZLWbeVEUKdaZYzrNT6jIeIg/
 WIOlgBnnqL42oP6t2lkGPKPsMFOts20cqIO7w8xoUNig5DW/gC4Q==
X-Google-Smtp-Source: AGHT+IGxfLstSr8CQl7alLOtLKVYkVGIfDujCz8IjfRl0PkCVcDx08vLM+T7Dxrt/VyrZ8oaKcXR9Q==
X-Received: by 2002:a05:6512:1150:b0:583:9860:1405 with SMTP id
 2adb3069b0e04-592c5d1334emr130244e87.4.1761065561495; 
 Tue, 21 Oct 2025 09:52:41 -0700 (PDT)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com.
 [209.85.167.45]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-591deec1475sm3822474e87.48.2025.10.21.09.52.40
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Oct 2025 09:52:41 -0700 (PDT)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-591ea9ccfc2so102852e87.1
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 09:52:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWYb0/nu/FKqpyxF00VPoFAEmxT/j+5mF8yhCOF36o4yN/ioarbwoViyAAoMPxJsxGcUkdhwW8JBOA=@buildroot.org
X-Received: by 2002:a05:6512:691:b0:579:5d8e:1629 with SMTP id
 2adb3069b0e04-592cd17f408mr159869e87.12.1761065560595; Tue, 21 Oct 2025
 09:52:40 -0700 (PDT)
MIME-Version: 1.0
References: <20251021055931.532861-1-james.hilliard1@gmail.com>
 <aPcomAvNjlDA4o9R@yd-6wlzhs3>
 <CADvTj4qVJJ7dhUGJiOQnUtrgyuYcZzCKPMf3tx55CWzW-2RQbA@mail.gmail.com>
In-Reply-To: <CADvTj4qVJJ7dhUGJiOQnUtrgyuYcZzCKPMf3tx55CWzW-2RQbA@mail.gmail.com>
Date: Tue, 21 Oct 2025 09:52:28 -0700
X-Gmail-Original-Message-ID: <CA+h8R2pYtF+_aDB1o22=ywQCt2aPvPUG_2F=q3ACvR1oKnXiSA@mail.gmail.com>
X-Gm-Features: AS18NWDeqz0mZf-VcRFqZ_VnsOGvpLZv32IcVGXhtPNoBfhJ8P1738TA46ClirY
Message-ID: <CA+h8R2pYtF+_aDB1o22=ywQCt2aPvPUG_2F=q3ACvR1oKnXiSA@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: yann.morin@orange.com, Buildroot Mailing List <buildroot@buildroot.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1761065562; x=1761670362; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=MPnh7Ce1dmmrEnbnb0TI2/GnYPLj6BJV0cUzcNr69q4=;
 b=rVs8S8avKu7gT8zkiikBOxIh9rVFqq09N+riNpsF78Gh1qfG9Iy9Vh6kKt6KP43NbZ
 YFNtJHTjxQJ4BBwtgEewj/ZLn+H9ji64iS0gOaikXlNkOretVvna3bfBEavXoGA01zuu
 N7zoS9elmhY4d2x9C99+FoyN/y7OK3rONwu5e/Y33vqyeEVXEbXpRsXpoZp2Xhlqf2uk
 9HeoJ8JuCEGpJ3CJhILctB9CJsMwVdPD48I6lYTvkmMcVrkTunH/DBHqn+5JsQ4wydaI
 hVf9fQ3dYs9SKEQgmAKTwCJyT3KH2yUwuztf3GjIrLaVeTFjPsd9iT/9vG3Gfdxoj6Px
 qF5w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=rVs8S8av
Subject: Re: [Buildroot] [PATCH v3 1/3] package/pkg-golang.mk: use golang
 toolchain default GOPROXY
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: multipart/mixed; boundary="===============4374365032519695698=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4374365032519695698==
Content-Type: multipart/alternative; boundary="0000000000002a62800641ae07fa"

--0000000000002a62800641ae07fa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi James,

On Tue, Oct 21, 2025, 12:00=E2=80=AFAM James Hilliard <james.hilliard1@gmai=
l.com>
wrote:

> On Tue, Oct 21, 2025 at 12:30=E2=80=AFAM <yann.morin@orange.com> wrote:
> >
> > James, All,
> >
> > Thanks for the quick respin (while the discussion was still on-going in
> > a previous thread...)
> >
> > I was expecting that the order of patches would be the reverse:
> >   - first, make it configurable, keeping the current default
> >   - second change the default.
> >
> > If you first make it configurable and the patch is reverted, then the
> > default patch would _technically_ have to be reverted too.
>
> You'd also have to revert the tailscale package bump since that
> package requires the caching proxy and will not build when using
> GOPROXY=3Ddirect. So I wouldn't worry too much about that since
> reverting would require package version bump reverts as well.
>

Do we have a GitHub issue for the mismatched dependencies filed with
tailscale?

While I agree for performance it makes sense to use the proxy on default,
as this is no different than using say npm or pypi or any other package
store, nevertheless ...

It still makes me nervous to have these mismatches and treat them as a
matter of fact since it indicates something weird is going on, maybe
someone trying to hide malicious code in the proxy, so I think at least we
should test with direct as well and file GitHub issues for the mismatches.

In the past tailscale fixed several for us on request on GitHub issues.

Best regards,
Christian Stewart

--0000000000002a62800641ae07fa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi James,<br><br><div class=3D"gmail_quote gmail_quo=
te_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Oct 21, 2025, 1=
2:00=E2=80=AFAM James Hilliard &lt;<a href=3D"mailto:james.hilliard1@gmail.=
com">james.hilliard1@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex">On Tue, Oct 21, 2025 at 12:30=E2=80=AFAM &lt;<a href=3D"mailto:y=
ann.morin@orange.com" target=3D"_blank" rel=3D"noreferrer">yann.morin@orang=
e.com</a>&gt; wrote:<br>
&gt;<br>
&gt; James, All,<br>
&gt;<br>
&gt; Thanks for the quick respin (while the discussion was still on-going i=
n<br>
&gt; a previous thread...)<br>
&gt;<br>
&gt; I was expecting that the order of patches would be the reverse:<br>
&gt;=C2=A0 =C2=A0- first, make it configurable, keeping the current default=
<br>
&gt;=C2=A0 =C2=A0- second change the default.<br>
&gt;<br>
&gt; If you first make it configurable and the patch is reverted, then the<=
br>
&gt; default patch would _technically_ have to be reverted too.<br>
<br>
You&#39;d also have to revert the tailscale package bump since that<br>
package requires the caching proxy and will not build when using<br>
GOPROXY=3Ddirect. So I wouldn&#39;t worry too much about that since<br>
reverting would require package version bump reverts as well.<br></blockquo=
te></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Do we have a G=
itHub issue for the mismatched dependencies filed with tailscale?</div><div=
 dir=3D"auto"><br></div><div dir=3D"auto">While I agree for performance it =
makes sense to use the proxy on default, as this is no different than using=
 say npm or pypi or any other package store, nevertheless ...</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">It still makes me nervous to have the=
se mismatches and treat them as a matter of fact since it indicates somethi=
ng weird is going on, maybe someone trying to hide malicious code in the pr=
oxy, so I think at least we should test with direct as well and file GitHub=
 issues for the mismatches.</div><div dir=3D"auto"><br></div><div dir=3D"au=
to">In the past tailscale fixed several for us on request on GitHub issues.=
</div><div dir=3D"auto"><br></div><div dir=3D"auto">Best regards,</div><div=
 dir=3D"auto">Christian Stewart</div></div>

--0000000000002a62800641ae07fa--

--===============4374365032519695698==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4374365032519695698==--
