Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA68BD3C923
	for <buildroot@archiver.kernel.org>; Sat, 19 Oct 2024 17:48:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 937A140269;
	Sat, 19 Oct 2024 17:48:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4NWUjczMrWm1; Sat, 19 Oct 2024 17:48:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5EBCB40277
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5EBCB40277;
	Sat, 19 Oct 2024 17:48:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 42DA53A23
 for <buildroot@buildroot.org>; Sat, 19 Oct 2024 17:48:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2409B80C38
 for <buildroot@buildroot.org>; Sat, 19 Oct 2024 17:48:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IkNhoNkaBkQA for <buildroot@buildroot.org>;
 Sat, 19 Oct 2024 17:48:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EE53280C37
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE53280C37
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EE53280C37
 for <buildroot@buildroot.org>; Sat, 19 Oct 2024 17:48:15 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4770AFF803;
 Sat, 19 Oct 2024 17:48:12 +0000 (UTC)
Date: Sat, 19 Oct 2024 19:48:11 +0200
To: Baruch Siach via buildroot <buildroot@buildroot.org>
Message-ID: <20241019194811.56173670@windsurf>
In-Reply-To: <ac44157e8218a87e38494d4dfc5cf0fb8ebde35b.1727155451.git.baruch@tkos.co.il>
References: <ac44157e8218a87e38494d4dfc5cf0fb8ebde35b.1727155451.git.baruch@tkos.co.il>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729360093;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2tAg4z/bv0VWjAPmfnckXVMttmNgOMyXZgEobQyFGw4=;
 b=BtD4mR7gQACqZ0aarRyACFexFOSNVbPJ/2ybed2Q3tw44eaHNobDpgS8sJ450Cmkqx5gRw
 XNU117e3xJLQsuILbmPztMvWKYmJCqYWIiiwiAADg01+pXryL9hv2P8MnPqZXjjkNV9HDH
 PI2J9KsPxC7hegZPGo/1tQiy7Sw5CFJr7Vf1frhiVTM2LLgjMwhRmwRDMLLXNANKyEz/kR
 2lyPK6oqeXLCJ0yTZILpDxRmYF3JDjy0m9iDqeRX5DPrKMcJZEYm12o9CCrKk47viGLFLM
 ppacbzX8GyJoTpgFqPCvnApI720rKwxvmUhVSN2tBKoNSaKPExWj8pSNzEVLMQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BtD4mR7g
Subject: Re: [Buildroot] [PATCH] package/libcurl: fix build failure with
 verbose disabled
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

On Tue, 24 Sep 2024 08:24:11 +0300
Baruch Siach via buildroot <buildroot@buildroot.org> wrote:

> Add patch to fix build failure introduced in bump to version 8.10.0.
> 
> Fixes:
> https://autobuild.buildroot.org/results/2d553687a32651f81813c82d7bbf9bb11fd3eca5/
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  ...build-with-verbose-messages-disabled.patch | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 package/libcurl/0001-curl_trc-fix-build-with-verbose-messages-disabled.patch

Applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
