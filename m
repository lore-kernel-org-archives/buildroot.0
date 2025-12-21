Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51276E67496
	for <buildroot@archiver.kernel.org>; Sun, 21 Dec 2025 00:58:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3BC140928;
	Sun, 21 Dec 2025 00:58:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wxVCAo3t2hql; Sun, 21 Dec 2025 00:58:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E76B740920
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766278710;
	bh=tvLmoxwGNyU6kM6EHAnt1D22DFmKcyDK3NsnpwxgmR4=;
	h=References:In-Reply-To:From:Date:To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cR/+8fVcdbvgmK0nnEcJFQT1hM002vIfc+qxJWBkYDeh+nL5BVbndFLcjPE9IRAsK
	 71SzgJwOsiQXo14EJNR6aDN17caW3Omq8zfRaTUZxVSoeJHlEPTk8w2+qZKC1qzQKs
	 3FVV8myXvNrfa5ay1YQC2RbzCsPeYTLZF+RgR5yTxKv1Kew91kin+ibi7aMXEg7vHZ
	 0sx9cUUsNhVtIiW33Q8Hdj0fL1dB0w1ZNGqe52rxBNUT60SkZUIuNAFZn1n9l61AxM
	 su8Y0hPMrl2tKmL1PvOJnzz25j79R2Db4nBTo+Yzgi5TSYUxQiMa4ZI0OlwJkzODLF
	 afAsmklGmnjeA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E76B740920;
	Sun, 21 Dec 2025 00:58:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2F8041A6
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 00:58:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1609A40920
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 00:58:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pxa3dblRm3Rb for <buildroot@buildroot.org>;
 Sun, 21 Dec 2025 00:58:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com;
 envelope-from=obbardc@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DE886408F9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE886408F9
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DE886408F9
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 00:58:26 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-640e9f5951aso5976883a12.1
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 16:58:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766278704; x=1766883504;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PZHqRnFNWOEyB93ddqrL/GduaLbPO3sp9mGrBChJ04Y=;
 b=LKAA2mG1RokMjYSSM5Dg+JoK5+XAqGwknEEANUI8QUu2RNcS3qx2dQqXhopGDxctDe
 bki6Iy1fma2ChV/TiO98KZJipOxgMAvelSdBVUzXPvUZdHBDltkGSsu3hnvCgy/tbhhF
 +zH+XhjP1qrt+S8y2l1E6DkO59TQyaUnbnno8WaNiKRYZLM+zckmg1zdBnpRa/gMLcIL
 KD5k8NGxuExlN+Rpwz1sBSo8Nis7KRpv+5Js538bMcObzFtlBD3iKygDEKKQxrUFFs2a
 XCLV6F6L62kIhxCj15syqI3KZGMQO6OVXf5qowqhb+6BJTIbCjsKx2J+yVIpyO4/Etgd
 WPLw==
X-Gm-Message-State: AOJu0YxmRBlv2ZS0NWxdQIcNflRj5aWnQ2jg07loc5oREumWPgwxdJDX
 iL+Ya+DfwXtVAd+/xatS3RecNNrE+cJwHU9GgRNF1VwjepaavAVhhzQisIKGC2iu+bLes7nl/r2
 Z8g/BKPQCdkUE4VT//i2iMJXC03FFIOp2TqyUPa8=
X-Gm-Gg: AY/fxX5DlApJN705XFxm2GeNW4WnIVgsGjGFhFDRieWb0/EPYbm2nOO0EMv96f2SZGt
 OX9cuADguveqGpamEVZyiYAWgWPZJ9SBTB3Tb8RIGFqTb+7CZL4Dh0g4UFV3R265H2dveoF8fut
 BFNjKh1HswmLVbM+sw79uM6VDKiqaI4SxF/3FFANYokE06Ib+PJIaEEc2JTw6jGC0oj0dPehfM7
 AHY3sFh2BvCEGCqJZJP172dybkQPNuQUBSygDl6vRZUB6fqhE3RtnzubDCrblIwhnSiHZA=
X-Google-Smtp-Source: AGHT+IEYiVf5JO2+1PDK2a6SnkwIIYsBpAJktzL+ut2M1YK86l3xWbVZbV9AUUdRWY0bV//0BI2GqMkZuZ+7IAEGPz0=
X-Received: by 2002:a17:907:948a:b0:b79:ea1b:f13d with SMTP id
 a640c23a62f3a-b80355b7986mr886176966b.2.1766278704422; Sat, 20 Dec 2025
 16:58:24 -0800 (PST)
MIME-Version: 1.0
References: <20251219-wip-obbardc-add-package-dtui-v2-1-744f76604c5e@gmail.com>
In-Reply-To: <20251219-wip-obbardc-add-package-dtui-v2-1-744f76604c5e@gmail.com>
From: Christopher Obbard <obbardc@gmail.com>
Date: Sun, 21 Dec 2025 00:58:12 +0000
X-Gm-Features: AQt7F2qSd1LN4uFdmTOoNg00Ac8xs5orAY1daOUxi2WSRvTHakmlx5HI4w4KG1w
Message-ID: <CAP03XeoxdTP4sGCtrZZaKX7o4q+9Qu+WkJQNwKBbTRq=MkiG1A@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766278704; x=1766883504; darn=buildroot.org;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PZHqRnFNWOEyB93ddqrL/GduaLbPO3sp9mGrBChJ04Y=;
 b=nMFUMxL5cRH0vJTzjiLgtGEcqgHjx8G1gryBxq6kdJRXcJvFZ1Eh8yUTPV3dRd8Y9G
 zbU86ptbYdli+hcEF9WxwYt3+qlp5mgEFFsc8oUTiRsGJMWG1GcQ3B6mqt3MYutHkA8p
 Tk84xkqaFmWRd7MccmRc3JKM0pdAEbrlButLuhWZdqLExIqih+mBv3yVuK9ndRbqRed4
 WlWQ0p4D8TU6qYCOfVuAnreGfnmj8Vr+/FwEOMaaksD3xTy2N5iHbl2ohzxPPncVCTc9
 g2Q8vgU8LntjR3BcWzweYOzdd2EZL5jGkjC5GTr2XWKgMEDXscP/Ojze1IXsP3HWASwk
 FI2A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=nMFUMxL5
Subject: Re: [Buildroot] [PATCH v2] dtui: new package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

On Fri, 19 Dec 2025 at 18:23, Christopher Obbard <obbardc@gmail.com> wrote:
>
> DTUI is a small TUI for introspecting the state of the system/session
> D-Bus. It shows current services and lets you introspect objects and
> their interfaces.
>
> This package is built with Rust/Cargo.
>
> Upstream: https://github.com/Troels51/dtui
> License: MIT
> Signed-off-by: Christopher Obbard <obbardc@gmail.com>

For next draft patch series v3 I have changed this patch's title to
"package/dtui: new package" to match other patch submissions I've
seen.
I won't send the series for another week or so, just in case may be
any other feedback to address.


Cheers!

Christopher Obbard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
