Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 282DAC531DC
	for <buildroot@archiver.kernel.org>; Fri, 23 Aug 2024 14:33:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E5F0581F21;
	Fri, 23 Aug 2024 14:33:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id knpWOIkXJvGt; Fri, 23 Aug 2024 14:33:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8C6381F22
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E8C6381F22;
	Fri, 23 Aug 2024 14:33:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6C93B1BF2E5
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 14:33:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 660F2412F8
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 14:33:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VGLyR-09gH62 for <buildroot@lists.busybox.net>;
 Fri, 23 Aug 2024 14:33:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 24F93412F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 24F93412F6
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 24F93412F6
 for <buildroot@buildroot.org>; Fri, 23 Aug 2024 14:33:22 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B5C921C000D;
 Fri, 23 Aug 2024 14:33:19 +0000 (UTC)
Date: Fri, 23 Aug 2024 16:33:18 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240823163318.7e8876e1@windsurf>
In-Reply-To: <ZsTTRhsNDiMsnH1z@waldemar-brodkorb.de>
References: <ZsTTRhsNDiMsnH1z@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724423599;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZzqF7QvqUx0T6G5rHDrPMY1kKAfW+67R/6zVWaFp9y8=;
 b=ZuTIG9UoFg4E4PZKlOFsFu/py2LaBWxFIe9OPXRsSo7GUqZ710jIDWgh76kP7E2342Hbcy
 pltD6h4jZImNS651hUedws5fF/CbDR2Ja1tSRHaaf/mh/ID8Q7afjrx3CL2csD0axudyD1
 uCNhqFl0kxuiSHKvFAfSZAGF6TKYgUnRHeTUZ0vwjGVZiHddU5aurTkpxHWLrqwSfgjpCZ
 v0BKgcWAr2QeHhSqo7gAUti9eBs8P/lqv0lKaQ/lwPjbwdUq8U+7L+N9P6sSknPCoyYcQR
 BWTxCQ4r71apMFfEeAxHR0+2nCLTMthNooO9vow536ofRUzOh3PrN6P+hyS+jg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZuTIG9Uo
Subject: Re: [Buildroot] [PATCH next] package/babeld: update to 1.13
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

On Tue, 20 Aug 2024 19:32:54 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> Update Homepage and Download URL.
> For changes see here:
> https://github.com/jech/babeld/blob/master/CHANGES
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/babeld/Config.in   | 2 +-
>  package/babeld/babeld.hash | 2 +-
>  package/babeld/babeld.mk   | 4 ++--
>  3 files changed, 4 insertions(+), 4 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
