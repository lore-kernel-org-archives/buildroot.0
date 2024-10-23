Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E37E6CFA466
	for <buildroot@archiver.kernel.org>; Wed, 23 Oct 2024 20:13:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9842681254;
	Wed, 23 Oct 2024 20:13:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7MM6jUndg9Q9; Wed, 23 Oct 2024 20:13:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C75E081270
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C75E081270;
	Wed, 23 Oct 2024 20:13:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 773F54960
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 20:13:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 65A8860771
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 20:13:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jq3e9L0uR7Ii for <buildroot@buildroot.org>;
 Wed, 23 Oct 2024 20:13:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 33E216082C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 33E216082C
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 33E216082C
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 20:13:47 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 28D9440006;
 Wed, 23 Oct 2024 20:13:46 +0000 (UTC)
Date: Wed, 23 Oct 2024 22:13:44 +0200
To: Scott Fan <fancp2007@gmail.com>
Cc: buildroot@buildroot.org, Maxim Kochetkov <fido_max@inbox.ru>
Message-ID: <20241023221344.5e5cc674@windsurf>
In-Reply-To: <20241023002753.146238-1-fancp2007@gmail.com>
References: <20241023002753.146238-1-fancp2007@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729714426;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ChRzhsZq2OAsAE4HmF/MKg/KIq4754xEWQeIeDm2L6w=;
 b=VgOOCVk6mHAYA/YaQIcJz9MNdWIe9KIiCVAWaOw7ooNblkTpwoz4zghvITNTZUHuCMgS0U
 rvKd1y/QdF2h72kDYG9bjWZnazfCi0YUNcF6y4/wGUmDAfdfc4uJ00WiFcsFqvZMPVAG7C
 v9CJYFJ9Liic5mm7abVylc1+UWfNwc3EZdWYoO1xtNTMBto+8znjes4BgybLbilZWhPdG4
 qltJJ7QzrCG7YBW9Ez0zU/7dnnu2JMPBPTQtYo9ZkGQUcLdbHVBjLsPTLxmmeYC62F+B9q
 yVSEe2zJ0BoB3QAIAAZQ7beY2nsBDh/ri+AFMFBb/Qt5W7nvNVmlSDo8oeGM0g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=VgOOCVk6
Subject: Re: [Buildroot] [PATCH] package/timescaledb: bump version to 2.17.1
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

On Wed, 23 Oct 2024 08:27:45 +0800
Scott Fan <fancp2007@gmail.com> wrote:

> Release notes: https://github.com/timescale/timescaledb/blob/2.17.1/CHANGELOG.md
> 
> Signed-off-by: Scott Fan <fancp2007@gmail.com>
> ---
>  package/timescaledb/timescaledb.hash | 2 +-
>  package/timescaledb/timescaledb.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
