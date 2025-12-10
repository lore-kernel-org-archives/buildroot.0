Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 820F9D3C90A
	for <buildroot@archiver.kernel.org>; Wed, 10 Dec 2025 13:57:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 229154087E;
	Wed, 10 Dec 2025 13:57:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5w4J8a-FclGu; Wed, 10 Dec 2025 13:57:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4532A408C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765375045;
	bh=kbVBrgahMufUl0NYyXUPN4Khin7zA7uqSm4ZnRE4C3A=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Ff4riQ8B/K0jhz3TFMJ1fE1/CGb0o/b9HGuKg47zEzt2C/Sti22b6MjfQCrGne6h0
	 //BJqc960Oz8MJ0yFe0/2q7okDvP2C+8Usrhu74jBoFSvqfLTaqNq5YOGVnAQz1f7R
	 d2BFZEOYM/Cb+f/xZPzOSdHZ5rFRxO9Iaz+I3WX/C+HdqK/mmYMIntn5T6TVdWh7Tk
	 B2l4AK68uBK6ukuVNW0RmNHRkKDf37NaNSz3etxuObu8/DUJkC5Ddu96pKdWaLKscK
	 T/J87s4spVVcxLUbrVGs8n7I18+nZZF8B4IOD3GA51CKaEvc3f7ubCCLzVkBgRatMQ
	 ZgOHswjp/rYfw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4532A408C4;
	Wed, 10 Dec 2025 13:57:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2943A237
 for <buildroot@buildroot.org>; Wed, 10 Dec 2025 13:57:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2689084A49
 for <buildroot@buildroot.org>; Wed, 10 Dec 2025 13:57:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NcMKfM56jFju for <buildroot@buildroot.org>;
 Wed, 10 Dec 2025 13:57:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1381A84A0D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1381A84A0D
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1381A84A0D
 for <buildroot@buildroot.org>; Wed, 10 Dec 2025 13:57:21 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id BEB48C180F8
 for <buildroot@buildroot.org>; Wed, 10 Dec 2025 13:56:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 96E0460714
 for <buildroot@buildroot.org>; Wed, 10 Dec 2025 13:57:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2C2DC1193175C; Wed, 10 Dec 2025 14:57:16 +0100 (CET)
Date: Wed, 10 Dec 2025 14:57:15 +0100
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: buildroot@buildroot.org
Message-ID: <20251210145715.50e51799@windsurf>
In-Reply-To: <20251210102940.2535550-1-kory.maincent@bootlin.com>
References: <20251210102940.2535550-1-kory.maincent@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1765375038; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=3HgxHCgyy3t+tl6vKvZfyFd74Zhk7tTdE182E57Hazc=;
 b=YQyXMOixv/KXjwvAd14yWfYwv1jnF7cvw7W2t6cqJmIzjH2HP8NQtRzQufd3jYRk+at4Hs
 M1ZsFoIQbLd0Ht1JfL7V33hZxo7Ew3G24iK3zFbj1Zv6MRTcBlIs9HLDOMc2DIgb5VZ3GQ
 gcnbzsnoM9oMDkhC/BUGYI5CDznRrs8xkQxVw1KBDlVD1FrgljF8JZbH/196wW9VBz39Xa
 ZS12yoLgF9TZUVGgmK59wy2SGshnFAvehPL2bsE2ryNAYgsifOLqtE9UuAgWym+O/NZ0qc
 jlAbENybZMYDNcS/JiEe5V3leGc/CpZKZIxTCORjOrrorgmUrpjByQBKeVlEkg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=YQyXMOix
Subject: Re: [Buildroot] [PATCH] package/util-linux: Fix host uuidd build
 configuration
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

On Wed, 10 Dec 2025 10:29:39 +0000
Kory Maincent <kory.maincent@bootlin.com> wrote:

> The host build had conflicting configuration options where libuuid was
> simultaneously enabled and disabled. Although comments explicitly stated
> that libuuid should be enabled for the host, the --disable-uuidd flag
> was preventing the uuid tools from being built and installed.

Sorry, but I don't really understand the conflict. --enable-libuuid to
me does not conflict with --disable-uuidd. --enable-libuuid enables the
libuuid library, --disable-uuidd disables the uuidd daemon, which can
optionally be used by libuuid, but isn't strictly needed.

Which specific tool was missing in your case?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
