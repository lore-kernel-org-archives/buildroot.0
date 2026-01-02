Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48AC4FA3758
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 20:56:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B33080981;
	Fri,  2 Jan 2026 20:56:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wuMmz0yDbLtM; Fri,  2 Jan 2026 20:56:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0EF6E816FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767387379;
	bh=DY0lACf25FXvuOu4uSMomR7CeXlR3M8MX7nJm1lNHZo=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kvRzSe6w9G4oAAh8AhCqAy+/BOkJyv6sfv/aQbSn6kDYVH9uazc0ingrfSnvjJjZz
	 1UI1MLK8AD1dDHxrEcR1hKZILuOy8UaAjWs6sw19rHEkTC/mDqhF+9A8eju7GmXhe+
	 QROyBpz+7RujB1+8HdyLQKPWuoDGf2PZ7htpgtDGnbePXBDVGeMj0R486dzv2N90Hu
	 exOwVCQrJwLUrqd696vRdlkkkPGnBNv3Z293P2ZZEawuYtbdvb2BC1khPnF0g8xnVf
	 U0ATNYjQcDhEDyseEQm6shu5prUeKhH5cHCdpTc0cz6SDZPhHKGuSkE8EWBjbaNtUs
	 Ppx7EXbj2ZbuQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0EF6E816FA;
	Fri,  2 Jan 2026 20:56:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 992B7202
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 20:56:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8AE57608F6
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 20:56:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OXBkAYiDHgjE for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 20:56:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 806E76083C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 806E76083C
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 806E76083C
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 20:56:15 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 555894E41F02;
 Fri,  2 Jan 2026 20:56:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 20649606C7;
 Fri,  2 Jan 2026 20:56:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0716E113B023D; Fri,  2 Jan 2026 21:56:12 +0100 (CET)
Date: Fri, 2 Jan 2026 21:56:12 +0100
To: Julien Olivain via buildroot <buildroot@buildroot.org>
Cc: Julien Olivain <ju.o@free.fr>
Message-ID: <20260102215612.6747b549@windsurf>
In-Reply-To: <20251223194547.293956-1-ju.o@free.fr>
References: <20251223194547.293956-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767387373; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Faqe7+yGG2QUuNUcakcyEB4YyaS6+d1D6B3M6JnZHio=;
 b=Sfr0FhVIXPg2cpmschgrDt9Qs/EiChpDLuExm488DVSVK+KMYjLdWQn4F4/2pWPw8miVXN
 9AUgaABiBrT3Yqm6k+sLnaFdaxb1ojUceoaknDUp/znQN1C4SUNNi0HAGgpZOTIw1U3MGR
 IJCYX0BFGPjfS67S/RBn/GqziwHfvzBxAmcOfqkhueoT+dvs/lXfd9aT8ug9jEo4K9YC+A
 GG2HW+BMcY9Hd7MhsI4BM6eEoVVaD6eWwMlT9O9ht+ZIlNuv261eFmA9pgLSd9qNMPw0ot
 r7fEoF3Jg2yzjF29W9k324o5TFrC26QL9Tc7JT9PcW3lTGgX5dOeTMJreo8KnA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=Sfr0FhVI
Subject: Re: [Buildroot] [PATCH 1/1] package/oath-toolkit: bump version to
 2.6.13
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

On Tue, 23 Dec 2025 20:45:47 +0100
Julien Olivain via buildroot <buildroot@buildroot.org> wrote:

> For release announce, see:
> https://mail.gnu.org/archive/html/oath-toolkit-help/2025-07/msg00000.html
> 
> The COPYING license file had minor updates in [1] and other license
> files were removed from the source archive. This commit refect those
> changes.
> 
> [1] https://codeberg.org/oath-toolkit/oath-toolkit/commit/e0fcb3b73d788f0cafdaff0a069e8273d9987777
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch tested in:
> https://gitlab.com/jolivain/buildroot/-/pipelines/2230445114
> ---
>  package/oath-toolkit/oath-toolkit.hash | 13 +++++--------
>  package/oath-toolkit/oath-toolkit.mk   |  8 ++------
>  2 files changed, 7 insertions(+), 14 deletions(-)

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
