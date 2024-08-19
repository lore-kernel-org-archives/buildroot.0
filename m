Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EBDAC5320E
	for <buildroot@archiver.kernel.org>; Mon, 19 Aug 2024 10:48:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DBE9D80BBB;
	Mon, 19 Aug 2024 10:48:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cOPhxJJWEFLr; Mon, 19 Aug 2024 10:48:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C3A4D80F28
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C3A4D80F28;
	Mon, 19 Aug 2024 10:48:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B28851BF39D
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 10:48:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AA76240444
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 10:48:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n2ZmbjZBunrA for <buildroot@lists.busybox.net>;
 Mon, 19 Aug 2024 10:48:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2FC8D404F9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2FC8D404F9
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2FC8D404F9
 for <buildroot@buildroot.org>; Mon, 19 Aug 2024 10:48:22 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A648D240005;
 Mon, 19 Aug 2024 10:48:19 +0000 (UTC)
Date: Mon, 19 Aug 2024 12:48:18 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240819124818.1de270f6@windsurf>
In-Reply-To: <20240819084352.905082-1-james.hilliard1@gmail.com>
References: <20240819084352.905082-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724064499;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zE5ElBwRETqcgtwWDd5JPhi8lBb/hx7QxEMgOVpzq2s=;
 b=a2Tsy30vzewMyjF155c85jP6vVPk0NvGlhOmjWwgfCjux/hAITmnVgsA3eMa2gnXuYqS2Y
 8kH2YOGRTKo2rdMvxQVhNxIN2lOgKxgage4DbUt16HH77eXS5u0kzs25Lla4um07jSOoFs
 rfCuNfGop+9uLA9MCiFAu+ysWzDMKKQ2r2tTsBNcAuugp7CEnbq5knKZXNFkikDeBYwigR
 4w5zzxMrHajx0VwLmxmAnZgeHPOb0AhFitNwgI25jWoKjv/jE/Uf5Eb3RLsbmC28I4FAg+
 22DsE2Lk7I6ncAJVm4Bqw0q7Nfd4pFNTp614VLdZ76UBKJeg0ev3jjA2l+xP3g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=a2Tsy30v
Subject: Re: [Buildroot] [PATCH v2 1/1] package/flashrom: fix cli with
 BR2_SHARED_LIBS
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

On Mon, 19 Aug 2024 02:43:52 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Flashrom requires --default-library=both for the cli when building
> with BR2_SHARED_LIBS.
> 
> As such set --default-library=both instead of disabling it.
> 
> The cli was disabled in 8637884057ddc3c1aeb9f0dd285fc6fcf378c26b to
> work around a cli build issue which this fixes.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
> Changes v1 -> v2:
>   - add some additional details
> ---
>  package/flashrom/flashrom.mk | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)

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
