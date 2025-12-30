Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC2CCE95A8B
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 13:04:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF0BD81E22;
	Tue, 30 Dec 2025 13:04:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sZE1XsyWPcId; Tue, 30 Dec 2025 13:04:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 85B8381E35
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767099889;
	bh=729mA/RyUt55Muu6KBFl/DePv6ca++KukgcLpwavHxE=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=r8iSqEJX1g1JmWKJgX7l2x/zsYpShS0QUpAV2qGT5d+tvD8hno1GUqTgTi9e2pmmI
	 JN2S2PMq6n7Ur2VkaZh8OmQ1+L7c98RmPrYCyxH0O8R8mAGuog0GUeoj4o6td+q26l
	 LMqWetUrBYujoIWolxO/l4mCsH2qrLnZapGozM73deML0gPrjIrQQQxnK4My6JtAxU
	 RWNylm4v2+TYI9pnd2iNyf93dJXihRQBZ52qCp4/rQ1hQEHj3W9GAAlV1ec7u5VSJz
	 Qh72pktu+ManTFFwpXLPbdNWCL3pgRKBCCKy7jBCLOFlFdTbs5ll5V42H4ZU0Qptyl
	 mYnZjg3+2jzxg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 85B8381E35;
	Tue, 30 Dec 2025 13:04:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B5C88D8
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 13:04:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A870D80993
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 13:04:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4q3NT-8kQed0 for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 13:04:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6A2C481E35
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A2C481E35
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6A2C481E35
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 13:04:46 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 11AD3C1D734
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 13:04:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 9F3C56072C;
 Tue, 30 Dec 2025 13:04:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BA401113B07B2; Tue, 30 Dec 2025 14:04:42 +0100 (CET)
Date: Tue, 30 Dec 2025 14:02:31 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <20251230140231.051a1833@windsurf>
In-Reply-To: <20251228222027.2768711-1-james.hilliard1@gmail.com>
References: <20251228222027.2768711-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767099884; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=4C230LEoQ7iOgBTI+OolADksba4g4eiMW6NqL4dW85c=;
 b=SH5D8KAprKucisAGlRo0SMuoMpc0NG3rOh/Lkk+MrPBqoynNO0/8s0xOqXfR9tYrF3F35l
 g394hfGduJSMAkDrvZKNZCIJiEnjfq3bLN6ujXHpk+syvHLw6ENt5+CGEdKbFFVvk1wm0M
 TCyjel9hM8PU/EFH9f3i4KvHHqtA6HeBS7ZOBcnq7PRDxiRjHN3KtReHdgjUH3jfnGFU7P
 Dqat9J20jR4yamiOt9ppxa5Fnpwj1i3qfJ1bFORhjsgoLL2sFD4UDasAz6Q76z3PCclNSH
 AXFSP/hGS5klZlvz0uiWMxG1drVOtScVj01u0XB3JwshvWGrAsDPJ9lKD7adBg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=SH5D8KAp
Subject: Re: [Buildroot] [PATCH 1/1] package/python-tortoise-orm: bump to
 version 0.25.3
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

On Sun, 28 Dec 2025 15:20:27 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Migrate from poetry to pdm pep517 build backend.
> 
> Add new python-anyio runtime dependency.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-tortoise-orm/Config.in                | 1 +
>  package/python-tortoise-orm/python-tortoise-orm.hash | 4 ++--
>  package/python-tortoise-orm/python-tortoise-orm.mk   | 7 ++++---
>  3 files changed, 7 insertions(+), 5 deletions(-)

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
