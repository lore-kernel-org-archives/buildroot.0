Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 285FBCCF2C1
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 21:30:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3FFA40A3E;
	Fri, 16 Oct 2026 21:30:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IddkRB8IBJRa; Fri, 16 Oct 2026 21:30:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 2B30C40A35
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792186252;
	b=Bsp4uuWLmMcEDj2Pz+Jq9VWAjhRcBdX4BMhlNR/53xy9+3AyJ1YAON0DyqvfGV7euYaW
	 /aPaKSBn+anSxOGtCh37wQGSepjFRKlGvc6pkoj7Hd4E0ZGleRMH4KT/GAo7PjK6l8zY0
	 E9VZXPBCYgY4iVm0YX+68D1+L/MY3UmdeiWhZpqHjvum8oVJBx7o5EU5IjSvX0xi88CDN
	 kRQH9IDVv7o8ormTJomqWsPbPBPBuzp3gsjqhWhojqYOD56vlwvcmMFkfCAn7aAtEt2u7
	 a29JrrZyWiuvfXSrdUSgT9+DiJrGc9LOMcnRXzxeiqo4cPQ7HS9Xwy9S0mmR8/O5acg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792186252;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Date:From:To:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Reply-To:Cc:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=VLMryVLj7TsOWUTPx102xHY8+edk1ZMG2X8g3zvsS7k=;
	b=Cb0/7RLtzbEL4Fz9TaKmMF4KfWmqZYwhEoX05lZPhODITh/DOhu5xKWy6dROp8cSehm8
	 QQ0MCIwUZmvQ1boBB6Q610zrW83NZGJg2Og2aRjv5WRMraHOP+/F8hMD3Cn77XOengY9o
	 9aqmhYequlSsK5KMY4/kvElYLpnhSyroavMJWXeqISgXC1+JeB0pbjskUmnvxyFe+E/lN
	 ug5lTFGKQl/hE/ua6TdlKrLWcxW7uM8exB1ZvlXHvPSjbrvj+/UNdVAALv9qv3f/O6acj
	 Y5IrWngnAhUGH7ty+R0djdyqW9RPQtMoQN1JprzX2XS5n1/LpZs3fAKg3dZoaVBOLtw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792186252;
	bh=VLMryVLj7TsOWUTPx102xHY8+edk1ZMG2X8g3zvsS7k=;
	h=Date:From:To:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Reply-To:Cc:From;
	b=oFonTchxpFigetCKcqTlc+St11qZ4re/QC+oREAm2D6NGPtaHjHTMvOB9/YuWfF2L
	 hvMGGpV+dPCwrycWvKOqbeIAb9je8Fexy89R/DbGkOSTc0rRqR9ZYfaJ8Txm5QQbsJ
	 1+X0cj9W3carRjbSofYBZS3ZOA8n+zzoM/MGlT+WaGnofOGpq89CLkrQN0N/Flwsiq
	 oO8LeAAfBh8s/R/qvYXoW9Y8xbk06G3iSheiAAINhtc4Itc/EIH4CI6XzHwXptweDl
	 dvB70WWuA64lLi8g/UjoRV30ieX+N0dUFk2UK3WPMGrrPbpV/dffgwo+wzdZoH9lvp
	 E28jTdS2Nj5pw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B30C40A35;
	Fri, 16 Oct 2026 21:30:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 68E6379D
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 21:30:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4F636406E1
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 21:30:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lS-WhCdKoLFH for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 21:30:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 65B67404E8
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::334"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792186249;
 b=np8RFCuK4q5JvLKGoPVmxPEiIVQ9/nkN/By+KPdTwL0Jcc9kHJtJ0KJvrn1Gj70SJ/CK
 vNlzclIsng9tiWHl69VN5k+1Qe4XqiKGUGcVEPnWhV7tEvZvxDMXlMVzl7V+Bq1kbL0Rt
 TV9faMXvVASss2eqcIHdxVzwLj6XUmCV2/rnIim+7IHluZyZTHL0ylh2BW7fS830QmY6s
 cSeHf6ZW4UQRef59kefYZH+KGl6nAXB4wbywdtOE/OACjKre1waLlZy58KdOU8stUMhf4
 CY9cl2IqcJKoZqM9D3Ly2ds5Zw/XZ+bMDUpyTqVRTj3ucLMww9Wl6YyqnAaomInx7XQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792186249;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
 Subject:Message-ID:Reply-To:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To;
 bh=mBwAQFdkShJbT0RLWa1Ao2Nm88uPZcfYB9wfRExbujw=;
 b=iUUOoYs4nnN2a96QtfVhaW+FZtgsmj2nmmx+xjWYdYy2PcFbkeWWbJW6Erujafd4FaAJ
 RVzP4ueIL1ykM+1xRqXjJv6csvp5+Ohvj6zz/CqtmccFmJZ6vERDDw9/sVHX2KiVV+371
 K7sK0TbbGb+KWe8d9DYo/h2J/EpiV5ildYXVVFJFEm4iR+lIAtdG7++sZ56Lst8UGAJ2U
 Dz7IbTGx+Jd1Rn62ESQzvMpNsiWnoduz+XqXbJjwZ4E82f1qsE3VLGyLHguqOegZAM/YL
 XeBfX5eVvbL7GQSxduYPLvrE8OXf7qWaRjORxzPFnIQ93tqfLyXrG1jgVMtkkOZqs9g==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=CdRReGfK; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::334"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=CdRReGfK
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 65B67404E8
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 21:30:48 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4a172eb31f0so4148185e9.1
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 14:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792186247; x=1792791047; darn=buildroot.org;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:reply-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=mBwAQFdkShJbT0RLWa1Ao2Nm88uPZcfYB9wfRExbujw=;
 b=CdRReGfK8kXBK6SWNysymU8zUaCFAxflPs9h6xRgd8j7TLngDOP0lS0TQJObusAoKh
 IMueVYzNn6QLyRJHbe6CkCbuA4h4j5VA+iBcz6AecaKG3zj0q4tsfS0Khz+kYVMkFAf1
 lMwkHCKZ0x/aPzsKcJpNaD4VYE+blAFns9RNWWBQIxAlTzCgnWtpjy5XaTtpk1iRzwEI
 nffXXh2JwdVqHO+pHMMIIaABGhxcti/QX3iwArtefhJ4HDGu12Rkc9qx6nR80HWKICEF
 UPcXCxNAYNYwcfdX+uJploT4tadlmSgZTttJQhZjPSRAyefz7tLSsk+7O5gTD7zmlnKG
 we3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792186247; x=1792791047;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:reply-to:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=mBwAQFdkShJbT0RLWa1Ao2Nm88uPZcfYB9wfRExbujw=;
 b=0EGw3BbgTXmpkZ9FYE/Kc4QrKDQue851kylVyMZTKsAfyUOJJJOf7VXBxvzZvLRp3C
 qzXExxNYvRWudGzv+RhfrpET/npz0uGL/P0GxR/ILAS3I1xUnndUK/QqNyv7jyDFHcxD
 yM78u6omAvI3g27VmIrNPUaJkzwhpvzp8rTm9WWQKVD8eM7rxMkdH5h34RC0Z6KGQL9g
 tjLBt5oyQ5YEA5Z+Z4juVM4GbQTcyXvadgkBYJjKHkXJ+U5jxEGhRU5jMdVo+sv3RoLD
 Wmw526Mz4uCrH62akr/Zd8/bbcD5juCyRolQFEKP1+cY7ZAOfftuJyGygOnC1HQjc0T/
 Z76w==
X-Gm-Message-State: AFq9FYI13cEloCa+tQ1ZHYtku6pNoLHK2rQp8t387XAkCd9oFqG9xhw/
 zuulLw4Xd94zNh6PaJYh5vjohgYjpeeT05ENCkqBLaAKrR/0SQJp5Wjw
X-Gm-Gg: AYBFou2W3oe00mUszPT+4/OOONf5hqQbvwGjm1CCqZZ0jnOO3jmJ80ZX6M0GEU8aHvO
 IUUEtX9zwK+LmXpN2eXW75Dzjvjv7Nfg6PlCaQrf1FVuOJ4U8UO5JYV9CK04CjPzNd0On3phuU9
 tBxT5dH3dvcQ7UJuQfqHJtLG9smB40N+fA3Xgx5b257pkP71exkRloi1LwMibRk7u9mRND22X9d
 ivMcfKqwBwJH5k5pNtfFtSDufAB29m4RK+uxP1VtrfK+B46+a35fl8yrPpkp86QNY/g99vM6KaQ
 jHiQCjrH8XXRZKWYNmJN+H7ZEFQFYXCD4TfFVhfqpa8E4+dVecqg0BhB4DCkKUy600BFtpHxluZ
 qkrdfFipg4U7xYwII2awybCn22mwisNqPdFC2XBKwC0DzpeY07HwvPMAavhA33aYEjtklKKVYtH
 NJbJBe7smpc9OLQRUc0ZYYATX8fjTG8fk79EqwtyAgobavATuzJJPd8SZVYYlOYpRL7d8xb4JSw
 QLZ/I7w7oEadj4gSlcZOsRIwBn8sukNNRxWbURkG2pMjw==
X-Received: by 2002:a05:600c:8b22:b0:4a0:1c17:4fb2 with SMTP id
 5b1f17b1804b1-4a1d760d9fcmr20459175e9.31.1792186246567; 
 Fri, 16 Oct 2026 14:30:46 -0700 (PDT)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1c8ddde4esm108397155e9.12.2026.10.16.14.30.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2026 14:30:43 -0700 (PDT)
Date: Fri, 16 Oct 2026 23:30:41 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Titouan Christophe <titouan.christophe@mind.be>
Message-ID: <20261016213041.GB331129@pevik>
References: <20261010151121.876133-1-titouan.christophe@mind.be>
 <20261010151121.876133-2-titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261010151121.876133-2-titouan.christophe@mind.be>
Subject: Re: [Buildroot] [PATCH 1/7] Makefile: always use a base config file
 for defconfig
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Cc: ps.report@gmx.net, yann.morin@orange.com, thomas.petazzoni@bootlin.com,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Titouan,

...
> +++ b/Makefile
> @@ -1044,7 +1044,7 @@ oldconfig syncconfig olddefconfig: $(BUILD_DIR)/buildroot-config/conf outputmake
>  	@$(COMMON_CONFIG_ENV) $< --$@ $(CONFIG_CONFIG_IN)

>  defconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
> -	@$(COMMON_CONFIG_ENV) $< --defconfig$(if $(DEFCONFIG),=$(DEFCONFIG)) $(CONFIG_CONFIG_IN)
> +	@$(COMMON_CONFIG_ENV) $< --defconfig=$(or $(DEFCONFIG),/dev/null) $(CONFIG_CONFIG_IN)

Reviewed-by: Petr Vorel <petr.vorel@gmail.com>

Kind regards,
Petr
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
