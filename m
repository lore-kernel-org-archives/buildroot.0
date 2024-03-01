Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 400EBC5475B
	for <buildroot@archiver.kernel.org>; Fri,  1 Mar 2024 18:06:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F3596400D0;
	Fri,  1 Mar 2024 18:06:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qwcZ6uE1pQfi; Fri,  1 Mar 2024 18:06:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BF8334151D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BF8334151D;
	Fri,  1 Mar 2024 18:06:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B19D71BF354
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 18:06:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9EB13617BC
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 18:06:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kijHcUEtX0Ze for <buildroot@lists.busybox.net>;
 Fri,  1 Mar 2024 18:06:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2AE0D617A7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2AE0D617A7
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2AE0D617A7
 for <buildroot@buildroot.org>; Fri,  1 Mar 2024 18:06:13 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CC1BF240003;
 Fri,  1 Mar 2024 18:06:10 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rg7Gs-0070Bk-0S;
 Fri, 01 Mar 2024 19:06:10 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240229215641.330203-1-fontaine.fabrice@gmail.com>
Date: Fri, 01 Mar 2024 19:06:10 +0100
In-Reply-To: <20240229215641.330203-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 29 Feb 2024 22:56:41 +0100")
Message-ID: <87frx99699.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
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

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Use OPTIMIZATIONS parameter to pass -marm to fix the following build
 > failure in Thumb mode:

 > /tmp/ccEjPM4h.s:941: Error: selected processor does not support `mrc p15,0,r2,c9,c13,0' in Thumb mode

 > CFLAGS can't be overridden as it is defined as:
 > CFLAGS		= $(FEATUREFLAGS) \
 > 		  $(OPTIMIZATIONS) \
 > 		  $(WARNFLAGS) \
 > 		  $(if $(findstring clang,$(CC)),$(CLANG_WARNINGS)) \
 > 		  $(ARCH_CFLAGS) \
 > 		  $(WERRFLAGS) \
 > 		  $(INCLUDES) \
 > 		  $(DEFINES)

 > Fixes:
 >  - http://autobuild.buildroot.org/results/580156f89cfd72122fef07aa2fe37b4fdd4c316b
 >  - http://autobuild.buildroot.org/results/8980c0f422516c7263d8d0c9cc6123f30c4b7ee4

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
