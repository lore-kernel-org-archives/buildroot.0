Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E88FD3E774
	for <buildroot@archiver.kernel.org>; Wed, 10 Dec 2025 19:44:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE41240B2B;
	Wed, 10 Dec 2025 19:44:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ws5bnfJdA5Av; Wed, 10 Dec 2025 19:44:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B94740ACC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765395855;
	bh=SVlQ2b5qcqzyCofCDxzXj9rVmKCwAt8jmdy2eHqNZDo=;
	h=From:Date:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XARcJCC2CutBD/PwK4Uj/YT/ZC6MrSvnVr3hK3gsTZwM7T4gZUnZmT5lxh5sCcUoV
	 KwK54wccM4OahuHHLxnbdotE9aUf4XopPpsVMp3MSdDkn3Wtfvqq3fwMth0fCWipTq
	 1SDmHs0t2mJ/NBfm6bpeN7hSIQ1f0902Qf15Z0j1vbtA7uTC2agJjKhGsIzy6DB9L8
	 K4WFFDB2d57NmAgpUtaMTQTUJONG6YVTdOPWnFaPfQXKTS2l8tT3voq/c49MPTKXi5
	 PQslabu3B0P88W4FesYTEucLko+a6Tme0yqc0MMXdxAHMnPdUFcwR+xHE58Uh+dfzo
	 28gs7YCervBlg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B94740ACC;
	Wed, 10 Dec 2025 19:44:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id CB43AE7
 for <buildroot@buildroot.org>; Wed, 10 Dec 2025 19:44:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BC5C661BC2
 for <buildroot@buildroot.org>; Wed, 10 Dec 2025 19:44:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B2YROe4wJkO5 for <buildroot@buildroot.org>;
 Wed, 10 Dec 2025 19:44:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::112e; helo=mail-yw1-x112e.google.com;
 envelope-from=mattis@artisaninsight.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BC44961BAE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC44961BAE
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com
 [IPv6:2607:f8b0:4864:20::112e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BC44961BAE
 for <buildroot@buildroot.org>; Wed, 10 Dec 2025 19:44:12 +0000 (UTC)
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-78a76afeff6so2496557b3.0
 for <buildroot@buildroot.org>; Wed, 10 Dec 2025 11:44:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765395851; x=1766000651;
 h=to:subject:message-id:date:from:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=paoBVL+k7SZNfVKQPfx9MWM5Ds2zWjlbMTkTNmsjzY8=;
 b=QBoQGs4+tqmxnEHjzuF8nyspzeefxJTSVJ2GkBSOj16bbSITQo+IaVmzlvzPUrbMug
 8TxlGb868Mmsm8/PrNGad9qdH12550aCfmg9WqB/XuIrz1dK0IzTmOH++7hAJ3ZJH+QY
 BHY4dJFUdvt6DMxoPn7mUbNkBi7Qfpo4FJFq3g6OC7H32EDdTkMx6Giwx1gm3zqB4kx1
 iOoaZEGIh9+cq65KAgh5lUVYDWrQKtYUIJomygTN2vHTQeVFinN7RVkvERXULRIfVqQD
 h1cZBPJ2D+e1eIvLXCw9fppwUymXCxft6JKsWY4/gCNVjcm1qZcslmwRkTnVSuJyu947
 RyPg==
X-Gm-Message-State: AOJu0YxKaIQvZRtVftgkFhf2yEHD5iis09YjG5M3Ox++TG3X4VCpmBrF
 tdTiU0nr+wT562M5KT8/PARyTJomwIvrEkIKF5KDNQVHox4w5t/wvHacwGJ1RORMs/OjReERbr3
 e6u0Sx7ttdTTSINAgWUqXhgXv84ecEbwbRjViu+yTTETsOjoCUJYT3Vvihg==
X-Gm-Gg: AY/fxX5q3ZSnuggwrw3tKDCbFEfiQO8UX9VCp/h+fAoBbV142MK3jPZEoDtBW69SnPN
 wtsqSDOrEoO+c/eZSE27/CoETIjko8kZsOHHfW4gDWXzC5xKRY9KIEHw2Iz+V51U4PCcO3sSP0R
 iwVXWm0pEXfs5SaOd0NDAeK7UEUhYhyYYLoT+muF3KvfjVNSlQkQaEabplasGLMMxkDO94lVR3a
 mJwa9xqDYT4osuFA+79CelBeKHhTXiqZJXPkU3pniDSqE5pUnwtfIQ5Xa/GhkAIJVKJew==
X-Google-Smtp-Source: AGHT+IEUoFVIsnBrcIF0LuAQtGAmMDu4arY7jpNoz8hrJcLpL2cRnj9qfsKg70/bcH3UbqpnjqB8AoKfjynD+61U5Cg=
X-Received: by 2002:a05:690c:7341:b0:787:f5c5:c631 with SMTP id
 00721157ae682-78c9d7cef02mr28826947b3.65.1765395851147; Wed, 10 Dec 2025
 11:44:11 -0800 (PST)
MIME-Version: 1.0
From: Mattis Fjallstrom <mattis@artisaninsight.com>
Date: Wed, 10 Dec 2025 11:44:00 -0800
X-Gm-Features: AQt7F2q7hYsBgq8mSEGo1Ihi5-whwh0cYdzQKH4mRHPGYiHuRpWmdKLA6Gs_wvs
Message-ID: <CAGf-n5CBoiQusv9-1ZAN9duEmn_FoKC1S_yovMUpVvVoSX2=nQ@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=artisaninsight.com; s=google; t=1765395851; x=1766000651; darn=buildroot.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=paoBVL+k7SZNfVKQPfx9MWM5Ds2zWjlbMTkTNmsjzY8=;
 b=ZDh8ji6pCPNTFDI4/6lTafStDFKhnq2UQlOMMx3O4mMBvl3/cU1/NkGf5kuB+qZtc2
 Zb0MY8QMzSGb/eL/p6Z/TITaHBQKIOnDbUzeuIv7ivqC2OMmgGj5X+TSyeiy8gGN6MvV
 IVMLXtod/FP3PMxNNHuMp6G1H4pl4y4B9ROFnwCnlw7dylfMjcrx1FT9Qh/6g0rbA9Td
 vBzXABSIobJGsmRbuepKx6NcsX51X6NWszuWTdrvYzYQK0FzoWknDiaXD/jR6gEulSg4
 IBDyMwjiQUk9TC7W/Q88hYp7i5jyf7XLeTBHjzhEUtrqNybmM678U1NKNYjvi2GsD3Ci
 nANw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=artisaninsight.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=artisaninsight.com header.i=@artisaninsight.com
 header.a=rsa-sha256 header.s=google header.b=ZDh8ji6p
Subject: [Buildroot] ntpsec, strptime & strlcpy fix
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
Content-Type: multipart/mixed; boundary="===============6292705710287108315=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6292705710287108315==
Content-Type: multipart/alternative; boundary="00000000000098895a06459e40de"

--00000000000098895a06459e40de
Content-Type: text/plain; charset="UTF-8"

Hi All,

I was seeing a problem that I know I'm not the first to encounter - ntpsec
refused to build properly, with a couple of errors related to missing
function declarations (strptime(), strlcpy()).

It seems that the root of the issue is in the ntpsec.mk file, where
NTPSEC_CONF_OPTS -> --cross-cflags does not include -D_GNU_SOURCE. When
--cross-cflags is specified to waf configure, it overrides the default
CFLAGS setting that the ntpsec wscript otherwise would be using. This
includes _GNU_SOURCE.

If we add -D_GNU_SOURCE to the cross compilation flags specified in
ntpsec.mk the problem goes away. (We can also remove the --cross-cflags
option, which allows ntpsec's wscript to use it's own settings, but we may
be losing things we want to include that way).

I believe this would also allow removal of some of the patches that are
included in buildroot/package/ntpsec, which appear to be dealing with this
same problem.

Thoughts?

Cheers,

Mattis

--00000000000098895a06459e40de
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div><div><div><div><div>Hi All,=C2=A0<br=
><br></div>I was=20
seeing a problem that I know I&#39;m not the first to encounter - ntpsec re=
fused to
 build properly, with a couple of errors related to missing function=20
declarations (strptime(), strlcpy()).=C2=A0<br><br></div>It seems that the =
root of the issue is in the <a href=3D"http://ntpsec.mk" target=3D"_blank">=
ntpsec.mk</a>
 file, where NTPSEC_CONF_OPTS -&gt; --cross-cflags does not include=20
-D_GNU_SOURCE. When --cross-cflags is specified to waf configure, it=20
overrides the default CFLAGS setting that the ntpsec wscript otherwise woul=
d be using. This includes _GNU_SOURCE.=C2=A0<br><br></div>If we add -D_GNU_=
SOURCE to the cross=20
compilation flags specified in <a href=3D"http://ntpsec.mk">ntpsec.mk</a> t=
he problem goes away. (We can also remove the --cross-cflags option, which =
allows ntpsec&#39;s=C2=A0wscript to use it&#39;s own settings, but we may b=
e losing things we want to include that way).=C2=A0<br><br></div>I
 believe this would also allow removal of some of the patches that are=20
included in buildroot/package/ntpsec, which appear to be dealing with=20
this same problem.</div><div><br></div><div>Thoughts?=C2=A0</div><div><br><=
/div><div>Cheers,</div><div><br></div><div>Mattis</div></div><br></div>

--00000000000098895a06459e40de--

--===============6292705710287108315==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6292705710287108315==--
