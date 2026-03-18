Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3753710775E6
	for <buildroot@archiver.kernel.org>; Wed, 18 Mar 2026 16:51:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E99678144F;
	Wed, 18 Mar 2026 16:51:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WiAEo1wvpT8q; Wed, 18 Mar 2026 16:51:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A8BC81429
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773852663;
	bh=E87rgPVqUxZfbEpmSCUYbilMSiERPVaq5iDMfcCkao4=;
	h=References:In-Reply-To:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Dl87aaHVUW+l1Im0Sc6ycVKMBw/lvckFC+pFAxXw53YKPBFCeC74a7ep/z5eQFDAO
	 c7W+B6quiE+3V1cJuTGbn+h9jiAMz20kmQrQCGA/p3nupjauSZiCd+i18OYMOGhfTD
	 Z/SGpQu37yO4KqKl5POUw34jhkRwulfRWNTUwhRX2VoifXhV/ZytGf/ipbeHTd5uhj
	 EuodpvPkTDgcnaYtnS6ig1/mU4SBNqBTL08uVhPt3uTaN4cDujEmGQrq9AZjtM5os6
	 FIe6vBEnfDkDJuuArtR7unWijjZeSTu3QYCSkHg0XHPsL66OJ82xAWIhUe5eHaWLOE
	 pOskV1v/sLG0w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A8BC81429;
	Wed, 18 Mar 2026 16:51:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 96F781B6
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 16:51:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7C75A81312
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 16:51:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ayz1SWZDNKDQ for <buildroot@buildroot.org>;
 Wed, 18 Mar 2026 16:51:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22b; helo=mail-lj1-x22b.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3E72981160
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E72981160
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3E72981160
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 16:51:00 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-38a76ba6a78so930431fa.0
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 09:50:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773852657; x=1774457457;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6heHvuJ/Dgp30t2m8vyNdzrjJBKobZsJdumWL/52kOI=;
 b=QgXsNgtDbK7lCmlR9P1fBmecett7qskuBGOR0NwjVmKKEsqvCTg8rDOqQbp6bUMPLB
 mkYgKemPupeCE9gNxYnyLItq8GKh1Mqg/JHUyuC+uzogJUtdl3BM/R5HCG467eOS+JGA
 MObN98noaWy33ohHqS/MpzHtCsb5llqoGKZDAhL7dsCFux4pB3JL6/bKc3u+kaMCNVo0
 auNAm47cSis48rk/Kxy/TR0YL2+miPVHUYCyM5M5weLKhmDx7/f6v1K27iZnekTAStoV
 bvkY6rw/jBgc+CMSSLjrpJnRGMIy2wpS+OQTG7wK6I9FDlDAfTlR/f2tVanxyycZdNOG
 90Dg==
X-Gm-Message-State: AOJu0YwGCZiapPk/pC6HKekqNO426PSqDlJkeg6myX6FHhiLsmp9Rl31
 nn+JlQuAi4Yt1SX6y6e+cZIWDpz27GAwZJ0V53BBOmdFZUIvQsFtMxwC6ap5uEjxlTl46UnqZPm
 K+VV8769B3g==
X-Gm-Gg: ATEYQzxmwwso7r7YkKWA5T8bYroY9I54aUG9+vEQx6WVb9mMkyWsZr6uAiWFJrO8f6L
 1tT3nOSIRR2nSG5bAESjVLVswuMLR0hViyWiejVcTSbfwMc6I3ba9SlWoryrHA8atNC+7uEryXq
 ZgoS4hCR6H6uP3OP5aTYLA2CczOneZ+KY7rgwR4ddmYLORM1pd2H7dZMGU3JL7mHazvO1EuPmHD
 NhrzWpHVdH7N4efjwMk0vH5wS1U00sRSIOBv3MqUlNWGokyHheXlxYalL8HXlK7c+os5HxK2OZ7
 sKtMEUV6WbCmGrUyzrL6RGW7QgAZKDM7BE6gl9hqHmYJJ8jjOA+C7Qc1A1AP9DEPn7tJ4F9bRVt
 YRteube8V+1OYopbC3XFGuGaA9QCncq49gpSlulK3ViLkzqNEL39DiECPBXh89VTFQWWHCKLywk
 BqzEWYLkkjgKgOXjNk6y9sjQNKB1D+r2VsWmb3yejuXzJVmdEhS6pZlQlisuTcG3SiywMni+sW
X-Received: by 2002:a05:651c:b14:b0:389:ef35:fb9e with SMTP id
 38308e7fff4ca-38bd58508b1mr16663561fa.24.1773852657099; 
 Wed, 18 Mar 2026 09:50:57 -0700 (PDT)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com.
 [209.85.167.42]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-38bd517df25sm7545521fa.15.2026.03.18.09.50.56
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Mar 2026 09:50:56 -0700 (PDT)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-5a0fc5e2c59so63252e87.1
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 09:50:56 -0700 (PDT)
X-Received: by 2002:ac2:44d2:0:b0:5a1:43f3:764a with SMTP id
 2adb3069b0e04-5a279597e3bmr1123455e87.5.1773852655973; Wed, 18 Mar 2026
 09:50:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260314230517.4160-1-christian@aperture.us>
 <CA+h8R2pwVXFuwypxSipO0MVQK0Bpoo_PunWUu49kZSqZGfh-Lw@mail.gmail.com>
 <87eclhh9b1.fsf@dell.be.48ers.dk>
In-Reply-To: <87eclhh9b1.fsf@dell.be.48ers.dk>
Date: Wed, 18 Mar 2026 09:50:44 -0700
X-Gmail-Original-Message-ID: <CA+h8R2oEkHPMvn311mZ_pzqgDeaaoCa1VzcTijkrmPJp66YKOw@mail.gmail.com>
X-Gm-Features: AaiRm52QP1f07xSnHq5m-f0DLCwM2ElUwflICg65tE-P01Tiw2Tb-pQJKQwosz4
Message-ID: <CA+h8R2oEkHPMvn311mZ_pzqgDeaaoCa1VzcTijkrmPJp66YKOw@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Buildroot Mailing List <buildroot@buildroot.org>,
 Julien Olivain <ju.o@free.fr>, 
 Giulio Benetti <giulio.benetti@benettiengineering.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1773852657; x=1774457457; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=6heHvuJ/Dgp30t2m8vyNdzrjJBKobZsJdumWL/52kOI=;
 b=V4iIDI/EeRLU8ZkNAQ55y74+UbDCnfr0SV3eGfqiwy6CzcVJ//DBNIfE3HO1IIWyTg
 Tt9pq2z0tDM6E/j50Y1Ha/x8OQfPRhUSY6ShpWhB3/K34dGpCqzd0HBFHelA6hL32H1R
 gV39d9NdMgbvDr5RAozeS31j0Jn83akDjh7mGlxS8ChyFmNMBVV9800fkvyt7aUyNwvH
 UIRAHDI7yPzm4eQQiD6F5gSpr5gVMi/mbWAJFC8iKC6abFj1qpbz6RgKgO8Ju6RtAVQs
 D73goUpVmurflS2a8eONXeHMYJihBsSQRrkm9TaJbVxoGZATPtOtZ6caIXGuvzdiqIC4
 Oemw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=V4iIDI/E
Subject: Re: [Buildroot] [PATCH v1 1/1] package/rtl8812au-aircrack-ng: fix
 build with Linux 6.19
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
Content-Type: multipart/mixed; boundary="===============8267397669467610472=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8267397669467610472==
Content-Type: multipart/alternative; boundary="000000000000717c54064d4f411b"

--000000000000717c54064d4f411b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Peter,

On Wed, Mar 18, 2026, 12:43=E2=80=AFAM Peter Korsgaard <peter@korsgaard.com=
> wrote:

> >>>>> "Christian" =3D=3D Christian Stewart <christian@aperture.us> writes=
:
>
>  > Hi all,
>  > There's now a deprecation message in the aircrack-ng repo:
>
>  >
> https://github.com/aircrack-ng/rtl8812au?tab=3Dreadme-ov-file#these-drive=
rs-is-deprecated
>
>  > Maybe we should drop the package and instead support this one?
>
>  > https://github.com/lwfinger/rtw88
>
> lwfinger, that must be Larry Finger who passed away in 2024:
>
>
> https://lore.kernel.org/linux-wireless/ds6wc3svkyre4p2rwg4f76o67xndazaeoy=
jwblhuzichscyxoz@5ttdvbymxr55/T/#mfd2f4928e0e013c10375ca766035c1385e18f8e0



Yes, may he rest in peace, and he is fondly remembered and appreciated.

However: the repository is actively being maintained, the last commit was
two weeks ago. So I think it's still being ordained as the community
replacement for all of these rtl88* drivers.



>
> Given that it is a backport from the Linux kernel tree, do we really
> need it? The rtl8812au support seems to have been added by commit
> 4f8ec8927bc292b2a (v6.13-rc1).
>

It's still used on some older kernels I believe, and perhaps the support
there is more actively maintained than the in tree drivers which have to go
through a more extensive code review before changes are merged. I don't
have a requirement either way. It's probably ok to leave the package as is
for now unless someone needs the other.

Thanks,
Christian Stewart


> --
> Bye, Peter Korsgaard
>

--000000000000717c54064d4f411b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Peter,<br><br><div class=3D"gmail_quote gmail_quote_=
container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 18, 2026, 12:4=
3=E2=80=AFAM Peter Korsgaard &lt;<a href=3D"mailto:peter@korsgaard.com">pet=
er@korsgaard.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">&gt=
;&gt;&gt;&gt;&gt; &quot;Christian&quot; =3D=3D Christian Stewart &lt;<a hre=
f=3D"mailto:christian@aperture.us" target=3D"_blank" rel=3D"noreferrer">chr=
istian@aperture.us</a>&gt; writes:<br>
<br>
=C2=A0&gt; Hi all,<br>
=C2=A0&gt; There&#39;s now a deprecation message in the aircrack-ng repo:<b=
r>
<br>
=C2=A0&gt; <a href=3D"https://github.com/aircrack-ng/rtl8812au?tab=3Dreadme=
-ov-file#these-drivers-is-deprecated" rel=3D"noreferrer noreferrer" target=
=3D"_blank">https://github.com/aircrack-ng/rtl8812au?tab=3Dreadme-ov-file#t=
hese-drivers-is-deprecated</a><br>
<br>
=C2=A0&gt; Maybe we should drop the package and instead support this one?<b=
r>
<br>
=C2=A0&gt; <a href=3D"https://github.com/lwfinger/rtw88" rel=3D"noreferrer =
noreferrer" target=3D"_blank">https://github.com/lwfinger/rtw88</a><br>
<br>
lwfinger, that must be Larry Finger who passed away in 2024:<br>
<br>
<a href=3D"https://lore.kernel.org/linux-wireless/ds6wc3svkyre4p2rwg4f76o67=
xndazaeoyjwblhuzichscyxoz@5ttdvbymxr55/T/#mfd2f4928e0e013c10375ca766035c138=
5e18f8e0" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lore.kern=
el.org/linux-wireless/ds6wc3svkyre4p2rwg4f76o67xndazaeoyjwblhuzichscyxoz@5t=
tdvbymxr55/T/#mfd2f4928e0e013c10375ca766035c1385e18f8e0</a></blockquote></d=
iv></div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Yes, may he rest in peace, and he is fondly remembered and apprec=
iated.</div><div dir=3D"auto"><br></div><div dir=3D"auto">However: the repo=
sitory is actively being maintained, the last commit was two weeks ago. So =
I think it&#39;s still being ordained as the community replacement for all =
of these rtl88* drivers.</div><div dir=3D"auto"><br></div><div dir=3D"auto"=
><br></div><div dir=3D"auto"><div class=3D"gmail_quote gmail_quote_containe=
r"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex"><br>
<br>
Given that it is a backport from the Linux kernel tree, do we really<br>
need it? The rtl8812au support seems to have been added by commit<br>
4f8ec8927bc292b2a (v6.13-rc1).<br></blockquote></div></div><div dir=3D"auto=
"><br></div><div dir=3D"auto">It&#39;s still used on some older kernels I b=
elieve, and perhaps the support there is more actively maintained than the =
in tree drivers which have to go through a more extensive code review befor=
e changes are merged. I don&#39;t have a requirement either way. It&#39;s p=
robably ok to leave the package as is for now unless someone needs the othe=
r.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Thanks,</div><div dir=
=3D"auto">Christian Stewart</div><div dir=3D"auto"><br></div><div dir=3D"au=
to"><div class=3D"gmail_quote gmail_quote_container"><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex">
<br>
-- <br>
Bye, Peter Korsgaard<br>
</blockquote></div></div></div>

--000000000000717c54064d4f411b--

--===============8267397669467610472==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8267397669467610472==--
