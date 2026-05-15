Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA944CD4F47
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 17:46:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F9018465D;
	Fri, 15 May 2026 17:46:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kWb-q_H0PS1O; Fri, 15 May 2026 17:46:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 08F4584650
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778867208;
	bh=6xxvFNjE2hqq11v0UySTKYCdyvPgwkHIo2LlUh289LU=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=gA80EVfeRuKWWIoCtuaDXp+Yfp6ZCz7Uzjf3Evr8+ftjLOLk5+lQBHcLKne0+3+dD
	 c+AcFiS7ztOIM7aSO0CbnMsQrYF59SbFidFly3W2I2S5YeBsB7OBg7ZaJV9or9THNs
	 7BFnJvJGUgNFjoyM8cGHNZ74jQxOPBYQ/61ozb+7SK3Ui3Qu6Rap8opon2tuUJADyY
	 IPBFv+kljKoD46VqxequZH+P1R+MwJQ5kUA2nD0PSxwswXu92GdSsfbRAva/VKc5Ww
	 Y8RLNzLgFEDH+AehoEYsC/F0PC2v4jzdWtQhGTqzXAKcnLsWk1IlUw+PXocTAb4JFh
	 gEMOFt8NXYfCg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 08F4584650;
	Fri, 15 May 2026 17:46:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B98CA45B
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ABB5B61544
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4CDCYQGhAv-4 for <buildroot@buildroot.org>;
 Fri, 15 May 2026 17:46:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9B02461697
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B02461697
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9B02461697
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:39 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-488ff90d6c7so615615e9.2
 for <buildroot@buildroot.org>; Fri, 15 May 2026 10:46:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778867197; x=1779471997;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=bg1WZDbYhKmXmZAjEOTM8FPkp7YuXDbphqwttU05PgE=;
 b=XrLNJsDkDCHobQVf5Ymnsa3iRnfL74ii3cSjRTWTgm0qKjR99zX0Wk884NSKHPtegQ
 GeJ9MelVuGsDQjgqGTKcaEbAWxK8lQMyB5g+2FtJ5Hp0Pio5eR3LU3X3MycVLHVbrU5S
 sbR050Pv+jRzkViCqJptollehPOKHsIa8tspUu9vW//Oaro+HYZYoJytmK5Yg9qV8j7Y
 Tg6O1cC8fjZcKM5awXR5nJFiVEED20uyEx0TJe7TD1G8ywfOFVOZl7oJMgZ52LNvuzJ6
 wKlls5fXfOmYuMFBxq7yqHA1m6h2rLjSR5iEeU6x/vgUAwCU1W3MxQiU+WbTXgPhseZ/
 spmg==
X-Forwarded-Encrypted: i=1;
 AFNElJ81JcGl13PefCZzMGTxUSngumgxqgiLCLP7IniBYcp10S10wGoMi01brD5pUL5rG8BrL+nELx7tN1Y=@buildroot.org
X-Gm-Message-State: AOJu0YwZJFlYItw3GSrvwyuc/d7PXytpjnHjutpZ0fk5tWoBSEXvwsv6
 Ycc9dcbjgzJIIzomZWYOG33AgmekI184taedFJDEYxKbEzZFtzdIvelQi0X+ccnUVyc=
X-Gm-Gg: Acq92OE8mzjUvqyBfDq0gmtOO/k0GC/DbHXVGpxl+iS0oEnUmba5A6vYzMn6QbiHVHI
 fGcucT034tsTRALPvqemN2Vz6pi26FSVdFEXpybZX1hKbWNKcg3FKiIwA7xtKltwNy2cWj9cUeL
 CNoDnzmB4RnMwaF2gLAnxRPEiM++qlrnzFRXrmzGxaEMi5Di6ods/dY8MmIffMLyMLUVScPkz4k
 x67k9Vqw8hdyp8BB89XW9LRSAJOgdE/ll2PLGPKLY8/SEmCQGVNk85K9aVEzgZARdGdBzy1yOr0
 50Ohp3y9jUeJtoGz/w3Tnd5hvlbp+1V7AsC7mfj0o4aBGeMdb7DJaQ5pRWjoAMqSjHYJ9nqkS/8
 J17Krscmz+sW7tul5qhIAXgUE9/cLoOPUvB3+dTDL3hiH+l2jTVLU1T/gnB5A2moGh6WnvVE5br
 mEq8WVNUXprD4dK1jCcKvY97RiK43+F4iz3ZWjsGMKy1YOU7usuxKgpRM=
X-Received: by 2002:a05:600c:a293:b0:48f:e6de:1cba with SMTP id
 5b1f17b1804b1-48fe6de1dc5mr43550285e9.17.1778867197544; 
 Fri, 15 May 2026 10:46:37 -0700 (PDT)
Received: from arch (94.105.117.13.dyn.edpnet.net. [94.105.117.13])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45da15a5653sm16788724f8f.35.2026.05.15.10.46.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 10:46:37 -0700 (PDT)
To: Fiona Klute <fiona.klute@gmx.de>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 15 May 2026 19:46:36 +0200
Message-ID: <20260515174636.530206-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260501002320.1761716-1-fiona.klute@gmx.de>
References: <20260501002320.1761716-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1778867197; x=1779471997; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bg1WZDbYhKmXmZAjEOTM8FPkp7YuXDbphqwttU05PgE=;
 b=DIJWeTrSyHYWH+PRI+s91VhX5GKboN+lPKY/sGI91Bd6R3JTcbbnGMLQZgfyd0ef1h
 zbOikzYNpfsZONSrRkmRFCmQb/du9mAZ4KRnO0OfsCzDVEuFxa1tvCPlmcXhaSXPP1//
 tvYsncziGaWwrJRtUagBEcBtTeVQItVJjMkIDKbeiqO14ejHLOx1eiATdC+Jd1OaCmh6
 FzZgR4IKZuMnA1/1VWGasHAcfoc+za4e3uK43VFLhywcEw2TkzYrq9zIVQliwESw1mzM
 X+PSZgRV9M96Xam8nOkzGIEmQKZzVT2f6ewmteOclNx2eAno+2Dakg27bKCstugHtT2m
 B9ZQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=DIJWeTrS
Subject: Re: [Buildroot] [PATCH 1/3] package/openssh/S50sshd: immediately
 return if sending stop fails
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
> If sending the stop signal fails but the PID file exists the following
> shutdown wait turns into an endless loop. Avoid that and return the
> error immediately.
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/openssh/S50sshd | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/openssh/S50sshd b/package/openssh/S50sshd
> index a5ff385acc..7d862db14c 100644
> --- a/package/openssh/S50sshd
> +++ b/package/openssh/S50sshd
> @@ -36,6 +36,7 @@ stop() {
>  		echo "OK"
>  	else
>  		echo "FAIL"
> +		return "$status"
>  	fi
>  	# sshd deletes its PID file on exit, wait for it to be gone
>  	while [ -f "$PIDFILE" ]; do
> -- 
> 2.53.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
