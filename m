Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41471C3DA7F
	for <buildroot@archiver.kernel.org>; Mon,  5 Aug 2024 21:48:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D900E4022A;
	Mon,  5 Aug 2024 21:48:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fLfBkr1Z37XL; Mon,  5 Aug 2024 21:48:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A56740237
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A56740237;
	Mon,  5 Aug 2024 21:48:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A8D4C1BF2E4
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 21:48:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9F47780F51
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 21:48:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AEKoq6wHLlwB for <buildroot@lists.busybox.net>;
 Mon,  5 Aug 2024 21:48:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6A81E80D01
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A81E80D01
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6A81E80D01
 for <buildroot@busybox.net>; Mon,  5 Aug 2024 21:48:12 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 826B81C0003;
 Mon,  5 Aug 2024 21:48:09 +0000 (UTC)
Date: Mon, 5 Aug 2024 23:48:08 +0200
To: Markus Mayer via buildroot <buildroot@buildroot.org>
Message-ID: <20240805234808.36e94ee7@windsurf>
In-Reply-To: <CAGt4E5vg3nF-T3vbbhCmu6Qd+EXjH3fOB63KaB1LpSdb9nw0cA@mail.gmail.com>
References: <CAGt4E5vg3nF-T3vbbhCmu6Qd+EXjH3fOB63KaB1LpSdb9nw0cA@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722894490;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iztScaBzui2LpUDmw5WxVqVA8mbNfaOmnCKzY4pNp+8=;
 b=E6cyozB0Qjr1PGFpZL5KB2pDjM+2IWtUGgSbzLeyNlpNN5cVIsceuEkEpUk+wUyoNDwBPR
 UbFyW1/hZfRBYj26Ac1fuReIabsUQrLH7cwhWyBurM4PmPuF/RDBww6pHQNHaAirmMTKZE
 cqXwtfLqSxl7Lk+e1UnI+xusBzgYOd8tpp0buAHVxQa4URHyyivm61hMUDb9A39KEq83p1
 jcV8OzmwO5an1ZWCBePE0GzE1r/hES2CRuOpfeShOiQHv0Yyuay3domlG2LgVEhcleV8GD
 lRT3kCkK2GiLnTSrDQ4KiwGL70WpNwcA5g60mh+LMZHhXPcrkFDF094Pj4Zwhw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=E6cyozB0
Subject: Re: [Buildroot] BR2_FORCE_HOST_BUILD broken
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
Cc: Buildroot Mailing List <buildroot@busybox.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Markus Mayer <mmayer@broadcom.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

+Fabrice in Cc.

On Mon, 5 Aug 2024 14:29:05 -0700
Markus Mayer via buildroot <buildroot@buildroot.org> wrote:

> I haven't determined the actual circular dependency yet. Are there any
> tips for narrowing this down? These circular dependencies don't seem
> to be easy to track down.

Thanks for reporting the issue. The problem is that AUTORECONF = YES
adds host-autoconf as a dependency to host-xz... but host-autoconf
extracts a .tar.xz tarball, which requires host-xz (when you have
BR2_FORCE_HOST_BUILD=y).

Since the reason why we autoreconf xz is only relevant for the target
build, I think we could use the same trick as the one I've done in the
tar package in commit 69cbb563a124002fcb3e2725c3516b502587f9cc. I.e, we
do the autoreconf only for the target variant, and not the host
variant, which requires a bit of trickery.

Fabrice, or Markus, do you want to have a look?

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
