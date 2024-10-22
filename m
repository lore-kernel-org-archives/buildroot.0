Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C4BBCDD0D7
	for <buildroot@archiver.kernel.org>; Tue, 22 Oct 2024 19:18:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3609B40210;
	Tue, 22 Oct 2024 19:18:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dMfjG6DewF9S; Tue, 22 Oct 2024 19:18:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04C2C40499
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04C2C40499;
	Tue, 22 Oct 2024 19:18:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7BB822072
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 19:18:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6A6B180DB9
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 19:18:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YoHeQzfqZvTd for <buildroot@buildroot.org>;
 Tue, 22 Oct 2024 19:18:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 56A2F80E44
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 56A2F80E44
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 56A2F80E44
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 19:18:08 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E997240004;
 Tue, 22 Oct 2024 19:18:05 +0000 (UTC)
Date: Tue, 22 Oct 2024 21:18:04 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Asaf Kahlon <asafka7@gmail.com>
Message-ID: <20241022211804.513ace5a@windsurf>
In-Reply-To: <20241013202118.2828758-1-james.hilliard1@gmail.com>
References: <20241013202118.2828758-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729624686;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rxlCtYO6mdB9f3REUzBqAJZPG00PtnpEKgihRy2TH9I=;
 b=k4AV5hzlDbvKZl+Q2oa4t5X9BotRKs413eRR51TElO1lbMS8TcY9hUEVyfIbg41/wPcZnN
 TbMl6zzpmKz/UbXoVWnmEGXftqNb4GXuCvD2JKZR/3J2er6Ey7nkwgPCwKx4qCbMfrEr6F
 rhSKSAA18cwF2Gdbf1KfTKzUd8d2ins0VwAb1bkVw6IKH1X+XqoxvOMQKxMPKsLF9ZnlFs
 igpt8/17wf1pwhFOOwV7FfnFkG6rU+toNABga9lUfe5v34Sjbwms/Fkif0Hj0C2GwVUxu6
 2wU2ko5gCTIzZumHSlV5L3rCjrFFlefadbxF4S+I9MEXUYxp+iQyMKH9QBj7zQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=k4AV5hzl
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pydantic-core: bump to
 version 2.24.1
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

On Sun, 13 Oct 2024 14:21:18 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-pydantic-core/python-pydantic-core.hash | 2 +-
>  package/python-pydantic-core/python-pydantic-core.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
