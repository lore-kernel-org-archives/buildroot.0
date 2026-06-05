Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20830CD6E74
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:51:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DED35409F4;
	Fri,  5 Jun 2026 12:51:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zQOH7QMn62l2; Fri,  5 Jun 2026 12:51:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17BAB409FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663875;
	bh=Imr1Z2Z4pgN2FZovqrdtdVZJ1h/3RarnNFbTZJRMBMw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jueXgV9ebtlXePOBlsBKXpcblfUDLA+XnEUC7cAc1GX5t07q9Z6AZR9Zm4xHJAuxG
	 NY4CrH/st0Z+hml2xzcKhtaRU6lGawe1/6a1L9YSOV+47uWZ5gJUqRSu9CCSIfX7be
	 rrrhrT0976lfmzTRaObaFiFE7pyy0FAL1EqRuoCEUQ5STTYx8OhTKYAqUbXg0kwNfP
	 VwN6kTMg415IxyjQWWygo7JBKQDqk+7Zem6t7uJIN8hu1p1t3EYRCltKnFtzR2GLwJ
	 GfGny6qphKvSs8U6fmBDh+H/4QJ58rIbYHYy0sAMc/HZz3z4+0F6NPQCrpMPcC2pVi
	 /Jq+RJjJ3AnBA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17BAB409FF;
	Fri,  5 Jun 2026 12:51:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9A404F4
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:51:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8040981373
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:51:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O2GgiBVofttZ for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:51:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6C9588136E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C9588136E
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6C9588136E
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:51:10 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-490ae94a89eso16440055e9.1
 for <buildroot@buildroot.org>; Fri, 05 Jun 2026 05:51:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780663868; x=1781268668;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=665Dp/9KsRkp/R1vkbNezCZEdAhVdllI1JFGE6YAp1g=;
 b=RHNWq9WBgWWcmA0+BRcY76ZmYCUVZNuuD66UdJQOlug2jJt0SRh4Au1v9H+Ay3Kr9V
 /gxmQRGdIv8c+mXAWZtsixVcRZXxQ60QC41cDdcsCazkBrBneQzT8GPnKSbHsSuG+76I
 EM53B2IyaB3ecTt36wVKjykxCxBPEMomkO0XfLfMmTr/TNmu6n+dpEsxZb6BVx6WU60T
 LpTOJHE5kv1Ov1cqFywkRRggKJd55xzjRnTEzshHN8Dvr47e/ERx18h3Oc53GBNGHik4
 eIBsvZkXYD5m3Vi6bOEdl9f3uGMW4Pj+u6oRs9IT9kasaHe8CjaUPbP7Gc3sMvAzq9FN
 NACg==
X-Gm-Message-State: AOJu0YyJ/eUtlPzYKIzB2jsh7bCf9z6ZR+FGSa/A1Y1pHPx8QYC97l28
 fai0/0tG15lgtHX1XLcklMyBRuvG7tFw4I966esdIlwGd36Do2baipZbhIrsuX0FeUM=
X-Gm-Gg: Acq92OHMq/Py5nZmShl7It76YRz/xQ1NJznkF1dW+uc6eTzUr8JjS5qwMlJzOnMWT8C
 xMLn/bWMfu59KLmMSWVNnnpvqjdBj9sqlNSqb1ps4KHzffUevm9FmsU3hIkq7gb0Gf6YSsDdPSW
 ayOBWx/WBzdR7dAHGyFRh8NiVcKk30j0kmB+ZMS97xVnoaZQfyX/jeMCAIUpBlvC2X7xfQetmTK
 gE166nhuasBzhobpNIDxiACrxLft8yLVrkLpApt385LtxUUK//1QCXr7eBySFFbLWrVME2JK0aW
 dcWj90z7Ap13sZOHl/GAJE2H/jOKyNLypSa8Bwd9sopFhFmg6yhcnJhs8U1y7obwsnRRFSmj8le
 W1P1xCK+oYcN2eQEOXMwtEnLjNZpFPIjzX6qzISLCgwBtpkEeeeIwNqtCA9S7ZUn0An4u9mpckr
 13XTLDPTQLWlB2YpEfHmIQnhgnE45s03rulcgh
X-Received: by 2002:a05:600c:1387:b0:48a:75b9:b0bc with SMTP id
 5b1f17b1804b1-490c2619945mr53540765e9.29.1780663868531; 
 Fri, 05 Jun 2026 05:51:08 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f0a43e9sm25726202f8f.0.2026.06.05.05.51.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2026 05:51:07 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri,  5 Jun 2026 14:51:07 +0200
Message-ID: <20260605125107.275365-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260529150631.447940-2-thomas.perale@mind.be>
References: <20260529150631.447940-2-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780663868; x=1781268668; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=665Dp/9KsRkp/R1vkbNezCZEdAhVdllI1JFGE6YAp1g=;
 b=LdroGOFm7dHdTIIxtxW2tB6mPJySj8Hz4uQvXgkyB6sjI+PJMOU1JGAKupORN4tcgx
 QaI8vrBcI1Z8KjA0a1GqVwZihworNsJGUGvjS3E9UpRwivcthZlzKqhyNgrDd8ArBl3j
 hg8YMi5tMLh571A7npqaYDWuPJIwQSk6dGgLoaa0SvIT31ykso++PP1/gxYYX1ANfhWK
 UdwNXaVuixAcd+wSfnlMaGSGvr2Tjc362IhcbBby29+X4GTMOIQuD61DUA8Sbj8ygKN4
 OL3GiGCKU6bWVdW8hzFgWU1M1oLw64KzqltQKIz/d5B5A2++4dsPr4qIqhJnwZjONl7H
 RaUw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=LdroGOFm
Subject: Re: [Buildroot] [PATCH v2 2/5] support/scripts/cve-check: add
 indication how to run
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
> Always run this script from the output of 'generate-cyclonedx'. Do not re-run
> this script over an already analysed SBOMs.
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  support/scripts/cve-check | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/support/scripts/cve-check b/support/scripts/cve-check
> index 5047523ade..c045d7ea27 100755
> --- a/support/scripts/cve-check
> +++ b/support/scripts/cve-check
> @@ -29,6 +29,9 @@ database.
>  
>  The NVD database is cloned using a mirror of it and the content is compared
>  locally.
> +
> +Always run this script from the output of 'generate-cyclonedx'. Do not re-run
> +this script over an already analysed SBOMs.
>  """
>  
>  
> -- 
> 2.54.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
