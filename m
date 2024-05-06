Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2CA9C25B4F
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 20:02:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C39C82103;
	Mon,  6 May 2024 20:02:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v01H2zm0A4Ku; Mon,  6 May 2024 20:02:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A52E58213E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A52E58213E;
	Mon,  6 May 2024 20:02:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 49D0F1BF947
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 20:02:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 35EAC40B9D
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 20:02:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iIrqaMmnfBje for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 20:02:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D46AD4057C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D46AD4057C
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D46AD4057C
 for <buildroot@buildroot.org>; Mon,  6 May 2024 20:02:27 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C596A1C0003;
 Mon,  6 May 2024 20:02:24 +0000 (UTC)
Date: Mon, 6 May 2024 22:02:24 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240506220224.4b53441a@windsurf>
In-Reply-To: <20240505190821.1252791-1-fontaine.fabrice@gmail.com>
References: <20240505190821.1252791-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715025745;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8PLh2oWF4GwgRilMOVZRwSiWI81KGzCleZzebMs4nLI=;
 b=Kja1N4ItGu4+0dYwSwp2vWDJfwp06cLOEIfUiUvKs41h4441KMgN8Is6Hrl6IKzKR+RlAK
 uJW6JdXPOTCUPTnzflqjZLo5MxqaEHhquZtOn7WIE2VhlbQFnogYuftdgNtgosTowaoVHX
 vaTml8CzotPn+Gvl5OgLVmXe5EZH9bzFuXKHmXmUdGUltN46RVK3DtYCmZ2GTxfZAmGPr7
 sK9XGdkVZDtTK79m8YgBtfAfR4+t1SIDvbQEZUdWonzxbWCc0Sk7ttUWBRxG5cxoELW23R
 KN9fW8H3M8kPHd1VzgtfzC7DqPj2rk39Gvq9lFGAM8AaA+8fWy+AcPVbnqTadQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Kja1N4It
Subject: Re: [Buildroot] [PATCH 1/1] package/liburiparser: security bump to
 version 0.9.8
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
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  5 May 2024 21:08:21 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Fixed: [CVE-2024-34402]
>     Protect against integer overflow in ComposeQueryEngine
> - Fixed: [CVE-2024-34403]
>     Protect against integer overflow in ComposeQueryMallocExMm
> 
> https://github.com/uriparser/uriparser/blob/uriparser-0.9.8/ChangeLog
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/liburiparser/liburiparser.hash | 2 +-
>  package/liburiparser/liburiparser.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
