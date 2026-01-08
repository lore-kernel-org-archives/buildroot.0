Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FC0ED185CC
	for <buildroot@archiver.kernel.org>; Thu,  8 Jan 2026 11:11:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CDF5E60DE3;
	Thu,  8 Jan 2026 11:11:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VwyaZETc040w; Thu,  8 Jan 2026 11:11:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7694A60DC7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767870675;
	bh=xUysQhT4dyKYwsJr42zLJHsMzScBhgSvw+iiH0E80mI=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Gs+T9IQWsU0nw/1BN9WF8qBbho5iHYyyWiKCX1yP+b0CMpgM4Kqf7Ixti1HbTopyQ
	 WSPQQ9vI6z4ZX4Y/WEzMTXVSZOq85uZMgSeMOFU1ohqXFN9hzMk7riOXfad/27JKqV
	 qrZOJ5vWiG5zqyt5abw/RbGalcuIp3GtzgRIPuTMFULTP57GrnBfnWzqLk0D7e8FvV
	 gqoKxgwOPrdgRiDCvVWEhBFticQfG1t6nFsWIaKa4TJr/nXKNHv1ItVjiZ7Y9RPcMA
	 BwGaGexiYiKOYWFpBXUJsHXLQIuC3NFj6qfgu5SJVrY08K6VVYRSArfSmu22vRQoGw
	 6Ui4oDA+9lXrQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7694A60DC7;
	Thu,  8 Jan 2026 11:11:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 54A592C0
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 11:11:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 46BC760DC7
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 11:11:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GyZk8R8UW8JC for <buildroot@buildroot.org>;
 Thu,  8 Jan 2026 11:11:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5299F605A8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5299F605A8
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5299F605A8
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 11:11:13 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 67EEF4E41FF3;
 Thu,  8 Jan 2026 11:11:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 32887606B6;
 Thu,  8 Jan 2026 11:11:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6F03F103C8829; Thu,  8 Jan 2026 12:11:10 +0100 (CET)
Date: Thu, 8 Jan 2026 12:11:09 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <20260108121109.183a8ad9@windsurf>
In-Reply-To: <20260106023038.2231960-1-james.hilliard1@gmail.com>
References: <20260106023038.2231960-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767870670; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=j0oOAAq3QWY/8gNFJa2KrHLARM8RK0smtnsFn6U6gDk=;
 b=ZUxLEhLqn/0rOOtlHHJxv2ZHOVdF1r5cyydi0yuf7fpQUgsiurn2d+vq/09tGilhusDm4z
 clPABm+5zweq9G83RRBQoWjVcBFPYFoKR/gi/2OSVBJFzDfXrCeNL4CgWeNVCdd7MMWGtC
 hDQKlMiaIwHfyPUv49ICRgV9IYXFWJqfe16ZVTt3kWDslPeDbYFnVrTk0rdt6xoCWseI8g
 C1K8U+aRrPoikov0/fmzTuqFNNOg3i8yBBEgKzNqKCHbwARLTSJcWwCjdG/3bzZ5x2KlK6
 Q1D4HjeKWc0B24mEQgtCgrriaSonhYVvEy0U9MLNpNVyPK/0ClC1GLLeKzBsEg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=ZUxLEhLq
Subject: Re: [Buildroot] [PATCH 1/1] package/python-aiohttp: bump to version
 3.13.3
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

On Mon,  5 Jan 2026 19:30:38 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-aiohttp/python-aiohttp.hash | 4 ++--
>  package/python-aiohttp/python-aiohttp.mk   | 4 ++--
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
