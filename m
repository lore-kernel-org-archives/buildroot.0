Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35DCEE9A055
	for <buildroot@archiver.kernel.org>; Thu, 19 Feb 2026 17:26:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0CE8A83BA7;
	Thu, 19 Feb 2026 17:26:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qPOtSTZciuHA; Thu, 19 Feb 2026 17:26:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1034883B98
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771522005;
	bh=c2BInd/3bmmxPO+zkhtkh6CskhqpvoSUHObF5jwMwss=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=T19peYlUCkeqYcAKIDpYAjTuqlo2rXnhABrCNua3p6s55MdHjjHL1grD/gL435/t/
	 vBB90QV7iBd432m5JopA5V1FowF4g4ibviV+u+gGYW7Y4OZo6PmKVm07ySbme5e46p
	 6VG7UlwzL845uz4/GEJGlfxbriHIxah+TZcKUoFX3lCpJ0cMhEscEAYn6L+qfvC1Zo
	 deqtxGpp+Hv2628gQIY/dT7zaPxKWsBL/xoMXNA0X7aBhUA1zPs6Op4nCVOVpO2lOI
	 HSgE3juAdlkrz0yXfpXlMEXIN6Mgp7Jy97zBD78NrYis4psi5wImkMwjHy115rC5/w
	 AxSeuN6/WhTFw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1034883B98;
	Thu, 19 Feb 2026 17:26:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 74728206
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:26:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 65B084084B
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:26:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5i1LEU5-EB6f for <buildroot@buildroot.org>;
 Thu, 19 Feb 2026 17:26:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6F3944045B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F3944045B
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6F3944045B
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:26:38 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-483703e4b08so9628205e9.1
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 09:26:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771521996; x=1772126796;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=MEin1F6kXBJfRzXcuJnRuR7VWFtTo/zMlqU7FH1926s=;
 b=FJbOU1WRjhZzWG0S/s2GNmShF9WGelZ6NvF/QG6DcqMPr0JQQ4tht3xAHyNBDHf9nw
 AyS9siTcq7bed5cLiUcHgX3yOp+FXFE1YC2S+YUuFi+IoRnkSj1LvLfCY50/VPyTki69
 0CFJ9JI8sEJanURNNR59zIVTm2eVYFrDeFkANputy/vKR3xIVI8l27d2ef16x2K/nJNJ
 bF4qyu3+Fgem3zvi2EKO9AkI4xpHKazicZPrr6S4vLRBAm8KKvpG9hrFBWTswJECSx9P
 v5NKNWqdRJjC2bGyKUYYKuz0/u5nTkguuorCamNObiaOWXwZG1efm8vS8BNJm4cHx0+d
 kqaA==
X-Gm-Message-State: AOJu0Yxw611idqaw+EZq00yv9Vw4f5lyYUVb1J1tu822mWHC+ZoU2yHy
 nXR3hcmUIceY2Zo+56VJmTqHri//qVzSkkANxaV+wFyIkEwavZDzA2gawJAH0obrBiWotisqv+X
 yZKzc
X-Gm-Gg: AZuq6aLtuntngaDmWnwyQOfc4/TmnzdZRaX8T98NO6NaWtLRjS7qGyzE4sjEqCQ2YOa
 sHXp5QhZ0p0WRj05eM5HnDKEC07jXscIdiRWG3FBbqOqs+IIwrUq5JoZELQFWbP0tjOLZrxtwhS
 0herFkmT+Bvfg8t5dH7sxR1WYxlrni7qsxjgC6Wz4FyGfwokcFCOqXQsJvkMi34Re8hcw/hQk2k
 1AFIzZS2iLhtFymrcgV3N/vS509f2imnFT6fF5MuKvhRShScASQy9X49Ier5NKBlrkPi2ONVwwH
 DnyWekL1ZARZyd7ZjZ5qNq6XVvZFkRuwCTcFKD0+/HmSq9bfmir4IrF1esbKz4uhXdUFY1PTQvc
 XJJ0+TJPJppZLSvkPwATyYX2B4l6Ag4e+LjpYONmw+qyVpwfzUhf7kdkVjrOQ3OK1MPzenQxDlN
 bSp1UmcOUiETP5uK/f95D80VoXZQ==
X-Received: by 2002:a05:600d:6447:10b0:483:a352:b4e4 with SMTP id
 5b1f17b1804b1-483a352b4f9mr12282035e9.6.1771521996310; 
 Thu, 19 Feb 2026 09:26:36 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4839ea3cceesm23341555e9.9.2026.02.19.09.26.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Feb 2026 09:26:35 -0800 (PST)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Thu, 19 Feb 2026 18:26:34 +0100
Message-ID: <20260219172634.341015-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260212102336.154817-1-thomas.perale@mind.be>
References: <20260212102336.154817-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771521996; x=1772126796; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MEin1F6kXBJfRzXcuJnRuR7VWFtTo/zMlqU7FH1926s=;
 b=ZZjXK4pm0dQbgtyspFyQY897mzcJqoN4od3yA+LTkcTPUKHHbUw2BsoKHVL2sMI9KA
 tEkuEthmL+3yugNXXPVLPIjMnp2t2zsgfSJr0pMNH2M0a6UfoARPMPfuAiFXD8PQX+iH
 cOSza+QqckipgNsEGC7o3jZe3kCVmeTXnMsklnCssa6+vQrZyt/p/SEAeMHu8WPpQ66y
 vwN6PoLYhOkSvLqa8VIVQbnrhCDHcJjbED94PgUA8HoBQJrkOwYDNQvJ5hc3ZBKwjWIr
 h0Jr7ti5o8HZLJq8EV117fNE76dwJaFGl6Lp4L4B/rLj5wBYXbZThDf0Y9geDiBUHdgZ
 Cb8A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ZZjXK4pm
Subject: Re: [Buildroot] [PATCH 1/2] package/avahi: update _SITE
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
> The github repository lathiat/avahi now redirect to avahi/avahi.
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  package/avahi/avahi.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
> index 1efc05c025..9074b374f6 100644
> --- a/package/avahi/avahi.mk
> +++ b/package/avahi/avahi.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  AVAHI_VERSION = 0.8
> -AVAHI_SITE = https://github.com/lathiat/avahi/releases/download/v$(AVAHI_VERSION)
> +AVAHI_SITE = https://github.com/avahi/avahi/releases/download/v$(AVAHI_VERSION)
>  AVAHI_LICENSE = LGPL-2.1+
>  AVAHI_LICENSE_FILES = LICENSE
>  AVAHI_CPE_ID_VENDOR = avahi
> -- 
> 2.52.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
