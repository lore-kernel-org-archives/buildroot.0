Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAA11C433F5
	for <buildroot@archiver.kernel.org>; Wed, 12 Jan 2022 16:59:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6343684BDE;
	Wed, 12 Jan 2022 16:59:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6HcJv8NgAK0M; Wed, 12 Jan 2022 16:59:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B5A1884BDD;
	Wed, 12 Jan 2022 16:59:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2AE441BF2F6
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 16:59:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 18DD260DCB
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 16:59:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=essensium.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wB1YjlduIahf for <buildroot@lists.busybox.net>;
 Wed, 12 Jan 2022 16:59:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 39FAC60ABA
 for <buildroot@buildroot.org>; Wed, 12 Jan 2022 16:59:16 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id o6so12552332edc.4
 for <buildroot@buildroot.org>; Wed, 12 Jan 2022 08:59:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=essensium.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Sefj6GmKZo7igDlOsjRTiCjO4PIBvUZD2ApuNFqE5Dk=;
 b=G41bKUdoF/pJwndM8K6BPgEkCTqpYeK0Y9yFq0fQIoLU1t6tW2EeFvwoeuyXHnEv+2
 Y0nJUFtYT2MJ7SrJ9GZAPeS09rIrYqiKqyHiIzx4PPZyGHDgHU8qIJZGEBW0GLjLdK3E
 9362LaaHkQj1DfuWZrLa/hzfU2wpNORobXks3hRdB+MqT8nMoScQ0AUup2xnKGzsLdO8
 C9vsvtbvNLUIwBf3iQ1rxWHdnIp9K/JAFqsa121hrja4cRxq0TcCaFDF/phECa3SRZzf
 MonlCghxBo1CMeQroIIAmNrkZU+Sn6njs+nXryS2uCrILBE5IE2noGTYvllQx41NpJeC
 hWfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Sefj6GmKZo7igDlOsjRTiCjO4PIBvUZD2ApuNFqE5Dk=;
 b=Z+zeKhYow3QLxTwAZ0FFdRqOaOSuXRj+y1CE23sDdWYb/KR4efsCYSN5NQv0F+8ETB
 EGPXl1h79mtkR7MZjX7bxOumwdoFsfsfYGc5THsCbssAgAkSgLRxKutF35MyWcjALnV4
 eKiS6+sSwnJFyi0LF3sDzigC3wXedLwXDdfcTurifuffLpHM61iDbCJ0A0j74vAapgoL
 cAzN1bdIbQ+DnIefOG7On21fWgv1di8RUAjoHv9xrJdMyfMubEWFYRlQgVGg7awUU70I
 YEy5syc7sen9rWDsVHnaB98OsU9ghTf03xOuLEHlN9MgP4rXLMRcfKvBTt5mTsTs+UHb
 uK6w==
X-Gm-Message-State: AOAM5300joEx9OEIeo1THN1Ucp7a2G1D1X5mjmq10AjD3i3O9wKyYr4e
 9KP2dteIf6whVgLSXxSutiHGSg==
X-Google-Smtp-Source: ABdhPJzzlVfyDgiUofljdKq1aLJ6LTb29HEA4ZEjmznzXO8G5gkduTpuJFvTgQijnRCUntOXhzSbQg==
X-Received: by 2002:a17:906:76c5:: with SMTP id
 q5mr487540ejn.523.1642006754459; 
 Wed, 12 Jan 2022 08:59:14 -0800 (PST)
Received: from wintermute.localnet ([109.128.145.10])
 by smtp.gmail.com with ESMTPSA id gb35sm89150ejc.36.2022.01.12.08.59.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 08:59:13 -0800 (PST)
From: Frank Vanbever <frank.vanbever@essensium.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 12 Jan 2022 17:59:12 +0100
Message-ID: <2116555.irdbgypaU6@wintermute>
In-Reply-To: <20211230155334.16da5582@windsurf>
References: <20200217133806.21237-1-frank.vanbever@essensium.com>
 <20200217145805.18815-1-frank.vanbever@essensium.com>
 <20211230155334.16da5582@windsurf>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v3 1/1] package/fluentbit: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Kevin Hilman <khilman@baylibre.com>,
 Ryan Barnett <ryan.barnett@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On Thursday, 30 December 2021 15:53:34 CET Thomas Petazzoni wrote:
> If you're still interested in this package, could you have a look?

I took another look and basically came to the same conclusion as you. In an 
ideal world I'd see it through, but my situation changed in the meantime and 
right now I don't have the bandwidth to dive into fixing those problems. Sorry 
about that.

Best regards,
Frank




_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
