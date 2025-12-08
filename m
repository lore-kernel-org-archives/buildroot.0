Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEBE2D3B7E2
	for <buildroot@archiver.kernel.org>; Mon,  8 Dec 2025 16:23:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 44DBD40AD8;
	Mon,  8 Dec 2025 16:23:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vYKtOVKef4r1; Mon,  8 Dec 2025 16:23:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE5AB40A8F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765211027;
	bh=udFN/bwU2tdkEwUfVQDdMNQcSaoN0rLs2XRbL32f5gs=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=QZBVSFJFA5ntWnoEIX8JW1qkVM1tJNOzJyfDYD90nZxYQH0Ul1w2EEzzuyjfyt1uC
	 QuNibtsGSX7FifUYJ17257eHe7Lc1iJIzwwhyPzuQYL6NmjAt5X3HzJqubxTImc3aN
	 tt86Nlfgx7SHaRcMRWZzR1eaWyWUGxKR+XfRzWP38Cx6B1/FrN/nseL91YanpW24rX
	 B0x1eJesFcd3QdYuWUxDUmikubM66jAtdQzDviOe699F1Kb3FLpQqzF1L9OH5dtfdt
	 OxrVHdrWHZxWSOgjvoFSJcbipgOIFcqdz85KLee5Hc/6vChiNKGxi07Tr0m+bD+HLQ
	 pAREU7/RxM98g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE5AB40A8F;
	Mon,  8 Dec 2025 16:23:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9621F151
 for <buildroot@buildroot.org>; Mon,  8 Dec 2025 16:23:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 88574608AE
 for <buildroot@buildroot.org>; Mon,  8 Dec 2025 16:23:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0ubRWKpV4gaM for <buildroot@buildroot.org>;
 Mon,  8 Dec 2025 16:23:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 23EFD6074C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 23EFD6074C
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 23EFD6074C
 for <buildroot@buildroot.org>; Mon,  8 Dec 2025 16:23:44 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id A4A844E41AFB;
 Mon,  8 Dec 2025 16:23:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 7376660707;
 Mon,  8 Dec 2025 16:23:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 78FF410B61E50; Mon,  8 Dec 2025 17:23:40 +0100 (CET)
Date: Mon, 8 Dec 2025 17:23:39 +0100
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Petazzoni via buildroot <buildroot@buildroot.org>, Romain Naour
 <romain.naour@gmail.com>, Alexey Brodkin <alexey.brodkin@synopsys.com>, ARC
 Maintainers <arc-buildroot@synopsys.com>
Message-ID: <20251208172339.4a6d24a3@windsurf>
In-Reply-To: <87sedoazgb.fsf@dell.be.48ers.dk>
References: <20251205212959.2082018-1-thomas.petazzoni@bootlin.com>
 <87sedoazgb.fsf@dell.be.48ers.dk>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1765211021; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=gu5VigZKdnE6kQoLMbZN8DIUIhs3X4JWiOQBkBMy2b4=;
 b=zq7vEGQDZYCihQZhnlitqSijy5lhKjuE46c7gzSQV/11jKOO3zuLhh4D3T1xzxMXyvDunV
 BZ07GFxngTFoUe40g3NsMI6NGJWa4iBgeEdW8unZ5eghdRGYM7i96gyDA+8wTE4M8LCykM
 rp2lFEDmDtXDjO3jQX6/lOwLGiiT8fOQMPgN138mW9WUSCwCxdLobpLUjxwO55YwxOymLI
 lto1egZix0ejM/5xrZDPfCC/nS1+rsQXr7GYxHRZYNWnsWIpNEjPF81BHjOG5qBx5ITzf3
 YVErPAo64aKoCzPVSNBD4te+Plo0hDOtWRnIU2moCumgdsudj/vJos4Gb6it3Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=zq7vEGQD
Subject: Re: [Buildroot] [PATCH] package/glibc: only supports ARC
 little-endian since glibc 2.41
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

+Synopsys/ARC people in Cc.

On Sat, 06 Dec 2025 07:36:52 +0100
Peter Korsgaard <peter@korsgaard.com> wrote:

> Does this mean we should completely drop support for big engian ARC?

config BR2_PACKAGE_UCLIBC_ARCH_SUPPORTS
        bool
        default y if BR2_aarch64
        default y if BR2_aarch64_be
        default y if BR2_arcle
        default y if BR2_arceb

so I'd say no we don't need to drop support for big endian ARC as
uClibc still supports it.

However, I must say we have quite a few ARC-specific issues, which I
have reported a while ago to the Synopsys people, and there's no longer
any Synopsys participation to Buildroot. So I'm thinking we should
probably take this as a "Synopsys no longer cares" and therefore we
should drop support for ARC.

Let's see if they react to this e-mail. If they don't, it will be a
clear signal that they don't care anymore, and we should drop ARC.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
