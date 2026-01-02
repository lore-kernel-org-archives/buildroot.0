Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63972FA3755
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 20:52:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B5ED8142B;
	Fri,  2 Jan 2026 20:52:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z0wbW0MNWLv1; Fri,  2 Jan 2026 20:52:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F786813AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767387167;
	bh=6ckegocqbs4KK7/rPFufuB0cN4krPfoc4EOIagKhxUA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=PGbnLHNaMKn5BYzYK24e08wXxiXAOCZNH1nXq9ZUbfkmC2ak/x5zSD96I2/fIiAkz
	 R3z5E3R8wyOVP83K05677AwcRD1Z45isJJBtjLGXxFPOZ+OIcNL8+M2a3mGQsZcBqX
	 r1jvjDusMdtY5u9LwXWDR3w0QiijKwt90mr+QozAAmO/WB/Z0hT2Rfz7gKzj5XdsFM
	 pyRZpSq7/BC86hTHCMEwFBILCpxWEjruphnflbMFMb/yiwKmb+m5UAiZTpmo+6b6su
	 i0oaIFRMVuXMgYJK1wJB5SBpRsKnA0ldaCdiHQpK5kmryBboaMBqTeuJ7D7bWFJDxx
	 IP508OjKXJW8A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F786813AA;
	Fri,  2 Jan 2026 20:52:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7CD48202
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 20:52:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 633E96089F
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 20:52:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NiuBDyIzE_7G for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 20:52:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 80E4460841
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80E4460841
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 80E4460841
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 20:52:45 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id E0B354E41F02;
 Fri,  2 Jan 2026 20:52:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id AF2A0606C7;
 Fri,  2 Jan 2026 20:52:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id ECCE1113B0443; Fri,  2 Jan 2026 21:52:41 +0100 (CET)
Date: Fri, 2 Jan 2026 21:52:41 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <20260102215241.0cc8c098@windsurf>
In-Reply-To: <20260102175032.1918906-1-bernd@kuhls.net>
References: <20260102175032.1918906-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767387162; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Dq2iz77bC+r7jOFWP6qEiHlq5D/kQ7KLZpgele64+Lo=;
 b=Tt1ZzcDAUBLGxjTXQKo9ap5hWVggLLMInDpPqgJCkTcuFiACRsE6GjHx38wSeDnHJ1hkeU
 mU74qcTmc0PB0Hkg/RgdqMwh6d4uJASTXxupJEUDKvT0bH7Q3jZptmWA5F80uKq8vDXny9
 ACa3el7xZ/CIum4kNHFIrMz9JiCkjMGS1Eqn70zltRRtAmqBYQAa3OX1YfkFUA0eIZ5PWp
 E5wowaMim5+4eoDn8pvUbSfbFvXeYiMuo1IZq3iARB/FmBoOoGF2jxDgz926jdQSX6Z8vj
 av/dGzSaGHJOeSjQFT54wECeN1jykhNHJcrBiRfGIswU1dIltwxKONW1ohVdqw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=Tt1ZzcDA
Subject: Re: [Buildroot] [PATCH 1/1] package/libcorrect: fix build with
 cmake 4
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

On Fri,  2 Jan 2026 18:50:32 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> Fixes:
> https://autobuild.buildroot.net/results/44b/44b881a3455ff6a77f29532f25c12c40c34ceac4/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
> Patch 0001 was originally added by
> https://patchwork.ozlabs.org/project/buildroot/patch/20251203215723.2323032-11-bernd@kuhls.net/
> but was not part of buildroot commit 1a9e812d24c4e609c65e3dc39813e0c61b20966f

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
