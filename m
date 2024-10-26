Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EE9BD10BFC
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 14:52:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3DF6A6067E;
	Sat, 26 Oct 2024 14:52:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e9BROpZPWGFE; Sat, 26 Oct 2024 14:52:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 50F366069B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 50F366069B;
	Sat, 26 Oct 2024 14:52:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B8F505C1E
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 14:52:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9A42640542
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 14:52:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BaKHLEGQ_3qz for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 14:52:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5743B40538
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5743B40538
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5743B40538
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 14:52:54 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A27BBFF804;
 Sat, 26 Oct 2024 14:52:52 +0000 (UTC)
Date: Sat, 26 Oct 2024 16:52:51 +0200
To: Thomas Perale via buildroot <buildroot@buildroot.org>
Cc: Thomas Perale <thomas.perale@mind.be>, Joeri Barbarien
 <joeri.barbarien@nokia.com>
Message-ID: <20241026165251.437c67bb@windsurf>
In-Reply-To: <20240918151043.907458-1-thomas.perale@mind.be>
References: <20240918151043.907458-1-thomas.perale@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729954372;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NX3MpTpRzu1HgH1e85ocxwMZrfjkzNIVybHV040xuWo=;
 b=MP2OSBxlUNVIP7d/000uNHYpc532CImTp6WxySWPljhQGKu+ZyJGTpz27SS49xtddWwh/g
 CRQo+Qt5dvmCisxPw18e4cu8S5iSrkgap8tLu8gcdzYBQ59SXEfgDB/K5HiWLXFhi0R5dJ
 pWz+id+UgGhBNcQTt8Iaq2ApmThYlbCfgxRIF3r1nwYs2cudQB/LLKOBX/838dL0+Fub84
 GO80bgTb+DXnKTxNV5UjsFVb2NwI5YdSwJb3SgywVzY9YxkGLHvaz1SqoGjHCkqsRYwn7h
 CCcpwTUcRBsmT1HuHHz3M5M92cqwUpLlgqBQnpTEEPxFOupuX7zTOfS3c/+W2Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=MP2OSBxl
Subject: Re: [Buildroot] [PATCH 1/1] package/popperjs: remove PopperJS
 package
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

Hello Thomas,

I have applied, after doing some small tweaks.

First, commit title:

	package/popperjs: remove package

(no need to repeat the package name)

On Wed, 18 Sep 2024 17:10:43 +0200
Thomas Perale via buildroot <buildroot@buildroot.org> wrote:

> PopperJS project is now called floating-ui and is hosted on
> https://github.com/floating-ui/floating-ui this caused legacy
> source code archives to be repackaged with difference directory
> name which broke the sha256 hash and made the autobuild fail.
> 
> Given the package has never been bumped since its introduction the
> support for that package should probably be dropped.

I added here an indication that the person who contributed/maintained
this package dropped himself from the DEVELOPERS file in March 2024.
Which means the package was basically orphan since then.


> +config BR2_PACKAGE_POPPERJS
> +	string "PopperJS has been removed"

This should have been a "bool", not a "string".

And it should have had:

	select BR2_LEGACY

Applied with those fixes. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
