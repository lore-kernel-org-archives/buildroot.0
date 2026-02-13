Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A194EF99D3
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:39:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C59141E61;
	Fri, 13 Feb 2026 19:39:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2VjnjC0t1MrZ; Fri, 13 Feb 2026 19:39:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C9E7842182
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011554;
	bh=tcaO0Og9xAS72kTJH58sp1bqcRO4pTb9bLEVv14wm6k=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jZNf9aeQHwe5u11atR90J12PePAsJGSu6oZPWd/4B634YXNNl8fLe8obAzd9iwB9x
	 JcVTUtynL8T/b2VXGqo4GWRbmXFvMfCKqbgjB6sHF8sOsXwmocd/myLYu1rizfyIaA
	 9Fiq81LgiZxc1WQ60gObKfzt1c5CbLlMKx++O0CAD9NCOGYUR2nNZz8jpFijL+5gI/
	 z1V9HpH9G63GsCxgRkIUwpevZq5rQ6MBDqvv+ZogkTPpre4c9xmv7UTkPVn6n4/Pm4
	 SbTkBCL4z+dsb+U1P04ysOjZNxJxuQiuP45t9plyaUyOS5Izw8O5wyJDT4D2+EZaWA
	 sEZOdqeTsGEvA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C9E7842182;
	Fri, 13 Feb 2026 19:39:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C848283
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:38:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BE9A460750
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:38:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Quodmt6QizMN for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:38:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7ACB7615B7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7ACB7615B7
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7ACB7615B7
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:38:00 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-436234ef0f0so843294f8f.1
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 11:38:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771011478; x=1771616278;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=+6nbEM44qgrFXnrO1Ei/TZfJHHiZDeVFKIrYVCoXmx4=;
 b=WX2mkX78blS7gRGBpK9hm93jenuKAuQsKeC0xGDXSKByFj1A7xO98VhWLjDkJgRNoj
 NSBAZrxz/Kyt1uL8i3MpihASeobBXeCcqm6uBefLYBjGCZSXrosrEVg07dsYrTdJB3UY
 bqMiAuffwBEnfb8pS6g3ft29aYJP1Jh9ee1G5DDsDGrOJG/6EJTbENkvoJOi2thAEJnZ
 FiHs+KQTsz3olsjYs7014j8FSKt61tB52xlUaG6iXGdnKfWeVlzA3PYAk1jtKAikl+hg
 6Mn/xu6zXN/7FCWn/TwTi6nUqrR5iAS0QRRA1mF8E8WBAxklc/hHcAlUEuRduUQraGSw
 ta/w==
X-Gm-Message-State: AOJu0YxHBUWreNnI/gw7LczZYgo7YVUC5LLdoYkZdeFnUv4aeAn0XhCd
 A9ULaIzUrWuXEJECRadA3oMRvASuk6ktFUhE4KUu9tTYnw+3K+gU+AGAxwYOYRCdJO4=
X-Gm-Gg: AZuq6aI7cBmuOmur1kgwEbF9uVRbesah3NTC/k6zB8mA6h95dpJI1K1RysBH8WibJ8d
 O8Bh1GuFvqjCr2kLYUIiPwqcon/hg3Ibat+V1Xt7K4h9KMfW6CCqYXB0dj2h4wShXHEApH5I8it
 GTgcAD6WnFOrDTA5GQyTs0Puob9m3+xgvHm1pdYsbMzuUqzL5I6aKvlo8EOgTBp/041ooGkNVqk
 lUO21HDOxccOSg7BVIuegnmPzn2A3RlVLJ3WxXVuH6iAG8MGFmCbiuYpgS1xuguca2g5BeSPXlj
 LwNMSn5se8qhUeyFAijdl4pU4M5sQkdZWzcCGaQg9Lt/PB/kJqcJVO65gZZlDMbMceMD34IItcn
 G1joNqvLk303NtWMU6adfDmXApQOM4UbxdVyGDPbvl+7qp41Vqi2b6j7Upr5zGtfgfBRENMdH8b
 Ja9K4Li2+jA4h5HZ8=
X-Received: by 2002:a5d:5d87:0:b0:437:694d:fb6c with SMTP id
 ffacd0b85a97d-437978c1b77mr4473807f8f.9.1771011478439; 
 Fri, 13 Feb 2026 11:37:58 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796a6a6desm7601131f8f.10.2026.02.13.11.37.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 11:37:58 -0800 (PST)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:37:57 +0100
Message-ID: <20260213193757.41162-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260126130414.59175-3-thomas.perale@mind.be>
References: <20260126130414.59175-3-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771011478; x=1771616278; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+6nbEM44qgrFXnrO1Ei/TZfJHHiZDeVFKIrYVCoXmx4=;
 b=N65/gbYSqqo8q6t4uYdobQldXOyrtOfLcnlJE5IDhjxqnVUY6sG3MS2tnhAgBKi0Bl
 Ge1KhANzBBZwk6Y1CRo4Atc/EWhm/F3RCvq/2VMxwPSxcsEEhYNDbGKS59OZmtpOTdVk
 QTs6hVNnHm1qBiDlCV8O3dWDosLdzQ8VbaZM6xC5UkU1h0sA3tYj7y0ouVHx8KXYahBI
 JGCwGBUG9wGsZnkuidwrTVLc+3HJNZlRcNf2rJBP1B5P0U9jx3tPF8VrMW3EkcbNtrBa
 8GFdom3HaiLB03hMDakm3aOhupdRFNZlq9DBjUiyGJe939aLX2ExkuaiQkHh/wA1Qsle
 6JEQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=N65/gbYS
Subject: Re: [Buildroot] [PATCH v2 3/4] package/pkg-utils: add 'provides' to
 show-info
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
> Add the list of virtual packages a show-info entry provides to the
> output.
> 
> For more information on virtual packages infrastructure see [1]
> 
> [1] https://buildroot.org/downloads/manual/manual.html#_infrastructure_for_virtual_packages
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  package/pkg-utils.mk | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
> index 288a202230..211e681e8f 100644
> --- a/package/pkg-utils.mk
> +++ b/package/pkg-utils.mk
> @@ -201,9 +201,16 @@ define _json-info-pkg-details
>  		$(foreach patch, \
>  			$(call pkg-patches-list,$(1)), \
>  			$(call mk-json-str,$(patsubst $(CONFIG_DIR)/%,%,$(patch)))$(comma) \
> -
>  		)
>  	],
> +	$(if $($(1)_PROVIDES), \
> +		"provides": [ \
> +			$(foreach provide, \
> +				$($(1)_PROVIDES), \
> +				$(call mk-json-str,$(provide))$(comma) \
> +			) \
> +		]$(comma) \
> +	)
>  endef
>  
>  define _json-info-fs
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
