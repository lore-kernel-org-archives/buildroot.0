Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4963FCA1007
	for <buildroot@archiver.kernel.org>; Tue,  2 Sep 2025 23:04:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A6286157E;
	Tue,  2 Sep 2025 23:04:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a5-5wRUQhPop; Tue,  2 Sep 2025 23:04:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A26D6157F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A26D6157F;
	Tue,  2 Sep 2025 23:04:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A0978439
 for <buildroot@buildroot.org>; Tue,  2 Sep 2025 23:04:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 860D140706
 for <buildroot@buildroot.org>; Tue,  2 Sep 2025 23:04:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QgskByce5c1U for <buildroot@buildroot.org>;
 Tue,  2 Sep 2025 23:04:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b31; helo=mail-yb1-xb31.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EBF9340703
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EBF9340703
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EBF9340703
 for <buildroot@buildroot.org>; Tue,  2 Sep 2025 23:04:24 +0000 (UTC)
Received: by mail-yb1-xb31.google.com with SMTP id
 3f1490d57ef6-e96e5535fcdso430775276.1
 for <buildroot@buildroot.org>; Tue, 02 Sep 2025 16:04:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756854264; x=1757459064;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+Nlogx7TEmjqzldeb5bZpBuc7FI8rKWc4kiBmuDK6dc=;
 b=v5PGmgA/7ls1luBNKFl41NMFkJiF/QViOKOAa4HeKxuKNgLmHLxUJebb1miZRXA8yL
 cn6HBmCLi4fJkii5brgoHDpnDjesMQGsRNFELZfIFFgMPVJpMXebFHVfwvx+JRsZwYCV
 TwejufmOg6fGH9RLYlAbZ5OAIfo1EdATw7jzoUG0+hbp1QaLzINT4prpmO4vXgwgFZvv
 oB4UUWAY0PUtCI14GON/603wJshhNuywOiJ2DazikeyuKDLJYyM+pGZtQOXiwadZb9pt
 rh5flP5WSukUQpo75+DMNRR0Nx0xZ+nFKh/xL+YYH4T1cq9jyQfrOiPugrSN2qgcVRHe
 9Nzg==
X-Gm-Message-State: AOJu0YyaMu4mHblzPt1FRO4CzlopIwFMWQvygPrOmhDpkJ0ObI79YENt
 4abSqkZ5Y4zSToYsHgQ1n4xKPAbXRFJXe144XBQOzSPS7/U0Pgz8HzFJuEW3iX/onvILq6AwyS4
 2Mu9UhMBJjHfgFXrPfHwh/5RHiyi6hoA=
X-Gm-Gg: ASbGncuutOz8xXfZwjZNl6oVe/dTpvknHnY3RdAm7WPwciRm3znam1h6tSl4t1ryfg4
 NxVq6KlclQUHZlHN1IsRmivwDyErutO1hMdGvpbE6DTuYxK8bUaqfke87Z1iVhEso4vo458E9aU
 MJZ1V2nNyYVhLqJTOzSeKfthkvUlrMalkO7wfbL+FmkL+TCgHeJyV4OvvGmvF7Ymq0xaIwwXzBL
 Ryo4LbOYXuySANolQ==
X-Google-Smtp-Source: AGHT+IHI44aqF3/YlWzKFXcEGc2RbuYXyCd7lrqd3r6VtFvhA1p1/f98rF5h9o8AhQF9jR8hjhLfIKy9qMlviJAseX8=
X-Received: by 2002:a05:690c:620b:b0:722:6a27:4352 with SMTP id
 00721157ae682-722764acbc3mr147526797b3.14.1756854263742; Tue, 02 Sep 2025
 16:04:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250831123953.391803-1-clg@kaod.org>
 <20250831123953.391803-3-clg@kaod.org>
In-Reply-To: <20250831123953.391803-3-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 3 Sep 2025 08:34:12 +0930
X-Gm-Features: Ac12FXwH5rMS3kIkbw1JEfkvt7bnTTbCT7D-4FntIfX9r5itUWKmu8z9R1y3psw
Message-ID: <CACPK8XdasDQajSgOX=Oc7rYEJZ_XF6sZ-xy_y+BAC5A40wWNpQ@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jms.id.au; s=google; t=1756854264; x=1757459064; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+Nlogx7TEmjqzldeb5bZpBuc7FI8rKWc4kiBmuDK6dc=;
 b=LBxlthhVXCudZ7UgjHuG6tIdChVSZP29NFYJFrCytDKyId8LwVIgwrsJ4NVGHu7ysH
 zGE5equHRTcQqg75z0Pv7jsKlPpSM7omJzYq9CJppDcZro3jnegair8dA6Gu3QUTk7Hc
 tV/XJXqVHMo7dtx5JLQIlcMMWHuKCaNATGBAU=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=jms.id.au
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=jms.id.au header.i=@jms.id.au
 header.a=rsa-sha256 header.s=google header.b=LBxlthhV
Subject: Re: [Buildroot] [PATCH 2/4] configs/aspeed_ast2500evb: increase
 kernel partition size
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU3VuLCAzMSBBdWcgMjAyNSBhdCAyMjoxMiwgQ8OpZHJpYyBMZSBHb2F0ZXIgPGNsZ0BrYW9k
Lm9yZz4gd3JvdGU6Cj4KPiBMaW51eCBpbWFnZXMgYXJlIGdyb3dpbmcgbGFyZ2VyLCBhbmQgdGhl
IGN1cnJlbnQga2VybmVsIHBhcnRpdGlvbiBzaXplCj4gb2YgNDM1MksgaXMgbm8gbG9uZ2VyIHN1
ZmZpY2llbnQuIEluY3JlYXNlIHRoZSBwYXJ0aXRpb24gc2l6ZSB0bwo+IGFjY29tbW9kYXRlIHRo
ZSBsYXJnZXIgaW1hZ2VzLgo+Cj4gU2lnbmVkLW9mZi1ieTogQ8OpZHJpYyBMZSBHb2F0ZXIgPGNs
Z0BrYW9kLm9yZz4KClJldmlld2VkLWJ5OiBKb2VsIFN0YW5sZXkgPGpvZWxAam1zLmlkLmF1Pgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
