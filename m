Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F6C7C88CB2
	for <buildroot@archiver.kernel.org>; Mon, 12 Jun 2023 15:24:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC0D582EA5;
	Mon, 12 Jun 2023 15:24:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC0D582EA5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vggd6nNTmAvd; Mon, 12 Jun 2023 15:24:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D55382D75;
	Mon, 12 Jun 2023 15:24:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D55382D75
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 31FD21BF285
 for <buildroot@lists.busybox.net>; Mon, 12 Jun 2023 15:24:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0BC0D82E19
 for <buildroot@lists.busybox.net>; Mon, 12 Jun 2023 15:24:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0BC0D82E19
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pEPSzNgMnRDq for <buildroot@lists.busybox.net>;
 Mon, 12 Jun 2023 15:24:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF4DA82D75
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BF4DA82D75
 for <buildroot@buildroot.org>; Mon, 12 Jun 2023 15:24:15 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4f6283d0d84so5232054e87.1
 for <buildroot@buildroot.org>; Mon, 12 Jun 2023 08:24:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686583453; x=1689175453;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cbbnz/QkHe5rgUUofEnjH35Hmkqsdq7VSm91FzoJIjo=;
 b=OA6/eBmJ27dgppX8Mj9EQCi224RqM+cimVio+699nPazLWYIoArPfPpasDQTS04CsH
 fHco0Jgy2Oq7RkMFuV9GwSMrtdATdgGf5DqoK3XyeXqryfG8sU3FLuRNGLPnbBEFXrfl
 NvRIFPYG6HbHnkvEX7DEVNOmHbs1GpgTolHbdUhCZ/YzOjuVCzS0af6NeP8f8nnmZXhx
 B0vvslpwknXK/dRCGFn6usNRGowqUZSXUKwQ+hA23heeZXCOhcNWD84gKfk0bfpIycgU
 xm5JGBg0rswbfD48GffjtG3dZALH7CCO38mKqTPDoiuuDG3/Xrb8mhkaUgOJx5PT7oAl
 6Qcg==
X-Gm-Message-State: AC+VfDyQ6l5GwwWZjfcItuOjJFppw/vrEzImjI/xBwXXMQIAd9XATsG7
 dqZ2lIDnYMVs7revIcSvjQ8wQbD/GLh0BVgocantwLn/ums=
X-Google-Smtp-Source: ACHHUZ5MIql2ym2Aa55TA5S2om5ilWFRyL3/5tje/OigPJ/niCFijaSGaDA7esNKDVdXvt3Ny4nwSvK/e79YRzV1RGQ=
X-Received: by 2002:ac2:5bd1:0:b0:4f6:2852:5f56 with SMTP id
 u17-20020ac25bd1000000b004f628525f56mr4490476lfn.18.1686583453097; Mon, 12
 Jun 2023 08:24:13 -0700 (PDT)
MIME-Version: 1.0
From: Indrek Kruusa <indrek.kruusa@gmail.com>
Date: Mon, 12 Jun 2023 18:24:04 +0300
Message-ID: <CA+fTLhgfd1TXsc106CVJWzMPKiFE2BtPW6wieF8MxhoUik=Zcg@mail.gmail.com>
To: Buildroot Mailing List <buildroot@buildroot.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686583453; x=1689175453;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=cbbnz/QkHe5rgUUofEnjH35Hmkqsdq7VSm91FzoJIjo=;
 b=ZIdvujFVqX7yoLifZg4vXCPV7j5fLPH+3rAxVBvljakviiMBKwXMk4aCj8lypgWdFH
 xn7R1LoL0ndLYK4BCikzCoA3eSsS+/JuJ9Hkyx6+597Lg+i0xHHWo7dSekNhZPyc2nTU
 MSSXKBmVHVoT2ejFPeTgQBmItgR1QKK+G5FY9LliSubbE82I5gC22H5uoA4BmtqK7S8Q
 DNenuvDZNYptWtusGcikXR+6suDg8KXIQbi+mhkTqwJo2S2sbv366UaBJIUr9x7Zsngy
 u4//AdQd1drEhHa98owaSf0HV+etiRKYTItCd6tgnbhZRU6aw56gFDGqC5h7/Xg06B46
 7vXQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=ZIdvujFV
Subject: [Buildroot] package/rtl8189fs: question about the debug mode
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: multipart/mixed; boundary="===============2097960261735996664=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2097960261735996664==
Content-Type: multipart/alternative; boundary="0000000000009b265405fdf04f69"

--0000000000009b265405fdf04f69
Content-Type: text/plain; charset="UTF-8"

Hi!
When building rtl8189fs driver in buildroot currently then it runs in debug
mode (original Makefile line 91: CONFIG_RTW_DEBUG = y). It's really verbose
(at least 5 rows per second) and basically it renders the serial console
useless.
I would like to turn off the debug mode in a new board config (still
preparing a patch for this). But then I wonder how other users are living
with it. Maybe it should be patched on package level and not on board level?

Best regards,
Indrek

--0000000000009b265405fdf04f69
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi!<div>When building rtl8189fs driver in buildroot curren=
tly then it runs in debug mode (original Makefile line 91:=C2=A0CONFIG_RTW_=
DEBUG =3D y). It&#39;s really verbose (at least 5 rows per second) and basi=
cally=C2=A0it renders the serial console useless.</div><div>I would like to=
 turn off the debug mode in a new board config (still preparing a patch for=
 this). But then I wonder how other users are living with it. Maybe it shou=
ld be patched on package level and not on board level?</div><div><br></div>=
<div>Best regards,</div><div>Indrek</div><div><br></div></div>

--0000000000009b265405fdf04f69--

--===============2097960261735996664==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2097960261735996664==--
