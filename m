Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7244CD5BCF
	for <buildroot@archiver.kernel.org>; Tue, 26 May 2026 07:23:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 09A3B40F02;
	Tue, 26 May 2026 07:23:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZkUYrQIEqfky; Tue, 26 May 2026 07:22:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AED7B40EE4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779780177;
	bh=3rb8gZUNysDwziOl9RVc0Gcs6B/KnP60F5sNrhP7j1U=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=l4evCCUGV7A99O1lv9+/+hIxiqVzQJHrNn7S31ZB1SvtjJUJrDaIeSmy/BUAZ4bMF
	 kxhOnsP4fxCyTm/POe95zIMdUm2Y0xgYJpNVDTOFFIRAU0arsqj6jvikgA0zJjolhi
	 EaQPvRmEDKsDu2WDEl4JL9CvEkqpKt6x+g3fsjrLlA7a9tYwCh8F65TEWx3Mct1Wos
	 Y1t0ErXdO9Og0FcY1R82tbxE3mfemQJsM2HA5kW9kpGrj3tD+8cTIE+Tj/tMxGEKgd
	 0ueteZf53BbCLV3ynfORop2QLyNi2u8p5mnlAmU32OAB1zGu/cuWlPgouLrH+HxbBq
	 o2mWq+UXmrBkA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AED7B40EE4;
	Tue, 26 May 2026 07:22:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C9FF5265
 for <buildroot@buildroot.org>; Tue, 26 May 2026 07:22:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B26524032F
 for <buildroot@buildroot.org>; Tue, 26 May 2026 07:22:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YBleYkRRlQm0 for <buildroot@buildroot.org>;
 Tue, 26 May 2026 07:22:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 961DD4031C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 961DD4031C
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 961DD4031C
 for <buildroot@buildroot.org>; Tue, 26 May 2026 07:22:52 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4904c1ce4c1so37788305e9.3
 for <buildroot@buildroot.org>; Tue, 26 May 2026 00:22:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779780171; x=1780384971;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=KRm2NSA74a1ySKhXq6u2Wh81jtAtcXXLADxVf3YwCvk=;
 b=fuoZwXQxQtI2qNiOc57Ygx8HZnhw4fVCMrgrffGt16GE9hTIFpG6HoejulRSdMJFAd
 QjULyh3sHC44utDd+Ivi2S6PvC424mo9lp844xNrl+ZrCvsHQ/Pj0teAFq6IaGJD2Ar+
 rd5kZwe8X6hYRMIjHGoZN7pIzOqvxw8hW8VF+gwbdOfwacRbyZ1nM7ZH6Yz6Yedd7G3P
 WR1/40ylbJOfnkAF7ie4/GlUJyRxJ9Lm5frKRcB0cec59SFraGZcxQ7qdfwE/7mseTaK
 gOt/M8kxWTFZO5D68oiI80rWrA9jIXTZ3e4CJUxV9XK2P7Thrjpdz+m4J/PsNE3Qr27d
 5XBg==
X-Forwarded-Encrypted: i=1;
 AFNElJ+RW9dK//Fevo9kz6MVcFD617GH7aA1jJv9gYC7mMM+bxLkv/0UEmVVrVWJM9rD5XK0nIGjnoWk18A=@buildroot.org
X-Gm-Message-State: AOJu0YzZTBhWTqaxlntl1jXmwrwaOCLWDV22ePNuYUsooDdEFb9gqhd3
 1oos86gn+RLgxB9pSPMiDn9SoqDGNn5E8VVWrO/i0dLdv0eG4Ru5gjwPhFhAbXeDKK4=
X-Gm-Gg: Acq92OHnVGpB3X3uEcMI1jLG+kyKNRBJjaM4qDc4TMeaI9ExBNs9Wykpnk1vS+a7cAc
 EezobTxSoV9USEJyFbvid45VwZyF5vEh9fw//J/sVgbUqJ3/29d1iMpGKvxfppeL23sKTNJbwp9
 sAErfzXO6ahKTvUdmgq1n1NXdliwDBzoZLwlxNyd8pyQvPRZjw3K24QeAr/n58lwnk3aGVJvBiL
 f2iaE8kmB/iyiY8uw4NKPBSZsEWqbriQxCMXZ5cvnUdBJ3rSLBoheSouo8ThlqbwJjRkx5ka3XI
 +Oi4Argv3vFeBlwaLHNOJY/VGqu67pkm7OO5zGNXeSE3t4S7RTqayLRwRN9tH/4aHM+4n1nyRth
 OR1ZLcHvhLq5z7DLW4CUk5uJAbrFM0sC2bIMQxdwVp+UsxgLWEfStNTzgGq7UhdgF8ALLte3dfJ
 sc//QSl/W8oP649ilwOvh5IiJOQl0A+GTMqsE1PT4NfqP1zkaBFuugXj+5Rw==
X-Received: by 2002:a05:600d:8444:20b0:48f:e230:2a21 with SMTP id
 5b1f17b1804b1-490428ee28emr210380315e9.32.1779780170625; 
 Tue, 26 May 2026 00:22:50 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490417a3be1sm141806475e9.3.2026.05.26.00.22.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2026 00:22:50 -0700 (PDT)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
 Thomas Perale via buildroot <buildroot@buildroot.org>
Date: Tue, 26 May 2026 09:22:49 +0200
Message-ID: <20260526072249.15442-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <87qzn3aarf.fsf@dell.be.48ers.dk>
References: <87qzn3aarf.fsf@dell.be.48ers.dk>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1779780171; x=1780384971; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KRm2NSA74a1ySKhXq6u2Wh81jtAtcXXLADxVf3YwCvk=;
 b=OMXsI61zoY1+4Nh9GDt1zD0c8YYhAhRySE1qxAkc6vM+RGOlDpFmBsFplBBPafLTdP
 Xmji4vq1ez2gPYHUHXgeHrXnLUXrKXNBNsHffudGSspg7JqG8KCqOHEb4P5hHE769Vw8
 pmp/TzMuYvLN1Tqsdb4m1qdTETM/pfu43tLfGkrKg0fmqNhusxPEZLkrqsfWtaKlqAc3
 lJ5vi1G4TsMI+ildX54Zc1DcdV6oz6x0Un4pJAdQcuofQ1yylf5wF6/4Pv8FPQuuCqad
 ngmIqc7f2bYEqGI1mTSgyaS5fsMaJ0iCs6FxaLk/pSdhFO9pkPc5FY6iRQW+iRN4TyLC
 0bdA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=OMXsI61z
Subject: Re: [Buildroot] [git commit branch/2025.02.x] package/dropbear:
 patch CVE-2019-6111 CVE-2026-35385
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter,

In reply of:
> >>>>> "Thomas" == Thomas Perale via buildroot <buildroot@buildroot.org> writes:
> 
> Hi,
> 
>  > commit: https://gitlab.com/buildroot.org/buildroot/-/commit/30d1791eb26a8ef46a952d1ef66e163de1eade07
>  > branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x
> 
>  > While CVE-2019-6111 was already fixed in 2025.89, the version 2026.90
>  > provided a follow up of that fix.
> 
> What was the reason for cherry pick those commits over moving to
> 2026.91?
> 
> I see this triggers the same reallocarray() build issues that 2026.90
> did:
> 
> https://autobuild.buildroot.org/results/275/275c521bbbe6466649209069318e45a9e4de666e/build-end.log
> 
> Which were then fixed in 2026.91.

The reason was to avoid regression induced by bumping and keep the change
minimal, but as we can see even minimal change can trigger regression ...

I will bump since it doesn't include any notable breaking changes except the
one that is introduced by the fix for the CVE.

Thanks for the notice.
PERALE Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
