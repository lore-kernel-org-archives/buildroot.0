Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 145F7D3ABF6
	for <buildroot@archiver.kernel.org>; Mon, 11 Nov 2024 21:27:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A605760707;
	Mon, 11 Nov 2024 21:27:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4BdM7hAemd6P; Mon, 11 Nov 2024 21:27:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D653660711
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D653660711;
	Mon, 11 Nov 2024 21:27:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9B9DBDB1
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 21:27:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7CF6360716
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 21:27:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ilsxyghc1DPG for <buildroot@buildroot.org>;
 Mon, 11 Nov 2024 21:27:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0F3E360707
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F3E360707
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0F3E360707
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 21:27:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 24BF7240003;
 Mon, 11 Nov 2024 21:27:35 +0000 (UTC)
Date: Mon, 11 Nov 2024 22:27:34 +0100
To: Scott Fan <fancp2007@gmail.com>
Cc: buildroot@buildroot.org, Gero Schwaericke <gero.schwaericke@posteo.de>
Message-ID: <20241111222734.2912b453@windsurf>
In-Reply-To: <20241108154627.1922163-1-fancp2007@gmail.com>
References: <20241108133641.1216345-1-fancp2007@gmail.com>
 <20241108154627.1922163-1-fancp2007@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1731360455;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PN3zlFel8IgNPkRvu+KxDSgUxlUtRlzF9P1LtNJF7kU=;
 b=hs0SAjVMGhjWhqwgzavYfUkQp5rtvFqjk5Bvfh4wIKOXNYLMYgWiVpdedtlmPINvv53P7R
 3cpcA9kYQmBJED6YwClDgmWqkpvSaxG273r6nzn/9O39EITlMpOwUzP1q+jOCsMP+CAV3i
 x35pZtFm1lg4JCs6Q0qux8DNkX1iSd28Tgjv/w58lIFpO3LzIMzcmBz1mZx4aEAuJjqZjr
 InZVy5IIiozlsHuqBC4XnF7SaY5oPqU/eub/aJJCb1I40J86o/9Pjd6hxMfBYLalhFX/xn
 tlH6sf5du5VaZaYEsxYh9uzoS8est8W4Q5XdLzKkAgU+U7c5AKb99tgQVtKoGQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hs0SAjVM
Subject: Re: [Buildroot] [PATCH v3] configs/cubieboard1: bump Linux to
 6.11.6 and U-Boot to 2024.10
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

On Fri,  8 Nov 2024 23:46:25 +0800
Scott Fan <fancp2007@gmail.com> wrote:

> Signed-off-by: Scott Fan <fancp2007@gmail.com>
> 
> ---
> Changes v1 -> v2:
>   - update the linux.hash and uboot.hash file

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
