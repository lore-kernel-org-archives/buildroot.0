Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5274EEB57B
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 09:48:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8BEF581E41;
	Thu,  1 Jan 2026 09:48:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pPLGcxQLdwnR; Thu,  1 Jan 2026 09:48:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 73E8681DE2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767260898;
	bh=2uVMRixOC79YNE8ACAwsJxzLviupce7rje7P40u4vEo=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CSD466XSrMetFkphbdeniR1yFyjeEoH44P0dVcJkAPfJGHAI8EdzGSc4+epiEHnPm
	 eHw4enWsX/x65GgC+GfuBW02Pbzp0CytNkqpUYAO9rzcRjl9DXiXi2qeKNnWrsmNbR
	 zd5IecNVBaLLcjkUCkFU/czlofD5vW5rfmwFDHdRgqGUkHirMytMSqV0XsQ+MjOYpt
	 5ccgc18G/dhRrV6mrJc+gjaFq3pjChRWo72wIurMie61N/1mk49sjtWS4OQJSsKsXC
	 eC5Sv2R622/L6sZocAOoYGMAmQXUmLnn1DcrYX9LcDY0cZ6toemC+kUuX1hDhCggLL
	 5t8kb6R9/X5Uw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73E8681DE2;
	Thu,  1 Jan 2026 09:48:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 90DDB206
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:48:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 78496404A0
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:48:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fIIIJYdtbouY for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 09:48:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 794774080A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 794774080A
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 794774080A
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:48:16 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id DAEC31A258F;
 Thu,  1 Jan 2026 09:48:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id AC004606B6;
 Thu,  1 Jan 2026 09:48:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 216C4113B071F; Thu,  1 Jan 2026 10:48:14 +0100 (CET)
Date: Thu, 1 Jan 2026 10:45:39 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <20260101104539.04749460@windsurf>
In-Reply-To: <20251231184506.3945592-1-james.hilliard1@gmail.com>
References: <20251231184506.3945592-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767260894; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=nIDa8QOjB0V+tUb4LXZReOacfkCXKJckj7B6/RHYjc0=;
 b=UI/pSKrgW4B++Nor2w/JtvQnbMg3WIQ29COSNIbB0CSgm2l7D0norOXDFBtiR6GSWP9RGc
 OEWEabTFdL/lIbhev9y1taH8ruLe/pLz0g1Yb8klYJyo0xxuEONq8tQtqaVNmpTwZBBDVg
 HkN7GQk43eBmE3tYQRR13/n3oSVgKzG9VHZy3mYzgpGjRlUIy2BQeNiIyeAuYBIlVL4Bkr
 vpi9eosrh+sOvnlLDo7xoQzGNllqgA4Q1C+Z14Bw2lpVnCRTihDIn9BJSdtxhvVemJtNVp
 x6awBjGo1alGxwkXTX0gMG1MtCdG0f03+AoqjZQfLjYf8RYl5U7QaTlIPkV/HQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=UI/pSKrg
Subject: Re: [Buildroot] [PATCH 1/1] package/python-types-psutil: bump to
 version 7.2.1.20251231
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

On Wed, 31 Dec 2025 11:45:06 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-types-psutil/python-types-psutil.hash | 4 ++--
>  package/python-types-psutil/python-types-psutil.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
