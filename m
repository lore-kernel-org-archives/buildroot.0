Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7BBEE7717B
	for <buildroot@archiver.kernel.org>; Sat,  7 Dec 2024 13:54:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 38F7E600CC;
	Sat,  7 Dec 2024 13:54:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tAXO_--vpHjw; Sat,  7 Dec 2024 13:54:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 58F0460596
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 58F0460596;
	Sat,  7 Dec 2024 13:54:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 77C5EED7
 for <buildroot@buildroot.org>; Sat,  7 Dec 2024 13:54:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 40584402D1
 for <buildroot@buildroot.org>; Sat,  7 Dec 2024 13:54:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZBFby43jO4p6 for <buildroot@buildroot.org>;
 Sat,  7 Dec 2024 13:54:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 98D68402C2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 98D68402C2
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 98D68402C2
 for <buildroot@buildroot.org>; Sat,  7 Dec 2024 13:54:47 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 164E160004;
 Sat,  7 Dec 2024 13:54:44 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tJvGe-00ALP6-1U;
 Sat, 07 Dec 2024 14:54:44 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Cc: buildroot@buildroot.org
References: <20241031100108.3431-1-nicolas.cavallari@green-communications.fr>
Date: Sat, 07 Dec 2024 14:54:44 +0100
In-Reply-To: <20241031100108.3431-1-nicolas.cavallari@green-communications.fr>
 (Nicolas Cavallari's message of "Thu, 31 Oct 2024 10:57:25 +0100")
Message-ID: <87ldwr38ez.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 2024.0(5|8).x 1/1] package/bluez-alsa: Fix
 compilation with GCC 14 on musl
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Nicolas" == Nicolas Cavallari <nicolas.cavallari@green-communications.fr> writes:

 > bluez-alsa 4.1.1 uses the glibc basename() function, which is not
 > available on musl.  On GCC < 14, it would probably compile with a
 > warning, but GCC 14 now rejects this.

 > Backport an upstream fix to switch to the posix basename() on musl.

 > Fixes: https://autobuild.buildroot.org/results/8ada292393185328677b58a69c9e370c3118880f
 > Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
 > ---
 > 2024.02 does not have GCC 14 and bluez-alsa was bumped in 2024.11

Committed to 2024.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
