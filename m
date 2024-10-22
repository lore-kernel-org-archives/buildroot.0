Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 717EECDD0D7
	for <buildroot@archiver.kernel.org>; Tue, 22 Oct 2024 19:32:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33B5B405D6;
	Tue, 22 Oct 2024 19:32:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kvNraFIg-TFr; Tue, 22 Oct 2024 19:32:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A803405D2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A803405D2;
	Tue, 22 Oct 2024 19:32:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E0E42072
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 19:32:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 59DF540992
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 19:32:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NMbr5X96Fho2 for <buildroot@buildroot.org>;
 Tue, 22 Oct 2024 19:32:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 16A0240982
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 16A0240982
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 16A0240982
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 19:32:03 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CEDC81C0005;
 Tue, 22 Oct 2024 19:31:59 +0000 (UTC)
Date: Tue, 22 Oct 2024 21:31:58 +0200
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
Message-ID: <20241022213158.1e015b9e@windsurf>
In-Reply-To: <20241021192025.201742-1-ju.o@free.fr>
References: <20241021192025.201742-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729625520;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hNtnRR+ED8tP3dyrz0fqOAO4x/7s7uc17dWKKutK520=;
 b=StTZ3A+9D47o/mm+Xfcw9DZ8tkiNED/MaaQBIJRXRW2OtsJ04LhuorAx+vGB0vJW0MhflB
 Ug5ptayls/zxqohBR4LYJ1xzzEsgq2gjxALPqeYvQ3rTYbIdbvoy2TuB4VVvl+m60M5ltk
 lWYkz/7/64Jc1fOIY1oYrUZgokwErvPKW5Sd+GgCIc9CyeGdV5Ay1WLgh/SpsMJ/pNBtoF
 bMCtZtBJxDN4dXQfELjWTMPMMySEpfbQ3X2J6F/tVvhzPU7JwEqT5/i3r3mg8aSimr5irW
 I4pdFjtV/hWMKO/0UIHp4iM4UCuZlptB3/Hnrsaj64t0TzzDbonMuXHV+TWByQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=StTZ3A+9
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: add pppd runtime test
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

On Mon, 21 Oct 2024 21:20:25 +0200
Julien Olivain <ju.o@free.fr> wrote:

> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch tested in:
> https://gitlab.com/jolivain/buildroot/-/jobs/8145740231
> ---
>  DEVELOPERS                                    |   2 +
>  support/testing/tests/package/test_pppd.py    | 125 ++++++++++++++++++
>  .../package/test_pppd/linux-ppp.fragment      |   2 +
>  3 files changed, 129 insertions(+)
>  create mode 100644 support/testing/tests/package/test_pppd.py
>  create mode 100644 support/testing/tests/package/test_pppd/linux-ppp.fragment

Applied to master, thanks. Very interesting test, I really wasn't aware
that it was doable to do something like this with socat+pppd!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
