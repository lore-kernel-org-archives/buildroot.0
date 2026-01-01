Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54173EEB57E
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 09:47:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CBC4C81902;
	Thu,  1 Jan 2026 09:47:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JDf2DQqLXdu1; Thu,  1 Jan 2026 09:47:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D8B4E818CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767260864;
	bh=689M7l7WjTrOhih53lnPbH6q762AZpFHyqf0gudrXR0=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=WAtjoaQDQkaP8lnS0dUO/LfxvVboo4ONUhkr3DOfKr+NietqNvr/0MUv4YEjmxTYC
	 ZJbLwRCngJTukVCRwBJLdimMwtNpieV3u7pUAN8iesvCc9sJZuFv6y1JmgH9pl27la
	 zGw68gNcqopnwsCJ7WLEGpETjpp/9yiSbrym/5jFPFL37gB/h58Dx/YfXmajHm8UYt
	 CEcs6bbf6fhcVe8qLYT0SEalzkZC0nCxQXUjCg7a3q6T5M2K6/BwxC8vbgJRoQtPOa
	 2trf4QcSyu8ys/OnsNIBQhM3DAWAQQLnAbeA7IN7XYQOXUd+y56Lo0FAxwfFssBJyo
	 4TxyHMPmMKDVA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D8B4E818CD;
	Thu,  1 Jan 2026 09:47:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 00504206
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:47:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E69E2607A3
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:47:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MOXKZVLJOyXH for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 09:47:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D3C62606EC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D3C62606EC
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D3C62606EC
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:47:42 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 02F351A258F
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:47:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id CD231606B6;
 Thu,  1 Jan 2026 09:47:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 36DB4113B071F; Thu,  1 Jan 2026 10:47:40 +0100 (CET)
Date: Thu, 1 Jan 2026 10:47:13 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <20260101104713.305760ac@windsurf>
In-Reply-To: <20251231223337.535914-1-james.hilliard1@gmail.com>
References: <20251231223337.535914-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767260860; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=kr94h19Y9mkqO98aGl0VkP1CBhgzLc20naZqWq2J+vU=;
 b=cv6BWfG+QnrDCbDWUKCKkhWnR5GLlq7NgCfecfRPwVBHv8BRw8c62Y3C8K7TUpyI/EqIgJ
 3LhPhfbf24LUKwkwtM6Eq5eXDq5GQuWOWlPacdhGANvL4y01d3HDXd8dwzljleUASigQRH
 cp5duPBo600giYqMQOPkUM5mfolPkc2F3ABmuGAB7Ptzu9d1hyaLF2736cGgffysj7hV0G
 qAWvVSmTXzm5bxdQVOk18Ltcl5Zu34DL7zP7HEbDeR34QyXl4oBLSn591W2v57QOFvK4gq
 2fqmmud2gC4yP4BGOv7F0SaNqvqouM+gozjcsG3zzgx64eogrUNJYkkwpwTBHQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=cv6BWfG+
Subject: Re: [Buildroot] [PATCH 1/1] package/python-psutil: bump to version
 7.2.1
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

On Wed, 31 Dec 2025 15:33:37 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-psutil/python-psutil.hash | 4 ++--
>  package/python-psutil/python-psutil.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

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
