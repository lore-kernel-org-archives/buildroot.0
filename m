Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09096C25B10
	for <buildroot@archiver.kernel.org>; Fri, 10 May 2024 19:55:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C685F4235A;
	Fri, 10 May 2024 19:55:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rl-h6h-3uhCF; Fri, 10 May 2024 19:55:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B5CB3424E6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B5CB3424E6;
	Fri, 10 May 2024 19:55:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A3F881BF390
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 19:55:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 90FFA6164D
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 19:55:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gh1MZOoW5jrx for <buildroot@lists.busybox.net>;
 Fri, 10 May 2024 19:55:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7EC486062C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7EC486062C
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7EC486062C
 for <buildroot@buildroot.org>; Fri, 10 May 2024 19:55:50 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9518820003;
 Fri, 10 May 2024 19:55:47 +0000 (UTC)
Date: Fri, 10 May 2024 21:55:46 +0200
To: Leo Soares <leojrfs@gmail.com>
Message-ID: <20240510215546.12d96dc3@windsurf>
In-Reply-To: <20240510124102.2297738-1-leojrfs@gmail.com>
References: <20240510124102.2297738-1-leojrfs@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715370948;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dPvpeKeMiL06MUl7tN0hlEpAIpDFjD5uPvRu7bSthZk=;
 b=kH2PFzuKx+aBuXdeu/EzBVKbgPFp/HOHfItngZ/RNX2GzcDzUn2QhbKAjxTJbCWe+JYfbT
 wujP0SLKi+z/i7fnKY+WYoZayEFi4TQxhroVtwJnW34JkYe/oHcs0agyfva/Eds5E/Hhs6
 xMPYnPI6SUiGa4eGSuW5cSw2wtcnsvRbH5iNFdYw5Fzn1RhS3xvEj3P/x5ErC2wMJt1nbp
 CQe0c8qtjeVVdY/SFSdqci1pqkR7chsxxsLguXfatkodCO4h/B4lVR6ZhzF+W0Un8DKFOn
 fmviOUkUO1dlkki0hVDLO63oawRK/L6Uo7yolFRYe4cCKAT2NEs4sRTfw+sLnA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kH2PFzuK
Subject: Re: [Buildroot] [PATCH 1/1] package/janus-gateway: add staging
 installation
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
Cc: Gregory Dymarek <gregd72002@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 10 May 2024 13:41:02 +0100
Leo Soares <leojrfs@gmail.com> wrote:

> Install janus to staging directory so that external plugins can be built.
> 
> Signed-off-by: Leo Soares <leojrfs@gmail.com>
> ---
>  package/janus-gateway/janus-gateway.mk | 1 +
>  1 file changed, 1 insertion(+)

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
