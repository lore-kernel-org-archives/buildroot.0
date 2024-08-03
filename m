Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11495C3DA4A
	for <buildroot@archiver.kernel.org>; Sat,  3 Aug 2024 18:28:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CEAC64038D;
	Sat,  3 Aug 2024 18:28:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sTUIZUCvYFEI; Sat,  3 Aug 2024 18:28:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C28540393
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C28540393;
	Sat,  3 Aug 2024 18:28:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 673691BF364
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 18:28:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5553081441
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 18:28:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U28wc6XxVlTE for <buildroot@lists.busybox.net>;
 Sat,  3 Aug 2024 18:28:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 22C688143C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 22C688143C
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 22C688143C
 for <buildroot@buildroot.org>; Sat,  3 Aug 2024 18:28:01 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0EC1360003;
 Sat,  3 Aug 2024 18:27:59 +0000 (UTC)
Date: Sat, 3 Aug 2024 20:27:59 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240803202759.2b401793@windsurf>
In-Reply-To: <20240803104555.2574177-1-bernd@kuhls.net>
References: <20240803104555.2574177-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722709680;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rM7p4phfBBHXCcVb8YQFljQPooMDDgW5wQzEGVhC7h0=;
 b=VkqKLUQGG9qE0CjmAAU0L5S9OsgO3g7qiLV+nER/6a4lJIwvxm5rmzpgxDXziS6Di+VLUE
 tPJvtjQs2Br+hWRBHyiNZBghxnfbUFMox0V2FbLaYEScZbJ7JDKyA2apwfr+2wjtNpkz0A
 NRvaj4aTpEW5dj/ZEfV9f6RLwEEOWT1EULLtFnj1MudLVN1UG64+1nsb2L07Ntf1WFGDsk
 7INH81bMntiQuHgicziHexOapWR/uJaTdFt9nyS9F5Ks+MfIZVpdklVwwA5Je/cH4n7aK+
 4WhwSx3jSh8+3Z9vbfvf85bML9Q6lkL8zyK8/bqp/fKsg3ILw0rfyqakp/nEEw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=VkqKLUQG
Subject: Re: [Buildroot] [PATCH 1/1] package/php: bump version to 8.3.10
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat,  3 Aug 2024 12:45:55 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Changelog: https://www.php.net/ChangeLog-8.php#PHP_8_3
> Release notes: https://news-web.php.net/php.announce/434
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/php/php.hash | 2 +-
>  package/php/php.mk   | 2 +-
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
