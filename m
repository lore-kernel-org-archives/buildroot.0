Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53541CA0EE4
	for <buildroot@archiver.kernel.org>; Thu, 14 Aug 2025 20:32:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 24F7680F54;
	Thu, 14 Aug 2025 20:32:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kQ4acs9oyuq5; Thu, 14 Aug 2025 20:32:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D267280F00
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D267280F00;
	Thu, 14 Aug 2025 20:32:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D055E1BA
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:32:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C29E64049D
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:32:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ixnpy7g_Wm1D for <buildroot@buildroot.org>;
 Thu, 14 Aug 2025 20:32:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DAA4140494
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DAA4140494
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DAA4140494
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:32:21 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-afcb7a8dd3dso213051666b.3
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 13:32:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755203540; x=1755808340;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WUBw1dX5f5f6qxUcj7iOtycse0xB8J7LoLvaJM2iEvU=;
 b=vNyjBEQrmkct9fOReuIMrzjbc4+NJ9HTztcaSV4ZBBrRy81BAnW8pKAPC1SUNqZAa/
 q/cbCTkNKPs/6smtfWVYv8UKK2xemcnMeM0Nq9nxateBKsHjtcn64iCGbtvKm+L48Hz0
 V5iex6eunIc5MXQ5+Xea+cRWy4aePMIbgZhiptqeDEf/PR7CWclF79DVHeTRvxneWfNY
 Y4O9kdHWlQJUmGiF+C8UggAsy2ppZe1RIhXFiaCT759WwMyjVKNu+ce3AMpKwMCnREV3
 vhKAnQSXGzs7egLl1+Hkrd5he8s4nTG2wTyqLri3u/ytZM7DsPNqTDDRLHYcw4KVvt0N
 QEvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZdcRQYpKSV84WMcgwC+u7xN/LE5yra8sFNg+qaza2/Fk5LSDqmjjQTwpM0edK8p2gV+HQ4usAh54=@buildroot.org
X-Gm-Message-State: AOJu0YypSo81zb6eCu2+lIYXcSvUHcmL4plySiSwO/bk0QU49wxsGKvB
 RmfvH/Uy5AQgsGrjKZ2bh9m60sEZk5XN+MdTOLL0IemS1OFT/G8U5M7Py357ATgf+KE=
X-Gm-Gg: ASbGncuuPllRbHT0XJdIA1Rxpu/vh9lay9D1KTYfghyIgUePQQQyaD8F+30FF0OtLB7
 hLeyRQYr6/ikGK3roQY48pMfIZsXC3TgUlbqCwHeYBZIZrdZ0aCMamH2MPxAGIQcsvXrthwOxyJ
 C3grEUEj2vdbriYi7WsOpbmMA/jsn/n1V6DlCY/HNGJAI+t9SDzp6b9fX3q/+1/yVTFaUQb4e4G
 P/0uX0xdisKVeqRQIu0NznH3xIVA3/C77duQzvTn6YPH7PjYMgXs3BNqySBYVDznOuvw7/6epZi
 JPJXO8+8BwATTO0RnqyWi/24xF2qc7nwCXru8cUMsU1PE7M/ArRuzpX/sVms+ahma+jNf9xg5Ha
 LWfnWg/mM7/xelg==
X-Google-Smtp-Source: AGHT+IGWgb3Kf/Bm2p0DKY8PgggnGq6/nKRxy9tHdvluV3IbggxLcqNRnRW6FVs8vwxE+XxDDm7+9w==
X-Received: by 2002:a17:907:3f07:b0:af9:14cf:d827 with SMTP id
 a640c23a62f3a-afcb93c67fdmr431566666b.18.1755203539903; 
 Thu, 14 Aug 2025 13:32:19 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a219ecfsm2629873766b.94.2025.08.14.13.32.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 13:32:19 -0700 (PDT)
To: Florian Larysch <fl@n621.de>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 14 Aug 2025 22:32:19 +0200
Message-ID: <20250814203219.2817097-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250810163029.19877-2-fl@n621.de>
References: <20250810163029.19877-2-fl@n621.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1755203540; x=1755808340; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WUBw1dX5f5f6qxUcj7iOtycse0xB8J7LoLvaJM2iEvU=;
 b=ZIHbtA4HkBi6IdTIl7qURdmA+zH8qVElVgOFrzmoQyVbR7b9BWTztvvnpQs7/VYlhn
 jJHgoUc8l6As9eh8X+jkZrw2l7lRooCAaT9Rsd154DgiOPMn0F8plV7PFqn0Qzc6ermc
 dHsv/4CMzpDQL5OQIyd33cLlZ9CCSuXDudPZOzhNxIZEExoxFrf2QTHPxNKZCTMLSN2u
 fyj3sg2CBrSR/AwL2sJ2Y7NHJhOS5pUnfrJJ+wuzzFZSjbag/eBmNaqNc0o1/rXldt+m
 G3DTxkFwqG36HlQxAZaCq8M4pyb4K/AKVUOCD2S1RfoNB7GBh23TcfiWAlrJnTCwyz0h
 R68A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ZIHbtA4H
Subject: Re: [Buildroot] [PATCH v2 1/2] package/nanocom: fix build with GCC
 14
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
> GCC 14 made implicit function definitions an error and the forward declaration
> for display_state() was using the wrong name, causing a compilation
> failure at the call site.
> 
> Fixes: https://autobuild.buildroot.org/results/ebf/ebf500c48aaa357aaac3a88d87ef8f5c07cd78b6
> 
> Signed-off-by: Florian Larysch <fl@n621.de>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  .../nanocom/0002-fix-build-with-gcc-14.patch  | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 package/nanocom/0002-fix-build-with-gcc-14.patch
> 
> diff --git a/package/nanocom/0002-fix-build-with-gcc-14.patch b/package/nanocom/0002-fix-build-with-gcc-14.patch
> new file mode 100644
> index 0000000000..87df33a04d
> --- /dev/null
> +++ b/package/nanocom/0002-fix-build-with-gcc-14.patch
> @@ -0,0 +1,19 @@
> +GCC 14 made implicit function definitions an error and the forward declaration
> +for display_state() was using the wrong name, causing a compilation
> +failure at the call site.
> +
> +Upstream: Submitted to author via email
> +Signed-off-by: Florian Larysch <fl@n621.de>
> +
> +diff -purN old/nanocom.h new/nanocom.h
> +--- old/nanocom.h	2025-08-10 01:34:12.000284003 +0200
> ++++ new/nanocom.h	2025-08-10 01:27:59.545821909 +0200
> +@@ -56,7 +56,7 @@ void cleanup_termios(int signal);
> + void init_stdin(struct termios *sts);
> + void init_comm();
> + void usage( char *str);
> +-void display_status();
> ++void display_state();
> + 
> + 
> + /*typedef to represent the current line state
> -- 
> 2.50.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
