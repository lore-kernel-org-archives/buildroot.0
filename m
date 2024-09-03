Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB5F4CD343F
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 21:05:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96B6F401E7;
	Tue,  3 Sep 2024 21:05:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nU4Y0PraoLxb; Tue,  3 Sep 2024 21:05:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 75F98401F8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 75F98401F8;
	Tue,  3 Sep 2024 21:05:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 520251BF48B
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 21:05:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4B00480BEA
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 21:05:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u_G97ydT2DqV for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 21:05:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3912D80BDF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3912D80BDF
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3912D80BDF
 for <buildroot@busybox.net>; Tue,  3 Sep 2024 21:05:15 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 49054E0002;
 Tue,  3 Sep 2024 21:05:13 +0000 (UTC)
Date: Tue, 3 Sep 2024 23:05:12 +0200
To: Francois Perrad <francois.perrad@gadz.org>
Message-ID: <20240903230512.63ae8022@windsurf>
In-Reply-To: <20240902203424.2649384-1-francois.perrad@gadz.org>
References: <20240902203424.2649384-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1725397514;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vn4HPoN08ARfa8PPSFfMcDKJiykk1WipnjsO0V5+WU8=;
 b=nP9Z7yrxxvbrtfMjNs0oo9IRuo+CsoLO7D4zWEdnDsw6SnOC9sPwQVZWb4HVmZUIQr4m7h
 kw/OMiD4/A3OC6+HutUzOFxU6unS3AH305OiXKvqZfCCMmzhsyuuZsrv2Op6Z9eQOaOCyA
 TRKlo8W1sGuAaYDPMOFN33vxH+tHnJCvGDNPuXxRMzgCozQuIOFHg2xqDed7rT/rJHPJiw
 gdJSYtzkSGO/GugxN1naBDt0J8ouYKLnFYK1Uj2jSmaG4f1BwCJDyedMfXowH+F3rfwUqx
 xQwM7ypmHz4HQMYoxkJ8JhtVMf5UtmgSbU9IQN/FLdaotn/YT5ytztLdlH4xKA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=nP9Z7yrx
Subject: Re: [Buildroot] [PATCH] package/open62541: bump to version 1.3.12
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon,  2 Sep 2024 22:34:24 +0200
Francois Perrad <francois.perrad@gadz.org> wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/open62541/open62541.hash | 2 +-
>  package/open62541/open62541.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
