Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A539E8FDB1
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 13:04:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E70940596;
	Mon, 29 Dec 2025 13:04:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uwf5qm8UIYma; Mon, 29 Dec 2025 13:04:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2CFC7407A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767013479;
	bh=f0SXsLALaOF0N4gjMnvo83aZS4xAcK1s2dYTnfyQ0BY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=XG0tXpGYy2k18mKRsV02fEzo+Zy6MZxt3Sk93acfv6iFvyVY8fm/p3L68AAwdNYYx
	 9sDpj0QofAOctq91vSP+79xC5+zLaI6KLbuJ3cT9YNAXCdLx97miCa019jn8BpzPDt
	 NRIhFpPKKAfAAZvioiKIK5W1gTsl0ByR26zMBKXGz3jCjc2dc6wuQMAgUk4/qRnU+k
	 cpjvPY6MWYzZx0Pa3a1Fg5xZqngXF7qR/U9a8dqBsBvgKrTBGN8tBp/wjQAN9b0Nfw
	 U5GILQmV6wBLT7QbmiJM+nrXsTNR1jxe7QaQEG8uMD2kS3ksDpRDXv+1D1pz77mV4z
	 mbFoSIgBMtzuA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2CFC7407A6;
	Mon, 29 Dec 2025 13:04:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9E1F3177
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 13:04:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 85A2A407A6
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 13:04:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q0cQoxRNK5uN for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 13:04:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5860840596
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5860840596
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5860840596
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 13:04:35 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id E88804E41E4E
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 13:04:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id BD25560725;
 Mon, 29 Dec 2025 13:04:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3F9A2113B050D; Mon, 29 Dec 2025 14:04:28 +0100 (CET)
Date: Mon, 29 Dec 2025 14:04:22 +0100
To: Frank Chung <uuidxx@163.com>
Cc: buildroot@buildroot.org
Message-ID: <20251229140422.72afe362@windsurf>
In-Reply-To: <824933a6-3d08-46cd-8ab4-add609401a60@163.com>
References: <824933a6-3d08-46cd-8ab4-add609401a60@163.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767013472; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=hulL5iwmA5yuEXDsmAfnVU5Kdpdsw+wzGdktevoVVZY=;
 b=qYYrfuKdBHCqpIYkzALOVSD9ovXnE9QWvQ2qsJUy2EM2ocV339qWnLi0l3BEUXWs5hHpqd
 X33USMn/xAeaizd4YJzf2xyL89crTSjqiguBOBor3w+bS2VF31t4PfKB7ypmMzk0XB92B9
 ZPSKfwijGVNqv7MWn7oi5dcJxLP6mqNvgApA88YrlcLxYsdFzEnsZgXWd9fHLhEXEGwpPQ
 DyNRCbcGvDgYCkj/ER2DvG67pJYvmESfGQjzt2ZkaJvs9f/QDF1hMh4hDdyEM0cdktw3qz
 mjVkUDufw9lBI/WUsiYZEapNPUnUsSwXz/QC9wBWcwfqXxvj/P9cy8KbQsE7sg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=qYYrfuKd
Subject: Re: [Buildroot] [PATCH 1/1] package/rund: add new package
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

Hello Frank,

Thanks for your patch!

On Mon, 29 Dec 2025 18:25:20 +0800
Frank Chung <uuidxx@163.com> wrote:

>  From 0166d724f0d1309ff6615c087d90d822e8f95fb0 Mon Sep 17 00:00:00 2001
> From: Frank Chung <uuidxx@163.com>
> Date: Mon, 29 Dec 2025 18:23:14 +0800
> Subject: [PATCH 1/1] package/rund: add new package

It seems like your git setup is not quite correct, as this should
appear here. Can you use "git send-email" to send your patch?

> diff --git a/package/rund/Config.in b/package/rund/Config.in
> new file mode 100644
> index 0000000000..f21bd7a11a
> --- /dev/null
> +++ b/package/rund/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_RUND
> +	bool "rund"

It has really no dependencies on specific toolchain features? Could you
test your package with ./utils/test-pkg to verify this?

> +	help
> +		A lightweight daemonizer and process supervisor.
> +
> +		https://github.com/cyberxnomad/rund

Indentation for the help text is one tab + 2 spaces.

You can also run "make check-package" to verify trivial coding style
issues.

This project seems very new. Is this your project? Who uses this? I'm
just questioning the popularity and whether it makes sense to have this
in Buildroot at all?

> diff --git a/package/rund/rund.hash b/package/rund/rund.hash
> new file mode 100644
> index 0000000000..214774661e
> --- /dev/null
> +++ b/package/rund/rund.hash
> @@ -0,0 +1,3 @@
> +# Locally computed
> +sha256 
> 701127ac5b90e02ba4a670ab7534db9f2a6678e8f0f9ff13efbfbbe1414fb066 
> rund-0.1.0.tar.gz
> +sha256 
> 81100abfee87ff6bf6ba4b49ede1f81ee04cda31000b143cb75ab98e2845d8e0  LICENSE

These lines are wrapped, probably by your e-mail client. If you use
"git send-email", it will fix this.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
