Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 556C5D7237B
	for <buildroot@archiver.kernel.org>; Sun, 25 Jan 2026 21:50:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 267AD40635;
	Sun, 25 Jan 2026 21:50:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NCWlHVWPb6aQ; Sun, 25 Jan 2026 21:50:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B73C4034A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769377818;
	bh=d33/6qmIY2mztsRL0eTVxW+fz2Oejzdm/QO1lFIcTHM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=YmRgHCa+uDFK49rm2It1G3byPhc7bnJY2+e0/h/HsllheIeHFHPmUFln8yfzEeD1F
	 XlJ5EYeASQQo92GQcnBsWsihG62ehjlYEv/rloB2GkvetsVi+kU2ZtWAz6+/pDuxbk
	 Vhi8S31FuBGyS9XQUfVlWhCS/w0ZAGs3W8HGy8rBn3U9GxMnSHMVw8lmgUaplos9Hr
	 dCpQIbshPFLJjwWutteGGU1arRbXrpvyaymjV/bkiXU9Z4lRjPemyWDCZ6wQfdy2w9
	 CuTO3/W8iJWJxtPDA5PS2KCL8ZXB0YX3KOLzUPD61HmkSpXrLYvUQC52xHk7+4ZUSn
	 3oaUb7pYVzKgQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B73C4034A;
	Sun, 25 Jan 2026 21:50:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E4CA31CE
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 21:50:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D20A04034A
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 21:50:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A_S8luzAjnjj for <buildroot@buildroot.org>;
 Sun, 25 Jan 2026 21:50:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C86AE402E1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C86AE402E1
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C86AE402E1
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 21:50:15 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 07AFAB0053D;
 Sun, 25 Jan 2026 22:50:11 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 25 Jan 2026 22:50:11 +0100
MIME-Version: 1.0
Date: Sun, 25 Jan 2026 22:50:11 +0100
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, linux-amarula@amarulasolutions.com
In-Reply-To: <20260124162000.2396200-1-dario.binacchi@amarulasolutions.com>
References: <20260124162000.2396200-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <e12af35b4650975709906c5c62b24760@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1769377814;
 bh=8PIgIO8aFmF7rECDqBzhxB2qreBh9iyGgpg/voqNnLM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=XsMwIMXZblz0tgXlCRGfXKGTBHu+0ttMF+I8vX0kDS8Y22f+49JD1wPYxQx8aK8tP
 K2TdJTs9o2GVK6VWOHwGNcQ/Czg92a6tgSj9rZK+IxLPNy3IZduJk2p4Pny79hfj8P
 lSEfINMaWedSnTum0k0Oms7q42gZI/9W9GAfluhmQXM0rt1aPvnvwIPe/lr7eV0W9u
 f7efAY9g2uuDocIrbaXoVP1c1XGsnJdpwOlTuqKEBr3H2BtMt5P98PxPCjNhvMddoi
 nguHZ3fw7/K3o+hka0jag5iAXD4FPzZ8iYC8YSBBrKMIt5boG2f8yxL8ING1+74HwF
 SKFSGtlV7YHBw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=XsMwIMXZ
Subject: Re: [Buildroot] [PATCH 1/1]
 board/stmicroelectronics/stm32f769-disco: exit post-build.sh on error
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

On 24/01/2026 17:20, Dario Binacchi wrote:
> Add 'set -eu' to ensure that command failures or unset variables are
> properly reported to the 'make' process. This prevents silent failures
> during the image generation phase.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
