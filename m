Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6916C3DA4A
	for <buildroot@archiver.kernel.org>; Sat,  3 Aug 2024 16:38:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5FB2F40102;
	Sat,  3 Aug 2024 16:38:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZaFq_-D8Cr3v; Sat,  3 Aug 2024 16:38:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4696340112
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4696340112;
	Sat,  3 Aug 2024 16:38:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1AB691BF3CE
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 16:38:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 14B4E4038F
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 16:38:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EF877CQQegoG for <buildroot@lists.busybox.net>;
 Sat,  3 Aug 2024 16:38:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::230; helo=mail-lj1-x230.google.com;
 envelope-from=festevam@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D0FE94035D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D0FE94035D
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D0FE94035D
 for <buildroot@buildroot.org>; Sat,  3 Aug 2024 16:38:46 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2ef302f5dbbso9012011fa.2
 for <buildroot@buildroot.org>; Sat, 03 Aug 2024 09:38:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722703124; x=1723307924;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EONOpefjBpJwsuu7SUBGaykcfoaeZgPfdHLjZ2c/6is=;
 b=rnWdu10XowcDwZFcXbKYpPEkin4CN90uQP+AsR9PDqzsb7l/R6NYagvzdXJQ2oLI4a
 Ha1B6yEPRXchWJ9Ceqij7bp3K1If7tSRdgvkpMBkhkmvapq7eiy0yxvbydM/6XSHWOoH
 sooEqk/idt1m/+UnEOJQP5AMqGNdbEedVvcvUJ6pP2hB2Qa2EvqyDkR6MEKDfLRl/ZgR
 FCA1OXTQWeP7/2khK8yh7cnI5kPKTQwW07QCCcYfj6KQUujYl2WiN6+ont1pbADtap/P
 EGJbphPGSxAuUFkQD+Oor0kTRIiEiRHgIy48iK3DTdsPe5nZXURmdXY2vj2ki6kKLgtU
 FOcw==
X-Gm-Message-State: AOJu0YwGvvUpXh2w6wSeG5kEjZG1yRNv0a7PdZgVJpD90wQRobHwFPsp
 +0/81xk/ttJxIFmHmhsNFrRFQA19VAg8yz116fZTFyY+K/HqSGXtwrRIkRqyJzP+ukfFTyuYpPf
 u8Ni8HUtgDoJ5OE4UlVzXwiZNf3w=
X-Google-Smtp-Source: AGHT+IG2wOzAvEURB2sGpBNC/QZlWK9opPvVCe80y2SroMa5gGIKF2PhxIhlFuRsXx0UDm9lDYfe+W6ou3uDppWQQvc=
X-Received: by 2002:a05:6512:3ca4:b0:52e:ccf4:c222 with SMTP id
 2adb3069b0e04-530bb3b7bdemr2617479e87.9.1722703123837; Sat, 03 Aug 2024
 09:38:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240803111855.1726141-1-ju.o@free.fr>
In-Reply-To: <20240803111855.1726141-1-ju.o@free.fr>
From: Fabio Estevam <festevam@gmail.com>
Date: Sat, 3 Aug 2024 13:38:32 -0300
Message-ID: <CAOMZO5DBp21mF9+X1iYq-PJf7RJvJ=wFGKLsr2vT3vzNPCfZ7w@mail.gmail.com>
To: Julien Olivain <ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722703124; x=1723307924; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EONOpefjBpJwsuu7SUBGaykcfoaeZgPfdHLjZ2c/6is=;
 b=d+UqSS8I+8fXouN1clZpYCFvcCT+LkqoQ2jduHNyFNAfCuJdKBrmeZS5N4G0r8Wot6
 uXQCuaCWCqP61BnJXdqiLZGmxr/6NTO7Xz3HeJbdmARfFNLY0foXsT5M0Lx27IEj7A48
 t4n2E6kiCWqFn6ms6iDWTxlKBRTHgPye/q/GEanzykS9I1qHOTwQJhjGNTKEhahZB46B
 rwLKF046yDneLdThQCLUXx/KU/OIw3Y5DP5Iu05flCu39Wu+pMEUX51WBIG0uaZ+dCF/
 9vXyhYDtXh7/rKPgjlRK6X9k9isvUSB1Fy2uTfRPBKVSe4+gXABSVQeU8tloLQbwMDxR
 rjbA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=d+UqSS8I
Subject: Re: [Buildroot] [PATCH 1/1] configs/freescale_imx6ullevk: bump BSP
 components to lf-6.6.23-2.0.0
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Fabrice Goucem <fabrice.goucem@oss.nxp.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgSnVsaWVuLAoKVGhhbmtzIGZvciB5b3VyIHBhdGNoZXMgdGhhdCB1cGRhdGUgdGhlIGNvbXBv
bmVudHMgZm9yIHRoZSBOWFAgYm9hcmRzLgoKT24gU2F0LCBBdWcgMywgMjAyNCBhdCA4OjE54oCv
QU0gSnVsaWVuIE9saXZhaW4gPGp1Lm9AZnJlZS5mcj4gd3JvdGU6Cj4KPiBCdW1wIEFURiwgVS1C
b290IGFuZCBMaW51eCBrZXJuZWwgdG8gdGhlIE5YUCBCU1AgbGYtNi42LjIzLTIuMC4wCj4gdmVy
c2lvbnMuCgpOaXQ6IHRoZSBpbXg2dWwgU29DIGRvZXMgbm90IHVzZSBBVEYuCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
