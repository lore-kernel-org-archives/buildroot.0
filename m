Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97508CCD193
	for <buildroot@archiver.kernel.org>; Mon, 20 Oct 2025 07:55:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3846B84077;
	Mon, 20 Oct 2025 07:55:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jbPZF_q3H7C2; Mon, 20 Oct 2025 07:55:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C37A8406D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C37A8406D;
	Mon, 20 Oct 2025 07:55:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 76F9E1CD
 for <buildroot@buildroot.org>; Mon, 20 Oct 2025 07:55:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 618F940FE3
 for <buildroot@buildroot.org>; Mon, 20 Oct 2025 07:55:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nAjX0YK4RMey for <buildroot@buildroot.org>;
 Mon, 20 Oct 2025 07:55:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 86F3340FC9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 86F3340FC9
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 86F3340FC9
 for <buildroot@buildroot.org>; Mon, 20 Oct 2025 07:55:02 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 3C17D4E411EA
 for <buildroot@buildroot.org>; Mon, 20 Oct 2025 07:55:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 13093606D5
 for <buildroot@buildroot.org>; Mon, 20 Oct 2025 07:55:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9B09D102F2390; 
 Mon, 20 Oct 2025 09:54:52 +0200 (CEST)
Date: Mon, 20 Oct 2025 09:54:51 +0200
To: Romain Gantois <romain.gantois@bootlin.com>
Cc: Buildroot List <buildroot@buildroot.org>
Message-ID: <20251020095447.08d46550@windsurf>
In-Reply-To: <22876007.EfDdHjke4D@fw-rgant>
References: <20251018194314.114284-1-thomas.petazzoni@bootlin.com>
 <20251018194314.114284-12-thomas.petazzoni@bootlin.com>
 <22876007.EfDdHjke4D@fw-rgant>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1760946895; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=um8nmZvPbs8GDYos5AfTKfgwDaHHtcSg5N5J+ZUV/6o=;
 b=ByQjjbIKTdGGQ/rU2W3biXq3FC6gxW39guLg+fWwnQa7KAxrE40nizy/a/AJSFUEU1ebAR
 qHpK/28g1u4gdWe/Tj2jHIblzGxDfWVuDmg1lXdFlN6ZoPBvMOEUqniHajBegZODxKh2mk
 CJfX0Rji44pMtEA1//1IV7th+V7sGO02MNNZKMm6Fji0+pdazfTwFTd4VkoTr3ZB8L9Bta
 rJd6fHYeK23xRPgkgmfU/n7jNJsGei5IBlqFBss8N2qwuVnWOpCcKmtvK6VgboetXkTdLN
 mUN03UWviovaz8Dh5LPGhAyRNM2sklevfJUXnaRRgE5mnAv3EotrngW3hCNd6w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=ByQjjbIK
Subject: Re: [Buildroot] [PATCH 11/11] package/snagboot: new package
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

Hello Romain,

On Mon, 20 Oct 2025 09:17:49 +0200
Romain Gantois <romain.gantois@bootlin.com> wrote:

> Only the "gui" variant of the Snagboot package provides Snagfactory, the base 
> version doesn't, so is this removal really necessary?

From my testing, the snagfactory main script gets installed, which is
why I had to remove it.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
