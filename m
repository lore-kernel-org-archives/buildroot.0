Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9885AC61DD6
	for <buildroot@archiver.kernel.org>; Tue,  1 Sep 2026 07:12:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54D19406A5;
	Tue,  1 Sep 2026 07:12:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rYXM1SH7j65I; Tue,  1 Sep 2026 07:12:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788246746;
	bh=DSsIcz+jLEy5vDEckxXgFGrduhV7jJbZ/mKYlMrjYIo=;
	h=References:In-Reply-To:From:Date:To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=q3A1yR4ZpBKfQ/aRONjt90dH2AxBE+XHYxeytXw/2H4ohYzF1H7JGU/Vs5mLnIOGh
	 k8EffkRBlSbjlTQxOCxV2ZSceV0bsxXupMvn6ST5zOHz5r3JUzm4nXSM6MpCIUcW/I
	 xwwik5FJtwQsY8FzyAin7WpVnELQLzIWLfPo4lDY/MAK7nMC1X0fTTHAYMZEJNJz7D
	 5c3qlclO/mpOoRnxcz3T4ZkIVYtOQow1azZkpC45x6QGb8B/42AiAjFvO7pE307zD5
	 gfISDYZS3W+34HDOwnhZ7i8L1moXfVusGUe9W55jXyDg8PJXr+kZvGS+h93mcbX0Vg
	 F7QGEBgH0X8+w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86888404E9;
	Tue,  1 Sep 2026 07:12:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4079B4AD
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 07:12:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 22E55404E9
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 07:12:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bxtsii56jkb6 for <buildroot@buildroot.org>;
 Tue,  1 Sep 2026 07:12:24 +0000 (UTC)
Received-SPF: Permerror (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::536; helo=mail-ed1-x536.google.com;
 envelope-from=rhidian.dewit@openpixelsystems.org; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org; dmarc=none (p=none dis=none)
 header.from=openpixelsystems.org
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=openpixelsystems.org header.i=@openpixelsystems.org
 header.a=rsa-sha256 header.s=google header.b=AVe0I2qv
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 471D7404E7
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 07:12:23 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-6a600a1caf8so803085a12.2
 for <buildroot@buildroot.org>; Tue, 01 Sep 2026 00:12:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788246742; cv=none;
 d=google.com; s=arc-20260327;
 b=TdXjUOtyERjG2cxDp+neqZjy8K2oJaAOlhEjr7D+20okcPmscVx1C6mSeZYdZXjOLG
 ZKjNLjJClGA6cymuKA7TOKZmOtDIG8bHE1x4Bl3K+xCm0YHFh/6MZxu/ijYsoOQsEsUi
 afzQgSxaFTpTkFPd/tXlbIqHmYE2O8KZDl7kUKLcusBZyf7XR4J6eNuKNjEfKxeEOSZg
 0hH/NE+V2XDan6bsUpyXlb11jImCxO/I/POpne5E3/9HuVUGBLU71eqklRF5jypBhstR
 Yfdzjq+kLlR+Edv6gDVQOljDp1iQ8581izEiTJAB/O2ddmbTT/C4zGgWtQZUJI5asKDL
 LL7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :dkim-signature;
 bh=PjeWl9hkO6j1/Z4D3T2IniZVQC2oF7Ag9QcApzxbUhQ=;
 fh=3pWBXGdSiVldOzJ6ypfJcTUIWlbrikH1EIZUHFIjzuo=;
 b=VTjOPi7s4JsJL7km9JrnvR3V0F1i8gGU+e0Zh1TAIFU7iBqo+mz82BIRoQalPKNhPu
 UJ7pqmNpDHlscW/j7NtNI056llov8l26pCICcp1BtyeeI0/PQQS29BMiTpnivdbbyb/T
 tBLDMQD3aKnB14cWTV7tBcFtkwjRW50vsc6Roxh2snSBT2ORGxFoOUavAyKid9simeIe
 2P5lu1rMkbGDz1efwYD19tHpVjTpW/AVAfseP3Gnxt8l0qNphB04EFrAt+dCutXgJ/yt
 qtk0uGcaU5MiOxJvyxdFsWbLXQasIIewMuw4DdZF+CW3X3UCVQi9FaFnDnn9mOM7t9ww
 T4Fg==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openpixelsystems.org; s=google; t=1788246742; x=1788851542;
 darn=buildroot.org; 
 h=content-type:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=PjeWl9hkO6j1/Z4D3T2IniZVQC2oF7Ag9QcApzxbUhQ=;
 b=AVe0I2qvLoE4Bq9WrBkVwALt+qyMSEXJU5KUgV8XPXWQfymYatDi9DbpCAD772SFb2
 JyuceaY+vMN5NRW2DVFdOSfTm5NbHiaKHEbSb8xy1uJ1yv9++KWGDXqwiTT9R9lxNq5j
 IfCLuWLc8BAp7KVH6KucnbjgaDMaBWWrV24NVQ8sSm217RSj0sNh1MPHNhGxE1Oe1VhG
 g9xCa/k1F/kvolSCtg42zGNOhqDRlhd3RyUvYZuLLJfNwQzbaV1MLH8rQcD3NOZFz+la
 QS7pAYqARjnkMyUrdkBCQ+eZhDhCFGCpNBgB7CaibUfGgSSJHKaPmeV1BWBNKZORL6oM
 9ncg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788246742; x=1788851542;
 h=content-type:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=PjeWl9hkO6j1/Z4D3T2IniZVQC2oF7Ag9QcApzxbUhQ=;
 b=c334WhEC0DSX/MspLr5cuvl0nZgArvVCuKxg4rYzPnDgbsjFC7vBS02/KbZ/baNgZ5
 W8N9d9GRIx8uclrq+VAzjRUGrhARpXuyajhBpkR5nUAk0fiJ/4x3OZRfjj0v98iQ7CNb
 3qsTDklRillStOx4np+UmopGp8mEJXH9l81ZYW/6Y6oi8fyvokWY97IpxSgnekrVQRqH
 k9LHEwwt2TWamKY7ukt4Nbe287giB2v5gBfsvkkp93Wat+ycIZs2GU5XZgKne86ftxQF
 hTDFpuYsalrnSMJhzPhrsM4qx9/lD7jDmMdnNcUbEj7snDs0R70EFvpsCD9HfUkvtz6/
 /elw==
X-Gm-Message-State: AFuF++mjyf41jXDb2T+C9JSXJhgzr3umgBqy3BcTIeLFg3tqvtoJLA8Y
 jNRCZIAp07A4t5t1T3FOY4hrSPlqad40rCbWccflI2OODx3Thh50Bngq1HJgpA2sV1X9piMF6zU
 0SpxfP6eKa1Jljr/QYchJBM9i8iGrrfIPNAXjaO+m3ubtyhuxro8h
X-Gm-Gg: AYBFou1BxexL/Zlc5xAmEzJI4bED8QHYc2p96D6S2pGVma8LXIOrW4sXoknGQsmHRkL
 OIGI0MyAeHXHlpQMsaR/JGzyFQxhWzZNYGzpptkYcJbm3qAN0VKE63EKVfI8Zxdv08sbtzo14+I
 PgG7Z9hZjLCmXY5114/X+t+Odg2gTqLU3EJxmAtAggIurSfzLUC8Dy7gKSC/W5+K3rMIAc6POFj
 MaO+ydyvB1FEyB8+TlWSXtSTz147fRGtL5o1sQOtbPLxjCouYyuCs4PFKKcBF7czJAAXPe1pZjD
 g7bcLUBSvrou1fSOk2c9DhymC1mkF0IbyorQQmmbvnYIsfk67H0kPdvZIwtDh+20x0RcQwqPTKF
 U8ks=
X-Received: by 2002:a05:6402:a0ce:b0:6a6:2022:fee with SMTP id
 4fb4d7f45d1cf-6a6202211fcmr14122618a12.7.1788246742082; Tue, 01 Sep 2026
 00:12:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260901071121.834356-1-rhidian.dewit@openpixelsystems.org>
In-Reply-To: <20260901071121.834356-1-rhidian.dewit@openpixelsystems.org>
From: Rhidian De Wit <rhidian.dewit@openpixelsystems.org>
Date: Tue, 1 Sep 2026 09:12:10 +0200
X-Gm-Features: AcwNN1X8gdSFUnuhDFIG4M_-QF1iyZP1Vt5ycMmUpwzIR4-pXEK2mA0of_Ya38c
Message-ID: <CAKWiKxErbBNpQDe715qsva1k2=L5EkYs2vgkr__iPxtPawuMLA@mail.gmail.com>
To: buildroot@buildroot.org
Subject: Re: [Buildroot] [PATCH] Avoid segfault on x86-64 with invalid EFI
 boot entries
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

Apologies for the confusion on my end, these are the correct patches.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
