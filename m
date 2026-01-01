Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E950FEEB57E
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 09:49:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0EFC81E31;
	Thu,  1 Jan 2026 09:49:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hq5YyCzMw1B7; Thu,  1 Jan 2026 09:49:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 008B4816DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767260984;
	bh=9Tcc8D9VhbAlx+/rjZFft+3I2gAEmTxCGJCzmiOYV9k=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=srosVSNrddTzk0qc0uJ3S/kQhyGtJ+AqaxtpkRQhgZXL/hoK479mg4DVJVqVvRgFm
	 Q9E0sSKfNX0DJK+9SuRq0YbCFARt5hwycnO/YG1lDDs9NPlLcO/AijaIiZFPcK38eq
	 Ve+LwVJcDcgPEfgCAREXBXGVsolwowGbv7l/sAmrDqN6fY83q6y/bNy8TzXdnsC64e
	 p85daDJ4qFjGwKGsR5qCHtp9HzKnsPYOGijz02Ped1qZGp+ECDDsB9Fn1+L9gnCQ22
	 yJpAHw0E0l5n6mCAC5r4UPZC8Ke3No/0xXEVO2iSZz/nLjTawKULiWcE4aAep1siEb
	 hLMiW9AjMrM0A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 008B4816DF;
	Thu,  1 Jan 2026 09:49:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 87BCE206
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:49:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 79BC0816DF
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:49:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WFzoTa1wMHZz for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 09:49:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 786A381521
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 786A381521
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 786A381521
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:49:41 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 8EB6AC1D19A;
 Thu,  1 Jan 2026 09:49:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 48522606B6;
 Thu,  1 Jan 2026 09:49:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A3FCE113B071F; Thu,  1 Jan 2026 10:49:37 +0100 (CET)
Date: Thu, 1 Jan 2026 10:46:13 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <20260101104613.5160df1f@windsurf>
In-Reply-To: <20251231195242.4045046-1-james.hilliard1@gmail.com>
References: <20251231195242.4045046-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767260977; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=M/iZLE4cw+7/ibpOVUr6CUBZC1yWMjk6EmRcWPPSlF4=;
 b=1S2Pb+F8XER9oIuRm/jiSYLPoPxz/psdPd3OKvZI6wxjz561mun4Jbg66/1m0Qec50EXR3
 hvJNZSE9O9ILp+pkSBpXcPtDClFXCOK+k8OnUYVc5ZgllplGvy8vk6C16fTmc9ydvcVAyJ
 5e6oU0RFWG87c/PhOplA/CKU8gcq2THNIiI69CIb/T1uTON7V2x5Z67aOvmsJuCIc7kEtg
 M/69MkykG2upqRjz5TKXv2090gzB+vhtvMbhlfk4A8Frae+eR7Fa8Qx0DYTLcKMunYQ2Fx
 rdIhIJcjAewiyvgpxuJNogc5VjNtJ8CKtb2r6J9i2A59keDmWFOAapThdjr4yg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=1S2Pb+F8
Subject: Re: [Buildroot] [PATCH 1/1] package/python-socketio: bump to
 version 5.16.0
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

On Wed, 31 Dec 2025 12:52:42 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-socketio/python-socketio.hash | 4 ++--
>  package/python-socketio/python-socketio.mk   | 4 ++--
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
