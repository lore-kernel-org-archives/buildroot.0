Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AAAFC3DA4B
	for <buildroot@archiver.kernel.org>; Thu, 11 Jul 2024 19:10:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2807E41117;
	Thu, 11 Jul 2024 19:10:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DBD4x891I6rY; Thu, 11 Jul 2024 19:10:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DEEF74111C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DEEF74111C;
	Thu, 11 Jul 2024 19:10:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 30FBE1BF479
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 19:10:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2BEE860899
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 19:10:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pnv4Pzn6J3ge for <buildroot@lists.busybox.net>;
 Thu, 11 Jul 2024 19:10:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0072B60895
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0072B60895
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0072B60895
 for <buildroot@buildroot.org>; Thu, 11 Jul 2024 19:10:25 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 994ADC0003;
 Thu, 11 Jul 2024 19:10:22 +0000 (UTC)
Date: Thu, 11 Jul 2024 21:10:20 +0200
To: Alexander Wellbrock via buildroot <buildroot@buildroot.org>
Message-ID: <20240711211020.000370bb@windsurf>
In-Reply-To: <20240617180157.3771298-1-a.wellbrock@mailbox.org>
References: <20240617180157.3771298-1-a.wellbrock@mailbox.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720725023;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xMqysi3ijd7koniN+yX39VwFf13yzfhfn+mUxtZuInY=;
 b=n8diFziVIiGJ23Hv9cBZW0M5Dq6RliPSW41+MxZPwb/xAp2iTOBQJl+Bk6EDe924rmZcl4
 EMWUKDCPEfzZZDmxxhAIxy529bMk8WQS0dmYp1AfeIcoS0m8d2SO0tJcWZYlIkhchprhBd
 6u6bzOzTVMVe6ScEmIpeOP2g+sHEeVUBhUrLBccDmRHINI5my+uoN81Uaki/MagoXtyD5V
 Xp8BF2gQgQMBnTTWs80gtzecPnJYm/5ikoXCraHpAzC4eS2QyUe4U9RUxAHshvmoEhDnh8
 92k1CUKKBLOIFwLdtyvu7FFkr4NOFwZbMajaGpmNRFiMDk2hf169+S8J5oUf0w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=n8diFziV
Subject: Re: [Buildroot] [PATCH 1/1] package/c-ares: update site url
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
Cc: alex <alexander.wellbrock@othermo.de>, a.wellbrock@mailbox.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 17 Jun 2024 20:01:57 +0200
Alexander Wellbrock via buildroot <buildroot@buildroot.org> wrote:

> From: alex <alexander.wellbrock@othermo.de>
> 
> Download URLs changed after hosting of the c-ares website changed
> ownership:
> https://daniel.haxx.se/blog/2024/06/06/bye-bye-hosting-c-ares-web/
> 
> This cannot be fixed upstream as github pages does not support .htaccess
> files according to:
> https://github.com/c-ares/c-ares.github.io/issues/2
> 
> Signed-off-by: Alexander Wellbrock <a.wellbrock@mailbox.org>
> ---
>  package/c-ares/c-ares.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, after fixing the From: field to match with the
Signed-off-by, as Alexander clarified in a follow-up e-mail. Thanks a
lot for your contribution Alexander!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
