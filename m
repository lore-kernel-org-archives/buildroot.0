Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDBA1D1CA00
	for <buildroot@archiver.kernel.org>; Mon,  4 Nov 2024 21:56:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D123880E47;
	Mon,  4 Nov 2024 21:56:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BLxVwVJyZcXq; Mon,  4 Nov 2024 21:56:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C1E2280FB9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C1E2280FB9;
	Mon,  4 Nov 2024 21:56:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id AE42D723
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 21:56:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9AED780FF5
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 21:56:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a7PhZL6gaZTD for <buildroot@buildroot.org>;
 Mon,  4 Nov 2024 21:56:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0F58A81025
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F58A81025
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0F58A81025
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 21:56:40 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3E0E71BF205;
 Mon,  4 Nov 2024 21:56:38 +0000 (UTC)
Date: Mon, 4 Nov 2024 22:56:37 +0100
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
Message-ID: <20241104225637.73691b7e@windsurf>
In-Reply-To: <20241027212732.3337953-1-ju.o@free.fr>
References: <20241027212732.3337953-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730757398;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5Gy7w2JooaWDqUOeH4L8PIR5hphBONTelJYbbs9qTng=;
 b=R3mpq8j866PwgUr1VniDzk8FhkHd0D5rxRdRmY6ZVFJ28KVr9eHaZpPV+NnVSttdIrJE0J
 OECYgNVdKw9cnjGj7UtVlm1Q3+mGyOpzYZHT+u+pwb8iew1UD45CLA5nrNXA2CnI2HQheQ
 sF5g5GRSITdE9NkYpU7PcQ79Ue5+0BED+PISDZk33wTbXPGbotYOxklvB1wLJrwAp6Rdgo
 H2G4HFYxgbjZVJomf6eo8Lea7DUmdMH6BLCa40ywPz8oWHFgpjEyXWRe3pfNMqWQ8GN/Ws
 y/wTJ6ATQQQTDyjSugY504bb4jMJNVjz9vHf7cRTe38DUGluZsR/esv3V8QGWA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=R3mpq8j8
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: add audit runtime test
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

On Sun, 27 Oct 2024 22:27:32 +0100
Julien Olivain <ju.o@free.fr> wrote:

> This test was suggested by Thomas, in:
> https://lists.buildroot.org/pipermail/buildroot/2024-October/766091.html
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch tested in:
> https://gitlab.com/jolivain/buildroot/-/jobs/8199781301

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
