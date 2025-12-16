Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76AE3D5CC8F
	for <buildroot@archiver.kernel.org>; Tue, 16 Dec 2025 09:21:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2771182314;
	Tue, 16 Dec 2025 09:21:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id glypJKOgFa0e; Tue, 16 Dec 2025 09:21:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 52E38822F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765876879;
	bh=IMQ/xFPwqZIC5fAb3EpTn4GvZ7nL0oQG9DL14mvpMBs=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=BDqvG9tWmL2nsjle9eOQd0eQvSITKIQI91TnC1lcUq8hYLGt7RFEgN3JFu2g4/1bW
	 zXoehMqjpFBukvYBnfQawLYtBP8XjVQzn5gl+BEOhSiJiWMFP85IIdkVTH+ce8npoK
	 +HDU8jWJ4oAQdQZK5zsQjD8+6Ii3GWeyOqAQp8L+bpQC1aEK6tHvRMZ36U8ps353Qh
	 cYLEOsoHY9eHmBTkw9lCdseg43XYgXoWoNoyJSkeObWlNwJ076GUGH4lQJryMLaD8i
	 oVJsuITP2njI6eBsI1uX+SvVItzSH31nFdqcHCahu35HBXKFzXat7CH4KZvzVKl8Ol
	 ZUdmUSpwzXvgg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 52E38822F3;
	Tue, 16 Dec 2025 09:21:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 38011372
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 09:21:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1E500822F3
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 09:21:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 22ZV4FbAjBB3 for <buildroot@buildroot.org>;
 Tue, 16 Dec 2025 09:21:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4486D822EB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4486D822EB
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4486D822EB
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 09:21:16 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id D18084E41C26;
 Tue, 16 Dec 2025 09:21:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A5A2C6071C;
 Tue, 16 Dec 2025 09:21:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3528B11943265; Tue, 16 Dec 2025 10:21:07 +0100 (CET)
Date: Tue, 16 Dec 2025 10:21:07 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, TIAN Yuanhao <tianyuanhao3@163.com>
Message-ID: <20251216102107.79d90210@windsurf>
In-Reply-To: <20251202210233.2588746-1-bernd@kuhls.net>
References: <20251202210233.2588746-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1765876870; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=PX6SEsPdXg7x2zu62yFq2lDBCAILNP/n84WK0eeRNK8=;
 b=Mu8pUigomjNo5L+smjZS6S1JwID3cH/AEyE0+pcFr38+j3U5qZgW2HCdHAD16ymBK6mhRh
 bqq7soKh+0wDvBNqWSC7R3bAZQtYp0gq5MVnTbq/nLBRsBlv5exPg/XcsWxP8uwlvhXwWz
 +KSJugdwdigh1rzKhk7qIlMpdZgQB0CvHWMqcF8Q4teNPVkMXnnFkpNuR1zCgL9BTsRBm0
 bx9ZLZ1g+KjGiGQdbOk+G0B4D5SIt/g0tslmt/m7Hc36+80etnpdS2F6f5WJiDcOek4alt
 EBM6ox0JW612Ji2QbRyeEb6/5Q0eOYfNo0eWfRPy7lQwBCRSESiRko1hDd+/vw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=Mu8pUigo
Subject: Re: [Buildroot] [PATCH/next 1/1] package/cli11: bump version to
 2.6.1
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

On Tue,  2 Dec 2025 22:02:33 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> Release notes: https://github.com/CLIUtils/CLI11/releases
> 
> Updated license hash due to copyright year and version bumps:
> https://github.com/CLIUtils/CLI11/commits/v2.6.1/LICENSE
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/cli11/cli11.hash | 4 ++--
>  package/cli11/cli11.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to master as it also fixes CMake 4 build issues. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
