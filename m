Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B48DDC3DA49
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 10:28:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 528F581261;
	Tue, 23 Jul 2024 10:28:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0yqmhhvYvBI1; Tue, 23 Jul 2024 10:28:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47CB281264
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47CB281264;
	Tue, 23 Jul 2024 10:28:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CDF741BF20F
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 10:28:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AC4DB402AA
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 10:28:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kQPpCd9134VX for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 10:28:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6B7DF402B0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B7DF402B0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6B7DF402B0
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 10:28:01 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CD9C1FF807;
 Tue, 23 Jul 2024 10:27:59 +0000 (UTC)
Date: Tue, 23 Jul 2024 12:27:59 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240723122759.3a4eb036@windsurf>
In-Reply-To: <20240719045639.3336541-1-james.hilliard1@gmail.com>
References: <20240719045639.3336541-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721730480;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5lANe98BrLDBYMbJ2sSCFX+QaOr1bl6P2j8q5DDG2qg=;
 b=arb0qS5UEURf6UrEtqYsagQiOog4VYj2uKUpLND2PXzVxdTFmGn+cSwz9rZFIRxw96Xku0
 NNXOUWAO34NvTPD6n5aowmyHT1sXYO6dedyf34QY/GLHZ30+H/FnSj37xyHDIt7bjPGSw5
 AGOZp57FzqPOMn6cPh//hKfH/oZgWGq8Wlt8iKIsHn37+esjkGnT9FhUk+sli153IDKe6K
 zvDUFnprZg78SFrOSR8By7L6uWmAa2LSxcece3uS9FZrtBFbR9NjcxCWFv7gEV3ErXR4kq
 OBPdT3nzNH7EV8+CSpcHwOf9UgcgZnYFX4ko5ZTeWKDFeh/o3xhPrkgYuOh19g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=arb0qS5U
Subject: Re: [Buildroot] [PATCH 1/1] package/python-maturin: bump to version
 1.7.0
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 18 Jul 2024 22:56:39 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-maturin/python-maturin.hash | 2 +-
>  package/python-maturin/python-maturin.mk   | 7 +++----
>  2 files changed, 4 insertions(+), 5 deletions(-)

This patch seems to cause build issues:

  http://autobuild.buildroot.net/results/459/4591c6788ad577ce62f6bc82ea77f94be832ce04/build-end.log

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
