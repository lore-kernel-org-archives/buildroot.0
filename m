Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2F5AF34C49
	for <buildroot@archiver.kernel.org>; Mon, 13 Apr 2026 12:28:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BAF59422FE;
	Mon, 13 Apr 2026 12:28:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5e-bp-D_F2eg; Mon, 13 Apr 2026 12:28:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE01C406FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776083319;
	bh=ynGem0rpzHvu7xBAQ5/Z8Vm3W5qY6Cv7lL5ovmji6NY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=s+0W1qN1MfaUU1Qy+ZTiSyCrE7NlpO+f4n0R/GDVyQVZCxY6ewnoJCz+4jvHwuLVK
	 BLbrUwNXEESWoNLwFaQDUE6nOzOlUfsLCe0LPaM6cjIuD4XY0/7nEMi2Mh27JyZZ80
	 pA7KkdiSX/D1s8wu+zH+9DFeXvkFqx0GcPcDrEgqTz4yeDN1B1YqefPI94Tz2iXTVw
	 Bhievdd2cfoLPhXBNqzUNobVEUR/0N+IFlNM6b8xGFfQtpNxS3COWF/qUhFCGsFdWh
	 f5CnMw9SwRc76W/83qQJ7ySEDJ9Hq+dITkq1OZscduGufBdNqdr5zE7c3JJEbZ6Qra
	 Mp1fr0ZLE2/dg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE01C406FE;
	Mon, 13 Apr 2026 12:28:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id ABCEA237
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 12:28:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 91F4C844A2
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 12:28:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id np4f7tlDOKmN for <buildroot@buildroot.org>;
 Mon, 13 Apr 2026 12:28:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AFECA8449F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AFECA8449F
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AFECA8449F
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 12:28:37 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-488ba6366a7so54827355e9.0
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 05:28:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776083316; x=1776688116;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Dudo5a9lZDsNUTjnAaFrxV8hs++JuatbN48taEWfTWg=;
 b=BIyqpPq5ZGfajhdxX/sN0Yyk0YMn96uCUMuMKaTSxRCS5z5t8BS7u2MvoZp8SeVns7
 1caaTB4kWw/uirM9M9wsnHb3hvneUptY2THLJTv2GUTfg+5hCjpjrfAfxSjtok1lw0L0
 gqQR1bx5ylsopIYLHOK5Cmuvjbg/zPwXOTF+6fd53BKYWC1YI1uqFX3pnRNEl3Pg7LuH
 afKPYY9j+1K/SNlwWeg+ezHD2k9RE0QIOyjf5us1HLGCXTnK384c7ruvvgItHh1AZZ2t
 p+iNKNwtdl3QIxmEGyRNAJdvrdhIZd/Q1/pVdTZMLAAwjwYELPndqNhZtdFdpBozCatH
 cDmg==
X-Forwarded-Encrypted: i=1;
 AFNElJ80X5UfKjgwgSky0b6sNLqW3GjZLh7SUGsCtv0PFAxi/Gac/LfHmGGrK2+7sD6QbfnSGoqxYbuPjbw=@buildroot.org
X-Gm-Message-State: AOJu0Yy32ktP0fHLRzH5d/ck9svFl0/VdlpTIawtv0ndjRz/vaxTbjTN
 3tNsVekMCS1sabDk7Dfs5S9BzwPqNLCEGIPOWcSMFy/pHrIZ3HJsN9n7KeWA7pJbLRU=
X-Gm-Gg: AeBDieuTIjI++vTggxCR+toguqzr29EgmA9s4NKOvYMCd0Euj9etDSxempjrUjvyq/F
 Nh21ZaX1daNIyWh/Ve2MZA/oJaGmnpRA70WHPoovh/RRIZZIyRQgP0JKgf/+kL9b++7jRzeJnui
 +Oh9BLLcRAboz6JhZjshjAAhOJfu2rczpLw85mSb7ePtX7hLtPsMbOB1d15q086w+8KvKWSq8hH
 Qidjk+MYcxkT+x54wfay6k/gcQxDMi7+d/AFbZiceRTg/zSssEKT0Ksq/RFlqJzIJvRsUoe1bar
 oIpc9BukXQZfSkCHCDpWdqH4xccOiT/eYr3LivNjBmEWY/L2xscIojtmJlIDABCzLNHwF3R2hvQ
 OtKPA3TSVzgS+5UR/ju3hyS3ODIHWtAMFjaePTiHsYqSnzmHaWCVYypyxG0XLO0HhzISXgVzRAa
 ZtQl0BwAlrO0LjHRRxgsWQwkgnkyjm14a/Py3yapKEx/QYGoIVGC0Yfb4QDJa3
X-Received: by 2002:a05:6000:b12:b0:43d:6a0d:b0e8 with SMTP id
 ffacd0b85a97d-43d6a0db11dmr10514956f8f.3.1776083315649; 
 Mon, 13 Apr 2026 05:28:35 -0700 (PDT)
Received: from mindpad (ip-94-140-185-241.reverse.destiny.be. [94.140.185.241])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d750f0ca9sm13715374f8f.37.2026.04.13.05.28.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Apr 2026 05:28:35 -0700 (PDT)
To: Michael Nosthoff <buildroot@heine.tech>
Cc: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org,
 "Julien Olivain" <ju.o@free.fr>, "Bernd Kuhls" <bernd@kuhls.net>
Date: Mon, 13 Apr 2026 14:28:34 +0200
Message-ID: <20260413122834.58688-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <0871dc43-7b87-8808-6a93-ba8244d624be@heine.tech>
References: <0871dc43-7b87-8808-6a93-ba8244d624be@heine.tech>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1776083316; x=1776688116; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Dudo5a9lZDsNUTjnAaFrxV8hs++JuatbN48taEWfTWg=;
 b=arBqfVJLH6HKJDCVGN5e5fnTPKcsXnvsXFtUvLcToeKgUsfumXX0t52FBq97emwoTY
 UdgyFSP93/e+XvaaIBjvWH5y9uiJgFIVVm6SmxrNCYCH5H7GahNgiz7V1cPd+1Ep4kGY
 7UaxF2e5pn2eCko2XhFYGOKBBwsI4kO19pTDt5TUAEk312FyvA4RVkGuPvBLoJQ4zFG9
 TKIEvDh/x9oqg1eHOyS/skJ+cw42fCnrzRQMgLtKF/WuZmYvDa/FgKZuVJdHcIp4hulZ
 JctWWA4eWTTAfLD6Y6WHAsdhUfPbuK3jtWjIwMzWPtGIy0GtNuUbBWqslZJHK5/mO4SB
 DSJg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=arBqfVJL
Subject: Re: [Buildroot] package/libmicrohttpd: bump version to 1.0.3
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

Hi Michael,

In reply of:
> this version bump was actually a security bump. It fixes
> 
> https://www.cve.org/CVERecord?id=CVE-2025-62689
> https://www.cve.org/CVERecord?id=CVE-2025-59777
> 
> So I think this should go into the maintenance branches.

Thanks for the notice.

Best regards,
PERALE Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
