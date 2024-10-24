Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA211D1036C
	for <buildroot@archiver.kernel.org>; Thu, 24 Oct 2024 20:48:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 971E060DB2;
	Thu, 24 Oct 2024 20:48:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LSIrbjPNBQIi; Thu, 24 Oct 2024 20:48:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A758C60DFA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A758C60DFA;
	Thu, 24 Oct 2024 20:48:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 83DC1497A
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 20:48:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7281E8125A
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 20:48:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JUjSWx51r2ym for <buildroot@buildroot.org>;
 Thu, 24 Oct 2024 20:48:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7F2888122D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F2888122D
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7F2888122D
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 20:48:28 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6C88C1C0005;
 Thu, 24 Oct 2024 20:48:26 +0000 (UTC)
Date: Thu, 24 Oct 2024 22:48:25 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, linux-amarula@amarulasolutions.com, Juha
 Rantanen <juha@codercoded.com>
Message-ID: <20241024224825.1d9b8aa6@windsurf>
In-Reply-To: <20241007164616.373051-1-dario.binacchi@amarulasolutions.com>
References: <20241007164616.373051-1-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729802907;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0/3hKctIXacrBdDo8cacS4oR0Uz3VWmbjkiIKRzOHs4=;
 b=AYq/hDGQQeZ+jKVIgCGwj1YKZG7EbZWpUKr53wi9tGo8tqZJI7lmbbPHtuAU6oSTNajMXG
 NWcVgntIJWe7xidM7zoxKcI7HsoXogWIr3xTVkIIJ2NTKi+PatJIJi6CZ6vG9gArvKlrAk
 6enQG6xqmaXXL9cMzQBYjD+4i9RU9/+hSJ3v5eTTRyLXlbMfG6vMUOpHtXoM0dQc1qLupP
 BrF3X15WDzWPUGCR/PlDn/yLNPoSVzdBFyIibi/TbQHXa6B+ST2bsbTxWEPRHayQ9ILzDm
 0BgM2/eTVNs1/22WdIO465MbcNF8nZVS8MW0DxY8bKZHRdeV7zJ3kMiyT1l+6Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=AYq/hDGQ
Subject: Re: [Buildroot] [PATCH 1/1] package/acsccid: bump to version 1.1.11
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

On Mon,  7 Oct 2024 18:46:16 +0200
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> Release notes:
> https://sourceforge.net/p/acsccid/news/2024/03/acsccid-1111-released/
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  package/acsccid/acsccid.hash | 8 ++++----
>  package/acsccid/acsccid.mk   | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)

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
