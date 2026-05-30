Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9085ACD6E49
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 22:06:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D9DC60802;
	Sat, 30 May 2026 22:06:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hWbK_5RmgJ0g; Sat, 30 May 2026 22:06:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B8266085B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780178790;
	bh=GSarQg0gg5YQhRk4qh486LYz6QNKoYvXCMQr26YuCBs=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CzpOEWvigFdL7ar8Ckgg9aInNPz+qk84MG0fAV46wF7urP6Z0Lidu3eT7MVYqqEY7
	 xdJviSJV8Ht+1/tmCP8pex0IxCt9zScotDC7tG/WHczdqD4Ya3/JaMPJLz4o4Zq2Qd
	 aW8/TRsUyulNwNZuFkFrCs9MQfIIC5YuO6HzZOTTbb250UTwEBnRz05zPziaR23ckC
	 e3YbmSl8LaGcyzPJtlox2OstL3wtCJJHYHvf8PXLDxuQtjQvCGIAiytETdFB02S7+J
	 O0SlewTGDzFqzTGwpNvjrpivgl+d4Fd5mTFc8NB+Z1Vec5Ti1NDtiRb1Lf4g8qdQA6
	 zhcpVXZmPSvDQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B8266085B;
	Sat, 30 May 2026 22:06:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 19FD4F4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 22:06:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F3DAF6085B
 for <buildroot@buildroot.org>; Sat, 30 May 2026 22:06:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZuGIYLghELqM for <buildroot@buildroot.org>;
 Sat, 30 May 2026 22:06:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EDC2F60802
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EDC2F60802
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EDC2F60802
 for <buildroot@buildroot.org>; Sat, 30 May 2026 22:06:27 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 4C2531A3755
 for <buildroot@buildroot.org>; Sat, 30 May 2026 22:06:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 21F386073B;
 Sat, 30 May 2026 22:06:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7B10810888CC7; 
 Sun, 31 May 2026 00:06:25 +0200 (CEST)
Date: Sun, 31 May 2026 00:06:24 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
Message-ID: <ahtfUmHn-ZIo34C3@windsurf>
References: <20260518144828.1855670-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260518144828.1855670-1-giulio.benetti@benettiengineering.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1780178785; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=wcjKE+lEOyQT6lguUdapnYBFEN9aIAJ3WAdGVCWovxo=;
 b=f8Kx7nEfzrBrKbYP6Lx9UjvnhaLLfnvPh77i+7X8/cB24SVsZhVs3uHwT/JLMGVc7b+hMU
 BaWm3yLwYETof7OKnRVtinKEU0jxQY0wpBoI0T08v6JwhcPeJu5/aEeHrGUGj3BW1uj6sx
 FA8W4IT2/7XbFN+HMVJHjnJMbQ79kwQLchf0Yd8g3z7DvXY7/3Rv5luyQzTJThMYMODOTl
 tflxur53KaJ6pu+CXfy8sxTNK2OvG5GkJ3MbXwv1djWUWpG69H+q30Qmdk/oqkgA4pWTW5
 Mqjbgf3vBpv7YyPHLTkPlfpauj9xpLDto4rR6LF6j4Hop7Hm9PwEvZLCNiy5+w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=f8Kx7nEf
Subject: Re: [Buildroot] [PATCH] package/esp-hosted: fix build failure with
 Linux >= 7.1.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, May 18, 2026 at 04:48:28PM +0200, Giulio Benetti wrote:
> Add local patch pending upstream to fix build failure with Linux >= 7.1.0.
> 
> Fixes:
> still not occured
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
