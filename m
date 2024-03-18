Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A91F2C54E5D
	for <buildroot@archiver.kernel.org>; Mon, 18 Mar 2024 13:26:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 65B2340608;
	Mon, 18 Mar 2024 13:26:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vfYsWLteO9_9; Mon, 18 Mar 2024 13:26:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 85B2D408A5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 85B2D408A5;
	Mon, 18 Mar 2024 13:26:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7CDF31BF363
 for <buildroot@lists.busybox.net>; Mon, 18 Mar 2024 13:26:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6A8DA40523
 for <buildroot@lists.busybox.net>; Mon, 18 Mar 2024 13:26:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m9nUXlAUD_nw for <buildroot@lists.busybox.net>;
 Mon, 18 Mar 2024 13:26:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 07247403C8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07247403C8
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 07247403C8
 for <buildroot@buildroot.org>; Mon, 18 Mar 2024 13:26:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 98CE620002;
 Mon, 18 Mar 2024 13:26:39 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rmD0h-002eKI-03;
 Mon, 18 Mar 2024 14:26:39 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240229215641.330203-1-fontaine.fabrice@gmail.com>
 <87frx99699.fsf@48ers.dk>
Date: Mon, 18 Mar 2024 14:26:38 +0100
In-Reply-To: <87frx99699.fsf@48ers.dk> (Peter Korsgaard's message of "Fri, 01
 Mar 2024 19:06:10 +0100")
Message-ID: <87ttl3fz75.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] boot/shim: force arm mode instead of
 Thumb mode
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:
 >> Use OPTIMIZATIONS parameter to pass -marm to fix the following build
 >> failure in Thumb mode:

 >> /tmp/ccEjPM4h.s:941: Error: selected processor does not support `mrc p15,0,r2,c9,c13,0' in Thumb mode

 >> CFLAGS can't be overridden as it is defined as:
 >> CFLAGS		= $(FEATUREFLAGS) \
 >> $(OPTIMIZATIONS) \
 >> $(WARNFLAGS) \
 >> $(if $(findstring clang,$(CC)),$(CLANG_WARNINGS)) \
 >> $(ARCH_CFLAGS) \
 >> $(WERRFLAGS) \
 >> $(INCLUDES) \
 >> $(DEFINES)

 >> Fixes:
 >> - http://autobuild.buildroot.org/results/580156f89cfd72122fef07aa2fe37b4fdd4c316b
 >> - http://autobuild.buildroot.org/results/8980c0f422516c7263d8d0c9cc6123f30c4b7ee4

 >> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 > Committed, thanks.

Committed to 2023.02.x and 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
