Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DAF3C52D71
	for <buildroot@archiver.kernel.org>; Thu,  8 Aug 2024 08:36:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 070E4400E7;
	Thu,  8 Aug 2024 08:36:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dRS26xAbb-wN; Thu,  8 Aug 2024 08:36:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA54F40194
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EA54F40194;
	Thu,  8 Aug 2024 08:36:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0EF8F1BF2BF
 for <buildroot@lists.busybox.net>; Thu,  8 Aug 2024 08:36:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F058C40194
 for <buildroot@lists.busybox.net>; Thu,  8 Aug 2024 08:36:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y6grqg2Eg9-e for <buildroot@lists.busybox.net>;
 Thu,  8 Aug 2024 08:36:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2774E400E7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2774E400E7
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2774E400E7
 for <buildroot@buildroot.org>; Thu,  8 Aug 2024 08:36:02 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id ECADF1C0002;
 Thu,  8 Aug 2024 08:35:59 +0000 (UTC)
Date: Thu, 8 Aug 2024 10:35:57 +0200
To: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
Message-ID: <20240808103557.5c1b1f37@windsurf>
In-Reply-To: <087ec276f1e5357bd8bbb90fe4725dd4@zgyarmati.de>
References: <20240808052443.86164-1-zgyarmati@zgyarmati.de>
 <087ec276f1e5357bd8bbb90fe4725dd4@zgyarmati.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723106160;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E4H515uGGfw9W8C4aqL87H3f9MaWZIovCYV7rPxxoMw=;
 b=CO0Fldcy/w6bN7JQcWuKhMtBllJiZlolGIS7LpnrXnJJ8LOz6qS7tjyJEdZSBEr3S/oAhR
 zGOlBAzMb4DXKf4ZFavAUapDXCX/6GR3CdkR+BTG13LRdGOqtC4qAO5DiYSx/NI76KlHge
 /4XpexTKSaktJ6nSlV8A6Yz0ylkPKt6jdl7eGouyiEUGVSx8y8WFjExy8v5b/mfqn3xV1g
 f87h5b4fPK9vpl7QfJKjTtyeyPWmtMFpP/mOrmzjxtDQMRaEBYJA43WKkBsltXxt7RdGcu
 yLg/LkBXbL9OS4mqpDlTxlyqnZyxRtxDvKOkBrxiSe8q5xM9LfHMbEmoWAWEIw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CO0Fldcy
Subject: Re: [Buildroot] [PATCH 1/1] package/simple-mail: bump to 3.0.0,
 enable for qt6
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

Hello Zoltan,

On Thu, 08 Aug 2024 07:30:38 +0200
Zoltan Gyarmati <zgyarmati@zgyarmati.de> wrote:

> please disregard this patch, i've just  read your e-mail about splitting 
> my grantlee bump&qt6 patch into 2, gonna do the same with this one...

Correct. Could you also verify legal-info after this bump, and use:

ifeq ($(BR2_PACKAGE_QT5),y)
...
else ifeq ($(BR2_PACKAGE_QT6),y)
...
endif

in the .mk file? Indeed BR2_PACKAGE_QT5 and BR2_PACKAGE_QT6 are
mutually exclusive.

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
