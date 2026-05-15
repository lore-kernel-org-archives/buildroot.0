Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1434CD343F
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 17:46:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B3BA484633;
	Fri, 15 May 2026 17:46:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b3gs0IqHWaRj; Fri, 15 May 2026 17:46:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B390A8463B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778867197;
	bh=CpG7IckeOVSjlOlAk1+jRMO56jQ84bFlywVqKx6JXpQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=se/cDYbHXe8/vdVk1EpO2pMnTXH+oTqBxzNRgx137no6hXntXPb2vqF7njbl8Vpuq
	 mP++DGAZriCYwb8wNhlUN4oA/TgQ8npkKwfltE09uT6vSEaE5T8hsGgcY1at8e906b
	 UYnKNkHCmY0sxZKW0qpob2cJF8YYx+hM0ctHOgS7X9b8BrpKCJKRllMzpj5x8ew+Gw
	 9qGR0PGbwo2W5xJruQB3kFs9gNrSUYlFpR8Cpez/FCk+RPqpBBk/EHO6XvjcPewq93
	 DqaFFPuLLtlbwy1Z0GTQuz5Y6Gl429CtMBhUt6Xq3c3ZoB4RN8d72iW71bQ+4HHrdO
	 By2s5OObDi6EQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B390A8463B;
	Fri, 15 May 2026 17:46:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4F72145B
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3483861698
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bhVhDBfihXNi for <buildroot@buildroot.org>;
 Fri, 15 May 2026 17:46:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 04D6661623
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 04D6661623
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 04D6661623
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:33 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4896c22fcbaso721235e9.0
 for <buildroot@buildroot.org>; Fri, 15 May 2026 10:46:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778867192; x=1779471992;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=7idv9ZY04r8wZaUzI32eUIzQU0YgZuTM8665HDQ6tZs=;
 b=H+yFgA6+c1w7AjcvpUV+lHRp0TQNx+nAPPhVAIUi6zavfbpdFf2WfFzIU0TrOiJOgF
 BUerBoL0AaDbbcXDZoUlTnB8EqrVViP5qWbArqJMskARt7Iwct3pjdBVBb3Jgplx6wbi
 cZNhhXj9fxWvQozakncWeWFrZoQI2T84KfeyKoBboR4J9FUMCWQs51XVDPBA+DOIMBiR
 EzKx6PCG9BQY1LU1l2VQva6VO+ayMgK7MF9KUdQzqRvnF3220fx79liiY+vlMVWDzJGQ
 AOLU7JDbIeI4xmt0wJKtYWz1BjBZHhttF5DfbaPJMaDmjjw0G9i/1GJcVGifJoaD0KDU
 uZqw==
X-Forwarded-Encrypted: i=1;
 AFNElJ8zBtluTWkFlhcdGzfW9Jikq/63/0LvhAh4Z556/XAukaQG6rqkz60fIVAKancFTX+spItOUrI7JbU=@buildroot.org
X-Gm-Message-State: AOJu0YzG0ITKA+d8+eoFnZ9DcsI79QK7cbCHaQ3RBPCo1Y7EoRf1kPX/
 6x1CWahK1oT8x/JRftED/0pg4GnD31zFFO+WAaEveJ8mtV1YdbsHJnu/MMkwRNZRejo=
X-Gm-Gg: Acq92OEEJ5SxF1QGcgAxlxU4ExvzGzb9EmLBfLIULA9jpPNNLqcekohs+07ztOBASRi
 PbeIB89V/2XNzlFu9tGubox7wUAXYOWvxTN0Y7ZcO4r7hCwVrvKWNOvrpZ9et3nAM9cATsk4oVk
 v/uWsy930WD9jZHEuAxsXlTyM4YABk9LDUjoZLKiWkbBl5eyIHRFIVT62KcEBKpLvwFbyO7h0Iw
 yjqb9sr5IJInDaTUilx5b234wWQiUsG4cd/h3qyYR1gcP+y0BqSI0PJ09EAtSvzuKgVFk63xAaP
 f/+vVn5nv5Sb7BvokbPVEcJr0wG1EJ98p3e14eLK7eff2W61MQQL/p373seVeZ8fajJs8PSt0Hz
 4rcZIC24B1c0/7Ka49ejnfgT51peAgC0eaKoQh3iRTYFlYB1m33ffVevY1+wOVtL/jpUj8n1WuB
 OJCBoqPB4IemtgGOXbufvYecyWcsWqG6f4sjKwdo5omRT1
X-Received: by 2002:a05:600c:a102:b0:489:a4:e578 with SMTP id
 5b1f17b1804b1-48fe60da919mr55968035e9.14.1778867191957; 
 Fri, 15 May 2026 10:46:31 -0700 (PDT)
Received: from arch (94.105.117.13.dyn.edpnet.net. [94.105.117.13])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45da15a5653sm16788320f8f.35.2026.05.15.10.46.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 10:46:31 -0700 (PDT)
To: Fiona Klute <fiona.klute@gmx.de>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 15 May 2026 19:46:31 +0200
Message-ID: <20260515174631.529892-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260426153334.1026982-4-fiona.klute@gmx.de>
References: <20260426153334.1026982-4-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1778867192; x=1779471992; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7idv9ZY04r8wZaUzI32eUIzQU0YgZuTM8665HDQ6tZs=;
 b=DKtaDo3EH0ZFYRa7Ga17MICz5i9eJuZKJ7VG3Gzi56aFiJhpMfvvzcWvO1C/BO2K50
 z5NOmzKtbRBb09kjzrXHhNCu5GuxZhrepSv+Nz93Frg6x9H4OW08pQv/uCwWMmYN0I67
 nIvW7ICl94JJks+5NjtFOWwYGgPHdkWD3/nL5VMj7vTb5MWhhNgo6Ejqa2ICDFS5eIbd
 QSC8qv7mEKS+dqOrA8FQT1uszgP9kbnNn3eujHiGU2Q12JkKT6qnFnyW/ySPj9Af4fnk
 kAaHpITw2EY9Ht88b+DzqSkYlaErbWyaP8m+FlKIBWkMND3g2p5pBiFSwzy6FSJoMulQ
 bPBg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=DKtaDo3E
Subject: Re: [Buildroot] [PATCH v2 3/6] linux/Config.in: add kernel.org URL
 as BR2_LINUX_KERNEL_LATEST_VERSION help
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
> This makes it the first URL in the file, so it shows up correctly in
> pkg-stats output.
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  linux/Config.in | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/linux/Config.in b/linux/Config.in
> index 8633ddbc82..1104902b4b 100644
> --- a/linux/Config.in
> +++ b/linux/Config.in
> @@ -33,6 +33,8 @@ config BR2_LINUX_KERNEL_LATEST_VERSION
>  	# mips always generates an ITB image
>  	select BR2_PACKAGE_HOST_UBOOT_TOOLS if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
>  	select BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
> +	help
> +	  https://www.kernel.org/
>  
>  config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
>  	bool "Latest CIP SLTS version (5.10.246-cip66)"
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
