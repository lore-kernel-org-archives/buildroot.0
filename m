Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7B9EE9A057
	for <buildroot@archiver.kernel.org>; Thu, 19 Feb 2026 17:26:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9902E611FA;
	Thu, 19 Feb 2026 17:26:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u4iR8VT2bWtX; Thu, 19 Feb 2026 17:26:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 19816611F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771521996;
	bh=rxHENOd5+fBHfxpYBnOjexZotP8hoZW/hJvur7pAsYw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=e2gNgk6XupPr8cW4BJ1fzXEZ7JLvGXVgB31vwUo5Saa9wMUnOZYAKXJWZ5W2J2ssE
	 Z8HEYyq8i3KcyYZRSlgMzE+QIJW/xV9GXFE0w6+8L3t9fZSad4vTpGMjCcjNc6l+sm
	 fTR4aeMlghebBNL26fv/6Gy8vB23QE++cTGS9vezyyxoGu91MsNAxXOB8/AvuoLP1m
	 KmJI3VL44R1j8URaO9iN2D3ACuhvL3Bxm1mCJ8yY8PKnH6sTacTIoQyI5noU9SUuf3
	 +h7DO6LCTR+hru8Al5SeI5O/cgvXTElvCA3ilIM2a/ki0je1/j6HI+8EfRr+DqTe7j
	 ZjIf/LZr+FBCA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 19816611F1;
	Thu, 19 Feb 2026 17:26:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BE9BD1CE
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:26:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A4B7D403E5
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:26:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UHVyFee8Hirw for <buildroot@buildroot.org>;
 Thu, 19 Feb 2026 17:26:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9B1CB4045B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9B1CB4045B
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9B1CB4045B
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:26:31 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-483487335c2so11898225e9.2
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 09:26:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771521990; x=1772126790;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Czg0eug8m6GmD0+5H2mt6drCv+sA/zHZetVlbcjTBOg=;
 b=P21ys+T5M3RfmF8icNUHIpoJUgsMC/nSvWS3qSp6aoAyPFdkkOSD/8c2duqfkhtE5F
 V/bW7Q34GcqTa3hMgYEp3eyUgey1OfXY5gbtncCJPOcrSPlRHmKawGUSrh0KtanATB/Y
 uH2kicMLKUkqpuN1eiidg68370aWlweqZyuOwthsL8qMRfHYWODlhEQELZdYG2AXFJiO
 q4qxDc7g7HCdEOlUyZ8eICFgZxmu5lZoTSslD1c8phIBSgxau3k0e3nXNX1RrZlOZKh0
 rvN6PmzTtYGZ5WvSQblbMzNPiywNi4Rzzvx8V/UFLFkI/KfMvpqgI7lFClaFBg+kOOX3
 18XQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/6AaB4BNYtrObus4jAgOcTnHw1J2Z7f1NtF8aD5xZBMisQjDkEncDENW6D+tgmqTJR8zCzcHR+9E=@buildroot.org
X-Gm-Message-State: AOJu0Yy8y9svpfLfjZWgqVSTJnZr3p0elNL+3RBl973bVdvPXiSNpBN0
 hXI7tdtyaBe6Sj4QjiKTBwaXMNS0fr7DG8/+H8QR7r+dCJPRSAngnjXZxUar3V4MMsg=
X-Gm-Gg: AZuq6aJMXB0AoCbXZQ6ifmL1grwHxH2sk4Shc5CUOCRSq7hFtazelqxZef3yBgXqLZo
 wSv816XdKFZR4G+4eVW7VG2xTF4RvvsW2pSoiL/x9d1b3p9wB3XG1VI7klAzEuzzLwPokk+zAbz
 BNdCVk7KMRrGi/c5yU1FAZ807FK0YG/vJnTI7aSzIFT/hDmFDdqtkuWj2BvWjuva1wPou1gBDZI
 bU02tujgYEhbYsij4oBJBDqG9xntr4DZyCtFP80UvLA+ZsfiPYUgSxeq6mY2auhFQ0D2GryyBtr
 X+B241Nwxpvd77xwv7Vr7eA6Y1T2I+ZKcalW/6WlqY+SXqjA2HrvIlZCAtlMK7TMD/OHWhaq1cQ
 2TTJ63FXDOAgc0Bo3HZhfkSmFodmPqgfqAganxuV14DQ1pYf05OVgZjeN7KnIVb2nMsHX8AOird
 t5stM6kUWeB60AFXqcT5KAxDxctw==
X-Received: by 2002:a05:600d:8443:10b0:482:df17:bbbc with SMTP id
 5b1f17b1804b1-4839e661d4bmr44554575e9.20.1771521989662; 
 Thu, 19 Feb 2026 09:26:29 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a31ff4d7sm15802835e9.15.2026.02.19.09.26.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Feb 2026 09:26:29 -0800 (PST)
To: yann.morin@orange.com
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 19 Feb 2026 18:26:28 +0100
Message-ID: <20260219172628.340741-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <3c42d6a8803c28ce34156eee659e25875b916075.1770703119.git.yann.morin@orange.com>
References: <3c42d6a8803c28ce34156eee659e25875b916075.1770703119.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771521990; x=1772126790; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Czg0eug8m6GmD0+5H2mt6drCv+sA/zHZetVlbcjTBOg=;
 b=Spg0noab8+9DgJGFvvwIuPglNDFvnfKv5obFLiL17t2fgRUYzdPuVXx26rEsV8STEP
 rR03+zZ4/frx2LlpRvysGHDruj63fb40h6Md3CfIt5uxOcTb2jfzARvUT9aT0FgtNXJq
 YnLs0HoMTC1MO9qJlI6F5k9tmnomUQcQ4kLtxipOZQJ+LLPxSo+tgygPTwhnnBC3fMKW
 bnCLVh/LUY49nQWsd3va2zSGuCP1GzcpllLAy4gKNUIZS/GWc0cmkzJNsgNRrNuUxP4k
 s0f90bix73nPoo1Wu+vzcefDoSoxXbhVIdgspDPuuLYr/N1rTnh0LPYRw4twZnKdg5l/
 SUjQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Spg0noab
Subject: Re: [Buildroot] [PATCH] DEVELOPPERS: adopt mosquitto
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

In reply of:
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> Cc: Scott Fan <fancp2007@gmail.com>
> 

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
> mosquitto 2.1.x has been released recently, but has changed quite a bit,
> which needs quite a bit of tinkering in the .mk file. This commit also
> serves as a sign that I am working on the version bump.
> ---
>  DEVELOPERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 225d1ac917..296b79f9e4 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -3481,6 +3481,7 @@ F:	package/tpm2-pkcs11/
>  N:	Yann E. MORIN <yann.morin@orange.com>
>  F:	.editorconfig
>  F:	package/gpsd/
> +F:	package/mosquitto/
>  F:	package/skopeo/
>  
>  N:	Yegor Yefremov <yegorslists@googlemail.com>
> -- 
> 2.34.1
> 
> ____________________________________________________________________________________________________________
> Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
> pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
> a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
> Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.
> 
> This message and its attachments may contain confidential or privileged information that may be protected by law;
> they should not be distributed, used or copied without authorisation.
> If you have received this email in error, please notify the sender and delete this message and its attachments.
> As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
> Thank you.
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
