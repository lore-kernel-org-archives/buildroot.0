Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD532D5B15D
	for <buildroot@archiver.kernel.org>; Sat, 13 Dec 2025 17:25:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7536E60722;
	Sat, 13 Dec 2025 17:25:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2qiQ3GL3AoQ0; Sat, 13 Dec 2025 17:25:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15BA960677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765646715;
	bh=dtFHNonFp4LSVM/oAEiljuihsUdIAF3cgj5aFPMhsJY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=RibMWi9WWVEQk8WwjfzVyvVPIzL2+o679AaC8nhUtEZto/AftGa9GbhffYNCeCf1U
	 y45wmtWxhvhpiyBKLKPkQwkzai/87Trq/Wk9IRwok0e0wFPXNtTCR7KvIi5IYxi+93
	 TkyCm/wR7yIS2zhS58jNp4nyfUJe9G2bSfiX8AkMSUvPKkU6twGVZ6ityHD7+3ubWX
	 Mu8enOWQeIlJyptYUW9XFxlfyCt84sbn/D+1qUM6/cdY4lhmxfcp+37PdoR/kRsm7e
	 uMAJDbBGcRxdhOGRKXJ6BUQiNi1YhA4FLU0GERK0dRRuPrpH4et94j5laDMUQEqXGh
	 7N+XPIevZzA8Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15BA960677;
	Sat, 13 Dec 2025 17:25:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 11DF22C1
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 17:25:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EC78940072
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 17:25:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hsZYtAo5l5Oi for <buildroot@buildroot.org>;
 Sat, 13 Dec 2025 17:25:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0E6884006D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E6884006D
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0E6884006D
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 17:25:11 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id C38134E41B27;
 Sat, 13 Dec 2025 17:25:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8A3206070C;
 Sat, 13 Dec 2025 17:25:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EA581103C8DE5; Sat, 13 Dec 2025 18:25:04 +0100 (CET)
Date: Sat, 13 Dec 2025 18:25:04 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <20251213182504.51421c81@windsurf>
In-Reply-To: <20251213143008.1329736-1-bernd@kuhls.net>
References: <20251213143008.1329736-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1765646705; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=oHlKugyqnMZn/YlyHPu3iuJjne0lX5Jxkd3JK+XibyU=;
 b=b4kmVyUmMdwHGt3FjxoIf9acY71xWL7SigyKtPA5qhASAm6/pEx5eFyWhAGOq9ghJEpp4c
 qvSOUPQXCj0f77bfVYPrHbkI26jZjr05aFehB0g7GMtF4S28YcygSZiPyMXWPwK8tnfWKy
 7OseffOz1lq5Pt7oTOifEsePGP2wx6g6E+nmkAHfEYk/xstF/NQC7GlAHi3tsD3xIIhNjd
 mNiArzAKPBPj8L+AtiTb+1koVni4Y90NHwIjPuhZPY3juqW54jfIeXWkkkLQ4oqw64Wkhg
 1JBMeFYEFoD6ssus93ceuuysaM0psdpB0Zo6XCMB+23VKlfqqnoPTYPMbcnwrw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=b4kmVyUm
Subject: Re: [Buildroot] [PATCH 01/16] package/libnids: remove package
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

Hello Bernd,

On Sat, 13 Dec 2025 15:29:52 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> Analysis of https://github.com/MITRECND/libnids:
> "This repository was archived by the owner on May 20, 2025."
> last commit: Dec 2020
> last bug report: Jul 2024
> last patch sent upstream: Jan 2024
> 
> The package is broken with gcc 15.x and no other package depends on it.
> 
> Fixes:
> https://autobuild.buildroot.net/results/f22/f22c8954894ab9ca57df07571726140c5bf3499a/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Thanks for this series. However, in each patch, I don't see the package
maintainers Cc'ed. For example on this e-mail, I don't see Guillaume
William Brs <guillaume.bressaix@gmail.com> being Cc'ed.

Could you resend this series, Cc'ing the right package maintainers each
time?

Here is what you can throw in your .git/config file to automatically
add package maintainers in Cc:

[sendemail]
        ccCmd = "$(pwd)/utils/get-developers -e"

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
