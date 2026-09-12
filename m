Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32396C79FB6
	for <buildroot@archiver.kernel.org>; Sat, 12 Sep 2026 08:50:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9C4440792;
	Sat, 12 Sep 2026 08:50:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6QXuZ9yDXu9H; Sat, 12 Sep 2026 08:50:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org A14A040793
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789203042;
	b=I14A0Vc/ZKrq6sfDUpapNFhP7MavddAusZR5Mbg5D455sD1XIxeCXpX/0MKtqVYvw+RG
	 Q2XpgC+HwGqCl+R5K9fW6mc+kgi3fWTU7EYw+9aybGowNk2hGAM1Rm7cV9Fsh3oWvu05q
	 huoKpfpA6ahkIYtiUuL7ShSh7+JryDoZEJGLEwRVP2k/UaeunLx8+vSR61dWwq8Ia8NAX
	 RbShnc3S17DD96vjCfe8Ub4xpOVbX2SaOP3+P37+mWYoo0d6OHaOND9eT5DpA3g1uGdi4
	 VMsCeZ3wCA86jIIAMwTyW4+oW5lI8Dtfzm+1G/d2yMl6x/1XiXYrSLum2AbN/BpuOdQ==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789203042;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:To:Cc:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Errors-To:Sender;
	bh=HxOfzdOGSrGUAX/gtp9RiEvfEAZ/BcV94YUa4i2DMo0=;
	b=VcPujVa+0uGg9nQZl6wsJZWBBYMIu5+hDNFi9M6JTfb4tUdTpRKGrBVMMMjNp1VfeGUw
	 3BXGZuGHEyLdh5H8UNTmFXY4xAwznCwv8Zb8sQ7UuIrHWJvTYorxwPTYkOKzFb2rnHH8w
	 yFodz9LncT03bCWyW2OAwsej1wvPA7wcJsR3kCSl0ldiiztBKBA+9e/P81EOdKfqhhHZ+
	 xNQ+ROeAR16fIJ1zF1GbFW3OMIiygk+xx7BLgnSy5CtOdyhNucOHG6niofqbWPrO9sefi
	 /vATm90D/xVWcN11QhgX+53l1eta9+MQe57dSQ3qXW+OKa0jNcXCyhNSOLo6r+VPDxg==
ARC-Authentication-Results: i=3; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789203042;
	bh=HxOfzdOGSrGUAX/gtp9RiEvfEAZ/BcV94YUa4i2DMo0=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=agCApUS79xd8M4aDvBkniOoXQB5GGXA7QUTQSQ3Dsj8BmUzhKuQCnaJxFLkKngtn1
	 TAX5faoSs4rQnctcbw9J1Ar5cb+Ai3yynQDsm0IQimmTkAUa57gbooCfg53KgwptDK
	 o+qugQ1rDtFuipfiFhxm+/bDB0x5vH30VBnQDX0Jb1yW9mp36HJUZnfzgVIl/48S/L
	 RrSl0GOEO/4Z5mfmATl7Yd3Snptv5vxQeIVqbek4NFwdYMy3zLocQyZ0LDoqydXKDt
	 4c6qmlgv0SnTXcT+eD7xWuhaaTlIMvbg+W/1IT7M7nG4R9Uv3dESFtDnEPlwX3CN/5
	 eDseKREdjGlvg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A14A040793;
	Sat, 12 Sep 2026 08:50:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A501732F
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 08:50:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 90636400E4
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 08:50:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D8qcJIhTjqRE for <buildroot@buildroot.org>;
 Sat, 12 Sep 2026 08:50:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 5471A40076
Authentication-Results: smtp2.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2a00:1450:4864:39::10"
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1789203037;
 b=DIklgATdMLnBbl+g2Df3wKH/Ukx/iSUTr1uaxFFi7xqCZxz9/UmNcGzIgxYp60bdHWoz
 OTxdahcqgyKVkxhBekHVszfiRhY74FhcKlWaUA9gENM71r401+KN0/SwV870L+mbCylls
 SS5JhSB2+22PrxHf7mRLUc3fe4o/XAnsEceYnsoXvEauLlau/5SSRsRwH6imfyCt8aL+u
 Kv93AMN5PqzHDjlxjOWzU1kni+UniI8jN8N7x6YrxyIWD9NM6eUnNMNaXXnX8CUK+cbM9
 2t1ioQiQAezOr8Ml/UC6n2BXe9pRs3Z0y+K54EiRPxxuaKQ6Lg90qRfFj2+dKuTiy1g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789203037;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
 Content-Type;
 bh=KsQar1IGYLDUhVSkhlGltsvXg4yHni5Hsca4wc1u/ls=;
 b=YdU7BvYX2YGdHzTMAVNLQO8DLZ5E7fvR/RUPNyNTcL7A/67Dy9e1EtGTKBMZGa2A9qES
 8ZaOwfgocsfuoDaIkKcNf3zto2nBx8thSPr/gPzyl5O7wd7PRCMLzjO9CC0F2Sg8Z/DcQ
 bAFDEIBhwRUL7kNNin0B/xlhv4fbAEQ4RiHoWwH20YoswWSOlkEeay5svoUcfipjRhAsE
 hHF6DRPfvy4Daqt+4trEO3DJaOUDWy3ZN017AmvFKshYducRx8xYSlTRD0UDDPEBmIqQr
 9qzD5EqaSujwaEV6JCpg0ZuTez3W8pQ4GVgsEj3Q5ruLdErlxdCC9NgmnyYqbZkV24g==
ARC-Authentication-Results: i=2; smtp2.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=Xe5WJnyo; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2a00:1450:4864:39::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:39::10; helo=mail-ua2-x10.google.com;
 envelope-from=francois.perrad.86@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=Xe5WJnyo
Received: from mail-ua2-x10.google.com (mail-ua2-x10.google.com
 [IPv6:2a00:1450:4864:39::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5471A40076
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 08:50:37 +0000 (UTC)
Received: by mail-ua2-x10.google.com with SMTP id
 a1e0cc1a2514c-97e7c72bfe9so50178241.2
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 01:50:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789203036; cv=none;
 d=google.com; s=arc-20260327;
 b=KhX9/G9SHkgcuVPx2VPuys4AH0133khCBKEzx+rg090A5d93K4yynty/QZG2dFTjGW
 OPxTU7ouekfKTgEaFuJTyMcW5KIxSZ+l3WgXEtDt0xW5+JCSFL5xW9S/R3HeIr/TLSmR
 /j7ohGipkjzR292GqlWvI5onQmNyQZdRJwcwjayg998btX5EcsDp8nqd83wzsqpsJe9C
 B6QYJLETc7TkKRF3psbOylzOiTTxNstVbGirELNEUfgzpYCFc33zksGkuW8GumCpdW15
 77d2f+a+abtqzllYtfiMbWiY3CaFAiDf7j04vxuEj17RWzGxKRoq+BG54AdXhJIRF7Qj
 wLfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=KsQar1IGYLDUhVSkhlGltsvXg4yHni5Hsca4wc1u/ls=;
 fh=oysysEuf99awDJNXnO4HjS2bdltGM4EElFMAZMizmeo=;
 b=bkrAXyeijeQJuJxrHTKPAC+EbBduwaqjkQmpbGgk945ceY3jYQcFbLRAFcJqvZL0X6
 B/ml+XE5yAgprPKOYGTohDfLqEi3eUvFba+nn/JSK0iNwpCldSToSUT7QOWdbWjh32OY
 zNdhsDWx1shZb0LBW2MyJG4qIuaJ1olkBO2ReHBlMPBPg0GS+MECPYuHccYRUt2QmbX/
 7bVrVoogpdyPKZWPX58dE0B94HXkDGgsKbSfju2Xuu7ByxVb9cMmmtLzgnFfMt2SuvIS
 MF2Z64vUywwVK0GG8MrITPr4mNt3K63QooYeiv6dHxBFfWRVjULhc29mcM2tR/2E/BEg
 H0yA==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789203036; x=1789807836; darn=buildroot.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=KsQar1IGYLDUhVSkhlGltsvXg4yHni5Hsca4wc1u/ls=;
 b=Xe5WJnyoNJjO7sxOeUFYZ9oZIm061E1F9DOfUzC7LUE3FY9s6NevYL8gUfP0xuvfh7
 eWBLBzrbmt9MGVeD7/o/GaBAhZL7Mk3Q04oJ+nH8SP2l9FbOXaRlYDtADyHu8LSamUj2
 LzbuevBS0jdmqVboTw8pR5uOl0tIGxQUhhlmrJtf8N0B5+P7Zq9ZtAszYD3jiWF7fX4N
 pUvXLsuSTE29f1GBV3AfUmclLbfVAKK+jgY5ZSQnD3xo3Oy3UdrD5+DRPvf+vDeMrFWZ
 qSODH0IfhYeb/+J/sSlupfTpIPOhHrRQuWMZb6NwDrdRdBTdevM19JQJGNQq3vKF8lWh
 SSRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789203036; x=1789807836;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=KsQar1IGYLDUhVSkhlGltsvXg4yHni5Hsca4wc1u/ls=;
 b=dPGew/WS8v6BfWqQodE36Kryx5UGDf6xPbQ3okrdmvdDt58t20H47Lwic71RDrnr28
 VxqJ4g3YZ0iLP2GhGnZnpYavcIYwYPVFHakz0HkMg8pnrIX9ZsnJuL23/WWUC2wyWpqS
 qdCBR1xqoZruEGBEVUsacGzRtlSZuxy2+/ahNpcHyR3G6uakvHHimuROFgChYXjfY5Pd
 cfb3RzEimz45LT7NgU5LOX7V7tZ4NIU/KPAc9+guwJtMUiMY2Cmr+NrxnZ1grDSVfUzu
 CCFrdRfHAQM4tRCDxmP/O0F5BT1QiPG6RXN31QldkwtiTLmA1XjH4gt3yKSto4PBEqIH
 0lww==
X-Gm-Message-State: AFuF++lU6avlB1DwhT4bBoUfnEiYL2FvcBcRlxAPZPG5XDZdZyG/ssGJ
 ynY8QLVktaPPubq8HaZSaDw2UPj9z8MyqG/zjx4XfPsP8CP1mWDEb+xF05GcRXoIFoM+cwN7KuK
 oQzTPCiAAWHe6VNtxyVM2VbZ41r1TJcpLlGUZ
X-Gm-Gg: AYBFou0v/B247T40XtLXyiRsCVZIkMqYlCE7VnUyyDhIZR+iWwqvo9bPGMo7PimFoAz
 XNAyr36zZQfcTr4vJIBcEdSysFm+NqvAdvHhnwLckcX0ysEc3wGMdM8MMW5pt/j8Of6TrDfvFdd
 m3ACexhBpgMyd/CuixGqzkWEAHByXSYLQFE3XvioEAXLpJaK9+45nkmP0GDBbEstKjpaUxl36Cq
 drqxIIf4OKUw5YuZRQ0QXEekMPBOvItYhNl9CB2f9QhRSHlRDpZ43MyyNt2ceKC2sNlgd8a8oZf
 bcxUTzfO8huAWKUMcyJuiwabJGz6y20Q8cMLkZWSTXCFFFGqHl5sq7C5Rn5m6+UKN9DwFSC9NiI
 rtPA7yiUe+FHc05eEgVgVWd9XsA==
X-Received: by 2002:a05:6102:5814:b0:782:de7b:eead with SMTP id
 ada2fe7eead31-795a64b4ed1mr1363366137.1.1789203035597; Sat, 12 Sep 2026
 01:50:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260911222701.1047300-1-bernd@kuhls.net>
In-Reply-To: <20260911222701.1047300-1-bernd@kuhls.net>
From: =?UTF-8?Q?Fran=C3=A7ois_PERRAD?= <francois.perrad.86@gmail.com>
Date: Sat, 12 Sep 2026 10:50:24 +0200
X-Gm-Features: AcwNN1WSHHd7VY9YRy9S6qpB8xvkf2pJPGo_CZlbJfsHPSzneG8_V2-RpAZf98E
Message-ID: <CAMTop892cHK0JC+v-GFDMNbqH=-FNfWZZE4QFW7nJfD6mMjFyw@mail.gmail.com>
To: buildroot@buildroot.org
Cc: Marcin Niestroj <m.niestroj@grinn-global.com>,
 Bernd Kuhls <bernd@kuhls.net>
Subject: Re: [Buildroot] [PATCH 1/1] package/luaossl: bump version to
 20260910
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
Content-Type: multipart/mixed; boundary="===============4269790563123997907=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4269790563123997907==
Content-Type: multipart/alternative; boundary="0000000000005e2fcd065b454bf0"

--0000000000005e2fcd065b454bf0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le sam. 12 sept. 2026 =C3=A0 00:27, Bernd Kuhls <bernd@kuhls.net> a =C3=A9c=
rit :

> https://github.com/wahern/luaossl/releases/tag/rel-20260910
>
> Updated license hash due to copyright year bump:
>
> https://github.com/wahern/luaossl/commit/efaf49dc352c221f518305348bdbf89d=
b873d6e3
>
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
>

Acked-by: Francois Perrad <francois.perrad.86@gmail.com>


> ---
> Gitlab pipelines passed:
>
> https://gitlab.com/bkuhls/buildroot/-/commits/5e83ac0461c070e9f5f85a51867=
c0962aa826a74
>
>  package/luaossl/luaossl.hash | 4 ++--
>  package/luaossl/luaossl.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/package/luaossl/luaossl.hash b/package/luaossl/luaossl.hash
> index 734c916f5a..36f1046f07 100644
> --- a/package/luaossl/luaossl.hash
> +++ b/package/luaossl/luaossl.hash
> @@ -1,3 +1,3 @@
>  # computed by luarocks/buildroot
> -sha256  19cfc635dd804bde649a8db1ffae01e5fc0cdfac2630fb73c617fe6d8a0bfd30
> luaossl-20250929-0.src.rock
> -sha256  421c26c8788c46fd59e4dbfe5bf8eab6c21e37ce3ca8cb44dfff5dc179098756
> luaossl-rel-20250929/LICENSE
> +sha256  22ad2d0e3d12a9376c3d06a000a1af70c45ed181ae581556759e55f637ff371d
> luaossl-20260910-0.src.rock
> +sha256  277af5901eb8ae8b0e39fec050e858abd23ebf698147e3567df7518928c5cc2d
> luaossl-rel-20260910/LICENSE
> diff --git a/package/luaossl/luaossl.mk b/package/luaossl/luaossl.mk
> index 079d1e0ca4..e1a2806c80 100644
> --- a/package/luaossl/luaossl.mk
> +++ b/package/luaossl/luaossl.mk
> @@ -4,7 +4,7 @@
>  #
>
>  ########################################################################=
########
>
> -LUAOSSL_VERSION_UPSTREAM =3D 20250929
> +LUAOSSL_VERSION_UPSTREAM =3D 20260910
>  LUAOSSL_VERSION =3D $(LUAOSSL_VERSION_UPSTREAM)-0
>  LUAOSSL_SUBDIR =3D luaossl-rel-$(LUAOSSL_VERSION_UPSTREAM)
>  LUAOSSL_LICENSE =3D MIT
> --
> 2.47.3
>
>

--0000000000005e2fcd065b454bf0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0sam. 12=
 sept. 2026 =C3=A0=C2=A000:27, Bernd Kuhls &lt;<a href=3D"mailto:bernd@kuhl=
s.net">bernd@kuhls.net</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex"><a href=3D"https://github.com/wahern/lua=
ossl/releases/tag/rel-20260910" rel=3D"noreferrer" target=3D"_blank">https:=
//github.com/wahern/luaossl/releases/tag/rel-20260910</a><br>
<br>
Updated license hash due to copyright year bump:<br>
<a href=3D"https://github.com/wahern/luaossl/commit/efaf49dc352c221f5183053=
48bdbf89db873d6e3" rel=3D"noreferrer" target=3D"_blank">https://github.com/=
wahern/luaossl/commit/efaf49dc352c221f518305348bdbf89db873d6e3</a><br>
<br>
Signed-off-by: Bernd Kuhls &lt;<a href=3D"mailto:bernd@kuhls.net" target=3D=
"_blank">bernd@kuhls.net</a>&gt;<br></blockquote><div><br></div><div><span =
class=3D"gmail-term">Acked-by:=C2=A0</span>Francois Perrad &lt;<a href=3D"m=
ailto:francois.perrad.86@gmail.com" target=3D"_blank">francois.perrad.86@gm=
ail.com</a>&gt;</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">
---<br>
Gitlab pipelines passed:<br>
<a href=3D"https://gitlab.com/bkuhls/buildroot/-/commits/5e83ac0461c070e9f5=
f85a51867c0962aa826a74" rel=3D"noreferrer" target=3D"_blank">https://gitlab=
.com/bkuhls/buildroot/-/commits/5e83ac0461c070e9f5f85a51867c0962aa826a74</a=
><br>
<br>
=C2=A0package/luaossl/luaossl.hash | 4 ++--<br>
=C2=A0package/luaossl/<a href=3D"http://luaossl.mk" rel=3D"noreferrer" targ=
et=3D"_blank">luaossl.mk</a>=C2=A0 =C2=A0| 2 +-<br>
=C2=A02 files changed, 3 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/package/luaossl/luaossl.hash b/package/luaossl/luaossl.hash<br=
>
index 734c916f5a..36f1046f07 100644<br>
--- a/package/luaossl/luaossl.hash<br>
+++ b/package/luaossl/luaossl.hash<br>
@@ -1,3 +1,3 @@<br>
=C2=A0# computed by luarocks/buildroot<br>
-sha256=C2=A0 19cfc635dd804bde649a8db1ffae01e5fc0cdfac2630fb73c617fe6d8a0bf=
d30=C2=A0 luaossl-20250929-0.src.rock<br>
-sha256=C2=A0 421c26c8788c46fd59e4dbfe5bf8eab6c21e37ce3ca8cb44dfff5dc179098=
756=C2=A0 luaossl-rel-20250929/LICENSE<br>
+sha256=C2=A0 22ad2d0e3d12a9376c3d06a000a1af70c45ed181ae581556759e55f637ff3=
71d=C2=A0 luaossl-20260910-0.src.rock<br>
+sha256=C2=A0 277af5901eb8ae8b0e39fec050e858abd23ebf698147e3567df7518928c5c=
c2d=C2=A0 luaossl-rel-20260910/LICENSE<br>
diff --git a/package/luaossl/<a href=3D"http://luaossl.mk" rel=3D"noreferre=
r" target=3D"_blank">luaossl.mk</a> b/package/luaossl/<a href=3D"http://lua=
ossl.mk" rel=3D"noreferrer" target=3D"_blank">luaossl.mk</a><br>
index 079d1e0ca4..e1a2806c80 100644<br>
--- a/package/luaossl/<a href=3D"http://luaossl.mk" rel=3D"noreferrer" targ=
et=3D"_blank">luaossl.mk</a><br>
+++ b/package/luaossl/<a href=3D"http://luaossl.mk" rel=3D"noreferrer" targ=
et=3D"_blank">luaossl.mk</a><br>
@@ -4,7 +4,7 @@<br>
=C2=A0#<br>
=C2=A0#####################################################################=
###########<br>
<br>
-LUAOSSL_VERSION_UPSTREAM =3D 20250929<br>
+LUAOSSL_VERSION_UPSTREAM =3D 20260910<br>
=C2=A0LUAOSSL_VERSION =3D $(LUAOSSL_VERSION_UPSTREAM)-0<br>
=C2=A0LUAOSSL_SUBDIR =3D luaossl-rel-$(LUAOSSL_VERSION_UPSTREAM)<br>
=C2=A0LUAOSSL_LICENSE =3D MIT<br>
-- <br>
2.47.3<br>
<br>
</blockquote></div></div>

--0000000000005e2fcd065b454bf0--

--===============4269790563123997907==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4269790563123997907==--
