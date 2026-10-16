Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F373CCA46C
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 15:04:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C165816A3;
	Fri, 16 Oct 2026 15:04:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dYSOij4EmdPD; Fri, 16 Oct 2026 15:04:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2250B8169F
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792163089;
	b=hSauCy+lPWRKsiQ4tWGx4zfc34gj0T13FCAEqFliTT3tsTEHOJO/bqKKuw+l6e/xQKPy
	 T+mPFc1jGeCSXC4vTch41DwYl2HqLGwfrl4slXv7uMh0DpBsICvT03Wxc67EvxHkHo7E4
	 1fGbdafYaKOwwbGBUtxUW1hAWOR+PQQVWE/5KINTXm+gScBrcioMVNrOJL6mpMEGmPHe1
	 Eb0r1e2coBG0sRliVVoEEk5fsAKSZrI3+ZCHqirivQeslf++8+znLj6FZv9v0o/bLT5ue
	 cAXTGXUEuotc6vN6VvlvsKaPXdGEdofav6W0fmi1vDN7X2Mrv/SrkQqRxWmcd1P1gsQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792163089;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=SDzNIdP3wOL2CybsgxITEDBv4rTddqvBOTdQy7lhVXo=;
	b=tKFWBxnR7EW7veselPEgq3gEVCt5ywvWzKLlBtK/8hNh9osbjtCtJnlh5pBu34aQf8a6
	 zG+2HOuUqIg3cQ4UDSGo4bbvGIvjs3jrm5UDXO2uV+Ut94gyDceKZEINVIK7BBX8PQZyO
	 FaAD5nzQhRlnp7nB8MkSsGpoQrcmIh9V0V2oEH5QHjDwHCnhNmJt1pNDHGNH+XDLKIw0K
	 jxqB0OOZSmBDCmPwH7SHZOZ52ZHGO5N0WiAC5r0C5XyhlWFnkqi6/nHEimTXbu+CIAuam
	 UTLsEXIEVeRFaTBTLBbWz65sOwDG9CevcS4tl+wonBU+roYG/GQIn3we+OvMpNlJcoQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792163089;
	bh=SDzNIdP3wOL2CybsgxITEDBv4rTddqvBOTdQy7lhVXo=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=c3ILoChL8W6oCBZJ2Iacs5kyALb87L3KjAYqBdsWsmeuphUTCRG9zSiqG2pRjh+my
	 eDRGGSxNuyV/dslKX20nUccJXxDrcMABn0TMNh/xcXlFc9VMhtlBj8j+Cz//txMcz2
	 VUYw2CFVGWSL2lIPSl29Z8zzJ2ae0jBleGSC03mHjhuDO2HPQowz30v1u5oO9SvP6c
	 5v0Kvp/rcNDoVs4LHiQOnsXCuJKDscNaoNNQpFDVB38rK5zgU7pALpnpfxAvGSWgcZ
	 yaie0Dc8wOwN9O+6TPxL///nPYOzwoI23OXEgcezOxVJ00r/rby+tA7Bk/eJjeyXa7
	 UXprhRBxPFXAw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2250B8169F;
	Fri, 16 Oct 2026 15:04:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 49412255
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:04:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2F6884016D
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:04:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S5pvAyMc2fE2 for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 15:04:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 246A440042
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792163078;
 b=WDxHCe08x7AM1D9zjHEDcXOTLGuyO/c5ysLeOluvi1N87Vutyrp0Y5HuDy2r3euA//Lx
 p3mJRmHJIf2k8MeQszW4i9pHePB+Do47E9SCjRnAdVhO6CA3OYEZ55sKZ92VEbbcroVME
 WMvsxdSushfAZmRROdW8nXgt/nvNroO6M6jJPT/+DM5YdXDHSHbhcweOodMkSX0W3gpq8
 Ij5mRorJPbswvuHoXd5GBT76kDUvHBwvMS1pQFYbuUcCu5BoryaC7XjfXnAEHTouEzb81
 C+B/JzvPKp5iL3n/qWbCWMWENnoRtQnW3S8WjquKNGbC7gT4IVxQCPxl4+/ShRK+IXA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792163078;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=mjKMY5cRcJjuX/0t+ZJrtqa96mtEbasay24nfSWQxJ0=;
 b=MgsGZ/zeoH9tjnHpmEC1VRanSV9KrgXi4DY0f/3XXi7Lka+Y2pxxu3yGaoPhnabCK/oW
 er5uMNB2yWKdhU8qezl1pK+uef4ngG9LkOvO/nKScb4xANhkQjM+hml2Grjqi5di8TruH
 daQDS+tr4gpqv9oHvZdzpS+FBjD3SsvK7Up7HzN0/K+edv1ZGavxJN0+xJBFm1wbRniBL
 UcBzxEhhH3EajZZqo6o9XYZX5VNOYHFYmBBwuoz1ZJD61iN8ITf7NPnaoH4XssU10kzXf
 4UnZdnVr7y/Bv1xfDVO+/G8de1ZLsuWMfbfo3UVBVUAisrOSlzNRlfrvIAUvlK9/XUw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=A63gd1QE; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::42b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 246A440042
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:04:37 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-48df54150dfso1208001f8f.0
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 08:04:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792163076; x=1792767876;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=mjKMY5cRcJjuX/0t+ZJrtqa96mtEbasay24nfSWQxJ0=;
 b=slNWirXa/9KArNp+kiFritX1/qYSAfDOBwV7N7pzLiW8utJnyErS8C6UdNlY/BK9FB
 2TS+1n535XPhkKos0GwzVZyvoPfkW26GzN8D2+/Si60irUqhTg7waON57/O/8n/mf5Og
 2ZTE/wo26uY1q5NUiQcVViQMNgWwhcZWpvMIgh9pzhsUbNW1nK00X4h91q8DVpG8rmhk
 +YLoXbtFmYIqNh+NjLZ3KktHKFpfb0fMOp3de2v3oC7CFJlHkJR+TLzNt0Rykqqz2SUS
 +c8yVdttFsDX13VmXxhEwGSzobhK1icQujr5XhTlIifQbiWPoqhfrLR7HNA1BdYeSZm2
 H/6g==
X-Gm-Message-State: AFq9FYK/FxiGaIoqSiCorNduMf1J9UAj9qZ9I26pphxwA5BCdgAN6q83
 dBF5hoaRyMX2hLBdMadLgCR+VBaXz+1kvd1TU9742ez3CbUbGQogG0N72+C+KRcN4XdIdDwzryQ
 k/uV0Vkk=
X-Gm-Gg: AYBFou2TAd14Nh33KSKFvwrZSROgJo4kZFOERJLlJm6mvHIXhzh8twJ9CasoaaKZ/LC
 TucxZyzllwMhe1UBL+2HEIG5dQgGGd60xQSJI4h7SU9CdyoJZwUtrC5yH6notpjxU9Ypyn/4Qvn
 eDXVs3JyZv4tlz+YUzkmIfK0opkcXu+LM0OzeyRI5Kd/rafAsvYfB/1RqKOjZbH1Y+iNAg2Z21D
 oo1/zEENHFT6SHdZlrZbblxQwQo2Lg9gmljaSmskaOARhEojispsO/KlS8FAYikTu8olIhr3vw9
 wLWzN327GC3mTnL27XKxSEi948byw8hMvwpplV43yanP7a/sAyVXcEWs8YyI3TiHlp3y0eqoTeV
 sUPK8vfmAOKRj3SAk7rC8HUfDLEQSZKIB5gBjR8rJ1e32sq4JquyzOTWz1/gdZi8u74MEIu2vo8
 II4TwL6IKhiVOaMJHY+t6lJX3R+0xmrkkrb5vcDG0P0eXplwiG05Ek71Rgdy8fCM6JD7FoaI3VU
 7yT9g96lXwob3nBv8EKknJemcBCd2MldFFeNS+SRWX6kKY8bnZe
X-Received: by 2002:a05:600c:4e14:b0:4a1:d307:b526 with SMTP id
 5b1f17b1804b1-4a1d7464034mr3154995e9.0.1792163076037; 
 Fri, 16 Oct 2026 08:04:36 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1c8ad6245sm71473615e9.3.2026.10.16.08.04.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2026 08:04:35 -0700 (PDT)
To: buildroot@buildroot.org,
	Bernd Kuhls <bernd@kuhls.net>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 16 Oct 2026 17:04:33 +0200
Message-ID: <20261016150434.68741-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261004080211.2996307-1-bernd@kuhls.net>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/hwdata: bump version to 0.412
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> https://github.com/vcrhonek/hwdata/releases/tag/v0.412
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/hwdata/hwdata.hash | 2 +-
>  package/hwdata/hwdata.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/hwdata/hwdata.hash b/package/hwdata/hwdata.hash
> index 0046b56c75..a698a26265 100644
> --- a/package/hwdata/hwdata.hash
> +++ b/package/hwdata/hwdata.hash
> @@ -1,4 +1,4 @@
>  # Locally calculated
> -sha256  d75462181fbd307228e0a48b8d1449f1773ea4b1f17e8a1d56346907f999ce33  hwdata-0.411.tar.gz
> +sha256  f0c64cd7e31d70a5fb3a52e53ab50a61e74c0421a6381eaa45114eec3bde5fe7  hwdata-0.412.tar.gz
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
>  sha256  21d0406f93e884a050426ebc21931839a45d56bfcbcbfdda7686d583f36f107f  LICENSE
> diff --git a/package/hwdata/hwdata.mk b/package/hwdata/hwdata.mk
> index 20ecd799b8..5858b821af 100644
> --- a/package/hwdata/hwdata.mk
> +++ b/package/hwdata/hwdata.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -HWDATA_VERSION = 0.411
> +HWDATA_VERSION = 0.412
>  HWDATA_SITE = $(call github,vcrhonek,hwdata,v$(HWDATA_VERSION))
>  HWDATA_LICENSE = GPL-2.0+, BSD-3-Clause, XFree86 1.0
>  HWDATA_LICENSE_FILES = COPYING LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
