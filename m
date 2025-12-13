Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8474CD5B15D
	for <buildroot@archiver.kernel.org>; Sat, 13 Dec 2025 17:56:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 36E4281BF4;
	Sat, 13 Dec 2025 17:56:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qWV2S6n55rap; Sat, 13 Dec 2025 17:56:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 64F5281B69
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765648567;
	bh=5CmbMJ+Inch4Hb0Tw2UqxoPLArDI2zXVoKfN9QYPJ1M=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CKkCM5NzskHQ779z8FceUBq8H7uVioVZDujhB0PMfE2HTQ2JeOypwNidEiDw9sU/f
	 ERHylebmu3Bul+XzfByrhz5sPMNSSn5qKiyIsM/eKoibEU7yhASH1ZqGvM2lDHG5ML
	 +th+xJA+IhVgH/GozoQ2AkuQ9tLI7B1ZGxZI00Onsp7rQsVlo55W8UiavwSIKRjEth
	 G3NAkRbadbqWd3C03gRkYsGb2bso70kT//DYvpRsR+EY8JrErzm+Jq+VqjpuoW9o1C
	 DJ/xmqtGDvzAVO0ySgTf3Dd+75jnclvDhZclpRO+9bx/KAe27ajXy38y0irXUk5ej1
	 yTZlJ8ZTsn7kg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64F5281B69;
	Sat, 13 Dec 2025 17:56:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5D764117
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 17:56:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 50011402CE
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 17:56:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z6g4FnkzBOFj for <buildroot@buildroot.org>;
 Sat, 13 Dec 2025 17:56:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A2BEA402AF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A2BEA402AF
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A2BEA402AF
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 17:56:03 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id B10164E41BD1
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 17:56:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 62ADD6070C;
 Sat, 13 Dec 2025 17:56:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 41CB0103C8DE6; Sat, 13 Dec 2025 18:55:56 +0100 (CET)
Date: Sat, 13 Dec 2025 18:55:55 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Petr Vorel <petr.vorel@gmail.com>
Message-ID: <20251213185555.22ab2051@windsurf>
In-Reply-To: <20251213151730.821513-2-giulio.benetti@benettiengineering.com>
References: <20251213151730.821513-1-giulio.benetti@benettiengineering.com>
 <20251213151730.821513-2-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1765648556; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=vafsQPqiLlmG0cCdBmMi+yoT3s5fQZvGBWaJ8zUfgQg=;
 b=JN8TjggNcL1FDJm5QmZJLWCjmjFLlbK+ALD6NKVr4SkPnn8S1In6T/4nFa/wAdba46qY0W
 RNCLU395r3U5D3nl9KJRAOCdiMmExSN34RnMWPxvpziJ/G7wSWFZsnfcomsyM5AHwMuRq0
 qVSPbWhA8b0iqGvFPeSjYapJjRT98wvSKhn8hbmSHYiKa8cbVAIpdbn/OFOmnD7WB/Bc9m
 ogyp6UxXXoD2pJAHz52p7s3nnQ9eqEG167Nmeji7afnzx0Wj9KEnOD7QM/OAL5jkhSglbK
 hcIXiNmMT6tezcBI5e68XSEEi9k/sXUUnzv5f6y7dqc3/C4dv6LV2FBxS5BOQA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=JN8TjggN
Subject: Re: [Buildroot] [PATCH v2 2/2] pacakge/nfs-utils: fix build failure
 due to missing BR2_PACKAGE_LIBTIRPC_DB
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

Hello,

On Sat, 13 Dec 2025 16:17:30 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Pacakge nfs-utils requires libtirpc rpcdb option, so let's select it by
> default.
> 
> Fixes:
> https://autobuild.buildroot.org/results/29adf2d04cf4c46e492af95edaa96983985d6b57/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

It seems like rpcbind will need the same thing?

	https://autobuild.buildroot.org/results/f461212605d9d5f1c38a1ffe00a83912522bf482/build-end.log

Let me know if you want to address it as well, or if you would like me
to send a separate patch.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
