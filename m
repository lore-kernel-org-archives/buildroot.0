Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28310C3DA7F
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 12:20:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF34D40224;
	Wed,  7 Aug 2024 12:20:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IWT8kVVGbNmX; Wed,  7 Aug 2024 12:20:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD12340474
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD12340474;
	Wed,  7 Aug 2024 12:20:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DDE1A1BF342
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 12:20:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C7B644042E
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 12:20:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 79EYzXJAW0GA for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 12:20:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 86422402AE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 86422402AE
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 86422402AE
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 12:20:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 178992000A;
 Wed,  7 Aug 2024 12:20:33 +0000 (UTC)
Date: Wed, 7 Aug 2024 14:20:33 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240807142033.7d1599cd@windsurf>
In-Reply-To: <ZrNQBcWzOEsRkZij@waldemar-brodkorb.de>
References: <ZrNQBcWzOEsRkZij@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723033234;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dRUC0DUNp2CzQBkUKF6xnu74y7cHeFywTQPPnbfdIsA=;
 b=dHkOwr3kSvlSD00ihtstotoT3Z665byDdntHQLQhsGvkpwpKia1PAy3Wv4LZ8+qfRYWK/8
 78+xjhCwufMvWu5ime1hufd7MPwFnzSsL6sinOvzicuN2CKk2a2Aucklt3stpTX2bPGZUs
 0bvS4duFXGcy8f1g5kMSbI4V0EESj9ERHKm1kBs+RKiloI9ZJrQvRqw7bCyvJWMlXB7pdI
 EVu421AVazICSnMprpypHpjlxq5QCiidSNRbpwuLCK8+GpzSYSuIXl1EN39MwLS8fBMuT6
 OmIXmnNwd4t2wMoLY9tNuJGyyQB0S9qZv4iVnAG0HDkj0nmyrVMud5DQHXRDug==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dHkOwr3k
Subject: Re: [Buildroot] [PATCH] package/mpg123: update to 1.32.6
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

On Wed, 7 Aug 2024 12:44:21 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> See the homepage for News and Changes:
> http://mpg123.de/
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/mpg123/mpg123.hash | 6 +++---
>  package/mpg123/mpg123.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)

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
