Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E23FE95A8D
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 13:04:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 52AA781E4F;
	Tue, 30 Dec 2025 13:04:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uZqY7ENFuCWg; Tue, 30 Dec 2025 13:04:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E59C81E37
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767099877;
	bh=peiZWv7aeCOvqaUMTzA5VenzTHtfYNyPXiORzooBG+g=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=fx+to0VB0hwO3EitgLZfIt7gvewuG+rCrc/A8yn5U/nLLdMj3P4n3sf98wVJlOBrX
	 xHaS8Xixb9eIZpRtzpDJbEWGsG/eRHZBk547G/WSU5pQjY+bvLscqpI8ill+JzGvUA
	 yb+0wzsRz1Zgx1u9tdKjcHD3luGZBJV3a82lPjbXe7+EKwXyZgRyaKvFqrT9p0CCmR
	 DbhlQ1DDC4IU433x5nuEiJ6zqVx0riIx94K4jcIF7WQwF+cZmlsyp1ou3tkvQ0ahKg
	 3CAE7ENLqpEygO30X/y5OQhdwgYjZloJEYDu9F0+XSAHcfx8JIGYDUn/kN3Xa/C5Dv
	 hLWYia43+6DLw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E59C81E37;
	Tue, 30 Dec 2025 13:04:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 939A2D8
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 13:04:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 85EEB40796
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 13:04:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1Zez3aanMLQA for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 13:04:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7B8DC4077B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B8DC4077B
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7B8DC4077B
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 13:04:35 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 34631C1D734;
 Tue, 30 Dec 2025 13:04:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B7AAE6072C;
 Tue, 30 Dec 2025 13:04:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 20ECF113B0643; Tue, 30 Dec 2025 14:04:31 +0100 (CET)
Date: Tue, 30 Dec 2025 14:03:52 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <20251230140352.3d83c861@windsurf>
In-Reply-To: <20251229053411.3468160-1-james.hilliard1@gmail.com>
References: <20251229053411.3468160-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767099873; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=4rpgh57s8AFXPmEUnKXSqbfbU338LYERrKqLo5dDeUY=;
 b=GrGRVcpXMoHB774yaSMVNUOe3eVZRKobr4IOJiyHrQorcPq6aUD2neRrn++9QTMWHWKGrx
 8190Uj9YDw2kfc+uiGlTfn6fMR+2gqj9Do+1OPUxAdXGbq/LZgS1H18K9hRKjwyvyhDctC
 oVyNAWEth1fA1ZUBHYkZ9c3bpCG7rV/o/wWXzjs+ESBtQgoD6HZszoJvZ7mHkfeK0J/iAg
 Yn64buuh1bomaxJ7rxHkWKJxZkZLjWROTERqV+hJsl4koFp3drmwaKxCiYq3vefqtOLGff
 yQLiPHBv364UNUH3XhxxWhnovIVIeC8xsMduqAOlJS69uxaZQlnFBNZg6uxSBA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=GrGRVcpX
Subject: Re: [Buildroot] [PATCH 1/1] package/python-secretstorage: bump to
 version 3.5.0
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

On Sun, 28 Dec 2025 22:34:11 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> License hash changed due to copyright year update.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-secretstorage/python-secretstorage.hash | 6 +++---
>  package/python-secretstorage/python-secretstorage.mk   | 6 +++---
>  2 files changed, 6 insertions(+), 6 deletions(-)

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
