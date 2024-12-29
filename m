Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2784DE7718B
	for <buildroot@archiver.kernel.org>; Sun, 29 Dec 2024 22:47:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6EA840651;
	Sun, 29 Dec 2024 22:47:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9R857U4GfSb4; Sun, 29 Dec 2024 22:47:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C525740644
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C525740644;
	Sun, 29 Dec 2024 22:47:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1DBB072
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 22:47:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F22BC60707
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 22:47:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RHDBCBhk-E0t for <buildroot@buildroot.org>;
 Sun, 29 Dec 2024 22:47:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org ED9B6608CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED9B6608CA
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ED9B6608CA
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 22:47:13 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8ABBF20003;
 Sun, 29 Dec 2024 22:47:10 +0000 (UTC)
Date: Sun, 29 Dec 2024 23:47:09 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20241229234709.09344085@windsurf>
In-Reply-To: <20241229202206.1664828-1-bernd@kuhls.net>
References: <20241229202206.1664828-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1735512430;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gHC7zMzFI2U2UnJZrBsB7HJfaWSX1vtYWGj4Fe+Q9Sk=;
 b=O1tiqXg9Qhrep9sfx1ekvDPs6RGwaMgbYhMKazfe50/WC+fm/3rc6Mu8G1xE71ZNB5qMg6
 jeoKAeI0Towo/MCZl+3MhtHEgh9GwUjdt5bmYomSlgX6V20LhAYT9hk/UI5IzMPol1M9GV
 izIXYZAp2MYIGRkbCCyol5xvLPOrbaRV114DXktkDUy0FBqbEvbNYj6I9ip0O9v57J04Tx
 wI1HYbOUnWs2OpzivlkYs6N42uRFfNPrGGYbAe78E2nr33+YLBVFrhMisRlfKKwaRsHNf7
 DviiMGXNbT8N+LKgIrNqEhSGDwAu61kbhtjStXYZAPI+AztQl1Dw5d/mXl6YTw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=O1tiqXg9
Subject: Re: [Buildroot] [PATCH 1/1] package/flatbuffers: bump version to
 24.12.23
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

On Sun, 29 Dec 2024 21:22:06 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> Release notes:
> https://github.com/google/flatbuffers/releases/tag/v24.12.23
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/flatbuffers/flatbuffers.hash | 2 +-
>  package/flatbuffers/flatbuffers.mk   | 2 +-
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
