Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28927E93805
	for <buildroot@archiver.kernel.org>; Sun, 12 Apr 2026 20:42:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A3876171D;
	Sun, 12 Apr 2026 20:42:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u-VK88tqXFJn; Sun, 12 Apr 2026 20:42:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A326616EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776026539;
	bh=m+ckOSuNWTi2Tg03bButL9VV/Z+2LLcQb2slcFIEAxE=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=E4qiRaA9J8U9DREXerY08rT3HCG/ECGBVQnNd38BK52ECqZU/KC8evqGqXutgMPl6
	 uQztLcGjr7FLqfSylf5eN1+dQ2dPZQC9IL825mvcK0yGFyLbiVNrQXaOGLkouEzwtb
	 98VfGNKk1DGkMFjFIL0chPuEirQCbH+mJj6tJHjQjj7wdZ9P6wo9ZIrJbHSgyk+RF2
	 4Sg/7UxXpUYf8peLv7DS7Ak3FxhMcMnfJ0mn07u8zwzPNGl7DsjRlgmVhvRW1uiOGi
	 cnPdQz6NZnl+sL9r6iweReDXIWohtPlD/tYVnAovEEZtrUhKWcKECUjikS/wACY0mr
	 hV2omXSsxJPIA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A326616EB;
	Sun, 12 Apr 2026 20:42:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 911AA283
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 20:42:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 82E138461D
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 20:42:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1uXQbzKTlVy7 for <buildroot@buildroot.org>;
 Sun, 12 Apr 2026 20:42:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 77AEE8461A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 77AEE8461A
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 77AEE8461A
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 20:42:17 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 6E8C8B00535;
 Sun, 12 Apr 2026 22:42:14 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 12 Apr 2026 22:42:14 +0200
MIME-Version: 1.0
Date: Sun, 12 Apr 2026 22:42:14 +0200
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20260412171340.256271-1-romain.naour@smile.fr>
References: <20260412171340.256271-1-romain.naour@smile.fr>
User-Agent: Webmail Free/1.6.14
Message-ID: <7d3e6b0dcbae608a2ee6f14c8eec07b3@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776026535;
 bh=cPTJJap6FAj446j5JlJF9IaNIRnfF5ZoBOpc4mow1Ek=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=iQ/sqq3j4LKrG2OwhlMDNRyLI60X+h6tcECWQaHnPyUNrK8ZLwIJdYuqV9SdVdm7R
 AgcvUmwDYflGmFnoAIDB69wAlyVwC11Q92eMPf3f2w2wrK5KjYlkWIGsaErHcm62Jj
 EwpmA1p27r1UQM2IWVfq1Cy/cZIa2eL2WDlte3X/BgwAeBJf1LlqoIKn5IJeHFjaMH
 idmjRueCNSlToXVKXKpFiuOQzf+ST91nvRo4+HxzErPGPh82CloUMbaDyBKFxaIRNj
 +zrZ0LIwxS+3pRce4JNnW5e8LejPjwftlWx2dYMknTqXq9O/bb7wbLUJxvXuieIP5I
 vvME22c3vqByQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=iQ/sqq3j
Subject: Re: [Buildroot] [PATCH] configs/am574x_idk_defconfig: bump linux to
 6.18.16 and u-boot to 2026.04
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 12/04/2026 19:13, Romain Naour via buildroot wrote:
[...]
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Applied to master, thanks.

Since the new uboot version needs gnutls, so I added:
BR2_TARGET_UBOOT_NEEDS_GNUTLS=y

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
