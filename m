Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B91B5CF3968
	for <buildroot@archiver.kernel.org>; Fri, 20 Sep 2024 10:32:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2389E408DD;
	Fri, 20 Sep 2024 10:32:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8xW7Y9nIcjYt; Fri, 20 Sep 2024 10:32:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AFB684064B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AFB684064B;
	Fri, 20 Sep 2024 10:32:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B83411BF599
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 10:32:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A77CB6077B
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 10:32:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zD_798YHm44o for <buildroot@lists.busybox.net>;
 Fri, 20 Sep 2024 10:32:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A9FBA60772
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A9FBA60772
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A9FBA60772
 for <buildroot@buildroot.org>; Fri, 20 Sep 2024 10:32:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C588340004;
 Fri, 20 Sep 2024 10:32:33 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1srawC-00H38a-35;
 Fri, 20 Sep 2024 12:32:32 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
References: <20240914095501.194725-1-arnout@mind.be>
 <20240914095501.194725-3-arnout@mind.be>
Date: Fri, 20 Sep 2024 12:32:32 +0200
In-Reply-To: <20240914095501.194725-3-arnout@mind.be> (Arnout Vandecappelle
 via buildroot's message of "Sat, 14 Sep 2024 11:55:00 +0200")
Message-ID: <87bk0iipj3.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 3/4] package/pkg-generic.mk: legal-info:
 proper double-dollar
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
Cc: Nicolas Carrier <carrier.nicolas0@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Arnout" == Arnout Vandecappelle via buildroot <buildroot@buildroot.org> writes:

 > Everything inside the generic-package macro should be double-dollared,
 > except for $(1) $(2) etc. There was still a $(call ...) that was not
 > double-dollared in the legal-info target. The result is that
 > OVERRIDE_SRCDIR isn't actually qstrip'ed.

 > Double dollar the $(call ...) like everywhere else.

 > Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
 > Cc: Nicolas Carrier <carrier.nicolas0@gmail.com>
 > Reported-by: Yann E. MORIN <yann.morin.1998@free.fr>

Committed to 2024.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
