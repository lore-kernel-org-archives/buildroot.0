Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39435D10BFF
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 16:38:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB6E540C97;
	Sat, 26 Oct 2024 16:38:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2O-QwTYhOZSu; Sat, 26 Oct 2024 16:38:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DDDB440874
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DDDB440874;
	Sat, 26 Oct 2024 16:38:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id AC6272318
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 16:38:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8D5A960D74
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 16:38:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wb6HaHUSdECI for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 16:38:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 77C4D6074C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 77C4D6074C
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 77C4D6074C
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 16:38:01 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A5203240002;
 Sat, 26 Oct 2024 16:37:58 +0000 (UTC)
Date: Sat, 26 Oct 2024 18:37:57 +0200
To: Fiona Klute via buildroot <buildroot@buildroot.org>
Cc: Fiona Klute <fiona.klute@gmx.de>, James Hilliard
 <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Message-ID: <20241026183757.068d30c7@windsurf>
In-Reply-To: <20240927183400.339491-1-fiona.klute@gmx.de>
References: <20240927183400.339491-1-fiona.klute@gmx.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729960678;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6P2j122Fa3vTx2L03YxAskR9+QKwUmzL5n02LJbcPNE=;
 b=QhBfZrQmsSepgiSbkwCuGawP+NrxT3PapHILSIFqvTtDSAKGEoFji0EjMAW0Qp6XpjFlna
 v8N8rXxFn/xFTDeBKmU2sQRVSp1TWZOYCvdsAibd9D9MRlx8ZpsNQSUx5S5FoOXrPbz54H
 LwLwTLbS1an2jWA5vv6ev6ylg0hNLS4Mc2z2PvQQaeHZLfE+vdsOKwQUm68J+j6dFWHGEg
 jbVW14hLLxlmKMlmBnZoxtHiduBzyXA4Awl3BaEUTDDb7tRdl1M9pqOVdFxwIbG1w+haAl
 yBs/APd/GDrxijmWBN3hsb6fmI21iKxgVYALVU6xha0WXtnwvcy4Awxt/fojYg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=QhBfZrQm
Subject: Re: [Buildroot] [PATCH 1/4] package/python-tomlkit: add host package
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

Hello Fiona,

On Fri, 27 Sep 2024 20:33:57 +0200
Fiona Klute via buildroot <buildroot@buildroot.org> wrote:

> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
> 
> Required to run poetry-dynamic-versioning on the host.
> 
> Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
> ---
>  package/python-tomlkit/python-tomlkit.mk | 2 ++
>  1 file changed, 2 insertions(+)

Thanks, series applied. I changed PATCH 2/4 and 3/4 to download from
PyPi. So in your comment on PATCH 4/4, you said you download from PyPi
instead of Github, but that's exactly what we do for our Python
packages.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
